module Chat
  class DataStorage
    attr_reader :user

    def initialize(config)
      @config = config
      db_connection
      @info_columns = Info.column_names
    end

    def save(key, val)
      if key == 'name'
        create_user(val)
      elsif @info_columns.include?(key)
        save_info(key, val)
      end
    end

    def save_message(text)
      Message.create(text: text, user: person, receiver: bot_user) if @user
    end

    def save_bot_message(text)
      Message.create(text: text, user: bot_user, receiver: person) if @user
    end

    private

    def create_user(name)
      user_data = { name: name, info: Info.create }
      @user = User.create(user_data) unless @user
    end

    def info
      user.info
    end

    def save_info(key, val)
      info[key] = val
      val.present? && info.valid? ? info.save : false
    end

    def db_connection
      ActiveRecord::Base.establish_connection(@config)
    end

    def person
      @user ||= create_user('')
    end

    def bot_user
      @bot ||= User.find_or_create_by(name: 'ChatBot')
    end
  end
end
