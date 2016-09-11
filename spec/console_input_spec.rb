require_relative 'spec_helper'

describe Chat::ConsoleInput do

  before :each do                
    @item = Chat::ConsoleInput.new()
  end

  describe "#new" do
    it "returns object" do
      expect(@item).to be_a(Chat::ConsoleInput)
    end
  end

  describe "#get_user_input" do
    it "returns user input" do
      item = with_mock_question()
      item.stub(:gets){"ok"}
      expect(item.get_user_input).to eq "ok"
    end
  end 

  describe "#get_user_input" do
    it "returns user input" do
      item = with_mock_question()
      item.stub(:gets){"ok"}
      item.get_user_input
      hash = {"text"=>"ok"}
      expect(item.compare).to eq hash
    end
  end 

  describe "#compare_levenstein" do
    it "compare user input with aswers using levenstein eturns a key of value" do
      item = with_mock_question()
      item.stub(:gets){"bys"}
      item.get_user_input
      expect(item.compare_levenstein).to eq 2
    end
  end 

  describe "#compare_levenstein" do
    it "compare user input with aswers using levenstein eturns a key of value" do
      item = with_mock_question()
      item.stub(:gets){"smtn completely different"}
      item.get_user_input
      expect(item.compare_levenstein).to eq false
    end
  end

  def with_mock_question
    answers = [{'text' => "Lets talk"}, {'text' => "ok"}, {'text' => "by"}]
    question_with_answers = Chat::Question.new(:text => "Who are you?", :answers => answers)            
    item = Chat::ConsoleInput.new(question_with_answers)
  end

 
end