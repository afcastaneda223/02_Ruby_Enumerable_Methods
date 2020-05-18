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
    def my_select
        pick = []
        self.my_each { |x|
        if yield(x)
          pick.push(x)
        end
        }
        return pick
    end
end

array = ["a","b","c",1,2,3,true,false]
num_array = [1,2,3,4,5,6,7]
string_array = ["a","b","c"]
bool_array = [true,false,true]


puts num_array.my_select {|x| x.odd?}
