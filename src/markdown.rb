class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    if @content.start_with?("#")
      marker = @content[/^#+(?=\s)/]
      heading(marker)
    end
  end

  private

  def heading(marker)
    tags = {
      "#" => { start: "<h1>", end: "</h1>" },
      "##" => { start: "<h2>", end: "</h2>" },
      "###" => { start: "<h3>", end: "</h3>" },
      "####" => { start: "<h4>", end: "</h4>" }
    }
    tag = tags[marker]
    inline_text = text_after(marker)
    tag[:start] + inline_text + tag[:end]
  end

  def text_after(token)
    @content.sub(/^#{Regexp.escape(token)}+\s*/, "")
  end
end