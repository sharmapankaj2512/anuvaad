# frozen_string_literal: true

require 'minitest/autorun'

class CodeTest < Minitest::Test
  def test_inline_code
    assert_equal Markdown.new('Best code `def python` ever').to_html, 'Best code <code>def python</code> ever'
  end
end
