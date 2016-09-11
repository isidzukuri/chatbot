require_relative 'spec_helper'

describe Chat::Levenstein do

  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(Chat::Levenstein)
    @hash_of_strings = ['some string', 'SoME string', 'lorem ipsum']
  end

  describe "#levenshtein_distance" do
    it "compares strings" do
      expect(@dummy_class.levenshtein_distance('some string', 'some string')).to eq 0
    end
  end

  describe "#levenshtein_distance" do
    it "compares strings" do
      expect(@dummy_class.levenshtein_distance('some string', 'some other string')).not_to eq 0
    end
  end

  describe "#levenshtein_distance" do
    it "compares strings" do
      expect(@dummy_class.levenshtein_distance('some string', 'SOME string')).not_to eq 0
    end
  end

  describe "#levenshtein_distance" do
    it "compares strings" do
      expect(@dummy_class.levenshtein_distance('some string', 'SoME string')).to eq 3
    end
  end


  describe "#calculate_distances" do
    it "compare strings with the string and returns hash of results" do
      expect(@dummy_class.calculate_distances(@hash_of_strings, 'SoME string')).to be_a(Hash)
    end
  end


  describe "#lowest_distance" do
    it "returns lowest distance key" do
      hash = @dummy_class.calculate_distances(@hash_of_strings, 'SoME string')
      expect(@dummy_class.lowest_distance(hash)).to be_a(Integer)
    end
  end


end