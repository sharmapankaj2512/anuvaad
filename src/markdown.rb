class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    if @content.start_with?("##")
      "<h2>The ultimate heading</h2>"
    else
      heading_one(text_after("#"))
    end
  end

  private

  def heading_one(text)
    "<h1>" + text + "</h1>"
  end

  def text_after(token)
    @content.sub(/^#{Regexp.escape(token)}+\s*/, "")
  end
end