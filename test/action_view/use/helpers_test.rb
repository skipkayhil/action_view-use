# frozen_string_literal: true

require "test_helper"

module ActionView::Use
  class HelpersTest < ActionView::TestCase
    test "use_symbol renders use in svg" do
      assert_dom_equal <<~HTML, use_symbol("icons/home")
        <svg xmlns="http://www.w3.org/2000/svg">
          <use href="#icons/home" />
        </svg>
      HTML
    end

    test "all_used_symbols works with no used symbols" do
      assert_dom_equal <<~HTML, all_used_symbols
        <svg xmlns="http://www.w3.org/2000/svg"></svg>
      HTML
    end

    test "all_used_symbols renders a used symbol" do
      view.lookup_context.prepend_view_paths ["test/fixtures/views"]

      use_symbol "circle"

      assert_dom_equal <<~HTML, all_used_symbols
        <svg xmlns="http://www.w3.org/2000/svg">
          <symbol id="circle">
            <svg xmlns="http://www.w3.org/2000/svg">
              <circle cx="5" cy="5" r="5" />
            </svg>
          </symbol>
        </svg>
      HTML
    end

    test "all_used_symbols renders a used symbol only once" do
      view.lookup_context.prepend_view_paths ["test/fixtures/views"]

      use_symbol "circle"
      use_symbol "circle"
      use_symbol "circle"

      assert_dom_equal <<~HTML, all_used_symbols
        <svg xmlns="http://www.w3.org/2000/svg">
          <symbol id="circle">
            <svg xmlns="http://www.w3.org/2000/svg">
              <circle cx="5" cy="5" r="5" />
            </svg>
          </symbol>
        </svg>
      HTML
    end

    test "all_used_symbols renders multiple symbols" do
      view.lookup_context.prepend_view_paths ["test/fixtures/views"]

      use_symbol "icons/square"
      use_symbol "circle"

      assert_dom_equal <<~HTML, all_used_symbols
        <svg xmlns="http://www.w3.org/2000/svg">
          <symbol id="icons/square">
            <svg xmlns="http://www.w3.org/2000/svg">
              <rect x="10" y="10" width="10" height="10"/>
            </svg>
          </symbol>
          <symbol id="circle">
            <svg xmlns="http://www.w3.org/2000/svg">
              <circle cx="5" cy="5" r="5" />
            </svg>
          </symbol>
        </svg>
      HTML
    end
  end
end
