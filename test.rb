module Enumerable
    def my_each
        n= self.length
        i = 0
        while i < n
            yield(self[i])
            i += 1
        end
        return self
    end
    def my_none?
        self.my_each { |x|
        if yield(x) == true
            return false
        end
        }
        return true
    end
end

array = ["a","b","c",1,2,3,true,false]
num_array = [1,2,3,4,5,6,7]
string_array = ["ab","bbbb","cb"]
bool_array = [true,false,true]


puts string_array.my_none?{|x| x.length > 3}
