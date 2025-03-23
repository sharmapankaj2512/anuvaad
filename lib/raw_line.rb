# frozen_string_literal: true

# Factory class that determines the appropriate markdown element for a given line
# Routes processing to specialized marker classes based on line content
class RawLine
  def initialize(lines, current_line_index)
    @line = lines[current_line_index]
    @lines = lines
    @current_line_index = current_line_index
  end

  def to_markdown
    return BoldMarker.new(@lines, @current_line_index) if BoldMarker.present?(@line)
    return ItalicMarker.new(@lines, @current_line_index) if ItalicMarker.present?(@line)
    return ListMarker.make(@lines, @current_line_index) if ListMarker.present?(@line)
    return LinkMarker.new(@lines, @current_line_index) if LinkMarker.present?(@line)
    return ImageMarker.new(@lines, @current_line_index) if ImageMarker.present?(@line)
    return HeadingMarker.new(@lines, @current_line_index) if HeadingMarker.present?(@line)

    NoMarker.new(@lines, @current_line_index)
  end
end

require_relative 'markdown/bold_marker'
require_relative 'markdown/italic_marker'
require_relative 'markdown/list_marker'
require_relative 'markdown/heading_marker'

require_relative 'markdown/link_marker.rb'

require_relative 'markdown/image_marker.rb'

require_relative 'markdown/no_marker.rb'
