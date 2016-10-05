require 'yaml'
require 'sqlite3'
require 'active_record'
require 'awesome_print'

dirs = ['lib/*.rb', 'lib/models/*.rb', 'lib/steps/*.rb', 'lib/answers/*.rb']

dirs.each do |path|
  Dir["../#{path}"].each { |file| require_relative file }
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

def data_storage_with_user
  config = {
    adapter: 'sqlite3',
    database: '../db/chatbot.db'
  }
  data_storage = Chat::DataStorage.new(config)
  data_storage.save('name', 'Test')
  data_storage
end
