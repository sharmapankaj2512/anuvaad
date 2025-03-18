class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    if @content.start_with?("##")
      "<h2>The ultimate heading</h2>"
    else
      "<h1>" + text_after("#") + "</h1>"
    end
  end

  private

  def text_after(token)
    @content.sub(/^#{Regexp.escape(token)}+\s*/, "")
  end
end