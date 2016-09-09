module Chat
	module PersonalData

		def self.included(includer)
			includer.class_eval do

				@person_data = {}

			 	def self.personal_data
			 		@person_data 
			 	end

			 	def self.add_personal_data(data = {})
			 		@person_data.merge!(data)
			 	end

			end
		end


	end
end