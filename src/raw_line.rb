# frozen_string_literal: true

# Factory class that determines the appropriate markdown element for a given line
# Routes processing to specialized marker classes based on line content
class RawLine
  def initialize(line)
    @line = line
  end

  def to_markdown(lines, current_line_index)
    return BoldMarker.new(@line, lines, current_line_index) if BoldMarker.present?(@line)
    return ItalicMarker.new(@line, lines, current_line_index) if ItalicMarker.present?(@line)
    return ListMarker.make(@line, lines, current_line_index) if ListMarker.present?(@line)

    HeadingMarker.new(@line, lines, current_line_index) if HeadingMarker.present?(@line)
  end
end

require_relative 'bold_marker'
require_relative 'italic_marker'
require_relative 'list_marker'
require_relative 'heading_marker'
