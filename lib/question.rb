module Chat
  class Question < Step

    include ConsoleWriter
    
    attr_reader :answers, :final

    def run
      ask()
      process_answer()
    end

    def ask
      puts_bot_text(@text)
      get_answer
      @answer.puts_comments()
      @tree_position = @answer.process_input()
    end

    def data
      @data ? @data.downcase : nil
    end

    def data_ia_a?(label)
      !!(@data && @data == label)
    end

    private

    def get_answer
      @answer ||= Answer.get_instance(self)
    end

    def process_answer      
      @tree_position ||= @init_vars
      Step.next_step(@tree_position)
    end


  end
end