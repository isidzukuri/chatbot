module Chat
  class Question < Step
    attr_reader :answers

    def run
      puts_text
      answer = answer_instance.process_input
      answer ? answer : @init_vars
    end

    def puts_text
      text = @text
      if @answers
        text = "#{text}\nPossible answers:"
        @answers.each_with_index do |item, i|
          n = i + 1
          text = "#{text}\n \s\s#{n}) #{item['text']}"
        end
      end
      text = "#{text}\nEnter answer:"
      @writer.puts_bot_text(text)
    end

    def data
      @data ? @data.downcase : nil
    end

    def data_is_a?(label)
      @data && @data == label
    end

    private

    def answer_instance
      @answer ||= AnswerFactory.get_instance(self)
    end
  end
end
