# frozen_string_literal: true

module Enumerable
  # my_each
  def my_each
    return to_enum unless block_given?

    n = length
    x = 0
    while x < n
      yield(self[x])
      x += 1
    end
    self
  end

  # my_inject
  def my_inject(memo = nil, value = nil)
    if block_given?
      if memo.nil?
        acumulator = to_a[0]
        start = 1
        while start < size
          acumulator = yield(acumulator, to_a[start])
          start += 1
        end
        acumulator
      else !memo.nil?
           acumulator = memo
           start = 0
           while start < size
             acumulator = yield(acumulator, to_a[start])
             start += 1
           end
           acumulator
        end
    elsif block_given? == false
      if !memo.nil? && value.nil?
        acumulator = nil
        my_each { |x| acumulator = acumulator.nil? ? x : acumulator.send(memo, x) }
        acumulator
      else !value.nil?
           acumulator = memo
           my_each { |x| acumulator = acumulator.send(value, x) }
           acumulator
      end
      end
  end
end

a = ['abc', 1, nil, false]
na = [2, 4, 5]
sa = %w[ab ab ab]
ba = [false, true]
ea = [nil, nil, false]
my_proc = proc { |x, y| x + y }

puts na.my_inject(2, :*)
puts na.inject(2, :*)

# puts 'my all'
#
# puts ea.my_any?
# puts ea.any?
#
# ea.my_each{|x| puts x.nil?}
#
# puts a.my_all?
# puts a.all?
# puts 'module'
# puts a.my_all?(Numeric)
# puts a.all?(Numeric)
# puts na.my_all?(Numeric)
# puts na.all?(Numeric)
# puts 'regex'
# puts sa.my_all?(/e/)
# puts sa.all?(/e/)
# puts sa.my_all?(/a/)
# puts sa.all?(/a/)
# puts 'variable'
# puts sa.my_all?('a')
# puts sa.all?('a')
# puts sa.my_all?('ab')
# puts sa.all?('ab')
# puts 'block'
# puts na.my_all? { |x| x > 1 }
# puts na.all? { |x| x > 1 }
# puts na.my_all? { |x| x > 3 }
# puts na.all? { |x| x > 3 }
#
# puts 'my any'
# puts a.my_any?
# puts a.any?
# puts ea.my_any?
# puts ea.any?
# puts 'module'
# puts a.my_any?(Numeric)
# puts a.any?(Numeric)
# puts sa.my_any?(Numeric)
# puts sa.any?(Numeric)
# puts 'regex'
# puts sa.my_any?(/e/)
# puts sa.any?(/e/)
# puts sa.my_any?(/a/)
# puts sa.any?(/a/)
# puts 'variable'
# puts sa.my_any?('a')
# puts sa.any?('a')
# puts sa.my_any?('ab')
# puts sa.any?('ab')
# puts 'block'
# puts na.my_any? { |x| x > 1 }
# puts na.any? { |x| x > 1 }
# puts na.my_any? { |x| x < 1 }
# puts na.any? { |x| x < 1 }
#
# puts 'my none'
# puts a.my_none?
# puts a.none?
# puts ea.my_none?
# puts ea.none?
# puts 'module'
# puts a.my_none?(Numeric)
# puts a.none?(Numeric)
# puts sa.my_none?(Numeric)
# puts sa.none?(Numeric)
# puts 'regex'
# puts sa.my_none?(/e/)
# puts sa.none?(/e/)
# puts sa.my_none?(/a/)
# puts sa.none?(/a/)
# puts 'variable'
# puts sa.my_none?('a')
# puts sa.none?('a')
# puts sa.my_none?('ab')
# puts sa.none?('ab')
# puts 'block'
# puts na.my_none? { |x| x > 1 }
# puts na.none? { |x| x > 1 }
# puts na.my_none? { |x| x < 1 }
# puts na.none? { |x| x < 1 }
# puts 'my count'
# puts na.my_count
# puts na.count
# puts 'variable'
# puts na.my_count(2)
# puts na.count(2)
# puts 'block'
# puts na.my_count { |x| x > 4 }
# puts na.count { |x| x > 4 }
