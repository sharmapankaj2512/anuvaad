# frozen_string_literal: true

# Handles conversion of unordered lists (- syntax) to HTML <ul> and <li> tags
# Note: This appears to be a deprecated or redundant class as functionality is in list_marker.rb
class ListMarker
  include Text

  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def to_html
    list_items, index = list_markers(@index, @line, @lines)
    [list_items_to_html(list_items), index]
  end

  def list_markers(start_index, line, lines)
    index = start_index
    list_items = []
    while ListMarker.present?(line)
      list_items << line
      index += 1
      line = lines[index]
    end
    [list_items, index]
  end

  def list_items_to_html(list_items)
    html = String.new('<ul>')
    list_items.each do |list_item|
      html << list_marker_to_html(list_item)
    end
    html << '</ul>'
    html
  end

  def list_marker_to_html(line)
    marker = line[/^-+(?=\s)/]
    inline_text = text_after(marker, line)
    "<li>#{inline_text}</li>"
  end

  def self.present?(line)
    return false if line.nil?

    line.start_with?('-')
  end
end
