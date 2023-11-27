# lib/my_gem/railtie.rb
module ActionView
  module Use
    class Railtie < Rails::Railtie
        ActionView::Use.symbols_root = config.active_view_use_symbols_path || Rails.root.join("app", "views", "symbols")
    end
  end
end
