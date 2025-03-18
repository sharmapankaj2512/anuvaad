# frozen_string_literal: true

require 'minitest/autorun'

class HeadingsTest < Minitest::Test
  def test_heading_one
    assert_equal Markdown.new("# The ultimate heading").to_html, "<h1>The ultimate heading</h1>"
    assert_equal Markdown.new("# Tomorrow never dies").to_html, "<h1>Tomorrow never dies</h1>"
  end

  def test_heading_two
    assert_equal Markdown.new("## The ultimate heading").to_html, "<h2>The ultimate heading</h2>"
  end
end

require_relative '../src/markdown.rb'

