require_relative "answer"

module Chat
  class VariantAnswer < Answer

    
    def initialize question
      super
      @answers = @question.answers
    end
    
    private

    def answer_result
      answer = @answers[@user_input.to_i-1] if @user_input.length == 1 && @user_input.to_i.between?(1, @answers.length)
      if answer
        @answer_text = answer['text']
      else
        answer = fallback_behaviour()
      end
      answer
    end


  end
end