# frozen_string_literal: true

class SearchService
  attr_reader :text, :source

  def initialize(text:, source:)
    @text = text.downcase
    @source = source
  end

  def call
    source.load.each_with_object([]) do |record, acum|
      acum << source.match?(record, text)
    end.compact
  end
end
