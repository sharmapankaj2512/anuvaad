class UnorderedListItems < ListMarker
  def initialize(line, lines, current_line_index)
    super(line, lines, current_line_index, '<ul>', '</ul>')
  end

  def self.is_present(line)
    return false if line.nil?

    line.start_with?('-')
  end
end