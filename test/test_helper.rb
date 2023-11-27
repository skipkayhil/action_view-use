# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "action_view/use"

require "minitest/autorun"
require "byebug"

ActionView::Use.symbols_root = Pathname.new(Dir.pwd).join("test","fixtures", "views", "symbols")
