class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    html = ""
    @content.split("\n").each { |line|
      if is_heading_marker
        marker = line[/^#+(?=\s)/]
        inline_text = text_after(marker, line)
        html << heading(marker, inline_text)
      end
    }
    html
  end

  private

  def is_heading_marker
    @content.start_with?("#")
  end

  def heading(marker, inline_text)
    tags = {
      "#" => { start: "<h1>", end: "</h1>" },
      "##" => { start: "<h2>", end: "</h2>" },
      "###" => { start: "<h3>", end: "</h3>" },
      "####" => { start: "<h4>", end: "</h4>" },
      "#####" => { start: "<h5>", end: "</h5>" },
      "######" => { start: "<h6>", end: "</h6>" }
    }
    tag = tags[marker]
    tag[:start] + inline_text + tag[:end]
  end

  def text_after(token, line)
    line.sub(/^#{Regexp.escape(token)}+\s*/, "")
  end
end