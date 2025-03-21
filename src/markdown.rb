# frozen_string_literal: true

class Markdown

  def initialize(content)
    @content = content
  end

  def to_html
    html = String.new
    lines = @content.split("\n")
    current_line_index = 0
    while current_line_index < lines.length
      line = lines[current_line_index]
      raw_line = RawLine.new(line)
      mark_down = raw_line.to_markdown(lines, current_line_index)
      content, lines_processed = mark_down.to_html
      html << content
      current_line_index += lines_processed
    end
    html
  end

end

require_relative 'raw_line.rb'

require_relative 'heading_marker.rb'

require_relative 'bold_marker.rb'

require_relative 'italic_marker.rb'

require_relative 'unordered_list_marker.rb'

