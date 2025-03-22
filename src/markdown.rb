# frozen_string_literal: true

class Markdown

  def initialize(content)
    @content = content
  end

  def to_html
    html = String.new
    current_index = 0
    while current_index < markdown_lines.length
      html_content, lines_processed = to_html_line(current_index, markdown_lines)
      current_index += lines_processed
      html << html_content
    end
    html
  end

  private

  def markdown_lines
    @content.split("\n")
  end

  def to_html_line(current_line_index, lines)
    line = lines[current_line_index]
    raw_line = RawLine.new(line)
    mark_down = raw_line.to_markdown(lines, current_line_index)
    html_content, lines_processed = mark_down.to_html
    [html_content, lines_processed]
  end

end

require_relative 'raw_line'
require_relative 'heading_marker'
require_relative 'bold_marker'
require_relative 'italic_marker'
require_relative 'list_marker'

