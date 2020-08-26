class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price.delete('$').to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > market_average
  end

  def market_average
    500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    rooms.reduce(0) do |total_a, room_a|
      total_a + room_a.area
    end
  end

  def details
    {
      "price" => price,
      "address" => @address
    }
  end

end
