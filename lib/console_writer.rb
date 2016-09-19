module Chat
  class ConsoleWriter
    def initialize(user = nil)
      @user = user
    end

    def puts_bot_text(str)
      if @user
        str = insert_values(str)
        @user.save_bot_message(str)
      end
      puts str
    end

    def insert_values(str)
      replace_hash = {
        '%user_name%' => @user.name,
        '%contact_type%' => @user.contact_type,
        '%contact%' => @user.contact
      }
      replace_hash.each { |k, v| str = str.gsub(k, v.to_s) }
      str
    end
  end
end
