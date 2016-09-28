class Node
  require 'wikipedia'
  attr_accessor :value, :children

  def initialize(value, children = [])
    @value = value
    @children = children
  end

  def self.value(node)
    node.value
  end

  def self.children(node)
    node.children
  end

  def self.push(node1, node2)
    return nil if Node.children(node1).length >= 2
    children(node1) << node2
  end

  def self.pop(node, which_node = :left)
    if which_node == :left
      result = children(node)[0]
      children(node)[0] = nil
    else
      result = children(node)[1]
      children(node)[1] = nil
    end
    result
  end

  def self.total_nodes(node)
    total = 1
    children = children(node)
    left_node =  children[0]
    right_node = children[1]

    total += self.total_nodes(left_node)  if left_node
    total += self.total_nodes(right_node) if right_node

    total
  end

  # def self.linsert(node1, node2)
  #   temp = pop(node1, :left)
  #   push(node1, node2)
  #   push(node1, temp)
  #   swap_children(node1)
  # end
  #
  # def self.rinsert(node1, node2)
  #   temp = pop(node1, :right)
  #   push(node1, node2)
  #   push(node1, temp)
  #   swap_children(node1)
  # end

  def self.swap_children(node)
    temp = pop(node, :left)
    push(node, temp)
  end

  def self.profile
    page = Wikipedia.find( 'Binary Tree' )
    puts page.summary.split("\n").map { |a| a.strip }.join(" ").gsub(/{.+}/, "")
  end
end
