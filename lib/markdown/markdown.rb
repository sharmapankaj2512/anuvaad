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

  # Factory class that determines the appropriate markdown element for a given line
  # Routes processing to specialized marker classes based on line content
  class RawLine
    def initialize(lines, current_line_index)
      @line = lines[current_line_index]
      @lines = lines
      @current_line_index = current_line_index
    end

    def to_markdown
      return ListMarker.make(@lines, @current_line_index) if ListMarker.present?(@line)
      return HeadingMarker.new(@lines, @current_line_index) if HeadingMarker.present?(@line)
      return InlineMarker.new(@lines, @current_line_index) if InlineMarker.present?(@line)

      NoMarker.new(@lines, @current_line_index)
    end
  end
end

require_relative 'markers/bold_marker'
require_relative 'markers/italic_marker'
require_relative 'markers/list_marker'
require_relative 'markers/heading_marker'
require_relative 'markers/link_marker'
require_relative 'markers/image_marker'
require_relative 'markers/no_marker'

class InlineMarker
  def initialize(lines, current_line_index)
    @lines = lines
    @current_line_index = current_line_index
  end

  def self.present?(line)
    BoldMarker.present?(line) ||
      ItalicMarker.present?(line) ||
      LinkMarker.present?(line) ||
      ImageMarker.present?(line)
  end

  def to_html
    if BoldMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = BoldMarker.new(@lines, @current_line_index).to_html
    end
    if ItalicMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = ItalicMarker.new(@lines, @current_line_index).to_html
    end
    if LinkMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = LinkMarker.new(@lines, @current_line_index).to_html
    end
    if ImageMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = ImageMarker.new(@lines, @current_line_index).to_html
    end
    [@lines[@current_line_index], 1]
  end
end