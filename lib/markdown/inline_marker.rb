class InlineMarker
  @@registered_markers = []

  def self.register_marker(marker_class)
    @@registered_markers << marker_class
  end

  register_marker BoldMarker
  register_marker ItalicMarker
  register_marker LinkMarker
  register_marker ImageMarker

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
    @@registered_markers.each do |marker_class|
      if marker_class.present?(@lines[@current_line_index])
        marker = marker_class.new(@lines, @current_line_index)
        @lines[@current_line_index], = marker.to_html
      end
    end
    [@lines[@current_line_index], 1]
  end
end