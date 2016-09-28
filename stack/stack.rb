class Stack
  attr_accessor :items
  require 'wikipedia'

  def initialize(n = 10)
    @items = Array.new(n, nil)
  end

  def self.items(stack)
    stack.items
  end

  def self.push(stack, new_item)
    counter = 0
    for index in 0...total(stack) do
      if stack.items[index] == nil && counter == 0
        stack.items[index] = new_item
        counter += 1
      end
    end
    stack.items
  end

  def self.length(stack)
    count = 0
    for item in stack.items do
      if item != nil
        count += 1
      end
    end
    count
  end

  def self.space(stack)
    count = 0
    for item in stack.items do
      if item == nil
        count += 1
      end
    end
    count
  end

  def self.total(stack)
    stack.items.length
  end

  def self.pop(stack)
    counter = 0
    total = stack.items.length - 1
    for index in 0..total do
      if stack.items[total - index] != nil && counter == 0
        result = stack.items[total - index]
        stack.items[total - index] = nil
        counter += 1
      end
    end
    result
  end

  def self.peak(stack)
    counter = 0
    total = stack.items.length - 1
    for index in 0..total do
      if stack.items[total - index] != nil && counter == 0
        result = stack.items[total - index]
        counter += 1
      end
    end
    result
  end

  def self.profile
    page = Wikipedia.find( 'Stack (abstract data type)' )
    puts page.summary.split("\n").map { |a| a.strip }.join(" ").gsub(/{.+}/, "")
  end

end
