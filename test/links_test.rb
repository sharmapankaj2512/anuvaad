# frozen_string_literal: true

require 'minitest/autorun'

class LinksTest < Minitest::Test
  def test_single_link
    assert_equal Markdown.new('[Best Article](<https://articles.in/>)').to_html, '<a href="https://articles.in/">Best Article</a>'
  end
end
