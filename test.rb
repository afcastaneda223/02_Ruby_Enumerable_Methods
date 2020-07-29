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
    def my_map(param = nil)
        maps = []
        self.map { |x|
            if param
                maps.push(param.call(x))
                elsif block_given?
                maps.push(yield(x))
                else
                return to_enum
            end
        }
         maps
    end
    def my_all?(arg=nil)
        if block_given? && arg == nil
          self.my_each { |x|
          return false unless yield(x) == false
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
    elsif arg !=nil
        self.my_each{ |x|
        return false unless x == arg
        }
return true
            
    else arg.is_a?(Module)
        self.my_each{ |x|
        return false unless x.is_a?(arg)
        }
        return true
            
        end
    end
end

array = ["a","b","c",0,1,2,3,true,false]
num_array = [2,4,5]
string_array = ["ab","abc","abcd"]
bool_array = [true,false,true]
my_proc = Proc.new { |x| puts x}

puts bool_array.my_all?(my_proc)
puts "xxxxxxx"
puts bool_array.all?(my_proc)