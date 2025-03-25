# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class LinksTest < Minitest::Test
  def test_single_link
    assert_equal '<a href="https://articles.in/">Best Article</a>',
                 Markdown.new('[Best Article](https://articles.in/)').to_html
  end

  def test_not_a_link
    refute_equal Markdown.new('![Best Article](https://articles.in/)').to_html,
                 '<a href="https://articles.in/">Best Article</a>'
  end
end
