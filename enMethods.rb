module Enumerable
  def my_each
    selfArr = self.to_a

    for i in 0...selfArr.length
      yield(selfArr[i])
    end
  end
end

[1,2,3].my_each {|m| puts m + 1}
