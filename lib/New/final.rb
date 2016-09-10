module Chat
	class Final
	
		include Init
		include Step
		include Colorize

		def print_text
			puts green(@text)
		end

		def run
			do_job()
			print_text()
			exit
		end

		def do_job
			
		end

		def step_type_and_data data
			prefix = data.delete('prefix') || ''
			class_name = "#{prefix.capitalize}Final"
			{:class => class_name, :data => data}
		end
	
	end
end