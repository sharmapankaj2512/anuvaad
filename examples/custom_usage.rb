#!/usr/bin/env ruby
# frozen_string_literal: true

# Example showing how to use Anuvaad as a library in custom Ruby code

require_relative '../lib/markdown/markdown'

# Example 1: Convert string directly
markdown_string = <<~MARKDOWN
  # Hello World

  This is **bold** and *italic* text.

  - List item 1
  - List item 2

  [Link to Google](https://google.com)
MARKDOWN

puts 'Example 1 Output:'
puts Markdown.new(markdown_string).to_html
puts "\n\n"

# Example 2: Read from file, write to file
if File.exist?('examples/basic_example.md')
  puts 'Example 2: Converting examples/basic_example.md to output.html'
  markdown_content = File.read('examples/basic_example.md')
  html_output = Markdown.new(markdown_content).to_html

  File.write('output.html', html_output)
  puts 'Conversion complete! Check output.html'
else
  puts 'Example 2: examples/basic_example.md not found'
end
