require_relative 'spec_helper'

describe Chat::Chatbot do

	before :each do
    @item = Chat::Chatbot.new
	end

	describe "#new" do
    it "returns a Chatbot object" do
      expect(@item).to be_a(Chat::Chatbot)
    end
	end

	describe "#load_tree_config" do
    it "load questions tree configuration" do
      expect(@item.load_tree_config).to be_a(Hash) 
    end
	end

	describe "#load_configs" do
    it "load configuration files" do
      expect { @item.load_configs }.not_to raise_error
    end
	end

	describe "#db_connection" do
    it "connects to db" do
    	expect { @item.db_connection }.not_to raise_error
    end
	end

	describe "#get_bot_user" do
    it "returns bot user" do
    	@item.db_connection
    	expect(@item.get_bot_user).to be_a(User) 
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