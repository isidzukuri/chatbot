require_relative 'spec_helper'

describe Chat::Chatbot do
  before :each do
    @item = Chat::Final.new(text: 'this is spar.... final!')
  end

  describe '#new' do
    it 'returns a Final object' do
      expect(@item).to be_a(Chat::Final)
    end
  end

  describe '#do_job' do
    it 'do some job before exit' do
      expect { @item.do_job }.not_to raise_error
    end
  end

  # describe "#run" do
  #   it "prints text" do
  #     expect { @item.run }.to output(/this is spar.... final!/).to_stdout
  #   end
  # end
end
