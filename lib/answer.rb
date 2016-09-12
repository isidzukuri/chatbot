module Chat
  class Answer

    include Init
    include ConsoleWriter
    include UserWork

    def self.get_instance(question)
      hash = {:question => question}
      question.answers ? VariantAnswer.new(hash) : Answer.new(hash)
    end
    
    def initialize init_vars = {}
      super
      @retry = false
      @input = ConsoleInput.new(@question)
      @texts = Chat.texts
      @info_columns = Info.column_names
      @text_answer = ''
    end

    def process_input
      tree_position = nil
      @input.get_user_input 
      save_user_message(@input.user_input)      
      create_user(:name => @input.user_input) if @question.data_ia_a?('name')
      tree_position = answer_result()               
      save_data()
      tree_position
    end

    def puts_comments
      puts_bot_text(@texts['enter_answer'])
    end

    
    private

    def answer_result
      set_answer_text()
      nil
    end
    
    def save_data
      if @question.data && @info_columns.include?(@question.data)
        set_user_data({@question.data => @text_answer})
        validate_data()
      end
    end

    def validate_data
      if !is_data_field_valid?(@question.data)
        while !is_data_field_valid?(@question.data) 
          invalid_data_callback()
        end
      end
    end

    def invalid_data_callback
      puts_bot_text(@texts['input_not_valid'])
      @input.get_user_input 
      set_answer_text()
      set_user_data({@question.data => @text_answer})
    end

    def ask_same_again
      @retry = true
      puts_bot_text(@texts['answer_again'])
      puts_bot_text(@texts['ask_again'])
      @question.ask()
    end

    def set_answer_text()
      @text_answer = @input.user_input
    end

  end
end