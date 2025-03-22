# frozen_string_literal: true

# Handles conversion of bold markdown syntax to HTML
# Processes both ** and __ style bold markers to <b> tags
class BoldMarker
  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def self.present?(line)
    star_or_underscore_pair = /(\*\*.*?\*\*)|(__.*?__)/
    line.match?(star_or_underscore_pair)
  end

  def to_html
    [bold_tags, 1]
  end

  private

  def bold_tags
    content_between_markers = /(\*\*(.*?)\*\*)|(__([^_]+)__)/
    @line.gsub(content_between_markers, '<b>\2\4</b>')
  end
end
