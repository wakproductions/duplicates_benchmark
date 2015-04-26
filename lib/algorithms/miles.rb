module DuplicatesBenchmark
  module Miles
    def self.duplicates(ary)
      duplicate_list(ary).keys
    end

    private

    def self.duplicate_list(ary)
      count_values(ary).select { |_, count| count > 1 }
    end

    def self.count_values(ary)
      ary.inject({}) { |memo, value| memo[value] = memo[value].to_i + 1; memo }
    end
  end
end