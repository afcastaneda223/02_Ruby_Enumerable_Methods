module Enumerable
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

  def my_map(param = nil)
    maps = []
    map do |x|
      if param
        maps.push(param.call(x))
      elsif block_given?
        maps.push(yield(x))
      else
        return to_enum
      end
    end
    maps
  end

  def my_all?(arg = nil)
    if block_given? && arg.nil?
      my_each do |x|
        return false unless yield(x) == false
      end
      true

    elsif block_given? == false && arg.nil?
      my_each do |x|
        return false unless x.nil? || x == false
      end
      true

    elsif arg.is_a?(Regexp)
      my_each do |x|
        return false unless x.match(arg)
      end
      true
    elsif !arg.nil?
      my_each do |x|
        return false unless x == arg
      end
      true

    else arg.is_a?(Module)
         my_each do |x|
           return false unless x.is_a?(arg)
         end
         true

    end
  end
end

array = ['a', 'b', 'c', 0, 1, 2, 3, true, false]
num_array = [2, 4, 5]
string_array = %w[ab abc abcd]
bool_array = [true, false, true]
my_proc = proc { |x| puts x }

puts bool_array.my_all?(my_proc)
puts 'xxxxxxx'
puts bool_array.all?(my_proc)
