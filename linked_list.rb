
#LinkedList class, which will represent the full list.
class LinkedList
 #Nodeclass, containing a #value method and a link to the #next_node, set both as nil by default.
  def initialize
    @head = nil
  end
  
  class Node
   def initialize (value)
     @value = value
     @next_node = nil
   end
  end

  #append(value) adds a new node containing value to the end of the list
  def append(value)
    Node.new(value)
  end

  # prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    
   
end

l = LinkedList.new
l.append('a')
p l

  # size returns the total number of nodes in the list
  # head returns the first node in the list
  # tail returns the last node in the list
  # at(index) returns the node at the given index
  # pop removes the last element from the list
  # contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  # find(value) returns the index of the node containing value, or nil if not found.
  # to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil