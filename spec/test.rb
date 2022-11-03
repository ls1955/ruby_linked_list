# frozen_string_literal: false

require_relative '../lib/linked_list'
require_relative '../lib/node'

RSpec.describe Node do
  let(:node) { Node.new(0) }

  it 'initialize as a node containing given value' do
    expect(node.to_s).to eq('( 0 )')
  end
end

RSpec.describe LinkedList do
  let(:linked_list) { LinkedList.new }

  it 'initialize an empty linked list' do
    expect(linked_list.to_s).to eq('nil')
  end

  it 'has one node when append with first value' do
    linked_list.append(5)
    expect(linked_list.to_s).to eq('( 5 ) -> nil')
  end

  it 'has 5 node when append 5 times' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.to_s).to eq('( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> nil')
  end

  it 'has one node when prepend with first value' do
    linked_list.prepend(5)
    expect(linked_list.to_s).to eq('( 5 ) -> nil')
  end

  it 'has 5 node when prepend 5 times' do
    5.times { |val| linked_list.prepend(val) }
    expect(linked_list.to_s).to eq('( 4 ) -> ( 3 ) -> ( 2 ) -> ( 1 ) -> ( 0 ) -> nil')
  end

  it 'has size of 5 after prepend with 5 nodes' do
    5.times { |val| linked_list.prepend(val) }
    expect(linked_list.size).to eq(5)
  end

  it 'not an empty list when append with node' do
    linked_list.append(1)
    expect(linked_list.size).not_to eq(0)
  end

  it 'last node is first node when append with first value' do
    linked_list.append(5)
    expect(linked_list.tail.to_s).to eq('( 5 )')
  end

  it 'tail is at the end of list after prepend with 5 nodes' do
    5.times { |val| linked_list.prepend(val) }
    expect(linked_list.tail.to_s).to eq('( 0 )')
  end

  it 'return nil if search index is invalid' do
    5.times { |val| linked_list.prepend(val) }
    expect(linked_list.at(100)).to eq(nil)
  end

  it 'find respective node in list given index' do
    5.times { |val| linked_list.prepend(val) }
    expect(linked_list.at(2).to_s).to eq('( 2 )')
  end

  it 'remove last node after pop' do
    5.times { |val| linked_list.append(val) }
    linked_list.pop
    expect(linked_list.to_s).to eq('( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> nil')
  end

  it 'remove first node after shift' do
    5.times { |val| linked_list.append(val) }
    linked_list.shift
    expect(linked_list.to_s).to eq('( 1 ) -> ( 2 ) -> ( 3 ) -> ( 4 ) -> nil')
  end

  it 'return true if value is contain in list' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.contains?(1)).to eq(true)
  end

  it 'return false if value is not contain in list' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.contains?(100)).to eq(false)
  end

  it 'find the index of node given value' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.find(2)).to eq(2)
  end

  it 'return nothing if no node contain given value' do
    5.times { |val| linked_list.append(val) }
    expect(linked_list.find(100)).to eq(nil)
  end

  it 'insert nothing if given index is invalid' do
    4.times { |val| linked_list.append(val) }
    linked_list.insert_at(1000, 2000)
    expect(linked_list.to_s).to eq('( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> nil')
  end

  it 'prepend the node if given index is 0' do
    4.times { |val| linked_list.append(val) }
    linked_list.insert_at(1000, 0)
    expect(linked_list.to_s).to eq('( 1000 ) -> ( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> nil')
  end

  it 'insert node at certain position given index' do
    4.times { |val| linked_list.append(val) }
    linked_list.insert_at(1000, 2)
    expect(linked_list.to_s).to eq('( 0 ) -> ( 1 ) -> ( 1000 ) -> ( 2 ) -> ( 3 ) -> nil')
  end

  it 'remove respective node given index' do
    4.times { |val| linked_list.append(val) }
    linked_list.remove_at(2)
    expect(linked_list.to_s).to eq('( 0 ) -> ( 1 ) -> ( 3 ) -> nil')
  end

  it 'remove first node if given index is zero' do
    4.times { |val| linked_list.append(val) }
    linked_list.remove_at(0)
    expect(linked_list.to_s).to eq('( 1 ) -> ( 2 ) -> ( 3 ) -> nil')
  end

  it 'do not remove any node given invalid index' do
    4.times { |val| linked_list.append(val) }
    linked_list.remove_at(1000)
    expect(linked_list.to_s).to eq('( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> nil')
  end

end
