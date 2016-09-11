module Chat
	class Question < Step

		include ConsoleWriter
		
		attr_reader :answers, :final
		attr_accessor :retry

		@retry = false

		def ask
			puts_bot_text(@text)
			@answer = Answer.new(:question => self)
			@answer.puts_comments()
			process_answer()
		end

		alias_method :run, :ask

		def data
			@data ? @data.downcase : nil
		end

		def data_ia_a?(label)
			!!(@data && @data == label)
		end

		private

		def process_answer			
			tree_position = @answer.process_input()
			tree_position ||= @init_vars
			Step.next_step(tree_position)
		end


	end
end