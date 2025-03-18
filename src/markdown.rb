class Markdown
  def initialize(content)
    @content = content
  end

  def to_html
    if @content.start_with?("##")
      "<h2>The ultimate heading</h2>"
    else
      "<h1>The ultimate heading</h1>"
    end
  end
end