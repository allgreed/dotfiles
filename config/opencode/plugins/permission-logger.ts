import { appendFileSync, mkdirSync, existsSync } from "fs"
import { join, dirname } from "path"
import { homedir } from "os"

const LOG_FILE = join(homedir(), ".config", "opencode", "permission-log.jsonl")

export const PermissionLogger = async () => {
  const logDir = dirname(LOG_FILE)
  if (!existsSync(logDir)) {
    mkdirSync(logDir, { recursive: true })
  }

  // Track pending permission requests so we can correlate replies
  const pending = new Map<string, { permission: string; patterns: string[]; askedAt: number }>()

  return {
    event: async ({ event }) => {
      if (event.type === "permission.asked") {
        const { id, permission, patterns } = event.properties
        if (id) {
          pending.set(id, { permission, patterns, askedAt: Date.now() })
        }
      }

      if (event.type === "permission.replied") {
        const { requestID, reply } = event.properties
        if (reply === "once" || reply === "always") {
          const request = pending.get(requestID)
          // Skip logging edit permission events
          if (request?.permission === "edit") {
            if (requestID) pending.delete(requestID)
            return
          }
          const elapsedMs = request?.askedAt
            ? Date.now() - request.askedAt
            : null
          const entry = {
            command: request?.patterns?.join(" ; ") ?? "unknown",
            tool: request?.permission ?? "unknown",
            reply,
            timestamp: new Date().toISOString(),
            elapsedMs,
          }
          try {
            appendFileSync(LOG_FILE, JSON.stringify(entry) + "\n")
          } catch {
            // Silently ignore write errors
          }
        }
        // Clean up regardless of reply
        if (requestID) {
          pending.delete(requestID)
        }
      }
    },
  }
}
