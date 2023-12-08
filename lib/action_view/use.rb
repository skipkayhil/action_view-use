# frozen_string_literal: true

require "action_view"
require_relative "use/version"
require_relative "use/helpers"
require_relative "use/symbol_renderer"

module ActionView
  module Use
    singleton_class.attr_accessor :prefixes
    self.prefixes = ["symbols"]
  end
end

ActiveSupport.on_load(:action_view) do
  include ActionView::Use::Helpers
end
