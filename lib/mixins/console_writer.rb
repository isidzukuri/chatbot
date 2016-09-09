require_relative "colorize"

module Chat
	module ConsoleWriter

		include Colorize

		def puts_bot_text str
			# replace [%user_name%]
			puts green(str)
		end

	end
end