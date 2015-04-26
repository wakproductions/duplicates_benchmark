module DuplicatesBenchmark
  module Original
    def self.duplicates(a)
      a.inject({}){ |a,b| a[b] = a[b].to_i + 1; a}.\
          reject{ |a,b| b == 1 }.keys
    end
  end
end