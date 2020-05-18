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
    def my_each_with_index
        n= self.length
        i = 0
        while i < n
            yield(self[i], i)
            i += 1
        end
        return self
    end
end

array = ["a","b","c",1,2,3,true,false]

array.my_each { |x|
    puts x
}

array.my_each_with_index { |x,y|
    puts x if y.odd?
}
