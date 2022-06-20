require_relative "../linked_list.rb"

RSpec.configure do |config|
  config.before(:all) do
    @values = Array.new(25) { rand(100) }
  end
end

RSpec.describe LinkedList do
  before(:each) do
    @list = LinkedList.new
  end

  describe "#append" do
    it "adds each node to the end of the list" do
      @list.append(125)
      expect(@list.tail.value).to eql 125
      expect(@list.head.value).to eql 125
    end

    it "does not affect the head of the list" do
      values = [2, 7, 5, 3, 6]
      values.each { |value| @list.append(value) }
      expect(@list.head.value).not_to eql @list.tail.value
    end

    it "increments the size of the list" do
      @values.each { |value| @list.append(value) }
      expect(@list.size).to eql 25
    end
  end

  describe "#prepend" do
    it "adds each node to the end of the list" do
      @list.prepend(125)
      expect(@list.tail.value).to eql 125
      expect(@list.head.value).to eql 125
    end

    it "does not affect the head of the list" do
      values = [2, 7, 5, 3, 6]
      values.each { |value| @list.prepend(value) }
      expect(@list.head.value).not_to eql @list.tail.value
    end

    it "increments the size of the list" do
      @values.each { |node| @list.prepend(node) }
      expect(@list.size).to eql 25
    end
  end

  describe "#at" do
    before(:each) { @values.each { |value| @list.append(value) } }

    it "returns the node at the given index" do
      @values.each { |value| @list.append(value) }
      expect(@list.at(8).value).to eql @values[8]
      expect(@list.at(0).value).to eql @values[0]
      expect(@list.at(24).value).to eql @values[24]
    end

    it "returns nil if index is out of range" do
      expect(@list.at(34)).to eql nil
      expect(@list.at(-2)).to eql nil
      expect(@list.at(25)).to eql nil
    end
  end

  describe "#pop" do
    before(:each) { @values.each { |value| @list.append(value) } }

    it "removes the last element from the list" do
      @list.pop
      expect(@list.tail.value).to eql @values[23]
    end

    it "decrements the size of the list" do
      @list.pop
      expect(@list.size).to eql 24
    end

    it "does nothing if the list is empty" do
      @values.length.times { @list.pop }
      expect(@list.size).to eql 0
      expect(@list.tail).to eql nil
      expect(@list.head).to eql nil
    end
  end

  describe "#contains?" do
    before(:each) { @values.each { |value| @list.append(value) } }

    it "returns true if the list contains the value" do
      @values.each { |value| expect(@list.contains?(value)).to eql true }
    end

    it "returns false if the list does not contain the value" do
      expect(@list.contains?(150)).to eql false
      expect(@list.contains?(true)).to eql false
      expect(@list.contains?(nil)).to eql false
    end
  end

  describe "#find" do
    before(:each) { @values.each { |value| @list.append(value) } }

    it "returns the value's index if the list contains the value" do
      @values.each_with_index { |value, index| expect(@list.find(value)).to eql @values.index(value) }
    end

    it "returns nil if the list does not contain the value" do
      expect(@list.find(150)).to eql nil
      expect(@list.find(true)).to eql nil
      expect(@list.find(nil)).to eql nil
    end
  end
end
