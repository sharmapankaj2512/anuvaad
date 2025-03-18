class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    if @content.start_with?("###")
      heading("###", text_after("###"))
    elsif @content.start_with?("##")
      heading("##", text_after("##"))
    else
      heading("#", text_after("#"))
    end
  end

  private

  def heading(token, inline_text)
    tags = {
      "#" => { start: "<h1>", end: "</h1>" },
      "##" => { start: "<h2>", end: "</h2>" },
      "###" => { start: "<h3>", end: "</h3>" }
    }
    tag = tags[token]
    tag[:start] + inline_text + tag[:end]
  end

  def text_after(token)
    @content.sub(/^#{Regexp.escape(token)}+\s*/, "")
  end
end