# frozen_string_literal: false

require 'node'

# a linked list which consist of nodes
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    return @head = Node.new(value) if head.nil?

    dummy = @head
    dummy = dummy.next_node until dummy.next_node.nil?
    dummy.next_node = Node.new(value)
  end

  def prepend(value)
    new_node = Node.new(value)

    new_node.next_node = @head unless @head.nil?
    @head = new_node
  end

  def size
    return 0 if @head.nil?

    size = 1
    dummy = @head

    until dummy.next_node.nil?
      dummy = dummy.next_node
      size += 1
    end

    size
  end

  def tail
    return nil if @head.nil?

    dummy = @head
    dummy = dummy.next_node until dummy.next_node.nil?
    dummy
  end

  def at(index)
    return nil if @head.nil? || index > (size - 1)

    dummy = @head

    index.times { dummy = dummy.next_node }

    dummy
  end

  def pop
    return nil if @head.nil?

    hare = @head
    tortoise = @head

    hare = hare.next_node

    until hare.next_node.nil?
      hare = hare.next_node
      tortoise = tortoise.next_node
    end

    tortoise.next_node = hare.next_node
    hare
  end

  def shift
    return nil if @head.nil?

    @head = @head.next_node
  end

  def contains?(value)
    return nil if @head.nil?

    dummy = @head

    until dummy.next_node.nil?
      return true if dummy.value == value

      dummy = dummy.next_node
    end

    false
  end

  def find(value)
    return nil if @head.nil?

    dummy = @head
    index = 0

    until dummy.next_node.nil?
      return index if dummy.value == value

      index += 1
      dummy = dummy.next_node
    end

    nil
  end

  def to_s
    return 'nil' if @head.nil?

    dummy = @head
    string = "( #{dummy.value} ) -> "

    until dummy.next_node.nil?
      dummy = dummy.next_node
      string << "( #{dummy.value} ) -> "
    end

    string << 'nil'
  end

  def insert_at(value, index)
    return nil if index > (size - 1)

    return prepend(value) if index.zero?

    new_node = Node.new(value)
    hare = @head
    tortoise = @head

    hare = hare.next_node
    (index - 1).times do
      hare = hare.next_node
      tortoise = tortoise.next_node
    end

    tortoise.next_node = new_node
    new_node.next_node = hare
  end

  def remove_at(index)
    return nil if index > (size - 1)

    return pop if index == (size - 1)
    return shift if index.zero?

    dummy = @head

    (index - 1).times { dummy = dummy.next_node }

    dummy.next_node = dummy.next_node.next_node
  end
end
