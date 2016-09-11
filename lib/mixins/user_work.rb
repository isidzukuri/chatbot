module Chat
	module UserWork

		def save_user_message(text)
			Message.create(:text => text, :user => Chat.user, :receiver => Chat.bot_user) if Chat.user
		end

		def user_name
			Chat.user ? Chat.user.name : ''
		end

		def user_contact_type
			Chat.user ? Chat.user.info.contact_type : ''
		end

		def user_contact
			Chat.user && Chat.user.info.contact_type.present? ? Chat.user.info[Chat.user.info.contact_type.downcase] : ''
		end

		def create_user hash
			user_data = {:name => '', :info => Info.create()}
			user_data.merge!(hash)
			Chat.user = User.create(user_data) if !Chat.user 
		end

		def set_user_data hash
			hash.each{|k, v| Chat.user.info[k.to_s] = v} if Chat.user 
		end

		def is_data_field_valid?(key)
			Chat.user.info[key].present? && Chat.user.info.valid?
		end

	end
end