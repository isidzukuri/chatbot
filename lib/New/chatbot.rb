module Chat
	class Chatbot

# винести захардкоджені фрази
# збереження меседжів
# збереження юзера
# конфіг бд

	
		def run
			load_configs()
			check_tree_config()
			question = Question.new(@tree['question'])
				# ap question
			question.ask
		end

		def load_configs
			@tree = YAML.load_file('config/tree.yml')
			
			Chat.config = YAML.load_file('config/config.yml')

			Chat.texts = YAML.load_file('config/text.yml')
			
			Chat.step_types = Chat.config['step_classes']
			# You can create a new step-class with new logic, smtn like survey, pool or ... 
			# After adding it to this list u will be able to include it in a question tree
			# every step-class must have two methods implemented in Chat::Step mixin 
		end

		def check_tree_config
			raise ArgumentError, 'Configuration file config/tree.yml is empty.' if !@tree
			raise ArgumentError, 'U must set first question' if !@tree['question']
		end


	end
end