require_relative 'html.rb'

class Markdown
  include Html

  def initialize(content)
    @content = content
  end

  def to_html
    html = ""
    @content.split("\n").each { |line|
      if is_heading_marker
        html << heading_marker_to_html(line)
      elsif contains_bold_marker(line)
        html << bold_markers_to_html(line)
      end
    }
    html
  end

  private

  def is_heading_marker
    @content.start_with?("#")
  end

  def contains_bold_marker(line)
    pattern = /(\*\*.*?\*\*)|(__.*?__)/
    line.match?(pattern)
  end
end