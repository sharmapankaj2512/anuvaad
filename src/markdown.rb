# frozen_string_literal: true

require_relative 'html'

class Markdown
  include Html

  def initialize(content)
    @content = content
  end

  def to_html
    html = String.new
    @content.split("\n").each { |line|
      if is_heading_marker
        html << heading_marker_to_html(line)
      elsif contains_bold_marker(line)
        html << bold_markers_to_html(line)
      elsif contains_italic_marker(line)
        html << italic_markers_to_html(line)
      elsif contains_unordered_list_marker(line)
        html << '<ul>'
        html << unordered_list_marker_to_html(line)
        html << '</ul>'
      end
    }
    html
  end

  private

  def is_heading_marker
    @content.start_with?('#')
  end

  def contains_unordered_list_marker(line)
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