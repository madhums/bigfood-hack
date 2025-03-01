class ChatService
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    messages = training_prompts.map do |prompt|
      {role: "system", content: prompt}
    end

    messages << {role: "user", content: message}

    response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: messages,
        temperature: 0.7,
        stream: proc do |chunk, _bytesize|
          print chunk.dig("choices", 0, "delta", "content")
        end
      }
    )

    # response.dig("choices", 0, "message", "content")
  end

  private

  def client
    @_client ||= OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"], log_errors: true)
  end

  def training_prompts
    [
      "Set the context to the netherlands",
      "It can be any info on air, soil and or water",
      "Would be great if we can cross reference with agricultural datasets or crop production. Don't worry if you can't",
      "Don't list the data sources please",
      "Go fetch the dataset from https://www.cbs.nl/en-gb/figures/detail/7477eng",
      "Print the whole dataset",
      "Don't list the data sources please"
      # "Please give me the data itself"
    ]
  end
end
