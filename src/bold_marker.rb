class BoldMarker
  def initialize(line, lines, current_line_index)
    @line = line
    @lines = lines
    @index = current_line_index
  end

  def self.contains_bold_marker(line)
    star_or_underscore_pair = /(\*\*.*?\*\*)|(__.*?__)/
    line.match?(star_or_underscore_pair)
  end

  def to_html
    [bold_tags, 1]
  end

  private

  def bold_tags
    @line.gsub(/(\*\*(.*?)\*\*)|(__([^_]+)__)/, '<b>\2\4</b>')
  end
end