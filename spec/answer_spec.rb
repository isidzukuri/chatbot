require_relative 'spec_helper'

describe Chat::Answer do

  before :each do                
    chatbot = Chat::Chatbot.new
    chatbot.load_configs 
    chatbot.db_connection

    answers = [{'text' => "Lets talk"}, {'text' => "ok"}, {'text' => "by"}]
    question = Chat::Question.new(:text => "Who are you?", :answers => answers)
    @item = Chat::Answer.new(:question => question)
  end

  describe "#new" do
    it "returns object" do
      expect(@item).to be_a(Chat::Answer)
    end
  end

  describe "#puts_comments" do
    it "print answer varriants if is set" do
      expect{@item.puts_comments}.to output(/Lets talk/).to_stdout
    end
  end 

  describe "#process_input" do
    it "" do
      silence do
        expect{@item.process_input}.not_to raise_error
      end
    end
  end 

end