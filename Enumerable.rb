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
  def my_inject; end

  def multiply_els
    my_inject { |x, y| x * y }
  end
end

true_array = [1, true, 'hi', []]
puts true_array.all?
puts true_array.my_all?


# array = ['a', 'b', 'c', 0, 1, 2, 3, true, false]
# num_array = [2, 4, 5]
# string_array = %w[ab abc abcd]
# my_proc = proc { |x| x + 2 }

# puts ' my_each'

# puts array.my_each { |x| x }

# puts ' '
# puts ' my_each_with_index'

# array.my_each_with_index do |x, y|
#   puts "#{x}: #{y}"
# end

# puts ' '
# puts ' my_select'

# print num_array.my_select { |x| x.odd? }

# print string_array.my_select { |x| x != 'ab' }

# puts ' '
# puts ' my_all'

# print string_array.my_all? { |x| x.length > 3 }

# puts ' '
# puts ' my_any'

# print string_array.my_any? { |x| x.length > 3 }

# puts ' '
# puts 'my_count'

# puts num_array.count
# puts num_array.count { |x|
#   x >= 4
# }

# puts 'my_map'

# print num_array.my_map { |x|
#   x + 1
# }

# print num_array.my_map(&my_proc)

# puts ' '
# puts 'my_inject'

# puts num_array.multiply_els
