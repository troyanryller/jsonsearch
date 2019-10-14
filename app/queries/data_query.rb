# frozen_string_literal: true

class DataQuery
  def self.load
    JSON.parse(File.open('storage/data.json').read)
  end

  def self.match?(record, text)
    str = record['Name'] + record['Type'] + record['Designed by']

    text.downcase.split.each do |word|
      return nil unless str.downcase.include? word
    end

    record
  end
end
