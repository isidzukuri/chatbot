module Chat
	class Step
	
		include Init


		def self.next_step(hash)
			new(hash).next_step
		end

		def self.step_type_and_data(data)
			name = self.name.split('::').last
			{:class => name, :data => data}
		end


		def run
			raise NotImplementedError, 'Implement "run" method in your class'
		end
		
		def has_type?(type)
			!!instance_variable_get("@#{type}")
		end

		def next_step
			step = nil
			Chat.step_types.each do |item|
				step = get_class(item.capitalize).step_type_and_data(instance_variable_get("@#{item}")) if has_type?(item)
				break if step
			end
			raise NotImplementedError, 'Next step`s behavior not specified' if step.nil?
			run_next(step)
		end

		def run_next(step)
			klass = get_class(step[:class])
			klass.new(step[:data]).run			
		end

		def get_class(class_name)
			module_name = self.class.to_s.gsub(/::.*/, '')
			Object.const_get("#{module_name}::#{class_name}")
		end

		def fallback_behaviour
			{"final" => {"text" => Chat.texts['insane']} }
		end


	end
end