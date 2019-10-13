# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchService do
  describe '#call' do
    context 'one record' do
      subject { described_class.new('C++').call }

      it 'size' do
        expect(subject.size).to eq(1)
      end

      it 'author' do
        expect(subject.first['Designed by']) == 'Bjarne Stroustrup'
      end
    end

    context 'few records' do
      subject { described_class.new('Microsoft').call }

      it 'size' do
        expect(subject.size).to eq(8)
      end

      it 'first record name' do
        expect(subject.first['Name']) == 'C#'
      end
    end

    context 'reverce search' do
      subject { described_class.new('Matsumoto Yukihiro').call }

      it 'size' do
        expect(subject.size).to eq(1)
      end

      it 'name' do
        expect(subject.first['Name']) == 'Ruby'
      end
    end
  end
end
