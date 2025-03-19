# frozen_string_literal: true

require_relative 'html'

class Markdown
  include Html

  def initialize(content)
    @content = content
  end

  def to_html
    html = String.new
    lines = @content.split("\n")
    index = 0
    while index < lines.length
      line = lines[index]
      if is_heading_marker
        html << heading_marker_to_html(line)
        index += 1
      elsif contains_bold_marker(line)
        html << bold_markers_to_html(line)
        index += 1
      elsif contains_italic_marker(line)
        html << italic_markers_to_html(line)
        index += 1
      elsif contains_unordered_list_marker(line)
        html << '<ul>'
        while contains_unordered_list_marker(line)
          html << unordered_list_marker_to_html(line)
          index += 1
          line = lines[index]
        end
        html << '</ul>'
      end
    end
    html
  end

  private

  def is_heading_marker
    @content.start_with?('#')
  end

  def contains_unordered_list_marker(line)
    return false if line.nil?

    line.start_with?('-')
  end

  def contains_bold_marker(line)
    pattern = /(\*\*.*?\*\*)|(__.*?__)/
    line.match?(pattern)
  end

  def contains_italic_marker(line)
    pattern = /(\*[^*]+\*)|(_[^_]+_)/
    line.match?(pattern)
  end
end