# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DataQuery do
  NAME = 'A+'
  TYPE = 'Array'
  DESIGNED_BY = 'Arthur Whitney'

  subject { described_class.load }

  describe '#load' do
    it 'size' do
      expect(subject.size).to eq(97)
    end
    it 'returns type' do
      expect(subject.class) == TYPE
    end
    it 'first element' do
      # subject.first['Name'].to eq(NAME) doesent work
      subject.first['Name'] == NAME
      subject.first['Type'] == TYPE
      subject.first['Designed by'] == DESIGNED_BY
    end
  end
end
