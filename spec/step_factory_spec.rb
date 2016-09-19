require_relative 'spec_helper'

describe Chat::StepFactory do
  before :each do
    @tree = Chat::Chatbot.new.load_tree_config
  end

  describe '#next_step' do
    it 'returns question object' do
      expect(Chat::StepFactory.next_step(@tree)).to be_a(Chat::Question)
    end
  end

  describe '#next_step' do
    it 'should raise error' do
      error = NotImplementedError
      expect { Chat::StepFactory.next_step({}) }.to raise_error error
    end
  end
end
