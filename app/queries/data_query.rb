# frozen_string_literal: true

class DataQuery
  def self.load
    data = []

    File.open('storage/data.json') do |f|
      data = JSON.parse(f.read)
    end

    data
  end
end
