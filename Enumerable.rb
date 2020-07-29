module Enumerable
    #my_each
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
    #my_each_with_index
    def my_each_with_index
        return to_enum unless block_given?
        x=0
        self.my_each{
            yield(self[x], x)
            x += 1
        }
        end
         self
    end
    #my_select
    def my_select
        return to_enum unless block_given?
        pick = []
        self.my_each { |x|
            if yield(x)
                pick.push(x)
            end
        }
         pick
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
            self.my_each { |x| yield(x) == true
                counter += 1
            }
            elsif arg != nil
                self.my_each { |x| 
                if arg == x
                    counter += 1
                end
                }
            else
                return n
        end
         counter
    end
    #my_map
    def my_map(arg = nil)
        maps = []
        self.my_each { |x|
            if param
                maps.push(arg.call(x))
                elsif block_given?
                maps.push(yield(x))
                else
                return to_enum
            end
        }
         maps
    end
    #my_inject
    def my_inject
        return to_enum unless block_given?
        n= self.length
        x = 1
        total = self[0]
        while x < n
           total = yield(total,self[x])
            x += 1
        end
        return total
    end

    def multiply_els
        return to_enum unless block_given?
        self.inject{|x,y| x*y}
    end
end

array = ["a","b","c",0,1,2,3,true,false]
num_array = [2,4,5]
string_array = ["ab","abc","abcd"]
bool_array = [true,false,true]
my_proc = Proc.new { |x| x+2}


puts " my_each"

puts array.my_each{|x| x}

puts " "
puts " my_each_with_index"

array.my_each_with_index { |x,y|
    puts "#{x}: #{y}"
}

puts " "
puts " my_select"

print num_array.my_select {|x| x.odd?}

print string_array.my_select {|x| x != "ab"}

puts " "
puts " my_all"

print string_array.my_all? {|x| x.length >3}

puts " "
puts " my_any"


print string_array.my_any? {|x| x.length >3}

puts " "
puts "my_count"

puts num_array.count
puts num_array.count{|x|
    x >= 4
}

puts "my_map"

print num_array.my_map{|x| 
    x+1
}

print num_array.my_map(&my_proc)


puts " "
puts "my_inject"

puts num_array.multiply_els
