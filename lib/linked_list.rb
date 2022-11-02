# frozen_string_literal: false

require 'node'

# a linked list which consist of nodes
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      dummy = @head
      dummy = dummy.next_node until dummy.next_node.nil?
      dummy.next_node = new_node
    end
  end

  def prepend_with(value)
    new_node = Node.new(value)

    new_node.next_node = @head unless @head.nil?
    @head = new_node
  end

  def size
    return 0 if @head.nil?

    size = 1

    until @head.next_node.nil?
      @head = @head.next_node
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
    return nil if @head.nil? || index > size - 1

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

    string << "( #{dummy.value} ) -> " until dummy.next_node.nil?

    "#{string}nil"
  end

  def insert_at(value, index); end

  def remove_at(index); end
end
