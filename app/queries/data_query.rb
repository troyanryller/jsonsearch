# frozen_string_literal: true

class DataQuery
  def self.load
    JSON.parse(File.open('storage/data.json').read)
  end

  def self.find_match(record, text)
    str = record.values_at('Name', 'Type', 'Designed by').join.downcase

    text.downcase.split.each do |word|
      return nil unless str.downcase.include? word
    end

    record
  end
end
