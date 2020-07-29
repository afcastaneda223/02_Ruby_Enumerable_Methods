module Enumerable
    def my_each
        return to_enum unless block_given?
        n= self.length
        x = 0
        while x < n
            yield(self[x])
            x += 1
        end
         self
    end
    #my_all?
    def my_all?(arg =nil)
            if block_given? && arg == nil
              self.my_each { |x|
                if yield(x) == false
                    return false
                end
                }
                return true
    
                elsif block_given? == false && arg == nil
                    self.my_each {|x| 
                    return false unless x == nil || x == false                        
                    }
                return true
                
                elsif arg.is_a?(Regexp)
                    self.my_each{ |x|
                    return false unless x.match(arg)
                    }
                return true
                
                elsif arg.is_a?(Module)
                    self.my_each{ |x|
                    return false unless x.is_a?(arg)
                   }
               return true
                else arg != nil
                    self.my_each{ |x|
                    return false unless x == arg
                    }
                return true
            end
    end
    #my_any?
    def my_any?(arg=nil)
        if block_given? && arg == nil
          self.my_each { |x|
            if yield(x) == true
                return true
            end
            }
            return false
            elsif block_given? == false && arg == nil
                self.my_each {|x| 
                if x == nil || x == false
                return true 
                end
                }
                return false
            elsif arg.is_a?(Regexp)
                self.my_each{ |x|
                if x.match(arg)
                    return true 
                end
                }
                return false
            elsif arg.is_a?(Module)
                self.my_each{ |x|
                if x.is_a?(arg)
                    return true 
                end
                }
                return false

            else arg !=nil
                self.my_each{ |x|
                if x == arg
                    return true 
                end
                }
                return false
        end
    end
    #my_none?
    def my_none?(arg=nil)
        if block_given? && arg == nil
          self.my_each { |x|
            if yield(x) == true
                return false
            end
            }
            return true
            elsif block_given? == false && arg == nil
                self.my_each {|x| 
                if x == nil || x == false
                return false 
                end
                }
                return true
            elsif arg.is_a?(Regexp)
                self.my_each{ |x|
                if x.match(arg)
                    return false 
                end
                }
                return true
            elsif arg.is_a?(Module)
                self.my_each{ |x|
                if x.is_a?(arg)
                    return false 
                end
                }
                return true

            else arg !=nil
                self.my_each{ |x|
                if x == arg
                    return false 
                end
                }
                return true
        end
    end
    #my_count
    def my_count(arg = nil)
        counter = 0
        if block_given?
            self.my_each { |x| 
                if yield(x) == true
                    counter += 1
                end
            }
            elsif arg != nil
                self.my_each { |x| 
                if arg == x
                    counter += 1
                end
                }
            else
                return self.length
        end
         counter
    end
end


a = ["abc",false,nil,1]
na = [2,4,5]
sa = ["ab","ab","ab"]
ba = [false,true]
ea = []
my_proc = Proc.new { |x|  x >3}
puts "my all"
puts a.my_all?
puts a.all?
puts ea.my_all?
puts ea.all?
puts "module"
puts a.my_all?(Numeric)
puts a.all?(Numeric)
puts na.my_all?(Numeric)
puts na.all?(Numeric)
puts "regex"
puts sa.my_all?(/e/)
puts sa.all?(/e/)
puts sa.my_all?(/a/)
puts sa.all?(/a/)
puts "variable"
puts sa.my_all?("a")
puts sa.all?("a")
puts sa.my_all?("ab")
puts sa.all?("ab")
puts "block"
puts na.my_all?{ |x|  x >1}
puts na.all?{ |x|  x >1}
puts na.my_all?{ |x|  x >3}
puts na.all?{ |x|  x >3}

puts "my any"
puts a.my_any?
puts a.any?
puts ea.my_any?
puts ea.any?
puts "module"
puts a.my_any?(Numeric)
puts a.any?(Numeric)
puts sa.my_any?(Numeric)
puts sa.any?(Numeric)
puts "regex"
puts sa.my_any?(/e/)
puts sa.any?(/e/)
puts sa.my_any?(/a/)
puts sa.any?(/a/)
puts "variable"
puts sa.my_any?("a")
puts sa.any?("a")
puts sa.my_any?("ab")
puts sa.any?("ab")
puts "block"
puts na.my_any?{ |x|  x >1}
puts na.any?{ |x|  x >1}
puts na.my_any?{ |x|  x <1}
puts na.any?{ |x|  x <1}

puts "my none"
puts a.my_none?
puts a.none?
puts ea.my_none?
puts ea.none?
puts "module"
puts a.my_none?(Numeric)
puts a.none?(Numeric)
puts sa.my_none?(Numeric)
puts sa.none?(Numeric)
puts "regex"
puts sa.my_none?(/e/)
puts sa.none?(/e/)
puts sa.my_none?(/a/)
puts sa.none?(/a/)
puts "variable"
puts sa.my_none?("a")
puts sa.none?("a")
puts sa.my_none?("ab")
puts sa.none?("ab")
puts "block"
puts na.my_none?{ |x|  x >1}
puts na.none?{ |x|  x >1}
puts na.my_none?{ |x|   x<1}
puts na.none?{ |x|  x <1}


puts na.my_count
puts na.count
puts na.my_count(2)
puts na.count(2)
puts na.my_count{ |x|  x >4}
puts na.count{ |x|  x >4}