# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/markdown/markdown'

class ImagesTest < Minitest::Test
  def test_single_image
    assert_equal Markdown.new('![Alt Text](https://example.com/image.jpg)').to_html,
                 '<img src="https://example.com/image.jpg" alt="Alt Text"/>'
  end
end
