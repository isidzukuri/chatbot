module Chat
  class UserData

    def initialize bot = nil, user = nil
      @user = user
      @bot = bot
    end

    def create hash
      user_data = {:name => '', :info => Info.create()}
      user_data.merge!(hash)
      @user = User.create(user_data) if !@user 
    end

    def name
      @user ? @user.name : ''
    end

    def contact_type
      type = @user ? @user.info.contact_type : ''
      type.to_s
    end

    def contact
      @user && @user.info.contact_type.present? ? @user.info[@user.info.contact_type.downcase] : ''
    end

    def save_data key, val
      result = true
      if Info.column_names.include?(key)
        @user.info[key] = val
        result = (val.present? && @user.info.valid?) ? @user.info.save : false    
      end
      result
    end

    def save_message(text)
      Message.create(:text => text, :user => @user, :receiver => @bot) if @user
    end
    
    def save_bot_message(text)
      Message.create(:text => text, :user => @bot, :receiver => @user) if @user
    end

  end
end