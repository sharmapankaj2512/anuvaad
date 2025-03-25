# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class ItalicTest < Minitest::Test
  def test_single_italic_occurrence
    assert_equal '<i>ultimate text</i>', Markdown.new('*ultimate text*').to_html
  end
end
