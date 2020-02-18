class Item
  @@all = []
  def self.all
    @@all
  end

  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end
end
