module Chat
  class DialogTree
    def initialize(tree)
      @tree = tree
    end

    def next_step(tree_position = nil)
      tree_position ||= @tree
      tree_position = branch_hook(tree_position)
      step_data, type = resolve_type(tree_position)

      raise NotImplementedError, 'Next step not specified' if step_data.nil?
      klass = get_class(type)
      klass.new(step_data)
    end

    def find_branch(hash, label, parent = nil)
      branch = nil
      hash.each do |key, val|
        if key == 'label' && val == label
          branch = parent ? parent : hash
          break
        end
        branch = find_branch(val, label, hash) if val.is_a? Hash
        next unless !branch && val.is_a?(Array)
        val.each do |item|
          branch = find_branch(item, label, hash)
          break if branch
        end
      end
      branch
    end

    private

    def get_class(class_name)
      module_name = self.class.to_s.gsub(/::.*/, '')
      Object.const_get("#{module_name}::#{class_name.capitalize}")
    end

    def resolve_type(tree_position)
      step_data, type = nil
      %w(question final).each do |name|
        step_data = tree_position[name]
        type = name
        break if step_data
      end
      [step_data, type]
    end

    def branch_hook(tree_position)
      while tree_position['branch']
        tree_position = find_branch(@tree, tree_position['branch'])
      end
      tree_position
    end
  end
end
