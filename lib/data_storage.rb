module Chat
  class DataStorage

    attr_reader :user

    def initialize config
      @config = config
      db_connection
    end

    def create_user(name)
      user_data = { name: name, info: Info.create }
      @user = User.create(user_data) unless @user
    end

    def save key, val
      if key == 'name'
        create_user(val)
      elsif Info.column_names.include?(key)
        save_info(key, val)
      end
    end

    def save_message(text)
      Message.create(text: text, user: @user, receiver: bot_user) if @user
    end

    def save_bot_message(text)
      Message.create(text: text, user: bot_user, receiver: @user) if @user
    end

    private

    def info
      @user.info
    end

    def save_info(key, val)
      info[key] = val
      val.present? && info.valid? ? info.save : false
    end

    def db_connection
      ActiveRecord::Base.establish_connection(@config)
    end
    
    def bot_user
      @bot ||= User.find_or_create_by(name: 'ChatBot')
    end
  end
end
