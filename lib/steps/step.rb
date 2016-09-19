module Chat
  class Step

    def initialize init_vars = {}
      init_vars.each{|k,v| self.instance_variable_set("@#{k}", v)} if init_vars
      @init_vars = init_vars
      @writer = Chat.writer     
    end

    def run
      raise NotImplementedError, 'Implement "run" method in your class'
    end
   
  end
end