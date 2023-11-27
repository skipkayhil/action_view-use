# frozen_string_literal: true

require "action_view"
require_relative "use/version"
require_relative "use/helpers"

require_relative "use/railtie" if defined?(Rails::Railtie)

module ActionView
  module Use
    class << self
      attr_reader :symbols_root

      def symbols_root=(path)
        @symbols_root = Pathname.new(path)
      end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include ActionView::Use::Helpers
end
