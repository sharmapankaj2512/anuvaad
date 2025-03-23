# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class HeadingsTest < Minitest::Test
  def test_heading_one
    assert_equal Markdown.new('# The ultimate heading').to_html, '<h1>The ultimate heading</h1>'
    assert_equal Markdown.new('# Tomorrow never dies').to_html, '<h1>Tomorrow never dies</h1>'
  end

  def test_heading_two
    assert_equal Markdown.new('## The ultimate heading').to_html, '<h2>The ultimate heading</h2>'
    assert_equal Markdown.new('## Tomorrow never dies').to_html, '<h2>Tomorrow never dies</h2>'
  end

  def test_heading_three
    assert_equal Markdown.new('### The ultimate heading').to_html, '<h3>The ultimate heading</h3>'
    assert_equal Markdown.new('### Tomorrow never dies').to_html, '<h3>Tomorrow never dies</h3>'
  end

  def test_heading_four
    assert_equal Markdown.new('#### The ultimate heading').to_html, '<h4>The ultimate heading</h4>'
    assert_equal Markdown.new('#### Tomorrow never dies').to_html, '<h4>Tomorrow never dies</h4>'
  end

  def test_heading_five
    assert_equal Markdown.new('##### The ultimate heading').to_html, '<h5>The ultimate heading</h5>'
    assert_equal Markdown.new('##### Tomorrow never dies').to_html, '<h5>Tomorrow never dies</h5>'
  end

  def test_heading_six
    assert_equal Markdown.new('###### The ultimate heading').to_html, '<h6>The ultimate heading</h6>'
    assert_equal Markdown.new('###### Tomorrow never dies').to_html, '<h6>Tomorrow never dies</h6>'
  end

  def test_heading_multiline
    markdown = Markdown.new("# The ultimate heading\n### Tomorrow never dies")
    assert_equal markdown.to_html, '<h1>The ultimate heading</h1><h3>Tomorrow never dies</h3>'
  end
end

