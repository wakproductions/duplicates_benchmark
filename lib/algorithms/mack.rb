module DuplicatesBenchmark
  module Mack
    # Takes an array (enumerable?) as input
    # Return an array containing elements occurring multiple times in input
    def self.duplicates(list)
      occurs_multiple_times = []
      already_seen = []

      list.each do |element|
        if already_seen.include?(element)
          occurs_multiple_times << element
        else
          already_seen << element
        end
      end

      # Discard dups from elements occurring more that twice
      occurs_multiple_times.uniq
    end
  end
end