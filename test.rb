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
        return maps
    end
    def my_inject
        n= self.length
        x = 1
        total = self[0]
        while x < n
            puts "_____"
            puts total,x
           total = yield(total,self[x])
            x += 1
        end
        return total
    end
    def sum(arr)
        arr.my_each { |x| 
            x+1
        }
    end
end
array = ["a","b","c",1,2,3,true,false]
num_array = [1,2,3,4,5]
string_array = ["ab","bbbb","cb"]
bool_array = [true,false,true]
my_proc = Proc.new { |x| x+1}

puts num_array.inject{|x,y| x*y}

puts num_array.my_inject{|x,y| x*y}

#print num_array.map{|x| x+1}
=begin
puts num_array.inject{|x,y| x*y}
puts num_array.my_inject{|x,y| x*y}


puts num_array.inject(:+)
puts num_array.inject(5, :+)

puts num_array.my_inject(:+)
puts num_array.my_inject(5, :+)
=end