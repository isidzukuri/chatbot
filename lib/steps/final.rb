module Chat
  class Final < Step
    def run
      @writer.puts_bot_text(@text)
      nil
    end
  end
end
