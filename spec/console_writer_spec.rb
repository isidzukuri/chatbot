require_relative 'spec_helper'

describe Chat::ConsoleWriter do
  before :each do
    @item = Chat::ConsoleWriter.new(create_full_user_data)
  end

  describe '#puts_bot_text' do
    it 'prints text in console' do
      silence do
        item = Chat::ConsoleWriter.new
        expect { item.puts_bot_text('text text') }.to output(/text text/).to_stdout
      end
    end
  end

  describe '#puts_bot_text' do
    it 'prints text in console' do
      silence do
        expect { @item.puts_bot_text('text text %user_name%') }.to output(/text text test/).to_stdout
      end
    end
  end

  describe '#insert_values' do
    it 'replace substr' do
      expect(@item.insert_values('text text %user_name%')).to include('text text test')
    end
  end
  
end
