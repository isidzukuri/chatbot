module Chat
	class Question

		include Init
		include Step
		include Levenstein
		include ConsoleWriter
		
		@retry = false

		def ask
			puts_bot_text(@text)
			print_answers()
			puts_bot_text('enter answer:')
			result = process_input()
		end

		alias_method :run, :ask

		private

		def print_answers
			if has_variants?
				puts_bot_text("Possible answers:")
				@answers.each_with_index{|item, i| puts_bot_text("\s\s#{i+1}) #{item['text']}")}
			end
		end

		def has_variants?
			!!@answers	
		end

		def get_user_input
			@user_input = gets.chomp
		end

		def proceed
			@next_step = @current_answer.next_step
			klass = get_class(@next_step[:class])
			klass.new(@next_step[:data]).run
		end

		def process_input
			get_user_input()					
			if has_variants?
				find_answer_in_variants()
			else
				# freestyle input
				# save user_name to persobal_data
				@current_answer = Answer.new(@init_vars)											
			end	
			proceed()
		end

		def find_answer_in_variants
			if @user_input.length == 1 && @user_input.to_i.between?(1, @answers.length)
				answer = @answers[@user_input.to_i-1]
			else
				answer = process_text_input()
			end
			@current_answer = Answer.new(answer)
		end

		def fallback_behaviour
			{"final" => {"text" => "Sorry, but u are insane! Bye!"} }
		end

		def suggest key
			puts_bot_text("Did you mean '#{@answers[key]['text']}' ?")
			puts_bot_text('Type "yes" or "no" please:')
			get_user_input()
			['y', 'yes'].include?(@user_input.downcase) ? @answers[key] : false
		end

		def ask_same_again
			@retry = true
			puts_bot_text('Sorry, but i cant get it. Can you answer again?')
			puts_bot_text('Try to choose from suggested answers. u can answer by typing message or number of hot variant. So, the question is:')
			ask()
		end

		def process_text_input
			answer = @answers.find{|item| item['text'] == @user_input}
			if !answer
				#levenstein
				distances = calculate_distances(@answers, @user_input)
				lowest_distance_key = lowest_distance(distances)
				answer = suggest(lowest_distance_key) if distances[lowest_distance_key] <= 2
				
				ask_same_again() if !answer && !@retry
				
				answer = fallback_behaviour() if !answer	
			end
			answer
		end

	end
end