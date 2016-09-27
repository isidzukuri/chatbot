module Chat
  class Chatbot
    
    PATH = File.expand_path('../', File.dirname(__FILE__))

    def run
      @tree = DialogTree.new(Config.load("#{PATH}/config/tree.yml"))
      @data_storage = DataStorage.new(Config.load("#{PATH}/config/db.yml"))
      # @writer = ConsoleWriter.new

      ap User.last
      ap User.last.info

      # ap Message.all

      process_dialog
    end


    private

    def process_dialog
      tree_position = true
      step = @tree.next_step
      while tree_position
        tree_position = step.run(@data_storage)
        step = @tree.next_step(tree_position)
      end
    end

  end
end
