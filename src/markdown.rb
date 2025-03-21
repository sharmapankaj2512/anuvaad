# frozen_string_literal: true

require_relative 'html'

class Markdown

  def initialize(content)
    @content = content
  end

  def to_html
    html = String.new
    lines = @content.split("\n")
    index = 0
    while index < lines.length
      line = lines[index]
      raw_line = RawLine.new(line)
      mark_down = raw_line.to_markdown(lines, index)
      content, lines_processed = mark_down.to_html
      html << content
      index += lines_processed
    end
    html
  end

end

require_relative 'raw_line.rb'

require_relative 'heading_marker.rb'

require_relative 'bold_marker.rb'

class ItalicMarker
  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def self.contains_italic_marker(line)
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

class UnorderedListMarker
  include Text

  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def to_html
    list_items, index = unordered_list_markers(@index, @line, @lines)
    [unordered_list_items_to_html(list_items), index]
  end

  def unordered_list_markers(start_index, line, lines)
    index = start_index
    list_items = []
    while UnorderedListMarker.contains_unordered_list_marker(line)
      list_items << line
      index += 1
      line = lines[index]
    end
    [list_items, index]
  end

  def unordered_list_items_to_html(list_items)
    html = String.new('<ul>')
    list_items.each do |list_item|
      html << unordered_list_marker_to_html(list_item)
    end
    html << '</ul>'
    html
  end

  def unordered_list_marker_to_html(line)
    marker = line[/^-+(?=\s)/]
    inline_text = text_after(marker, line)
    "<li>#{inline_text}</li>"
  end

  def self.contains_unordered_list_marker(line)
    return false if line.nil?

    line.start_with?('-')
  end
end