module DuplicatesBenchmark

  # Note: This throws an error in Ruby 2.2.0 - omitting from benchmark
  #
  # NoMethodError: undefined method `count' for nil:NilClass
  # from (irb):3:in `block in duplicates'
  # from (irb):2:in `each'
  # from (irb):2:in `group_by'
  # from (irb):2:in `each'
  # from (irb):2:in `inject'
  # from (irb):2:in `duplicates'


  module Isaac
    def self.duplicates(a)
      a.group_by.inject({}) do |hash, (key,val)|
        hash[key] = val.count if val.count > 1
        hash
      end
    end
  end
end