class NoMarker
  def initialize(lines, current_line_index)
    @line = lines[current_line_index]
  end

  def to_html
    "Error processing #{@line}"
  end
end