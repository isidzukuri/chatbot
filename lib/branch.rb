module Chat
  class Branch < Step

    def initialize(label)
      @label = label
    end

    def run
      branch = find_branch_by_label(Chat.tree, @label)
      Step.next_step(branch)
    end

    def find_branch_by_label(hash, label, parent = nil)
      branch = nil
      hash.each do |key, val|
        if key == 'label' && val == label
          branch = parent ? parent : hash
          break
        end
        if val.is_a? Hash
          branch = find_branch_by_label(val, label, hash)
        end
        if !branch && val.is_a?(Array)
          val.each do |item|
            branch = find_branch_by_label(item, label, hash)
            break if branch
          end
        end
      end
      branch
    end


  end
end