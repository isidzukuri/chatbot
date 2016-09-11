module Chat
	class Final < Step
	
		include ConsoleWriter

		def run
			do_job()
			puts_bot_text(@text)
			exit(true)
		end

		def do_job
			
		end
	
	end
end