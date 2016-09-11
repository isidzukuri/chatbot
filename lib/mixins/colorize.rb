module Chat
  module Colorize

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def red(text)
      colorize(text, 31)
    end

    def green(text)
      colorize(text, 32)
    end

    def magneta(text)
      colorize(text, 35)
    end

    def bold(text)
      colorize(text, 1)
    end

  end
end