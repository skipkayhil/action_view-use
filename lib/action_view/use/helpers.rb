# frozen_string_literal: true

module ActionView
  module Use
    module Helpers
      def use_symbol(name)
        used_symbol_set << name

        <<~HTML.html_safe
          <svg xmlns="http://www.w3.org/2000/svg">
            <use href="##{name}" />
          </svg>
        HTML
      end

      def all_used_symbols
        html = +"" << '<svg xmlns="http://www.w3.org/2000/svg">'

        used_symbol_set.each do |name|
          html << '<symbol id="' << name << '">'
          html << render(file: symbol_path(name), formats: [:svg])
          html << "</symbol>"
        end

        html << "</svg>"
        html.html_safe
      end

      private
        def used_symbol_set
          @used_symbol_set ||= Set.new
        end

        def symbol_path(name)
            byebug
          ActionView::Use.symbols_root.join(name + ".svg")
        end
    end
  end
end
