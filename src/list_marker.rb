# frozen_string_literal: true

require_relative 'text'

# Base class for handling markdown list syntax conversion to HTML
# Supports both ordered and unordered lists with appropriate HTML tags
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
    while self.class.present?(line)
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

  def self.make(lines, current_line_index)
    line = lines[current_line_index]
    return UnorderedListItems.new(line, lines, current_line_index) if UnorderedListItems.present?(line)

    OrderedListItems.new(line, lines, current_line_index) if OrderedListItems.present?(line)
  end

  def self.present?(line)
    UnorderedListItems.present?(line) || OrderedListItems.present?(line)
  end

  private

  def marker_pattern(line)
    line[/^-+(?=\s)/]
  end

  # Handles unordered list items using the hyphen (-) syntax
  class UnorderedListItems < ListMarker
    def initialize(line, lines, current_line_index)
      super(line, lines, current_line_index, '<ul>', '</ul>')
    end

    def self.present?(line)
      return false if line.nil?

      line.start_with?('-')
    end
  end

  # Handles ordered list items using the number followed by period syntax (1., 2., etc.)
  class OrderedListItems < ListMarker
    def initialize(line, lines, current_line_index)
      super(line, lines, current_line_index, '<ol>', '</ol>')
    end

    def self.present?(line)
      return false if line.nil?

      ordered_list_pattern = /^\d+\.\s/
      line =~ ordered_list_pattern
    end

    private

    def marker_pattern(line)
      line[/^\d+\.(?=\s)/]
    end
  end
end
