require "./node.rb"
require "../test/test.rb"
include Test

test "Node.value(node)",
  expected = 5,
  actual   =
    (
    node = Node.new(expected)
    Node.value(node)
    )

test "Node.append(node1, node2)",
  expected = 6,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(expected)
    Node.append(node1, node2)
    node = node1.reference
    Node.value(node)
    )

test "Node.next(node)",
  expected = 6,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(expected)
    Node.reference(node1, node2)
    node = Node.next(node1)
    Node.value(node)
    )

test "Node.next, with some value",
  expected = 7,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(6)
    node3 = Node.new(expected)
    Node.reference(node1, node2)
    Node.reference(node2, node3)
    node = Node.next(node1, 2)
    Node.value(node)
    )

test "Node.at(node, index), (alias for Node.next)",
  expected = 7,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(6)
    node3 = Node.new(expected)
    Node.reference(node1, node2)
    Node.reference(node2, node3)
    node = Node.next(node1, 2)
    Node.value(node)
    )

test "Node.find_by(key: value)",
  expected = 6,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(6)
    Node.reference(node1, node2)
    node = Node.find_by(node1, {value: 6})
    node.value
    )

test "Node.insert",
  expected = 6,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(6)
    node3 = Node.new(7)
    Node.reference(node1, node3)
    Node.insert(node1, node2)
    node = Node.next(node1)
    node.value
    )

test "Node.delete",
  expected = 7,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(6)
    node3 = Node.new(7)
    Node.reference(node1, node2)
    Node.reference(node2, node3)
    Node.delete(node1, 1)
    node = Node.next(node1)
    node.value
    )

test "Node.last",
  expected = 7,
  actual   =
    (
    node1 = Node.new(5)
    node2 = Node.new(6)
    node3 = Node.new(7)
    Node.reference(node1, node2)
    Node.reference(node2, node3)
    node = Node.last(node1)
    node.value
    )
