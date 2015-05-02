require 'rubygems'
require 'bundler/setup'
require 'tach'
require_relative '../lib/duplicates_benchmark'

INPUT = ['yes'] * 100 + ['no'] * 50 + ['maybe'] + ['so']
TIMES = 1_000_000


Tach.meter(TIMES) do
  tach 'Corin' do
    DuplicatesBenchmark::Corin.duplicates(INPUT)
  end

  tach 'Isaac' do
    DuplicatesBenchmark::Isaac.duplicates(INPUT)
  end

  tach 'Kyle' do
    DuplicatesBenchmark::Kyle.duplicates(INPUT)
  end

  tach 'Kyle (monkeypatch)' do
    DuplicatesBenchmark::Kyle.duplicates_monkeypatch(INPUT)
  end

  tach 'Mack' do
    DuplicatesBenchmark::Mack.duplicates(INPUT)
  end

  tach 'Miles' do
    DuplicatesBenchmark::Miles.duplicates(INPUT)
  end

  tach 'Original' do
    DuplicatesBenchmark::Original.duplicates(INPUT)
  end

  tach 'Winston' do
    DuplicatesBenchmark::Winston.duplicates(INPUT)
  end
end
