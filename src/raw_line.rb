class RawLine
  def initialize(line)
    @line = line
  end

  def to_markdown(lines, current_line_index)
    return BoldMarker.new(@line, lines, current_line_index) if BoldMarker.is_present(@line)
    return ItalicMarker.new(@line, lines, current_line_index) if ItalicMarker.is_present(@line)
    return ListMarker.make(@line, lines, current_line_index) if ListMarker.is_present(@line)

    HeadingMarker.new(@line, lines, current_line_index) if HeadingMarker.is_present(@line)
  end
end

require_relative 'bold_marker'
require_relative 'italic_marker'
require_relative 'list_marker'
require_relative 'heading_marker'
