require_relative 'spec_helper'

describe Chat::Question do

  before :each do                
    @item = Chat::Question.new(:text => "Who are you?")
  end

  describe "#new" do
    it "returns a Question object" do
      expect(@item).to be_a(Chat::Question)
    end
  end

  describe "#data" do
    it "check is data set" do
      expect { @item.data }.not_to raise_error 
    end
  end

  describe "#data_ia_a?" do
    it "check is data equal to type" do
      expect(@item.data_ia_a?('phone')).not_to be_nil 
    end
  end

  describe "#run" do
    it "process a question" do
      silence do
        expect { @item.run }.to raise_error NotImplementedError
      end
    end
  end 

  # describe "#run" do
  #   it "prints text" do
  #     @question_with_final = Chat::Question.new(:text => "Who are you?", :final => {:text => "Hope to hear you soon! Bye!"})
  #     expect { @question_with_final.run }.to output(/Who are you?/).to_stdout
  #   end
  # end 

  # describe "#run" do
  #   it "process a question with final" do
  #     @question_with_final = Chat::Question.new(:text => "Who are you?", :final => {:text => "Hope to hear you soon! Bye!"})
  #     expect(@question_with_final.run).to be_a SystemExit
  #   end
  # end 


end