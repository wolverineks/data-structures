require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Unit Tests'

require "./tree.rb"
require "../test/test.rb"
include Test

test "Tree.max(node)",
  expected = 14,
  actual   =
    (
    array = [0, 3, 7, 8, 9, 10, 14]
    root = Tree.build(array)
    Tree.max(root)
    )

test "Tree.min(node)",
  expected = 0,
  actual   =
    (
    array = [0, 3, 7, 8, 9, 10, 14]
    root = Tree.build(array)
    Tree.min(root)
    )

test "Tree.find(root, target), when contains target",
  expected = true,
  actual   =
    (
    array = [0, 3, 7, 8, 9, 10, 14]
    root = Tree.build(array)
    node = Tree.find(root, 3)
    node.value == 3
    )

test "Tree.find(root, target), when does not contains target",
  expected = nil,
  actual   =
    (
    array = [0, 3, 7, 8, 9, 10, 14]
    root = Tree.build(array)
    Tree.find(root, 13)
    )

test "Tree.traverse(root)",
  expected = "ABCDEFGHIJK",
  actual   =
    (
    array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"]
    root = Tree.build(array)
    capture_stdout do
      Tree.traverse(root)
    end
    )

test "Tree.traverse(root, :inorder)",
  expected = "ABCDEFGHIJK",
  actual   =
    (
    array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"]
    root = Tree.build(array)
    capture_stdout do
      Tree.traverse(root, :inorder)
    end
    )

test "Tree.traverse(root, :preorder)",
  expected = "4213657",
  actual   =
    (
    array = [1, 2, 3, 4, 5, 6, 7]
    root = Tree.build(array)
    capture_stdout do
      Tree.traverse(root, :preorder)
    end
    )

test "Tree.traverse(root, :postorder)",
  expected = "21543",
  actual   =
    (
    array = [1, 2, 3, 4, 5]
    root = Tree.build(array)
    capture_stdout do
      Tree.traverse(root, :postorder)
    end
    )
