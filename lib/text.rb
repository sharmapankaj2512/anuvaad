# frozen_string_literal: true

# Module providing text manipulation utilities for markdown parsing
# Contains helper methods for extracting content from markdown-formatted lines
module Text
  def text_after(token, line)
    line.sub(/^#{Regexp.escape(token)}+\s*/, '')
  end
end
