---
name: permission-report
description: Analyze OpenCode permission logs and configs, then recommend frequently approved rules without editing configuration. Use when asked for a permission report, permission consolidation, frequent approval analysis, or additions based on permission-log.jsonl.
---

# Permission Report

## Objective

Generate a conservative report of OpenCode permissions that could be allowed
without prompting. Compare the permission history with the effective global and
project configuration, recommend only missing rules, and stop without editing
any files.

## Sources

Inspect all applicable sources:

1. `~/.config/opencode/permission-log.jsonl`
2. `~/.config/opencode/opencode.json` or `opencode.jsonc`
3. The active project's `opencode.json`, `opencode.jsonc`, and
   `.opencode/opencode.json`, when present
4. Relevant per-agent permission overrides when they explain repeated prompts

OpenCode deep-merges global and project configuration. Within each permission
object, the last matching rule wins. Account for both facts when deciding
whether a recommendation is already covered.

Treat an explicit, narrow `"ask"` rule as intentional policy. Do not recommend an `"allow"` rule that would override it.
Exception: `"*": "ask"` at the end of the file, ignore it; commands matched only by a fallback remain eligible for recommendation.

If rules match, use the effective last match to classify the command.

## Analysis

Treat `once` and `always` as approvals and `reject` as a rejection. Report the
total number of entries, approvals, rejections, and the log's date range.

Group commands into the narrowest useful rule families. Preserve meaningful
subcommands: group `aws bedrock get-foundation-model ...` under
`aws bedrock get-* *`, not under `aws *`. Do not infer a broad allow rule from a
shared executable alone.

Use these defaults for recommendation candidates:

- Multiple occurrences
- Clear signal -- it's almost universally accepted across time
- At least one recent occurrence when the log spans more than 30 days, unless
  the family has many approvals and is clearly still relevant
- The family is not already allowed by the effective merged configuration
- The family is not covered by an explicit narrow `"ask"` or `"deny"` rule

Exclude permission-log analysis commands, such as `node`, `jq`, or shell
commands whose arguments directly inspect `permission-log.jsonl`. They are
measurement artifacts and must not influence the report.

Repeated prompts can predate a current allow rule or result from a compound
command containing another restricted operation. Do not recommend a duplicate
rule in either case. Mention compound-command effects when they materially
explain the data.

## Safety Filter

Prefer narrow rules for read-only inspection, metadata lookup, syntax checks,
linters, type checks, and deterministic tests.

Keep prompting for these unless the user explicitly requests otherwise:

- Git staging, commits, pushes, checkouts, branch deletion, rebases, and
  Graphite mutation or continuation commands
- Kubernetes, Docker, Terraform/OpenTofu, cloud, and CI mutations
- Shells or language runtimes capable of arbitrary execution, including broad
  `python *`, `node *`, `bash *`, and `uv run python *` rules
- Broad `curl *`, `wget *`, `gh api *`, or similar network rules that can send
  data or invoke mutating endpoints
- Secret stores, credential directories, `.env` files, SSH material, and broad
  home-directory or `/tmp` access
- Broad task-runner rules such as `just *` when recipes include mutation,
  deployment, credential access, or generated-file changes

For `external_directory`, recommend the narrowest stable directory. Remember
that this permission only crosses the directory boundary; normal `read` and
`edit` permissions still apply.

## Placement

Recommend generic developer-tool rules for the user config at
`~/.config/opencode/opencode.json`. Recommend repository commands, task-runner
recipes, and local-environment workflows for the project config. Label every
recommendation as either `User` or `Project`.

Put broad rules before narrow exceptions in suggested snippets because the last
matching rule wins. Never suggest moving or removing an existing deny rule
unless the user asks for a broader policy review.

## Report Format

Produce these sections:

1. **Summary**: entry totals, date range, and a one-sentence conclusion
2. **Findings**: a numbered Markdown table with columns `#`, `Rule`, `Config`,
   `Approved`, `Rejected`, `Most Recent`, and `Rationale`. `Config` must be
   exactly `User` or `Project`, specifying where the change should land. Include
   only recommended changes in this table and order them by confidence, then
   approval count.
3. **Recommended Config**: copy-ready JSON fragments split into `User` and
   `Project`, matching the numbered findings and omitting empty sections
4. **Keep Prompting**: frequently approved families deliberately excluded by
   the safety filter, with a short reason
5. **Notes**: stale entries, existing coverage, compound commands, or per-agent
   overrides that affected the result. List frequently approved families
   excluded because of an explicit narrow `"ask"` rule as intentional policy.

Keep the report concise. Include actual patterns rather than vague command
names. Do not modify configuration, truncate or rotate the log, or ask whether
to apply the recommendations. End by stating that no files were changed and
the work stopped after the report.
