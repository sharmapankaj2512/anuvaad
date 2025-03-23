# frozen_string_literal: true

# Handles conversion of image markdown syntax to HTML
# Processes ![]() markers to <img> tags
class ImageMarker
  def initialize(lines, current_line_index)
    @line = lines[current_line_index]
  end

  def self.present?(line)
    line.match?(/!\[(.*?)\]\((.*?)\)/)
  end

  def to_html
    @line.gsub(/!\[(.*?)\]\((.*?)\)/) do |_|
      text = Regexp.last_match(1)
      link = Regexp.last_match(2)
      return ["<img src=\"#{link}\" alt=\"#{text}\"/>", 1]
    end
  end
end