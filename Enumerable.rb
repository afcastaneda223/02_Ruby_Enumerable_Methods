module Enumerable
    def my_each
        n= self.length
        x = 0
        while x < n
            yield(self[x])
            x += 1
        end
        return self
    end
    def my_each_with_index
        n= self.length
        x = 0
        while x < n
            yield(self[x], x)
            x += 1
        end
        return self
    end
    def my_select
        pick = []
        self.my_each { |x|
            if yield(x)
                pick.push(x)
            end
        }
        return pick
    end
    def my_all?
        self.my_each { |x|
        if yield(x) == false
            return false
        end
        }
        return true
    end
    #my_any?
    def my_any?
        self.my_each { |x|
        if yield(x) == true
            return true
        end
        }
        return false
    end
    #my_none?
    def my_none?
        self.my_each { |x|
        if yield(x) == true
            return false
        end
        }
        return true
    end
    #my_count
    def my_count
        counter = 0
        n= self.length
        self.my_each { |x|
        if yield(x) == true
            counter += 1
        else
            return n
        end
        }
        return counter
    end
    #my_map
    def my_select
        pick = []
        self.my_each { |x|
            if yield(x)
                pick.push(x)
            end
        }
        return pick
    end
    def my_map
        maps = []
        self.my_each { |x|
            maps.push(yield(x))
        }
        return maps
    end
    #my_inject
end

array = ["a","b","c",0,1,2,3,true,false]
num_array = [1,2,3,4,5,6,7]
string_array = ["ab","abc","abcd"]
bool_array = [true,false,true]

array.my_each { |x|
    puts x
}
puts "my_each"

array.my_each_with_index { |x,y|
    puts x if y.odd?
}
puts "my_each_with_index"

puts num_array.my_select {|x| x.odd?}

puts string_array.my_select {|x| x != "a"}

puts "my_select"

puts string_array.my_all? {|x| x.length >3}

puts "my_all"

puts string_array.my_any? {|x| x.length >3}

puts "my_any"

puts num_array.count

puts num_array.count{|x|
    x >=4
}
puts "my_count"

print num_array.my_map{|x| 
    x+5
}
puts " "
puts "my_map"




