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
  expected = [],
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
    Node.children(node1).first.value
    )

test "Node.push(node1, node2), when full",
  expected = nil,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    node4 = Node.new(4)
    Node.push(node1, node2)
    Node.push(node1, node3)
    Node.push(node1, node4)
    )

test "Node.pop(node1)",
  expected = 2,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    Node.push(node1, node2)
    Node.push(node1, node3)
    node = Node.pop(node1)

    Node.value(node)
    )

test "Node.pop(node1, :left)",
  expected = 2,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    Node.push(node1, node2)
    Node.push(node1, node3)
    node = Node.pop(node1, :left)

    Node.value(node)
    )

test "Node.pop(node1, :right)",
  expected = 3,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    Node.push(node1, node2)
    Node.push(node1, node3)
    node = Node.pop(node1, :right)

    Node.value(node)
    )

test "Node.total_nodes(node)",
  expected = 3,
  actual   =
    (
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    Node.push(node1, node2)
    Node.push(node2, node3)
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
    Node.push(node2, node3)
    Node.push(node3, node4)
    Node.push(node4, node5)
    Node.push(node5, node6)
    Node.total_nodes(node1)
    )

# test "Node.linsert(node)",
#   expected = "new",
#   actual   =
#     (
#     node1    = Node.new("root")
#     left     = Node.new("left")
#     right    = Node.new("right")
#     new_node = Node.new("new")
#     Node.push(node1, left)
#     Node.push(node1, right)
#     Node.linsert(node1, new_node)
#     children = Node.children(node1)
#
#     Node.value(children[0])
#     )
#
# test "Node.rinsert(node)",
#   expected = "new",
#   actual   =
#     (
#     node1    = Node.new("root")
#     left     = Node.new("left")
#     right    = Node.new("right")
#     new_node = Node.new("new")
#     Node.push(node1, left)
#     Node.push(node1, right)
#     Node.rinsert(node1, new_node)
#     children = Node.children(node1)
#
#     Node.value(children[1])
#     )









#
# test "Node.space(node)",
#   expected = 1,
#   actual   =
#     (
#     node = Node.new(3)
#     Node.push(node, "a")
#     Node.push(node, "a")
#     Node.space(node)
#     )
#
# test "Node.pop(node)",
#   expected = [nil, nil, nil],
#   actual   =
#     (
#     node = Node.new(3)
#     Node.push(node, "a")
#     Node.pop(node)
#     Node.items(node)
#     )
#
# test "Node.peak(node)",
#   expected = "a",
#   actual   =
#     (
#     node = Node.new(3)
#     Node.push(node, "a")
#     Node.peak(node)
#     )
#
# test "Node.peak(node)",
#   expected = ["a", nil, nil],
#   actual   =
#     (
#     node = Node.new(3)
#     Node.push(node, "a")
#     Node.peak(node)
#     Node.items(node)
#     )
#
# test "Node.rotate(node)",
#   expected = [2, 3, 1],
#   actual   =
#     (
#     node = Node.new(3)
#     Node.push(node, 1)
#     Node.push(node, 2)
#     Node.push(node, 3)
#     Node.rotate(node)
#     )
#
# test "Node.rotate(node, number)",
#   expected = [3, 1, 2],
#   actual   =
#     (
#     node = Node.new(3)
#     Node.push(node, 1)
#     Node.push(node, 2)
#     Node.push(node, 3)
#     Node.rotate(node, 2)
#     )
#
# test "Node.rotate(node, number),when node is empty",
#   expected = nil,
#   actual   =
#     (
#     node = Node.new(3)
#     Node.rotate(node, 2)
#     )
