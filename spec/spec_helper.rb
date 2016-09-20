require 'yaml'
require 'sqlite3'
require 'active_record'
# require 'awesome_print'

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

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: '../db/chatbot.db'
)

Chat.writer = Chat::ConsoleWriter.new
Chat.user = Chat::UserData.new # (bot_user)

def create_full_user
  info = Info.create(email: 'dasddas@sadda.dd',
                     phone: 123_123,
                     contact_time: 'ASAP',
                     contact_type: 'Phone')
  User.create(name: 'test', info: info)
end

def create_full_user_data
  Chat::UserData.new Chat::Chatbot.new.bot_user, create_full_user
end
