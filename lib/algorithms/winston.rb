module DuplicatesBenchmark
  module Winston
    def self.duplicates(a)
      a.inject({}) { |count_hash, value| count_hash[value] = count_hash[value].to_i + 1; count_hash }.select { |k,v| v > 1 }.keys
    end
  end
end