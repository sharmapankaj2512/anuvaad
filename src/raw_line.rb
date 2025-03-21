class RawLine
  def initialize(line)
    @line = line
  end

  def to_markdown(lines, current_line_index)
    return BoldMarker.new(@line, lines, current_line_index) if BoldMarker.is_present(@line)
    return ItalicMarker.new(@line, lines, current_line_index) if ItalicMarker.is_present(@line)
    return UnorderedListMarker.new(@line, lines, current_line_index) if UnorderedListMarker.is_present(@line)

    HeadingMarker.new(@line, lines, current_line_index) if HeadingMarker.is_heading_marker(@line)
  end
end