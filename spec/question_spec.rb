require_relative 'spec_helper'

describe Chat::Question do
  before :each do
    @item = Chat::Question.new(text: 'Who are you?')
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

  describe '#ask' do
    it 'prints question text' do
      silence do
        expect { @item.ask }.to output(/Who are you/).to_stdout
      end
    end
  end

  describe '#ask' do
    it 'asks user to type' do
      silence do
        expect { @item.ask }.to output(/Enter answer/).to_stdout
      end
    end
  end

  describe '#ask' do
    it 'prints answers variants' do
      answers = [{ 'text' => 'Lets talk' }, { 'text' => 'ok' }]
      question = Chat::Question.new(text: '', answers: answers)
      silence do
        expect { question.ask }.to output(/Lets talk/).to_stdout
      end
    end
  end

  describe '#run' do
    it 'writes question, returns dialogs trees position' do
      silence do
        expect(@item.run(data_storage_with_user)).to be_a(Hash)
      end
    end
  end
end
