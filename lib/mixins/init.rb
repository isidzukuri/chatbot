module Chat
	module Init

		def initialize init_vars = {}
			init_vars.each{|k,v| self.instance_variable_set("@#{k}", v)} if init_vars
			@init_vars = init_vars			
		end

	end
end