# frozen_string_literal: true

require "test_helper"

class ActionView::TestUse < ActiveSupport::TestCase
  def test_that_it_has_a_version_number
    assert_not_nil ::ActionView::Use::VERSION
  end
end
