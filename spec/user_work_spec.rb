require_relative 'spec_helper'

describe Chat::UserWork do
  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(Chat::UserWork)
  end

  describe '#create_user' do
    it 'returns user object' do
      expect(@dummy_class.create_user(name: 'test')).to be_a(User)
    end
  end

  describe '#save_user_message' do
    it 'saves users input' do
      expect(@dummy_class.save_user_message('some string')).to be_a(Message)
    end
  end

  describe '#user_name' do
    it 'returns string' do
      expect(@dummy_class.user_name).to be_a(String)
    end
  end

  describe '#user_contact_type' do
    it 'returns string' do
      expect(@dummy_class.user_contact_type).to be_a(String)
    end
  end

  describe '#user_contact' do
    it 'returns string' do
      expect(@dummy_class.user_contact).to be_a(String)
    end
  end

  describe '#set_user_data' do
    it 'updates attributes, returns hash' do
      expect(@dummy_class.set_user_data).to be_a(Hash)
    end
  end

  describe '#is_data_field_valid?' do
    it 'validate' do
      expect(@dummy_class.is_data_field_valid?('ptone')).to eq false
    end
  end
end
