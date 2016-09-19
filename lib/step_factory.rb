module Chat
  class StepFactory
    def self.next_step(tree_position)
      step_data, type = nil
      %w(question final branch).each do |name|
        step_data = tree_position[name]
        type = name
        break if step_data
      end
      raise NotImplementedError, 'Next step not specified' if step_data.nil?
      klass = get_class(type)
      klass.new(step_data)
    end

    def self.get_class(class_name)
      module_name = to_s.gsub(/::.*/, '')
      Object.const_get("#{module_name}::#{class_name.capitalize}")
    end
  end
end
