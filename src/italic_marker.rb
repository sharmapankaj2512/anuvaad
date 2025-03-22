# frozen_string_literal: true

# Handles conversion of italic markdown syntax to HTML
# Processes both * and _ style italic markers to <i> tags
class ItalicMarker
  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def self.present?(line)
    pattern = /(\*[^*]+\*)|(_[^_]+_)/
    line.match?(pattern)
  end

  def to_html
    [italic_tags, 1]
  end

  def italic_tags
    @line.gsub(/(\*(.*?)\*)|(_(.*?)_)/, '<i>\2\4</i>')
  end
end
