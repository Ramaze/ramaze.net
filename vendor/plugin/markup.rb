# Suck on that well crafted and tested code!
module Zen
  module Plugin
    class Markup
      def markdown(markup)
        # Standarize newlines
        markup.gsub!(/\r\n/, "\n")

        # Allow the use of code blocks for specific languages
        markup.gsub!(/```([a-zA-Z0-9_\-]+)\n/, '<pre class="\\1"><code class="\\1">')
        markup.gsub!('```', '</code></pre>')

        # Parse everything that's remaining
        markup = RDiscount.new(markup).to_html

        return markup
      end
    end
  end
end
