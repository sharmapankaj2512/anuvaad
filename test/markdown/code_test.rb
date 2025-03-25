# frozen_string_literal: true

require 'minitest/autorun'

class CodeTest < Minitest::Test
  def test_inline_code
    assert_equal 'Best code <code>def python</code> ever', Markdown.new('Best code `def python` ever').to_html
  end
end
