module Chat
	class Answer

		include Init
		include ConsoleWriter
		include UserWork
		
		def initialize init_vars = {}
			super
			@input = ConsoleInput.new(@question)
			@answers = @question.answers
			@texts = Chat.texts
			@info_columns = Info.column_names
			@text_answer = ''
		end

		def puts_comments
			print_answers()
			puts_bot_text(@texts['enter_answer'])
		end

		def process_input
			tree_position = nil
			@input.get_user_input	

			save_user_message(@input.user_input)			
			create_user(:name => @input.user_input) if @question.data_ia_a?('name')
		
			if has_variants?
				tree_position = find_answer_in_variants()
			else
				set_answer_text()								
			end

			save_data()

			tree_position
		end

		
		private

		def save_data
			if @question.data && @info_columns.include?(@question.data)
				set_user_data({@question.data => @text_answer})
				validate_data()
			end
		end

		def validate_data
			if !is_data_field_valid?(@question.data)
				while !is_data_field_valid?(@question.data) 
				  invalid_data_callback()
				end
			end
		end

		def invalid_data_callback
			puts_bot_text(@texts['input_not_valid'])
		  @input.get_user_input	
		  set_answer_text()
		  set_user_data({@question.data => @text_answer})
		end

		def has_variants?
			!!@answers	
		end

		def print_answers
			if has_variants?
				text = "#{@texts['possible_answers']}"
				@answers.each_with_index{|item, i| text = "#{text}\n \s\s#{i+1}) #{item['text']}"}
				puts_bot_text(text)
			end
		end

		def suggest key
			puts_bot_text("Did you mean '#{@answers[key]['text']}' ?")
			puts_bot_text(@texts['yes_or_no'])
			['y', 'yes'].include?(@input.get_user_input.downcase) ? @answers[key] : false
		end

		def ask_same_again
			@question.retry = true
			puts_bot_text(@texts['answer_again'])
			puts_bot_text(@texts['ask_again'])
			@question.ask()
		end

		def find_answer_in_variants
			input = @input.user_input
			if input.length == 1 && input.to_i.between?(1, @answers.length)
				answer = @answers[input.to_i-1]
			else
				answer = process_text_input()
			end
			set_answer_text(answer)
			answer
		end

		def process_text_input
			answer = @input.compare()
			set_answer_text(answer)
			if !answer
				answer = try_with_levenstein()
		
				ask_same_again() if !answer && !@question.retry
				set_answer_text(answer)

				answer = @question.fallback_behaviour() if !answer	
			end
			answer
		end

		def try_with_levenstein
			lowest_distance_key = @input.compare_levenstein()
			suggest(lowest_distance_key) if lowest_distance_key			
		end

		def set_answer_text(answer = nil)
			@text_answer = answer ? answer['text'] : @input.user_input
		end

	end
end