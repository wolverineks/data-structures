require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Unit Tests'

require "./node.rb"
require "../test/test.rb"
include Test

test "Node.value(node)",
  expected = 1,
  actual   =
    (
    node = Node.new(1)
    Node.value(node)
    )

test "Node.children(node), when no children",
  expected = [nil, nil],
    actual   =
    (
    node = Node.new(1)
    Node.children(node)
    )

test "Node.push(node1, node2)",
  expected = 2,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    Node.push(node1, node2)
    Node.children(node1).last.value
    )

# test "Node.push(node1, node2), when full",
#   expected = nil,
#   actual   =
#     (
#     node1 = Node.new(1)
#     node2 = Node.new(2)
#     node3 = Node.new(3)
#     node4 = Node.new(4)
#     Node.push(node1, node2)
#     Node.push(node1, node3)
#     Node.push(node1, node4)
#     )

# test "Node.pop(node1)",
#   expected = 2,
#   actual   =
#     (
#     node1 = Node.new(1)
#     node2 = Node.new(2)
#     node3 = Node.new(3)
#     Node.push(node1, node2)
#     Node.push(node1, node3)
#     node = Node.pop(node1)
#
#     Node.value(node)
#     )

# test "Node.pop(node1, :left)",
#   expected = 2,
#   actual   =
#     (
#     node1 = Node.new(1)
#     node2 = Node.new(2)
#     node3 = Node.new(3)
#     Node.push(node1, node2)
#     Node.push(node1, node3)
#     node = Node.pop(node1, :left)
#
#     Node.value(node)
#     )
#
# test "Node.pop(node1, :right)",
#   expected = 3,
#   actual   =
#     (
#     node1 = Node.new(1)
#     node2 = Node.new(2)
#     node3 = Node.new(3)
#     Node.push(node1, node2)
#     Node.push(node1, node3)
#     node = Node.pop(node1, :right)
#
#     Node.value(node)
#     )

test "Node.total_nodes(node)",
  expected = 3,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    Node.push(node1, node2)
    Node.push(node1, node3)
    Node.total_nodes(node1)
    )

test "Node.total_nodes(node)",
  expected = 6,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    node4 = Node.new(4)
    node5 = Node.new(5)
    node6 = Node.new(6)
    Node.push(node1, node2)
    Node.push(node1, node3)
    Node.push(node1, node4)
    Node.push(node1, node5)
    Node.push(node1, node6)
    Node.total_nodes(node1)
    )

  test "Node.left(node)",
    expected = 1,
    actual =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)

    Node.push(node2, node1)
    Node.push(node2, node3)

    Node.left(node2).value
    )

  test "Node.right(node)",
    expected = 3,
    actual =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)

    Node.push(node2, node1)
    Node.push(node2, node3)

    Node.right(node2).value
    )
