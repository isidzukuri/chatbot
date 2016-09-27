module Chat
  class Step
    def initialize(init_vars = {})
      init_vars.each { |k, v| instance_variable_set("@#{k}", v) } if init_vars
      @init_vars = init_vars
    end

    def run(data_storage)
      @data_storage = data_storage
      action
    end

    def action
      raise NotImplementedError, 'Implement "action" method in your class'
    end

  end
end
