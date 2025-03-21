# Anuvaad

A simple Markdown-to-HTML converter written in Ruby.

## Features

- Heading support (h1-h6)
- Text formatting (bold, italic)
- Lists (ordered and unordered)

## Usage

```ruby
require_relative 'src/markdown'

markdown_text = "# Hello World\n\nThis is **bold** and this is _italic_.\n\n- List item 1\n- List item 2"
html = Markdown.new(markdown_text).to_html
puts html
```

## Development

### Running Tests

```bash
rake test
```

## License

This project is licensed under the Parity + No AI License. See [License.md](License.md) for details.