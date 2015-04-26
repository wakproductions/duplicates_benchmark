module DuplicatesBenchmark
  module Isaac
    def self.duplicates(a)
      a.group_by(&:itself).inject({}) do |hash, (key, val)|
        hash[key] = val.count if val.count > 1
        hash
      end
    end
  end
end
