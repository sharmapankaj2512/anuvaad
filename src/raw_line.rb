class RawLine
  def initialize(line)
    @line = line
  end

  def to_markdown(lines, current_line_index)
    return BoldMarker.new(@line, lines, current_line_index) if BoldMarker.contains_bold_marker(@line)
    return ItalicMarker.new(@line, lines, current_line_index) if ItalicMarker.contains_italic_marker(@line)
    return UnorderedListMarker.new(@line, lines, current_line_index) if UnorderedListMarker.is_present(@line)

    HeadingMarker.new(@line, lines, current_line_index) if HeadingMarker.is_heading_marker(@line)
  end
end