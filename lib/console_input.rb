module Chat
	class ConsoleInput

		include Levenstein

		def initialize host = nil
			@host = host			
		end
		
		attr_reader :user_input

		def get_user_input
			@user_input = gets.chomp
		end

		def compare
			to_lower = @user_input.downcase
			@host.answers.find{|item| item['text'].downcase == to_lower}
		end

		def compare_levenstein
			distances = calculate_distances(@host.answers.map{|a| a['text']}, @user_input)
			lowest_distance_key = lowest_distance(distances)
			lowest_distance_key = distances[lowest_distance_key] <= Chat.config['levenstein_distance'] ? lowest_distance_key : false
		end
		
	end
end