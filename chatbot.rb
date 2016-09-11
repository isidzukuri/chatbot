require 'yaml'
require 'sqlite3'
require 'active_record'
require 'awesome_print'

['lib/mixins/*.rb', 'lib/*.rb', 'lib/models/*.rb'].each do |path|
	Dir[path].each {|file| require_relative file }
end 

Chat::Chatbot.new.run
