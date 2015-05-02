module DuplicatesBenchmark
  module Corin
    def self.duplicates(array)
      counts_by_number = array.inject({}) do |memo, element|
        memo[element] = memo[element].to_i  + 1    # I like this trick but I wish it didn't rely on knowing nil.to_i == 1
        memo
      end

      recurring_counts_by_number = counts_by_number.select do |number, count|
        count > 1
      end

      recurring_counts_by_number
    end
  end
end
