# frozen_string_literal: true

class SearchService
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def call
    data.each_with_object([]) do |record, acum|
      acum << record if has_match(record)
    end
  end

  private

  def data
    @data = DataQuery.load
  end

  def has_match(record)
    match = false

    record.each_value do |str|
      str_match = true

      text.split.each do |word|
        str_match = false unless str.downcase.include? word
      end

      match = true if str_match
    end

    match
  end
end
