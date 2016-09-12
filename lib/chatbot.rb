module Chat
  class Chatbot

    PATH = File.expand_path("../",File.dirname(__FILE__))

    def run
      load_configs()
      db_connection()
      get_bot_user()
      Step.next_step(Chat.tree)
    end

    def load_configs
      load_tree_config()
      Chat.config = YAML.load_file("#{PATH}/config/config.yml")
      Chat.texts = YAML.load_file("#{PATH}/config/text.yml")
      Chat.step_types = Chat.config['step_classes']
      # You can create a new step-class with new logic, smtn like survey, poll, comment or greeting 
      # After adding it to this list you will be able to include it in a question tree 
    end

    def load_tree_config
      tree = YAML.load_file("#{PATH}/config/tree.yml")
      raise ArgumentError, 'Configuration file config/tree.yml is empty.' if !tree
      # raise ArgumentError, 'U must set first question' if !tree['question']
      Chat.tree = tree
    end

    def db_connection
      ActiveRecord::Base.establish_connection(
        adapter:  Chat.config['db']['adapter'],
        database: "#{PATH}/#{Chat.config['db']['database']}"
      )
    end

    def get_bot_user
      Chat.bot_user = User.find_or_create_by(name: 'ChatBot')
    end


  end
end