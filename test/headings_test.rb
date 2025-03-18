# frozen_string_literal: true

require 'minitest/autorun'

class HeadingsTest < Minitest::Test
  def test_heading_one
    assert_equal Markdown.new("# The ultimate heading").to_html, "<h1>The ultimate heading</h1>"
    assert_equal Markdown.new("# Tomorrow never dies").to_html, "<h1>Tomorrow never dies</h1>"
  end

  def test_heading_two
    assert_equal Markdown.new("## The ultimate heading").to_html, "<h2>The ultimate heading</h2>"
    assert_equal Markdown.new("## Tomorrow never dies").to_html, "<h2>Tomorrow never dies</h2>"
  end

  def test_heading_three
    assert_equal Markdown.new("### The ultimate heading").to_html, "<h3>The ultimate heading</h3>"
    assert_equal Markdown.new("### Tomorrow never dies").to_html, "<h3>Tomorrow never dies</h3>"
  end

  def test_heading_four
    assert_equal Markdown.new("#### The ultimate heading").to_html, "<h4>The ultimate heading</h4>"
    assert_equal Markdown.new("#### Tomorrow never dies").to_html, "<h4>Tomorrow never dies</h4>"
  end
end

require_relative '../src/markdown.rb'

