module Chat
  class Chatbot
    PATH = File.expand_path('../', File.dirname(__FILE__))

    def run
      load_configs
      db_connection

      Chat.user = UserData.new(bot_user)
      Chat.writer = ConsoleWriter.new(Chat.user)

      ap User.last.info
      process_question_tree
    end

    def load_configs
      load_tree_config
      Chat.config = YAML.load_file("#{PATH}/config/config.yml")
    end

    def load_tree_config
      tree = YAML.load_file("#{PATH}/config/tree.yml")
      raise ArgumentError, 'Not valid config/tree.yml' unless tree
      # raise ArgumentError, 'U must set first question' if !tree['question']
      Chat.tree = tree
    end

    def db_connection
      ActiveRecord::Base.establish_connection(Chat.config['db'])
    end

    def bot_user
      User.find_or_create_by(name: 'ChatBot')
    end

    private

    def process_question_tree
      tree_position = Chat.tree
      while tree_position
        step = StepFactory.next_step(tree_position)
        tree_position = step.run
      end
    end
  end
end
