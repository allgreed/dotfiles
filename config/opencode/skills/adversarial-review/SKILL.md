---
name: adversarial-review
description: Adversarial review workflow. Use when the user requests an adversarial review, asks to invoke @adversarial-reviewer, or wants production risks reviewed.
---

# Adversarial Review

Use the regular `adversarial-reviewer` subagent to review the requested scope. Include the user's request and relevant context in the delegated prompt. Do not duplicate the subagent's review yourself.

If the reviewer reports no actionable findings, state that clearly and stop.

If it reports findings:

1. Present them in severity order with file and line references.
2. Use the interactive `question` tool in the primary conversation, with one question per finding and the choices `fix`, `explain`, and `ignore`.
3. For `fix`, implement and verify the fix.
4. For `explain`, give a concise explanation of the risk and proposed mitigation.
5. For `ignore`, acknowledge that it will not be changed.

## Completion Gate

When the reviewer reports findings, do not send a final response or consider the review complete until all of these conditions are true:

1. The primary conversation has called the `question` tool once for every finding, offering `fix`, `explain`, and `ignore`.
2. The user has selected a resolution for every finding.
3. Each selected resolution has been completed: fixes are implemented and verified, explanations are provided, and ignored findings are acknowledged.
4. The final response lists the resolution for every finding.
