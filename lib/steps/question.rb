module Chat
  class Question < Step
    
    attr_reader :answers

    def run 
      puts_text()
      get_answer()
      answer = @answer.process_input()
      answer ? answer : @init_vars 
    end

    def puts_text
      text = @text
      if @answers
        text = "#{text}\nPossible answers:"
        @answers.each_with_index{|item, i| text = "#{text}\n \s\s#{i+1}) #{item['text']}"}
      end        
      text = "#{text}\nEnter answer:"
      @writer.puts_bot_text(text)
    end

    def data
      @data ? @data.downcase : nil
    end

    def data_is_a?(label)
      !!(@data && @data == label)
    end

    private

    def get_answer
      @answer ||= AnswerFactory.get_instance(self)
    end

  end
end