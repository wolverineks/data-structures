require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'Unit Tests'

require "./stack.rb"
# require "../test/test.rb"
# include Test
require 'basic_test'
include BasicTest

test "Stack.items(stack)",
  expected = [nil, nil, nil],
  actual   =
    (
    stack = Stack.new(3)
    Stack.items(stack)
    )

test "Stack.push(stack)",
  expected = ["a", nil, nil],
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, "a")
    Stack.items(stack)
    )

test "Stack.length(stack)",
  expected = 1,
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, "a")
    Stack.length(stack)
    )

test "Stack.space(stack)",
  expected = 1,
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, "a")
    Stack.push(stack, "a")
    Stack.space(stack)
    )

test "Stack.pop(stack)",
  expected = [nil, nil, nil],
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, "a")
    Stack.pop(stack)
    Stack.items(stack)
    )

test "Stack.peak(stack)",
  expected = "a",
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, "a")
    Stack.peak(stack)
    )

test "Stack.peak(stack)",
  expected = ["a", nil, nil],
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, "a")
    Stack.peak(stack)
    Stack.items(stack)
    )

test "Stack.rotate(stack)",
  expected = [2, 3, 1],
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, 1)
    Stack.push(stack, 2)
    Stack.push(stack, 3)
    Stack.rotate(stack)
    )

test "Stack.rotate(stack, number)",
  expected = [3, 1, 2],
  actual   =
    (
    stack = Stack.new(3)
    Stack.push(stack, 1)
    Stack.push(stack, 2)
    Stack.push(stack, 3)
    Stack.rotate(stack, 2)
    )

test "Stack.rotate(stack, number),when stack is empty",
  expected = nil,
  actual   =
    (
    stack = Stack.new(3)
    Stack.rotate(stack, 2)
    )
