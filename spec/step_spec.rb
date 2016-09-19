require_relative 'spec_helper'

describe Chat::Step do
  before :each do
    @item = Chat::Step.new(text: 'Who are you?')
    # @hash = Chat::Branch.new('confirm_contact').find_branch_by_label(Chat.tree, 'confirm_contact')
  end

  describe '#new' do
    it 'returns object' do
      expect(@item).to be_a(Chat::Step)
    end
  end

  describe '#run' do
    it 'process a step' do
      expect { @item.run }.to raise_error NotImplementedError
    end
  end

  
end
