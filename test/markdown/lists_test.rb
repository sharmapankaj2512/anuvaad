# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class ListsTest < Minitest::Test
  def test_single_unordered_list_item
    assert_equal '<ul><li>Item 1</li></ul>', Markdown.new('- Item 1').to_html
  end

  def test_multiple_unordered_list_items
    assert_equal '<ul><li>Item 1</li><li>Item 2</li></ul>', Markdown.new("- Item 1\n- Item 2").to_html
  end

  def test_single_ordered_list_item
    assert_equal '<ol><li>Item 1</li></ol>', Markdown.new('1. Item 1').to_html
  end

  def test_multiple_ordered_list_items
    assert_equal '<ol><li>Item 1</li><li>Item 2</li></ol>', Markdown.new("1. Item 1\n2. Item 2").to_html
  end
end
