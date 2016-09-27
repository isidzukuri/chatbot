require_relative 'answer'

module Chat
  class VariantAnswer < Answer
    

    private

    def variants
      @question.answers
    end

    def answer_result
      answer = variants[@input.to_i - 1] if numeric?
      if answer
        @answer_text = answer['text']
      else
        answer = fallback_behaviour
      end
      answer
    end

    def numeric?
      @input.length == 1 && @input.to_i.between?(1, variants.length)
    end
  end
end
