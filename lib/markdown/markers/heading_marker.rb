# frozen_string_literal: true

require_relative '../../text'

# Processes markdown headings (# syntax) and converts them to HTML heading tags
# Supports heading levels 1-6 with corresponding h1-h6 HTML tags
class HeadingMarker
  include Text

  def initialize(lines, current_line_index)
    @line = lines[current_line_index]
  end

  def self.present?(line)
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
