require_relative 'spec_helper'

describe Chat::DataStorage do
  before :each do
    config = {
      adapter: 'sqlite3',
      database: '../db/chatbot.db'
    }
    @instance = Chat::DataStorage.new(config)
  end

  describe '#save' do
    it 'creates user entity for interlocutor' do
      expect(@instance.save('name', 'Test')).to be_a(User)
    end
  end

  describe '#save' do
    it 'saves interlocutors data' do
      @instance.save('name', 'Test')
      expect(@instance.save('email', 'some@email.com')).not_to eq false
    end
  end

  describe '#save' do
    it 'returns false because email not valid' do
      @instance.save('name', 'Test')
      expect(@instance.save('email', 'somemail.com')).to eq false
    end
  end

  describe '#save_message' do
    it 'should return message instance' do
      @instance.save('name', 'Test')
      expect(@instance.save_message('some message')).to be_a(Message)
    end
  end

  describe '#save_bot_message' do
    it 'should return message instance' do
      @instance.save('name', 'Test')
      expect(@instance.save_bot_message('some message')).to be_a(Message)
    end
  end
end
