require_relative "answer"

module Chat
  class VariantAnswer < Answer

    
    def initialize init_vars = {}
      super
      @answers = @question.answers
    end

    def puts_comments
      print_answers()
      super
    end
    
    private

    def print_answers
      text = "#{@texts['possible_answers']}"
      @answers.each_with_index{|item, i| text = "#{text}\n \s\s#{i+1}) #{item['text']}"}
      puts_bot_text(text)
    end

    def suggest key
      puts_bot_text("Did you mean '#{@answers[key]['text']}' ?")
      puts_bot_text(@texts['yes_or_no'])
      ['y', 'yes'].include?(@input.get_user_input.downcase) ? @answers[key] : false
    end

    def process_text_input
      answer = @input.compare()
      set_answer_text(answer)
      if !answer
        answer = try_with_levenstein()
        answer = ask_same_again() if !answer && !@retry  
      end
      answer
    end

    def try_with_levenstein
      lowest_distance_key = @input.compare_levenstein()
      suggest(lowest_distance_key) if lowest_distance_key     
    end

    def set_answer_text(answer = nil)
      @text_answer = answer ? answer['text'] : @input.user_input
    end

    def answer_result
      input = @input.user_input
      if input.length == 1 && input.to_i.between?(1, @answers.length)
        answer = @answers[input.to_i-1]
      else
        answer = process_text_input()
      end
      set_answer_text(answer)
      answer = @question.fallback_behaviour() if !answer
      answer
    end

  end
end