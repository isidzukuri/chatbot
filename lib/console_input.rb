module Chat
  class ConsoleInput

    include Levenstein

    def initialize answers = [], distance = 3
      @distance = distance
      @answers = answers 
    end
    
    attr_reader :user_input

    def get_user_input
      @user_input = gets.chomp
    end

    def compare
      to_lower = @user_input.downcase
      @answers.find{|item| item['text'].downcase == to_lower}
    end

    def compare_levenstein
      distances = calculate_distances(@answers.map{|a| a['text']}, @user_input)
      lowest_distance_key = lowest_distance(distances)
      lowest_distance_key = (distances[lowest_distance_key] <= @distance) ? lowest_distance_key : false
    end
    
  end
end