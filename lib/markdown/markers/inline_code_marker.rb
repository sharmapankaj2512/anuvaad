# frozen_string_literal: true

# Handles conversion of inline code markdown syntax to HTML
# Processes `` style inline code markers to <code> tags
class InlineCodeMarker
  def initialize(lines, current_line_index)
    @line = lines[current_line_index]
  end

  def self.present?(line)
    line.match?(/(?<!`)`[^`\n]+`(?!`)/)
  end

  def to_html
    @line.gsub(/(?<!`)`([^`\n]+)`(?!`)/, '<code>\1</code>')
  end
end
