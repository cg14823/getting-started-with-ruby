=begin
This is a dumb implementation of a linked list in ruby. In Ruby this type of structure
is very much useless as the same could be achieved with a normal array, but this is
just practice on using classes so it does not matter.
=end
class Node
  def initialize(value)
    @child = nil
    @value = value
  end

  def is_child_bigger(value)
    if @child.nil?
      return true
    end

    return @child.value >= value
  end

  attr_accessor :child
  attr_reader :value
end

class SortedLinkedList
  def initialize
    @head = nil
    @size = 0
  end

  attr_reader :size

  def delete_value(value)
    if @head.nil?
      return false
    end

    if @head.value == value
      @head = @head.child
      @size -= 1
      return true
    end
    
    previous = @head
    current = @head.child

    while not current.nil?
      if current.value == value
        @size -= 1
        previous.child = current.child
        return true
      end

      previous = current
      current = previous.child
    end
    
    return false
  end

  def add_value(value)
    node = Node.new(value)
    @size += 1

    if @head.nil?
      @head = node
      return
    end

    # case of inserting to head
    if @head.value > node.value
      node.child = @head
      @head = node
      return
    end

    # whilst the 
    current_node = @head
    while not current_node.is_child_bigger(node.value)
      current_node = current_node.child
    end

    node.child = current_node.child
    current_node.child = node
  end

  def has_value(value)
    current_node = @head
    while !current_node.nil?
      if current_node.value == value
        return true
      # short circuit as the list is sorted
      elsif current_node.value > value 
        return false
      end

      current_node = current_node.child
    end

    return false
  end

  def visualize
    if @head.nil? 
      puts "List empty"
      return
    end

    current_node = @head
    while !current_node.nil?
      print "#{current_node.value}#{current_node.child.nil? ? '' : ' -> '}"
      current_node = current_node.child
    end
    puts ""
  end
end