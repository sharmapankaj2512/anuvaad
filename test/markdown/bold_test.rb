# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class BoldTest < Minitest::Test
  def test_single_bold_occurrence
    assert_equal '<b>ultimate text</b>', Markdown.new('**ultimate text**').to_html
  end

  def test_multiple_bold_occurrences
    markdown = Markdown.new('The **ultimate text** is **here**.')

    assert_equal 'The <b>ultimate text</b> is <b>here</b>.', markdown.to_html
  end
end
