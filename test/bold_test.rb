# frozen_string_literal: true

require 'minitest/autorun'

class BoldTest < Minitest::Test
  def test_single_bold_occurrence
    assert_equal Markdown.new("**ultimate text**").to_html, "<b>ultimate text</b>"
  end
end
