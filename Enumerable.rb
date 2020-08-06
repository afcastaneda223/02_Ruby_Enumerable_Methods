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

  # my_each_with_index
  def my_each_with_index
    return to_enum unless block_given?

    x = 0
    my_each do
      yield(self[x], x)
      x += 1
    end
    self
  end

  # my_select
  def my_select
    return to_enum unless block_given?

    pick = []
    my_each do |x|
      pick.push(x) if yield(x)
    end
    pick
  end
  # my_all
  def my_all?(arg = nil)
    if block_given? && arg.nil?
      my_each do |x|
        return false if yield(x) == false
      end
      true

    elsif block_given? == false && arg.nil?
      my_each do |x|
        return false if x.nil? || x == false
      end
      true
    elsif arg.is_a?(Regexp)
      my_each do |x|
        return false unless x.match(arg)
      end
      true

    elsif arg.is_a?(Module)
      my_each do |x|
        return false unless x.is_a?(arg)
      end
      true
    else !arg.nil?
         my_each do |x|
           return false unless x == arg
         end
         true
    end
  end

  # my_any?
  def my_any?(arg = nil)
    if block_given? && arg.nil?
      my_each do |x|
        return true if yield(x) == true
      end
      false
    elsif arg.nil?
      my_each do |x|
        return true if x
      end
      false
    elsif arg.is_a?(Regexp)
      my_each do |x|
        return true if x.match(arg)
      end
      false
    elsif arg.is_a?(Module)
      my_each do |x|
        return true if x.is_a?(arg)
      end
      false

    else !arg.nil?
         my_each do |x|
           return true if x == arg
         end
         false
    end
  end

  # my_none?
  def my_none?(arg = nil)
    if block_given? && arg.nil?
      my_each do |x|
        return false if yield(x) == true
      end
      true
    elsif arg.nil?
      my_each do |x|
        return false if x
      end
      true
    elsif arg.is_a?(Regexp)
      my_each do |x|
        return false if x.match(arg)
      end
      true
    elsif arg.is_a?(Module)
      my_each do |x|
        return false if x.is_a?(arg)
      end
      true

    else !arg.nil?
         my_each do |x|
           return false if x == arg
         end
         true
    end
  end

  # my_count
  def my_count(arg = nil)
    counter = 0
    if block_given?
      my_each do |x|
        counter += 1 if yield(x) == true
      end
    elsif !arg.nil?
      my_each do |x|
        counter += 1 if arg == x
      end
    else
      return length
    end
    counter
  end

  # my_map
  def my_map(arg = nil)
    maps = []
    my_each do |x|
      if !arg.nil?
        maps.push(arg.call(x))
      elsif block_given?
        maps.push(yield(x))
      else
        return to_enum
      end
    end
    maps
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
      elsif memo.nil? && value.nil?
        yield(self)
      else !value.nil?
           acumulator = memo
           my_each { |x| acumulator = acumulator.send(value, x) }
           acumulator
      end
    end
  end
end

def multiply_els(arr)
    arr.my_inject { |x, y| x * y }
end

array = ['a', 'b', 'c', 0, 1, 2, 3, true, false]
string_array = %w[ab abc abcd]
num_array = [1,2,3,4,5,6,7,8]
ary = [1, 2, 4, 2]
my_proc = proc { |x| x + 2 }

puts ' my_each'
num_array.my_each { |n| puts "Current number is: #{n}" }

puts ' '
puts ' my_each_with_index'

array.my_each_with_index do |x, y|
   puts "#{x}: #{y}"
 end

puts ' '
puts ' my_select'
puts ' '

print num_array.my_select { |x| x.odd? }
puts ' '
puts string_array.my_select { |x| x != 'ab' }
puts ' '
puts ' my_all'
puts ' '
puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].my_all?(/t/)                        #=> false
puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
puts [nil, true, 99].my_all?                              #=> false
puts [].my_all?                                           #=> true

puts ' '
puts ' my_any'
puts ' '
puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
puts %w[ant bear cat].my_any?(/d/)                        #=> false
puts [nil, true, 99].my_any?(Integer)                     #=> true
puts [nil, true, 99].my_any?                              #=> true
puts [].my_any?                                           #=> false

puts ' '
puts ' my_none'
puts ' '
puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
puts %w{ant bear cat}.my_none?(/d/)                        #=> true
puts [1, 3.14, 42].my_none?(Float)                         #=> false
puts [].my_none?                                           #=> true
puts [nil].my_none?                                        #=> true
puts [nil, false].my_none?                                 #=> true
puts [nil, false, true].my_none?                           #=> false

puts ' '
puts 'my_count'
puts ' '
puts ary.my_count               #=> 4
puts ary.my_count(2)            #=> 2
puts ary.my_count{ |x| x%2==0 } #=> 3

puts ' '
puts 'my_map'
puts ' '
print num_array.my_map { |x| x + 1}
puts ' '
print num_array.my_map(&my_proc)

puts ' '
puts 'my_inject'
puts ' '
# Sum some numbers
puts [5,6,7,8,9,10].my_inject(:+)                             #=> 45
# Same using a block and inject
puts [5,6,7,8,9,10].my_inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
puts [5,6,7,8,9,10].my_inject(1, :*)                          #=> 151200
# Same using a block
puts [5,6,7,8,9,10].my_inject(1) { |product, n| product * n } #=> 151200
# find the longest word
longest = %w{ cat sheep bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
puts longest                                        #=> "sheep"

puts ' '
puts 'multiply_els'
puts ' '
puts multiply_els([2,4,5])