require_relative 'answer'

module Chat
  class VariantAnswer < Answer
    def initialize(question)
      super
      @answers = @question.answers
    end

    private

    def answer_result
      answer = @answers[@input.to_i - 1] if numeric?
      if answer
        @answer_text = answer['text']
      else
        answer = fallback_behaviour
      end
      answer
    end

    def numeric?
      @input.length == 1 && @input.to_i.between?(1, @answers.length)
    end
  end
end
