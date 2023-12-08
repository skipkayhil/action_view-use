# frozen_string_literal: true

module ActionView
  module Use
    class SymbolRenderer < AbstractRenderer
      def render(view, name)
        template = find_template(name)

        render_symbol_template(view, template)
      end

      private
        EMPTY_LOCALS = {}.freeze
        DETAILS = { formats: [:svg] }.freeze

        def render_symbol_template(view, template)
          content = template.render(view, EMPTY_LOCALS, add_to_stack: true) do |*name|
            view._layout_for(*name)
          end

          build_rendered_template(content, template)
        end

        def find_template(path)
          @lookup_context.find_template(path, ActionView::Use.prefixes, false, EMPTY_LOCALS, DETAILS)
        end
    end
  end
end
