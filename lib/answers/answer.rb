module Chat
  class Answer

    
    def initialize question
      @question = question
      @answer_text = ''
      @user = Chat.user
    end

    def process_input
      @tree_position = nil
      user_input = get_input()
      @user.save_message(user_input)
      @user.create(:name => user_input) if @question.data_is_a?('name')
      @tree_position = answer_result()
      save_data()
      @tree_position
    end

    
    private

    def get_input
      @user_input = gets.chomp
    end

    def answer_result
      @answer_text = @user_input
      nil
    end
    
    def save_data
      @tree_position = fallback_behaviour() if !@user.save_data(@question.data, @answer_text)
    end

    def fallback_behaviour
      {"final" => {"text" => "Wrong answer. Bye!"} }
    end

  end
end