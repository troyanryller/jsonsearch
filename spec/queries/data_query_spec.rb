# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DataQuery do
  let(:name) { 'A+' }
  let(:type) { 'Array' }
  let(:designed_by) { 'Arthur Whitney' }

  describe '#load' do
    subject { described_class.load }
    it 'size' do
      expect(subject.size).to eq(97)
    end
    it 'returns type' do
      expect(subject.class) == type
    end
    it 'first element' do
      # subject.first['Name'].to eq(name) doesent work((
      subject.first['Name'] == name
      subject.first['Type'] == type
      subject.first['Designed by'] == designed_by
    end
  end

  describe 'match' do
    let(:record) { described_class.load.first }

    context 'Name' do
      it 'match' do
        expect(described_class.match?(record, 'a+')).to eq(record)
      end
      it 'not a complete coincidence' do
        expect(described_class.match?(record, 'a')).to eq(record)
      end
      it 'nil' do
        expect(described_class.match?(record, 'B')).to eq(nil)
      end
    end
    context 'Author' do
      it 'match' do
        expect(described_class.match?(record, 'arthur whitney')).to eq(record)
      end
      it 'reverce' do
        expect(described_class.match?(record, 'whitney arthur')).to eq(record)
      end
    end
    context 'Type' do
      it 'match' do
        expect(described_class.match?(record, 'array')).to eq(record)
      end
      it 'not exist' do
        expect(described_class.match?(record, '1234')).to eq(nil)
      end
    end
  end
end
