import type { Plugin } from "@opencode-ai/plugin"

export const AdversarialReviewModel: Plugin = async ({ client }) => ({
  "chat.message": async (_input, output) => {
    if (output.message.agent !== "adversarial-reviewer") return

    // OpenCode versions store the variant either on the message or its model.
    const message = output.message as typeof output.message & {
      variant?: string
      model: { providerID: string; modelID: string; variant?: string }
    }
    const { providerID, modelID } = message.model
    const regularModelID = modelID.replace(/-(?:ultrafast|fast)$/, "")

    if (regularModelID !== modelID) {
      const { data } = await client.provider.list({ throwOnError: true })
      const provider = data.all.find((item) => item.id === providerID)
      if (!provider?.models[regularModelID]) {
        throw new Error(`Adversarial review requires the regular model ${providerID}/${regularModelID}, but it is unavailable.`)
      }
      message.model.modelID = regularModelID
    }

    if (/^(?:ultrafast|fast)$/i.test(message.model.variant ?? "")) {
      delete message.model.variant
    }
    if (/^(?:ultrafast|fast)$/i.test(message.variant ?? "")) {
      delete message.variant
    }
  },
})
