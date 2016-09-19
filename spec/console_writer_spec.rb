require_relative 'spec_helper'

describe Chat::ConsoleWriter do
  before :each do
    @item = Chat::ConsoleWriter.new(create_full_user_data)
  end

  describe '#puts_bot_text' do
    it 'prints text in console' do
      silence do
        item = Chat::ConsoleWriter.new
        expect { item.puts_bot_text('te xt') }.to output(/te xt/).to_stdout
      end
    end
  end

  describe '#puts_bot_text' do
    it 'prints text in console' do
      silence do
        str = 'txt %user_name%'
        expect { @item.puts_bot_text(str) }.to output(/txt test/).to_stdout
      end
    end
  end

  describe '#insert_values' do
    it 'replace substr' do
      expect(@item.insert_values('te xt %user_name%')).to include('te xt test')
    end
  end
end
