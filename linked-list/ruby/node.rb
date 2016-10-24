class Node
  attr_accessor :value, :reference

  def initialize(value, reference = nil)
    @value     = value
    @reference = reference
  end

  def self.value(node)
    node.value
  end

  def self.reference(node1, node2)
    node1.reference = node2
  end

  def self.append(node1, node2)
    reference(node1, node2)
  end

  def self.next(node, value = 1)
    if value == 1
      node.reference
    else
      node = node.reference
      self.next(node, value - 1)
    end
  end

  def self.at(node, index = 0)
    self.next(node, index)
  end

  def self.find_by(node, hash)
    key = hash.keys.first
    value = hash.values.first

    if node.send(key) == value
      node
    elsif node.reference == nil
      nil
    else
      node = self.next(node)
      self.find_by(node, hash)
    end
  end

  def self.insert(node1, node2)
    node2.reference = node1.reference
    node1.reference = node2
  end

  def self.delete(node, index)
    if index == 0
      return
    elsif index == 1
      node.reference = self.next(node, 2)
    else
      node = self.next(node)
      self.delete(node, index - 1)
    end
  end

  def self.last(node)
    until self.next(node) == nil
      node = Node.next(node)
      self.last(node)
    end
    node
  end

  def self.reverse(node, previous_node = nil)
    return previous_node unless node

    next_node = Node.next(node)
    Node.reference(node, previous_node)
    reverse(next_node, node)
  end

end

# CHARACTERISTCS
# linear collection of data elements, called nodes
# each node has a value and a reference
# easily grow
# easily prune
# potentially slow to read
# fast to append
# slow to prepend
