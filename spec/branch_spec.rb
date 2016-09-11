require_relative 'spec_helper'

describe Chat::Branch do

  before :each do             
    @item = Chat::Branch.new("confirm_contact")
    @tree = Chat::Chatbot.new.load_tree_config
  end

  describe "#new" do
    it "returns a Branch object" do
      expect(@item).to be_a(Chat::Branch)
    end
  end

  describe "#find_branch_by_label" do
    it "searhs branch i question tree" do
      expect(@item.find_branch_by_label(@tree, "confirm_contact")).to be_a(Hash)
    end
  end

  describe "#find_branch_by_label" do
    it "searhs branch i question tree" do
      expect(@item.find_branch_by_label(@tree, "confirm_contact").keys).to include('question','text')
    end
  end

  describe "#run" do
    it "process a question with final" do
      silence do 
        expect{@item.run}.not_to raise_error 
      end
    end
  end 


end