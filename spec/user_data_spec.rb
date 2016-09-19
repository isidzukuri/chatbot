require_relative 'spec_helper'

describe Chat::UserData do
  before :each do
    @item = create_full_user_data
  end

  describe '#name' do
    it 'returns string' do
      expect(@item.name).to be_a(String)
    end
  end
  
  describe '#contact_type' do
    it 'returns string' do
      expect(@item.contact_type).to be_a(String)
    end
  end

  describe '#contact' do
    it 'returns phone number' do
      expect(@item.contact).to be_a(Integer)
    end
  end

  describe '#save_data' do
    it 'saves user data and returns bool' do
      expect(@item.save_data('phone','2628789')).to eq true
    end
  end

  describe '#save_data' do
    it 'not saves user data and returns bool' do
      expect(@item.save_data('phone','2629')).to eq false
    end
  end


  describe '#save_message' do
    it 'should return message instance' do
      expect(@item.save_message('some message')).to be_a(Message)
    end
  end
  
  describe '#save_bot_message' do
    it 'should return message instance' do
      expect(@item.save_bot_message('some message')).to be_a(Message)
    end
  end

  describe '#create' do
    it 'returns string' do
      item = Chat::UserData.new
      expect(item.create(:name => 'Test')).to be_a(User)
    end
  end

end
