require_relative "colorize"

module Chat
  module ConsoleWriter

    include Colorize
    include UserWork

    def puts_bot_text(str)
      str = insert_values(str)
      save_bot_message(str)
      puts green(str)
    end

    def insert_values(str)
      replace_hash = {
        '%user_name%' => user_name(),
        '%contact_type%' => user_contact_type(),
        '%contact%' => user_contact()
      }
      replace_hash.each{|k,v| str = str.gsub(k, v.to_s) }
      str
    end

    def save_bot_message(text)
      Message.create(:text => text, :user => Chat.bot_user, :receiver => Chat.user) if Chat.user
    end
      

  end
end