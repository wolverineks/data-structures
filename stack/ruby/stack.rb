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

  def self.rotate(stack, counter = 1)
    total_items_count = Stack.length(stack)
    if total_items_count == 0
      return nil
    end
    temp1 = Stack.new(total_items_count - counter)
    temp2 = Stack.new(counter)

    for i in (0...total_items_count - counter) do
      item = Stack.pop(stack)
      Stack.push(temp1, item)
    end

    remaining_items = Stack.items(stack)
    for i in (remaining_items) do
      item = Stack.pop(stack)
      Stack.push(temp2, item)
    end

    for i in (0...total_items_count - counter) do
      item = Stack.pop(temp1)
      Stack.push(stack, item)
    end

    for i in (0...counter) do
      item = Stack.pop(temp2)
      Stack.push(stack, item)
    end
    stack.items
  end

  def self.profile
    page = Wikipedia.find( 'Stack (abstract data type)' )
    puts page.summary.split("\n").map { |a| a.strip }.join(" ").gsub(/{.+}/, "")
  end

end
