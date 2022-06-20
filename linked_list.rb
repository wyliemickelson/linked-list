require_relative "node.rb"

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if size == 0
      self.tail = new_node
      self.head = tail
    else
      new_node.prev_node = tail
      tail.next_node = new_node
      self.tail = new_node
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if size == 0
      self.head = new_node
      self.tail = head
    else
      head.prev_node = new_node
      new_node.next_node = head
      self.head = new_node
    end
    @size += 1
  end

  # def insert_at(value, index)

  # end

  # def remove_at(index)

  # end

  def at(index)
    current_node = head
    (index).times { current_node = current_node.next_node }
    current_node
  end

  def pop
    tail.prev_node.next_node = nil
    self.tail = prev_node
  end

  def contains?(value)
    current_node = head
    until current_node.nil?
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = head
    i = 0
    until current_node.nil?
      return i if current_node.value == value
      current_node = current_node.next_node
      i += 1
    end
    nil
  end

  def to_s
    current_node = head
    str = "#{current_node.value}"
    until current_node.nil?
      str += "-> #{current_node.value} "
      current_node = current_node.next_node
    end
    str += "-> nil"
  end
end
