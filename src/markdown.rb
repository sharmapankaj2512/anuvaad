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
        list_items = []
        while contains_unordered_list_marker(line)
          list_items << line
          index += 1
          line = lines[index]
        end
        html << unordered_list_items_to_html(list_items)
      end
    end
    html
  end

  private

  def unordered_list_items_to_html(list_items)
    html = String.new('<ul>')
    list_items.each do |list_item|
      html << unordered_list_marker_to_html(list_item)
    end
    html << '</ul>'
    html
  end

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