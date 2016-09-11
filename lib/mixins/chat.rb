module Chat

	class << self
		@texts = {}
		@config = {}
		@step_types = []
		attr_accessor :tree, :texts, :config, :step_types, :bot_user, :user
	end
	
end