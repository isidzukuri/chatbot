module Chat
	class Step
	
		include Init

		def self.next_step(hash)
			new(hash).next_step
		end

		def self.step_type_and_data(data)
			prefix = data['prefix'] ? data.delete('prefix') : ''
			class_name = "#{prefix.capitalize}#{self.name.split('::').last}"
			{:class => class_name, :data => data}
		end

		def run
			raise NotImplementedError, 'Implement "run" method in your class'
		end

		# in this way we can set a specific subclass in tree config.
		# to make this work properly use prefix option + class names convention.
		# example: prefix(happy or tragic) and class Final = HappyFinal or TragicFinal 
		# i have done this because i thought that it gives more flexibility to the tree configuration
		def next_step
			step = nil
			Chat.step_types.each do |item|
				step = get_class(item.capitalize).step_type_and_data(instance_variable_get("@#{item}")) if has_type?(item)
				break if step
			end
			raise NotImplementedError, 'Next step`s behavior not specified' if step.nil?
			run_next(step)
		end

		def has_type?(type)
			!!instance_variable_get("@#{type}")
		end

		def get_class(class_name)
			module_name = self.class.to_s.gsub(/::.*/, '')
			Object.const_get("#{module_name}::#{class_name}")
		end

		def run_next(step)
			klass = get_class(step[:class])
			klass.new(step[:data]).run	
		end

		def fallback_behaviour
			{"final" => {"text" => Chat.texts['insane']} }
		end


	end
end