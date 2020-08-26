require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @house2 = House.new("$240000", "123 fake street")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
  end

  def test_it_exists

    assert_instance_of House, @house
  end

  def test_it_can_return_house_price

    assert_equal 400000, @house.price
    assert_equal 240000, @house2.price
  end

  def test_it_can_return_house_address

    assert_equal "123 sugar lane", @house.address
    assert_equal "123 fake street", @house.address
  end

  def test_house_initially_does_not_have_rooms

    assert_equal [], @house.rooms
  end

  def test_house_rooms_exist_after_add_room

    assert_instance_of Room, @house.add_room(@room_1)
    assert_instance_of Room, @house2.add_room(@room_2)
  end

  def test_house_rooms_returns_instantiated_rooms

    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_instance_of Room, @house.rooms
  end



end
