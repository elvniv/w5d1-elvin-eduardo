class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false) 
  end

  def insert(num)
    if num > @store.length - 1 || num < 0
      raise "Out of bounds"
    end 
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
     @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # i = num % @store.length
    self[num] << num

  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % self.store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store.include?(num)
      @store[num % @store.length] << num
      @store.count
    end
    # if @store.include?(num)
    #   return true 
    # else 
    #   @store[num % @store.length] << num
    # end
    
  end

  def remove(num)
  end

  def include?(num)
    @store.each do |subs|
      if subs == [num]
        return true 
      end 
    end
      false
  end

  def count
    @count += 1
    @count
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end
end