# frozen_string_literal: true

module Text

  private

  def text_after(token, line)
    line.sub(/^#{Regexp.escape(token)}+\s*/, '')
  end
end
