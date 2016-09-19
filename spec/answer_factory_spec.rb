require_relative 'spec_helper'

describe Chat::AnswerFactory do
  before :each do
    @question = Chat::Question.new(text: '')
  end

  describe '#get_instance' do
    it 'returns answer object' do
      expect(Chat::AnswerFactory.get_instance(@question)).to be_a(Chat::Answer)
    end
  end

  describe '#get_instance' do
    it 'returns variant_answer object' do
      answers = [{ 'text' => 'Lets talk' }, { 'text' => 'ok' }, { 'text' => 'by' }]
      question = Chat::Question.new(text: '', answers: answers)
      expect(Chat::AnswerFactory.get_instance(question)).to be_a(Chat::VariantAnswer)
    end
  end

  
end
