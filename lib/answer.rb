module Chat
	class Answer
	
		include Init

		def next_step
			step = nil
			$step_types.each do |item|
				step = get_class(item).step_type_and_data(instance_variable_get("@#{item}")) if has_type?(item)
				break if step
			end
			raise NotImplementedError, 'Next step`s behavior not specified' if step.nil?
			step
		end

		def has_type? type
			!!instance_variable_get("@#{type}")
		end


	end
end