require_relative 'spec_helper'

describe Chat::Answer do
  before :each do
    @tree = Chat::Chatbot.new.load_tree_config
    hash = Chat::Branch.new('confirm_contact').run
    question = Chat::StepFactory.next_step(hash)
    Chat.user = create_full_user_data
    @item = Chat::AnswerFactory.get_instance(question)
  end

  describe '#process_input' do
    it 'takes user input via gets and returns a hash' do
      @item.stub(:gets) { '1' }
      expect(@item.process_input['text']).to eq 'Yes, Please'
    end
  end

  describe '#process_input' do
    it 'takes user input via gets and returns a hash' do
      @item.stub(:gets) { '2' }
      expect(@item.process_input['text']).to include('Sorry, wrong')
    end
  end

  describe '#process_input' do
    it 'takes user input via gets and returns a hash' do
      fallback_final = { 'final' => { 'text' => 'Wrong answer. Bye!' } }
      @item.stub(:gets) { '9' }
      expect(@item.process_input).to eq fallback_final
    end
  end

  describe '#process_input' do
    it 'takes user input via gets and returns nil' do
      question = Chat::Question.new(text: '')
      item = Chat::AnswerFactory.get_instance(question)
      item.stub(:gets) { 'some string' }
      expect(item.process_input).to be_nil
    end
  end
end
