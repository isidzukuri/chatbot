module Chat
	module Init

		def initialize init_vars = {}
			init_vars.each{|k,v| self.instance_variable_set("@#{k}", v)} if init_vars
				# self.instance_eval("def #{k};@#{k};end")
			@init_vars = init_vars			
		end

		def get_class class_name
			module_name = self.class.to_s.gsub(/::.*/, '')
			Object.const_get("#{module_name}::#{class_name.capitalize}")
		end

	end
end