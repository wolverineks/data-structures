class Node
  require 'wikipedia'
  attr_accessor :value, :children, :left, :right

  def initialize(value)
    @value = value
  end

  def self.value(node)
    node.value
  end

  def self.children(node)
    [node.left, node.right]
  end

  def self.left(node)
    node.left
  end

  def self.right(node)
    node.right
  end

  def self.push(node1, node2)
    if node1.value < node2.value
      if node1.right == nil
        node1.right = node2
      else
        push(node1.right, node2)
      end
    else
      if node1.left == nil
        node1.left = node2
      else
        push(node1.left, node2)
      end
    end
  end

  # def self.pop(node, which_node = :left)
  #   if which_node == :left
  #     result = children(node)[0]
  #     children(node)[0] = nil
  #   else
  #     result = children(node)[1]
  #     children(node)[1] = nil
  #   end
  #   result
  # end

  def self.total_nodes(node)
    total = 1
    children = children(node)
    left_node =  children[0]
    right_node = children[1]

    total += self.total_nodes(left_node)  if left_node
    total += self.total_nodes(right_node) if right_node

    total
  end

  # def self.swap_children(node)
  #   temp = pop(node, :left)
  #   push(node, temp)
  # end

  def self.profile
    page = Wikipedia.find( 'Binary Tree' )
    puts page.summary.split("\n").map { |a| a.strip }.join(" ").gsub(/{.+}/, "")
  end
end
