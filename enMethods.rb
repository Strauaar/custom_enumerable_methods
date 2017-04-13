module Enumerable

  def my_each
    selfArr = self.to_a

    for i in 0...selfArr.length
      yield(selfArr[i])
    end
  end

#[1,2,3].my_each {|m| puts m + 1}

  def my_each_index
    selfArr = self.to_a
    for i in 0...selfArr.length
      yield(selfArr[i],i)
    end
  end

#[1,2,3].my_each_index {|item, index| puts "#{item} + #{index}"}

  def my_select
    selfArr = self.to_a
    finalArr = []
    for i in 0...selfArr.length
      if yield(selfArr[i])
        finalArr.push(selfArr[i])
      else
      end
    end
    return finalArr
  end

#print [1, 3, 5, 6].my_select {|item| item >= 4}

  def my_all?
    selfArr = self.to_a
    all = true
    for i in 0...selfArr.length
      if !yield (selfArr[i])
        all = false
        break
      else
      end
    end
    return all
  end

#puts [1,2,3,4].my_all? {|item| item >= 1} #=> true
#puts [1,2,3,4].my_all? {|item| item >= 4} #=> false

  def my_any?
    selfArr = self.to_a
    any = false
    for i in 0...selfArr.length
      if yield(selfArr[i])
        any = true
        break
      else
      end
    end
    return any
  end

#puts [1,2,3,4].my_any?{|item| item >=3}

  def my_none?
    selfArr = self.to_a
    counter = 0
    for i in 0...selfArr.length
      if yield(selfArr[i])
      else
        counter += 1
      end
    end
    if counter == selfArr.length
      return true
    else
      return false
    end
  end
end

puts [1,2,3].my_none? {|item| item > 2} #=>false
puts [1,2,3].my_none? {|item| item > 4} #=>true
