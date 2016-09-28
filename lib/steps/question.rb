module Chat
  class Question < Step
    attr_reader :answers, :data_storage

    def ask
      text = @text
      if @answers
        text = "#{text}\nPossible answers:"
        @answers.each_with_index do |item, i|
          n = i + 1
          text = "#{text}\n \s\s#{n}) #{item['text']}"
        end
      end
      text = "#{text}\nEnter answer:"
      puts insert_values(text)
    end

    def data
      @data ? @data.downcase : nil
    end

    private

    def action
      ask
      answer = answer_instance.process_input
      answer ? answer : @init_vars
    end

    def answer_instance
      @answer ||= AnswerFactory.get_instance(self)
    end

    def insert_values(str)
      if interlocutor
        replace_hash = {
          '%user_name%' => interlocutor.name,
          '%contact_type%' => interlocutor.contact_type,
          '%contact%' => interlocutor.contact
        }
        replace_hash.each { |k, v| str = str.gsub(k, v.to_s) }
      end
      str
    end

    def interlocutor
      @data_storage ? @data_storage.user : nil
    end
  end
end
