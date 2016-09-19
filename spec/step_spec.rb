require_relative 'spec_helper'

describe Chat::Step do
  before :each do
    @item = Chat::Step.new(text: 'Who are you?')
    @hash = Chat::Branch.new('confirm_contact').find_branch_by_label(Chat.tree, 'confirm_contact')
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

  describe '#next_step' do
    it 'private next_step' do
      silence do
        expect { Chat::Step.next_step(Chat.tree) }.not_to raise_error
      end
    end
  end

  describe '#run_next' do
    it 'next step' do
      silence do
        item = Chat::Step.new
        expect { item.run_next(class: 'Question', data: @hash) }.not_to raise_error
      end
    end
  end

  describe '#next_step' do
    it 'pprivate next step' do
      silence do
        item = Chat::Step.new(@hash)
        expect { item.next_step }.not_to raise_error
      end
    end
  end
end
