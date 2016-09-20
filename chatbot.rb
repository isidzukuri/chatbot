require 'yaml'
require 'sqlite3'
require 'active_record'
# require 'awesome_print'

dirs = ['lib/*.rb', 'lib/models/*.rb', 'lib/steps/*.rb', 'lib/answers/*.rb']
dirs.each do |path|
  Dir[path].each { |file| require_relative file }
end

Chat::Chatbot.new.run
