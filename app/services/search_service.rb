# frozen_string_literal: true

class SearchService
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def call
    data.each_with_object([]) do |record, acum|
      acum << record if match?(record)
    end
  end

  private

  def data
    @data = DataQuery.load
  end

  def match?(record)
    str = record['Name'] + record['Type'] + record['Designed by']

    text.split.each do |word|
      return false unless str.downcase.include? word
    end

    true
  end
end
