# frozen_string_literal: true

require "action_view"
require_relative "use/version"
require_relative "use/helpers"

module ActionView
  module Use
  end
end

ActiveSupport.on_load(:action_view) do
  include ActionView::Use::Helpers
end
