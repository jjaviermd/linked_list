require 'pry-byebug'

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
    elsif self.size == 1
      return nil
    elsif self.size == 2
      self.head.next_node = nil
      self.size -=1 
      self
    else
      self.at(self.size - 2).next_node = nil
      self.size -=1
      self
    end
  end
  # contains?(value) returns true if the passed in value is in the list and 
    # otherwise returns false.
  def contains?(value)
    if self.head.nil?
      return false
    else
      current = self.head
      return true if current.value == value
      while !current.next_node.nil?
        current = current.next_node
        if current.value == value
          return true
        end
      end
    end
    return false
  end
  # find(value) returns the index of the node containing value, or nil if not 
    # found.
  def find(value)
    if self.head.nil?
      return nil
    elsif head.value == value
      return 0
    else
      counter = 0
      current = self.head
      until current.next_node.nil?
        current = current.next_node
        counter += 1
        return counter if current.value == value
      end
    end
    return nil
  end
  # to_s represent your LinkedList objects as strings, so you can print them 
    # out and preview them in the console. The format should be: 
    # ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    if self.head.nil?
      return nil
    else
      str = ""
      current = self.head
      self.size.times do
        str << "( #{current.value.to_s} ) -> "
        current = current.next_node
      end
      str << " nil"
    end
  end

  #insert_at(value, index) that inserts a new node with the
  # provided value at the given index.
  def insert_at(value, index)
    if self.head.nil? ||index <= 0
      self.prepend(value)
    elsif index > self.size
      self.append(value)
    else
      n_node =  self.at(index)
      p_node = self.at(index-1)
      new_node = Node.new(value)
      new_node.next_node = n_node
      p_node.next_node = new_node
      self.size += 1
    end
  end

  #remove_at(index) that removes the node at the given index.
  def remove_at(index)
    if self.head.nil?
      raise StandardError, "Linked list is empty"
    elsif index > self.size-1 || index < 0
      raise StandardError, "Index out of range"
    elsif index == 0
      self.head = self.head.next_node
      self.size -= 1
    elsif index == self.size-1
      new_tail = self.at(index-1)
      new_tail.next_node = nil
      self.size -= 1
    else
      p_node = self.at(index-1)
      n_node = self.at(index+1)
      p_node.next_node = n_node
      self.size -= 1
    end
  end


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
