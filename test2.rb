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
        x=0
        self.my_each{
            yield(self[x], x)
            x += 1
        }
         self
    end
end

array = ["a","b","c",0,1,2,3,true,false]
num_array = [2,4,5]
string_array = ["ab","abc","abcd"]
bool_array = [true,false,true]
my_proc = Proc.new { |x| puts x}

puts array.my_each_with_index 

puts array.my_each