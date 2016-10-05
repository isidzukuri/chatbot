require_relative 'spec_helper'

describe Chat::Step do
  before :each do
    @item = Chat::Step.new(text: 'Who are you?')
  end

  describe '#run' do
    it 'should do step job' do
      expect(@item).to respond_to :run
    end
  end
end
