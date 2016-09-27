module Chat
  class Config

    def self.load path
      config = YAML.load_file(path)
      raise ArgumentError, 'Not valid config' unless config
      config
    end

  end
end
