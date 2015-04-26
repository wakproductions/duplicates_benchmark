# To avoid the two-pass issue from above, we need something that only adds
# to the array if the value isn't nil.
# compact_map seems like a good name, and it turns out there's a proposal for it:
# https://bugs.ruby-lang.org/issues/5663
# I would only monkey patch this if:
#
# 1. I was using it in many places.
# 2. Performance isn't worse than map.compact,
#    since this is in Ruby and that's probably in C.
#
# If not #1 and #2, I'd probably just leave it as-is.

module Enumerable
  # Much like map, we need to allow transformations here:
  # { 1 => 2, 3 => nil, 4 => 5 }.compact_map { |k,v| k * 9 if v }
  # => [9, 36]
  # It should also return the original enumerable if called without a block:
  # { 1 => 2, 3 => nil, 4 => 5 }.compact_map
  # (Currently mine returns the equivalent of hash.map.to_a
  #  instead of an enumerable. Should probably fix that before production.)
  def compact_map
    inject([]) do |memo, val|
      transformed = block_given? ? yield(val) : val
      memo << transformed if transformed
      memo
    end
  end
end

