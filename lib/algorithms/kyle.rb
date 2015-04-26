require_relative '../../lib/core_extensions/enumerable/kyle_duplicates'

module DuplicatesBenchmark
  module Kyle
    # Walkthrough:
    # 1. [1,2,2,3,3,3].group_by(&:itself)
    #    => { 1 => [1], 2 => [2,2], 3 => [3,3,3] }
    # 2. map the key if there are multiple appearances, nil if only one appearance
    # 3. compact removes any nils that were mapped in step 2

    # Interesting bits:
    # 1. I didn't know :itself was a method now.
    # 2. Requires two passes (map and compact)
    #    which could be sub-optimal on large data sets
    #    (although compact seems pretty performant).
    def self.duplicates(arr)
      arr \
          .group_by(&:itself)
          .map { |el, appearances| el if appearances.size > 1 }
          .compact
    end

    # See lib/core_extensions/enumerable/kyle_duplicates for the patch on Enumerable
    def self.duplicates_monkeypatch(arr)
      arr \
          .group_by(&:itself)
          .compact_map { |el, appearances| el if appearances.size > 1 }
    end
  end
end