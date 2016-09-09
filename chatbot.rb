require 'yaml'
require 'awesome_print'

Dir['lib/mixins/*.rb'].each {|file| require_relative file }
Dir['lib/*.rb'].each {|file| require_relative file }
Dir['lib/steps/*.rb'].each {|file| require_relative file }

# require_relative "lib/mixins/init"
# require_relative "lib/mixins/personal_data"
# require_relative "lib/question"
# require_relative "lib/answer"
# require_relative "lib/chatbot"
# require_relative "lib/final"
# require_relative "lib/happy_final"





module Chat

	include PersonalData

	Chatbot.new.run
end