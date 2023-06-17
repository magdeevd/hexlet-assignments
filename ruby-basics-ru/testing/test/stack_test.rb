# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push_and_pop
    stack = Stack.new([1, 'c', 1.5, '!'])

    stack.push! 'test'

    assert { stack.size == 5 }

    result = stack.pop!

    assert { result == 'test' }
    assert { stack.size == 4 }
  end

  def test_pop_from_empty_stack
    stack = Stack.new

    result = stack.pop!

    assert { result.nil? }
    assert { stack.size.zero? }
  end

  def test_is_empty
    stack = Stack.new([1, 2])

    refute { stack.empty? }

    stack.clear!

    assert { stack.empty? }
  end

  def test_clear
    stack = Stack.new([1, 2, 3])
    stack.clear!

    assert { stack.empty? }
  end

  def test_clear_empty_stack
    stack = Stack.new
    stack.clear!

    assert { stack.empty? }
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
