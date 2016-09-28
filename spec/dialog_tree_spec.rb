require_relative 'spec_helper'

describe Chat::DialogTree do
  before :each do
    @tree = { 'question' => {
      'text' => 'Text text',
      'label' => 'find_me'
    } }
    @instance = Chat::DialogTree.new(@tree)
  end

  describe '#next_step' do
    it 'returns question or final object' do
      expect(@instance.next_step).to be_a(Chat::Question)
    end
  end

  describe '#find_branch' do
    it 'searches and finds dialog step with label' do
      expect(@instance.find_branch(@tree, 'find_me')).to be_a(Hash)
    end
  end

  describe '#find_branch' do
    it 'searches and NOT finds dialog step with label' do
      expect(@instance.find_branch(@tree, 'do_not_find_me')).to be_nil
    end
  end
end
