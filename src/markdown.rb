class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    if @content.start_with?("#")
      marker = @content[/^#+(?=\s)/]
      inline_text = text_after(marker)
      heading(marker, inline_text)
    end
  end

  private

  def heading(marker, inline_text)
    tags = {
      "#" => { start: "<h1>", end: "</h1>" },
      "##" => { start: "<h2>", end: "</h2>" },
      "###" => { start: "<h3>", end: "</h3>" },
      "####" => { start: "<h4>", end: "</h4>" },
      "#####" => { start: "<h5>", end: "</h5>" }
    }
    tag = tags[marker]
    tag[:start] + inline_text + tag[:end]
  end

  def text_after(token)
    @content.sub(/^#{Regexp.escape(token)}+\s*/, "")
  end
end