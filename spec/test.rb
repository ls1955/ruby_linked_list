# frozen_string_literal: false

require_relative '../lib/linked_list'
require_relative '../lib/node'

RSpec.describe Node do
  let(:node) { Node.new(0) }

  xit 'initialize as a node containing given value' do
    expect(node.to_s).to eq('( 0 )')
  end
end

RSpec.describe LinkedList do
  let(:linked_list) { LinkedList.new }

  xit 'initialize an empty linked list' do
    expect(linked_list.to_s).to eq('nil')
  end

  xit 'has one node when append with first value' do
    linked_list.append(5)
    expect(linked_list.to_s).to eq('( 5 ) -> nil')
  end

  it 'has 5 node when append 5 times' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.to_s).to eq('( 4 ) -> ( 3 ) -> ( 2 ) -> ( 1 ) -> ( 0 ) -> nil')
  end

  xit 'has one node when prepend with first value' do
    linked_list.prepend_with(5)
    expect(linked_list.to_s).to eq('( 5 ) -> nil')
  end

  xit 'has 5 node when prepend 5 times' do
    5.times { |val| linked_list.prepend_with(val) }
    expect(linked_list.to_s).to eq('( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> nil')
  end

  xit 'has size of 5 after prepend with 5 nodes' do
    5.times { |val| linked_list.prepend_with(val) }
    expect(linked_list.size).to eq(5)
  end

  xit 'not an empty list when append with node' do
    linked_list.append(1)
    expect(linked_list.size).not_to eq(0)
  end

  xit 'last node is first node when append with first value' do
    linked_list.append(5)
    expect(linked_list.tail).to eq('( 5 )')
  end

  xit 'tail is at the end of list after prepend with 5 nodes' do
    5.times { |val| linked_list.prepend_with(val) }
    expect(linked_list.tail).to eq('( 5 )')
  end

  xit 'find respective node in list given index' do
    5.times { |val| linked_list.prepend_with(val) }
    expect(linked_list.at(2).value).to eq(2)
  end

  xit 'return nil if search index is invalid' do
    5.times { |val| linked_list.prepend_with(val) }
    expect(linked_list.at(100).value).to eq(nil)
  end

  xit 'remove last node after pop' do
    5.times { |val| linked_list.append(val) }
    linked_list.pop
    expect(linked_list.to_s).to eq('( 4 ) -> ( 3 ) -> ( 2 ) -> ( 1 ) -> nil')
  end

  xit 'return true if value is contain in list' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.contains?(1)).to eq(true)
  end

  xit 'return false if value is not contain in list' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.contains?(100)).to eq(false)
  end

  xit 'find the index of node given value' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.find(2)).to eq(2)
  end

  xit 'return nothing if no node contain given value' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.find(100)).to eq(nil)
  end
end
