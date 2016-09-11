module Chat
  class Final < Step
  
    include ConsoleWriter

    def run
      do_job()
      puts_bot_text(@text)
    end

    def do_job
      
    end
  
  end
end