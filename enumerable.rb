# frozen_string_literal: true

module Enumerable
  # my_each
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

  # my_each_with_index
  def my_each_with_index
    return to_enum unless block_given?

    x = 0
    arr = if is_a?(Array)
            self
          else
            to_a
          end
    while x < arr.length
      yield(arr[x], x)
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
      return to_a.length
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

arr = [1, 2, 3]

arr.my_each_with_index { |x, y| puts "index: #{x} for #{y}" }
