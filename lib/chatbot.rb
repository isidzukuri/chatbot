module Chat
  class Chatbot
    PATH = File.expand_path('../', File.dirname(__FILE__))

    def initialize
      @tree = DialogTree.new(Config.load("#{PATH}/config/tree.yml"))
      @data_storage = DataStorage.new(Config.load("#{PATH}/config/db.yml"))
    end

    def run
      tree_position = true
      step = @tree.next_step
      while tree_position
        tree_position = step.run(@data_storage)
        step = @tree.next_step(tree_position)
      end
    end
  end
end
