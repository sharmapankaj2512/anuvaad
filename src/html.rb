module Html

  private

  def heading_marker_to_html(line)
    marker = line[/^#+(?=\s)/]
    inline_text = text_after(marker, line)
    heading(marker, inline_text)
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

  def bold_markers_to_html(line)
    line.gsub(/(\*\*(.*?)\*\*)|(__([^_]+)__)/, '<b>\2\4</b>')
  end

  def text_after(token, line)
    line.sub(/^#{Regexp.escape(token)}+\s*/, "")
  end
end
