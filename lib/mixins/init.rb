module Chat
	module Init

		def initialize init_vars = {}
			init_vars.each{|k,v| self.instance_variable_set("@#{k}", v)} if init_vars
				# self.instance_eval("def #{k};@#{k};end")
			@init_vars = init_vars			
		end

	end
end