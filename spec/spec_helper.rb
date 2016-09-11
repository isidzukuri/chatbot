require 'yaml'
require 'sqlite3'
require 'active_record'
require 'awesome_print'

['../lib/mixins/*.rb', '../lib/*.rb', '../lib/models/*.rb'].each do |path|
	Dir[path].each {|file| require_relative file }
end 

def silence
  # Store the original stderr and stdout in order to restore them later
  @original_stderr = $stderr
  @original_stdout = $stdout
  # Redirect stderr and stdout
  $stderr = $stdout = StringIO.new
  yield
  $stderr = @original_stderr
  $stdout = @original_stdout
  @original_stderr = nil
  @original_stdout = nil
end

Chat::Chatbot.new.load_tree_config

class DummyClass
end