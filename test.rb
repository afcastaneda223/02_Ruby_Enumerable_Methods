# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum unless block_given?

    x = 0
    arr = if is_a?(Array)
            self
          else
            to_a
          end
    while x < arr.length
      yield(arr[x])
      x += 1
    end
    self
  end

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
      return to_a.length
    end
    counter
  end
end

array = ['a', 'b', 'c', 0, 1, 2, 3, true, false]
string_array = %w[ab abc abcd]
num_array = [1, 2, 3, 4, 5, 6, 7, 8]
ary = [1, 2, 4, 2]
my_proc = proc { |x| x + 2 }
range = (1..8)
hash = { 'Jane Doe' => 10, 'Jim Doe' => 6 }

# puts ' '
# puts 'my each '
# puts range.my_each { |x| x }
# puts hash.my_each { |x| x }
# print string_array.my_each { |x| x }
# puts ' '
# puts range.each { |x| x }
# puts hash.each { |x| x }
# print string_array.each { |x| x }

# puts ' '
# puts 'my each with index'
# range.my_each_with_index { |x, y| puts "#{x}: #{y}" }
# hash.my_each_with_index { |x, y| puts "#{x}: #{y}" }
# string_array.my_each_with_index { |x, y| puts "#{x}: #{y}" }
# puts ' '
# range.each_with_index { |x, y| puts "#{x}: #{y}" }
# hash.each_with_index { |x, y| puts "#{x}: #{y}" }
# string_array.each_with_index { |x, y| puts "#{x}: #{y}" }

# puts ' '
# puts ' my_select'
# puts ' '

# print num_array.my_select(&:odd?)
# puts ' '
# print range.my_select(&:odd?)
# puts ' '
# print string_array.my_select { |x| x != 'ab' }
# puts ' '
# print hash.my_select { |x,y| y != 6 }
# puts ' '

# puts ' my_all'
# puts ' '
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].my_all?(/t/)                        #=> false
# puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# puts [nil, true, 99].my_all?                              #=> false
# puts [].my_all?                                           #=> true
# puts range.my_all?(Float)                                 #=> false
# puts range.my_all?(Numeric)                               #=> true

# puts ' '
# puts 'my_count'
# puts ' '
# puts ary.my_count               #=> 4
# puts ary.my_count(2)            #=> 2
# puts ary.my_count(&:even?) #=> 3
# puts range.my_count(&:even?) #=> 3
puts range.my_count #=> 8
puts (1..8).my_count

# puts ' '
# puts 'count'
# puts ' '
# puts ary.count               #=> 4
# puts ary.count(2)            #=> 2
# puts ary.count(&:even?)      #=> 3
# puts num_array.count         #=> 8
# puts range.count             #=> 8
