module Tree
  require_relative "../binary-tree/node.rb"
  extend self

  def build(array, start = 0, finish = array.length - 1)
    return nil if start > finish
    mid = (start + finish) / 2
    root = Node.new(array[mid])

    root.left  = build(array, start, mid - 1)
    root.right = build(array, mid + 1, finish)

    root
  end

  def max(node)
    if node.right == nil
      node.value
    else
      max(node.right)
    end
  end

  def min(node)
    if node.left == nil
      node.value
    else
      min(node.left)
    end
  end

  def find(root, target_value)
    return nil unless root
    root_value = root.value

    if target_value < root_value
      find(root.left, target_value)
    elsif target_value > root_value
      find(root.right, target_value)
    else
      root
    end
  end

  def traverse(root, order = :inorder)
    case order
      when :inorder
        return if root == nil
        traverse(root.left, order)
        print root.value
        traverse(root.right, order)
      when :preorder
        return if root == nil
        print root.value
        traverse(root.left, order)
        traverse(root.right, order)
      when :postorder
        return if root == nil
        traverse(root.left, order)
        traverse(root.right, order)
        print root.value
    end
  end

end
