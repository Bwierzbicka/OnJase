class SaveFileTool < Rubyllm::Tool
  def initialize(client:, model: "claude")
    @client = client
    @model = model
  end

  def execute(prompt, system: "You are a helpful assistant.")
    response = @client.chat(
      params: {
        model: @model,
        messages: [
          { role: "system", content: system },
          { role: "user", content: prompt }
        ]
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end
