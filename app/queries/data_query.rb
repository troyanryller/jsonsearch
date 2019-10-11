# frozen_string_literal: true

class DataQuery
  def self.load
    JSON.parse(File.open('storage/data.json').read)
  end
end
