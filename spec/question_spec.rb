require_relative 'spec_helper'

describe Chat::Question do
  before :each do
    @item = Chat::Question.new(text: 'Who are you?')
  end

  describe '#new' do
    it 'returns a Question object' do
      expect(@item).to be_a(Chat::Question)
    end
  end

  describe '#data' do
    it 'check is data set' do
      expect(@item.data).to be_nil
    end
  end

  describe '#data' do
    it 'check is data set' do
      item = Chat::Question.new(text: 'Who are you?', data: 'phone')
      expect(item.data).to be_a(String)
    end
  end

  describe '#data_is_a?' do
    it 'check is data equal to type' do
      expect(!!@item.data_is_a?('phone')).to eq false
    end
  end

  describe '#data_is_a?' do
    it 'check is data equal to type' do
      item = Chat::Question.new(text: 'Who are you?', data: 'phone')
      expect(!!item.data_is_a?('phone')).to eq true
    end
  end

  describe '#puts_text' do
    it 'prints question text' do
      silence do
        expect { @item.puts_text }.to output(/Who are you/).to_stdout
      end
    end
  end

  describe '#puts_text' do
    it 'asks user to type' do
      silence do
        expect { @item.puts_text }.to output(/Enter answer/).to_stdout
      end
    end
  end

  describe '#puts_text' do
    it 'prints answers variants' do
      hash = Chat::Branch.new('confirm_contact').run
      item = Chat::StepFactory.next_step(hash)
      silence do
        expect { item.puts_text }.to output(/Yes, Please/).to_stdout
      end
    end
  end

  describe '#run' do
    it 'returns hash' do
      silence do
        hash = Chat::Branch.new('confirm_contact').run
        item = Chat::StepFactory.next_step(hash)
        expect(item.run).to be_a(Hash)
      end
    end
  end

  
end
