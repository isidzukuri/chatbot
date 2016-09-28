module Chat
  class Answer
    def initialize(question)
      @question = question
      @answer_text = ''
      @data_storage = question.data_storage
    end

    def process_input
      @tree_position = nil
      user_input = input
      @tree_position = answer_result
      save_data if data
      @data_storage.save_message(user_input)
      @tree_position
    end

    private

    def data
      @question.data
    end

    def save_data
      saved = @data_storage.save(data, @answer_text)
      @tree_position = fallback_behaviour unless saved
    end

    def input
      @input = gets.chomp
    end

    def answer_result
      @answer_text = @input
      nil
    end

    def fallback_behaviour
      { 'final' => { 'text' => 'Wrong answer. Bye!' } }
    end
  end
end
