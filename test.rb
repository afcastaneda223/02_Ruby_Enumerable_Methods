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

  def multiply_els(arr)
      arr.my_inject { |x, y| x * y }
  end

end
n = []
puts n.multiply_els([2,4,5])