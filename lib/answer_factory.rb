module Chat
  class AnswerFactory


    def self.get_instance(question)
      question.answers ? VariantAnswer.new(question) : Answer.new(question)
    end
    
  end
end