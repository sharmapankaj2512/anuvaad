# frozen_string_literal: true

# Null object that does returns text which can help in debugging.
class NoMarker
  def initialize(lines, current_line_index)
    @line = lines[current_line_index]
  end

  def to_html
    "Error processing #{@line}"
  end
end
