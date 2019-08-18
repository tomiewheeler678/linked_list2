class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def detectloop(list)
  slow = list.next_node
  fast = list.next_node

  until fast.nil?
    fast = fast.next_node
    return false if fast.nil?

    fast = fast.next_node
    slow = slow.next_node
    return true if fast == slow
  end

  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

puts detectloop(node2)
node1.next_node = node2 # creates an infinite loop
puts detectloop(node2)