# Anuvaad

A simple multi-purpose converter written in Ruby, which supports only markdown to html at the moment.

## Features
- Markdown
  - Heading support (h1-h6)
  - Text formatting (bold, italic)
  - Lists (ordered and unordered)
  - Links
  - Images

## Usage

```ruby
require_relative 'lib/markdown'

content = "# Hello World\n\nThis is **bold** and this is _italic_.\n\n- List item 1\n- List item 2"
html = Markdown.new(content).to_html
puts html
```

## Development

### Running Tests

```bash
rake test
```

## License

This project is licensed under the Parity + No AI License. See [License.md](License.md) for details.
