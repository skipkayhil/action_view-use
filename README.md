# ActionView::Use

An Action View extension for rendering inline SVGs

## Installation

Install the gem and add to the application's Gemfile by executing:

```shell
$ bundle add action_view-use
```

## Usage

Add `all_used_symbols` to the end of the `<body>` in
`app/views/layouts/application.html.erb`:

```erb
    <%= all_used_symbols %>
  </body>
</html>
```

Create SVG symbols to use in your views:

```erb
<%# app/views/symbols/logo.svg.erb %>
<svg>
  <!--- logo content -->
</svg>
```

And then render symbols in your views:

```erb
<%= use_symbol "logo" %>
```

That's it!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/skipkayhil/action_view-use.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).
