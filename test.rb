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
        store = self[0]
        self.my_map{|x| 
        store = yield(store[x], x) 
    }
    end
end
array = ["a","b","c",1,2,3,true,false]
num_array = [1,2,3]
string_array = ["ab","bbbb","cb"]
bool_array = [true,false,true]
my_proc = Proc.new { |x,y| x}



#print num_array.map{|x| x+1}


print num_array.my_inject(&my_proc)
