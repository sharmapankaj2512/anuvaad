# frozen_string_literal: true

require 'minitest/autorun'

class BoldTest < Minitest::Test
  def test_single_bold_occurrence
    assert_equal Markdown.new('**ultimate text**').to_html, '<b>ultimate text</b>'
  end

  def test_multiple_bold_occurrences
    markdown = Markdown.new('The **ultimate text** is **here**.')
    assert_equal markdown.to_html, 'The <b>ultimate text</b> is <b>here</b>.'
  end
end
