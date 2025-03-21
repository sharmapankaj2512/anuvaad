# frozen_string_literal: true

require 'minitest/autorun'

class ListsTest < Minitest::Test
  def test_single_unordered_list_item
    assert_equal Markdown.new('- Item 1').to_html, '<ul><li>Item 1</li></ul>'
  end

  def test_multiple_unordered_list_items
    assert_equal Markdown.new("- Item 1\n- Item 2").to_html, '<ul><li>Item 1</li><li>Item 2</li></ul>'
  end
end
