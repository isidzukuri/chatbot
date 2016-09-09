module Chat
	module Step


		def self.included(includer)
			includer.class_eval do

				def self.step_type_and_data(data)
					name = self.name.split('::').last
					{:class => name, :data => data}
				end

			end
		end

		def run
			raise NotImplementedError, 'Implement "run" method in your class'
		end


	end
end