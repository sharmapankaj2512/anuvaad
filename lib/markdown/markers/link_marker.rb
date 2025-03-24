# frozen_string_literal: true

# Handles conversion of links markdown syntax to HTML
# Processes []() style bold markers to <a> tags
class LinkMarker
  def initialize(lines, current_line_index)
    @line = lines[current_line_index]
  end

  def self.present?(line)
    line.match?(/(?<!!)\[[^\]]+\]\([^)]+\)/)
  end

  def to_html
    @line.gsub(/\[(.*?)\]\((.*?)\)/, '<a href="\2">\1</a>')
  end
end
