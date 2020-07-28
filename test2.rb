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
    def my_all?(arg=nil)
        if block_given? && arg == nil
          self.my_each { |x|
            if yield(x) == false
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
                return false unless x.match(arg)
                }
        return true
            
    else arg.is_a?(Module)
        self.my_each{ |x|
        return false unless x.is_a?(arg)
        }
        return true
            
        end
    end
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
                if x == nil || x == true
                    return true
                end
                }
        return false
            
        elsif arg.is_a?(Regexp)
                self.my_each{ |x|
                return true unless x.match(arg)
                }
        return false
            
    else arg.is_a?(Module)
        self.my_each{ |x|
        return true unless x.is_a?(arg)
        }
        return false
            
        end
    end
end

array = ["abc"]
num_array = [2,4,5]
string_array = ["ab","abc","abcd"]
bool_array = [true,false,true]
my_proc = Proc.new { |x|  x >3}


puts bool_array.my_any?

puts bool_array.any?
