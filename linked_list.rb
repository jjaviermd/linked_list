require 'pry'

class LinkedList
  # head returns the first node in the list
 attr_accessor :head
 # size returns the total number of nodes in the list
 attr_reader :size

 def initialize
    self.head = nil
    self.size = 0
  end

   #append(value) adds a new node containing value to the end of the list
   def append(value)
    self.size += 1
    if self.head.nil?
      self.head = Node.new(value)
    else
      last = self.head
      while !last.next_node.nil?
      last = last.next_node
      end
      last.next_node = Node.new(value)
    end
    
  end

  # prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    self.size += 1
    if self.head.nil?
      self.head = Node.new(value)
    else
      last = self.head
      self.head = Node.new(value)
      self.head.next_node = last
    end
    
  end 

  # tail returns the last node in the list
  def tail
    if self.head.nil?
      raise EstandardError, "Linked list is empty"
    else
      last = self.head
      while !last.next_node.nil?
        last = last.next_node
      end
      last
    end  
  end

  # at(index) returns the node at the given index
  def at(index)
    if index < 0 || index >= self.size
      raise StandardError, "Index out of range"
    else
      if index == 0
        return self.head
      else
        current = self.head
        index.times do
          current = current.next_node
        end
        return current
      end
    end  
  end
  # pop removes the last element from the list
  def pop
    if self.head.nil?
      raise StandardError, "Linked list is empty"
    else

    end
  # contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  # find(value) returns the index of the node containing value, or nil if not found.
  # to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  
  private

  attr_writer :size

  class Node
    attr_accessor :value, :next_node

    def initialize (value)
     self.value = value
     self.next_node = nil
    end
  end
  
end

l = LinkedList.new
l.append('a')

l.append('b')


l.append('c')
# p l.head.value
# p l.head.next_node.value
# p l.head.next_node.next_node.value
l.prepend('z')
p l.at(1).value



  
 
  
  