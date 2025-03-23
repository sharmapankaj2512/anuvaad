# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class ItalicTest < Minitest::Test
  def test_single_italic_occurrence
    assert_equal Markdown.new('*ultimate text*').to_html, '<i>ultimate text</i>'
  end
end
