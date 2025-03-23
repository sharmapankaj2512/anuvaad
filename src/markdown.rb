# frozen_string_literal: true

# Markdown parser that converts markdown text to HTML
# Processes content line by line, converting markdown syntax to corresponding HTML tags
class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    html = String.new
    current_index = 0
    lines = markdown_lines
    while current_index < lines.length
      html_content, lines_processed = to_html_line(lines, current_index)
      current_index += lines_processed
      html << html_content
    end
    html
  end

  private

  def markdown_lines
    @content.split("\n").reject(&:empty?)
  end

  def to_html_line(lines, current_line_index)
    raw_line = RawLine.new(lines, current_line_index)
    mark_down = raw_line.to_markdown
    html_content, lines_processed = mark_down.to_html
    [html_content, lines_processed]
  end
end

require_relative 'raw_line'
