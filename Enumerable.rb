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
    def my_each_with_index
        return to_enum unless block_given?
        n= self.length
        x = 0
        while x < n
            yield(self[x], x)
            x += 1
        end
         self
    end
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
    def my_all?
        return to_enum unless block_given?
        self.my_each { |x|
        if yield(x) == false
            return false
        end
        }
         true
    end
    #my_any?
    def my_any?
        return to_enum unless block_given?
        self.my_each { |x|
        if yield(x) == true
            return true
        end
        }
         false
    end
    #my_none?
    def my_none?
        return to_enum unless block_given?
        self.my_each { |x|
        if yield(x) == true
            return false
        end
        }
         true
    end
    #my_count
    def my_count
        return to_enum unless block_given?
        counter = 0
        n= self.length
        self.my_each { |x|
        if yield(x) == true
            counter += 1
        else
            return n
        end
        }
         counter
    end
    #my_map
    def my_map(param = nil)
        maps = []
        self.my_each { |x|
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
    #my_inject
    def my_inject
        store = self[0]
        self.my_map{|x| 
        store = yield(store, x) 
    }
    end
    def multiply_els(arr)
        arr.my_inject{|x,y| 
        x*y
    }
    end
end

array = ["a","b","c",0,1,2,3,true,false]
num_array = [1,2,3,4,5,6,7]
string_array = ["ab","abc","abcd"]
bool_array = [true,false,true]
my_proc = Proc.new { |x| x+2}

puts " my_each"

puts array.each{|x| x}
puts array.my_each{|x| x}

puts " "
puts " my_each_with_index"

print array.my_each_with_index { |x,y|
     x if y.odd?
}
puts " "
puts " my_select"

print num_array.my_select {|x| x.odd?}

print string_array.my_select {|x| x != "a"}

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


print multiply_els(num_array)

