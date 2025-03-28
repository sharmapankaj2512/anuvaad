# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/markdown/markdown'

class IntegrationTest < Minitest::Test
  def test_non_nested_markdown
    markdown = File.read(File.join(__dir__, 'input_non_nested_markdown.md'))
    html = File.read(File.join(__dir__, 'non_nested_output.html'))

    assert_equal Markdown.new(markdown).to_html, html
  end

  def test_nested_markdown
    markdown = File.read(File.join(__dir__, 'input_nested_markdown.md'))
    html = File.read(File.join(__dir__, 'nested_output.html'))

    assert_equal Markdown.new(markdown).to_html, html
  end
end
