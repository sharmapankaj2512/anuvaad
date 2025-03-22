require_relative 'text'

class ListMarker
  include Text

  def initialize(line, lines, current_line_index, start_tag, end_tag)
    @line = line
    @lines = lines
    @index = current_line_index
    @start_tag = start_tag
    @end_tag = end_tag
  end

  def to_html
    marked_list_items, lines_processed = list_markers(@index, @line, @lines)
    [list_items_to_html(marked_list_items), lines_processed]
  end

  def list_markers(start_index, line, lines)
    index = start_index
    list_items = []
    while self.class.is_present(line)
      list_items << line
      index += 1
      line = lines[index]
    end
    [list_items, index]
  end

  def list_items_to_html(list_items)
    html = String.new(@start_tag)
    list_items.each do |list_item|
      html << list_marker_to_html(list_item)
    end
    html << @end_tag
    html
  end

  def list_marker_to_html(line)
    marker = marker_pattern(line)
    inline_text = text_after(marker, line)
    "<li>#{inline_text}</li>"
  end

  private

  def marker_pattern(line)
    line[/^-+(?=\s)/]
  end
end

require_relative 'unordered_list_items.rb'

class OrderedListItems < ListMarker
  def initialize(line, lines, current_line_index)
    super(line, lines, current_line_index, '<ol>', '</ol>')
  end

  def self.is_present(line)
    return false if line.nil?

    line =~ /^\d+\.\s/
  end

  private

  def marker_pattern(line)
    line[/^\d+\.(?=\s)/]
  end
end