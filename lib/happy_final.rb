require_relative "final"

module Chat
	class HappyFinal < Final

		def do_job
			Chat.user.info.save
		end
	
	end
end