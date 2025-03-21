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

class RawLine
  def initialize(line)
    @line = line
  end

  def to_markdown(lines, current_line_index)
    return BoldMarker.new(@line, lines, current_line_index) if BoldMarker.contains_bold_marker(@line)
    return ItalicMarker.new(@line, lines, current_line_index) if ItalicMarker.contains_italic_marker(@line)
    return UnorderedListMarker.new(@line, lines, current_line_index) if UnorderedListMarker.contains_unordered_list_marker(@line)

    HeadingMarker.new(@line, lines, current_line_index) if HeadingMarker.is_heading_marker(@line)
  end

end

class HeadingMarker
  include Text

  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def self.is_heading_marker(line)
    line.start_with?('#')
  end

  def to_html
    marker = @line[/^#+(?=\s)/]
    inline_text = text_after(marker, @line)
    [heading(marker, inline_text), 1]
  end

  def heading(marker, inline_text)
    tags = {
      '#' => { start: '<h1>', end: '</h1>' },
      '##' => { start: '<h2>', end: '</h2>' },
      '###' => { start: '<h3>', end: '</h3>' },
      '####' => { start: '<h4>', end: '</h4>' },
      '#####' => { start: '<h5>', end: '</h5>' },
      '######' => { start: '<h6>', end: '</h6>' }
    }
    tag = tags[marker]
    tag[:start] + inline_text + tag[:end]
  end
end

class BoldMarker
  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def self.contains_bold_marker(line)
    pattern = /(\*\*.*?\*\*)|(__.*?__)/
    line.match?(pattern)
  end

  def to_html
    [bold_tags, 1]
  end

  private

  def bold_tags
    @line.gsub(/(\*\*(.*?)\*\*)|(__([^_]+)__)/, '<b>\2\4</b>')
  end
end

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