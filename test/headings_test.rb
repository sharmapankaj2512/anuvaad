# frozen_string_literal: true

require 'minitest/autorun'

class HeadingsTest < Minitest::Test
  def test_heading_one
    assert_equal Markdown.new("# The ultimate heading").to_html, "<h1>The ultimate heading</h1>"
  end
end

require_relative '../src/markdown.rb'

