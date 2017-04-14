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

#puts [1,2,3].my_none? {|item| item > 2} #=>false
#puts [1,2,3].my_none? {|item| item > 4} #=>true

  def my_count(param = nil)
    selfArr = self.to_a
    if param
      counterSpecific = 0
      for i in 0...selfArr.length
        if selfArr[i] == param
          counterSpecific += 1
        else
        end
      end
      return counterSpecific
    elsif block_given?
      counter = 0
      for i in 0...selfArr.length
        if yield(selfArr[i])
          counter += 1
        else
        end
      end
      return counter
    else
      return selfArr.length
    end
  end


#puts [1,2,4,5,6,4].my_count(4) #=> 2
#puts [1,2,4,5,6,4].my_count #=> 6
#puts [1,2,4,5,6,4].my_count {|x| x > 2} #=> 4


  def my_map
    selfArr = self.to_a
    newArr = []
    for i in 0...selfArr.length
      if block_given?
        newArr.push(yield(selfArr[i]))
      else
        newArr.push(selfArr[i])
      end
    end
    return newArr
  end

#print (1..3).my_map #=> [1,2,3]
#print [1,2,3].my_map {|x| x * 2} #=> [2,4,6]

  def my_inject(initial = nil, sym = nil)
      selfArr = self.to_a
      cumulative = 0
      if initial
        selfArr.insert(0, initial)
      else
      end
      for i in 0...selfArr.length
        if block_given?
          if i == 0
          elsif i == 1
            toAccum = yield(selfArr[i-1],selfArr[i])
          else
            toAccum = yield(toAccum,selfArr[i])
          end
        else
          if i == 0
          elsif i == 1
            toAccum = sym.send(selfArr[i-1],selfArr[i])
          else
            toAccum = sym.send(toAccum,selfArr[i])
          end
        end
      end
  end
end

a= [1,2,3]
puts a.inject(:+) # => 6
puts a.inject(2, :+) # =>8
puts a.inject(2) {|cumulative, item| cumulative*item} # =>12
puts a.inject{|cumulative,item| cumulative*item} # => 6
