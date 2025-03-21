class ListMarker
  include Text

  def initialize(line, lines, current_line_index, start_tag, end_tag)
    @line = line
    @lines = lines
    @index = current_line_index
    @start_tag = start_tag
    @end_tag = end_tag
  end

  def unordered(line, lines, current_line_index)
    initialize(line, lines, current_line_index, '<ul>', '</ul>')
  end

  def to_html
    list_items, index = unordered_list_markers(@index, @line, @lines)
    [unordered_list_items_to_html(list_items), index]
  end

  def unordered_list_markers(start_index, line, lines)
    index = start_index
    list_items = []
    while ListMarker.is_present(line)
      list_items << line
      index += 1
      line = lines[index]
    end
    [list_items, index]
  end

  def unordered_list_items_to_html(list_items)
    html = String.new(@start_tag)
    list_items.each do |list_item|
      html << unordered_list_marker_to_html(list_item)
    end
    html << @end_tag
    html
  end

  def unordered_list_marker_to_html(line)
    marker = line[/^-+(?=\s)/]
    inline_text = text_after(marker, line)
    "<li>#{inline_text}</li>"
  end

  def self.is_present(line)
    return false if line.nil?

    line.start_with?('-')
  end
end