# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class HeadingsTest < Minitest::Test
  def test_heading_one
    assert_equal '<h1>The ultimate heading</h1>', Markdown.new('# The ultimate heading').to_html
    assert_equal '<h1>Tomorrow never dies</h1>', Markdown.new('# Tomorrow never dies').to_html
  end

  def test_heading_two
    assert_equal '<h2>The ultimate heading</h2>', Markdown.new('## The ultimate heading').to_html
    assert_equal '<h2>Tomorrow never dies</h2>', Markdown.new('## Tomorrow never dies').to_html
  end

  def test_heading_three
    assert_equal '<h3>The ultimate heading</h3>', Markdown.new('### The ultimate heading').to_html
    assert_equal '<h3>Tomorrow never dies</h3>', Markdown.new('### Tomorrow never dies').to_html
  end

  def test_heading_four
    assert_equal '<h4>The ultimate heading</h4>', Markdown.new('#### The ultimate heading').to_html
    assert_equal '<h4>Tomorrow never dies</h4>', Markdown.new('#### Tomorrow never dies').to_html
  end

  def test_heading_five
    assert_equal '<h5>The ultimate heading</h5>', Markdown.new('##### The ultimate heading').to_html
    assert_equal '<h5>Tomorrow never dies</h5>', Markdown.new('##### Tomorrow never dies').to_html
  end

  def test_heading_six
    assert_equal '<h6>The ultimate heading</h6>', Markdown.new('###### The ultimate heading').to_html
    assert_equal '<h6>Tomorrow never dies</h6>', Markdown.new('###### Tomorrow never dies').to_html
  end

  def test_heading_multiline
    markdown = Markdown.new("# The ultimate heading\n### Tomorrow never dies")

    assert_equal '<h1>The ultimate heading</h1><h3>Tomorrow never dies</h3>', markdown.to_html
  end
end
