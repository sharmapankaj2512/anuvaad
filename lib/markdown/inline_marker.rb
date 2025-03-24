class InlineMarker
  def initialize(lines, current_line_index)
    @lines = lines
    @current_line_index = current_line_index
  end

  def self.present?(line)
    BoldMarker.present?(line) ||
      ItalicMarker.present?(line) ||
      LinkMarker.present?(line) ||
      ImageMarker.present?(line)
  end

  def to_html
    if BoldMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = BoldMarker.new(@lines, @current_line_index).to_html
    end
    if ItalicMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = ItalicMarker.new(@lines, @current_line_index).to_html
    end
    if LinkMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = LinkMarker.new(@lines, @current_line_index).to_html
    end
    if ImageMarker.present?(@lines[@current_line_index])
      @lines[@current_line_index], = ImageMarker.new(@lines, @current_line_index).to_html
    end
    [@lines[@current_line_index], 1]
  end
end