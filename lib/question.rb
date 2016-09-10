module Chat
	class Question < Step

		include ConsoleWriter
		
		attr_reader :answers, :final

		@retry = false

		def ask
			@input = ConsoleInput.new(self)
			puts_bot_text(@text)

			print_answers() # prins some answers comments

			puts_bot_text(Chat.texts['enter_answer'])
			
			process_input() #answer process input

			Step.next_step(@tree_position)
		end

		alias_method :run, :ask

		private





		# should i separate answer logic to different class? maybe...
		# diferent types of ducks(Answer, AnswerWithVariants, AnswerSomeOtherType) will simplify my life in future
		# but its test task.		

		def has_variants?
			!!@answers	
		end

		def process_input
			@input.get_user_input					
			if has_variants?
				find_answer_in_variants()
			else
				# freestyle input
				# save user_name to persobal_data
				@tree_position = @init_vars											
			end	
		end

		


		# AnswerWithVariants


		def print_answers
			if has_variants?
				puts_bot_text(Chat.texts['possible_answers'])
				@answers.each_with_index{|item, i| puts_bot_text("\s\s#{i+1}) #{item['text']}")}
			end
		end

		def suggest key
			puts_bot_text("Did you mean '#{@answers[key]['text']}' ?")
			puts_bot_text(Chat.texts['yes_or_no'])
			['y', 'yes'].include?(@input.get_user_input.downcase) ? @answers[key] : false
		end

		def ask_same_again
			@retry = true
			puts_bot_text(Chat.texts['answer_again'])
			puts_bot_text(Chat.texts['ask_again'])
			ask()
		end

		def find_answer_in_variants
			input = @input.user_input
			if input.length == 1 && input.to_i.between?(1, @answers.length)
				answer = @answers[input.to_i-1]
			else
				answer = process_text_input()
			end
			@tree_position = answer
		end

		def process_text_input
			answer = @input.compare()
			if !answer
				answer = try_with_levenstein()
		
				ask_same_again() if !answer && !@retry
				
				answer = fallback_behaviour() if !answer	
			end
			answer
		end

		def try_with_levenstein
			lowest_distance_key = @input.compare_levenstein()
			answer = suggest(lowest_distance_key) if lowest_distance_key			
		end

	end
end