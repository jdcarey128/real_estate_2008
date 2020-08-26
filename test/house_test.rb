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
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
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
    assert_equal "123 fake street", @house2.address
  end

  def test_house_initially_does_not_have_rooms

    assert_equal [], @house.rooms
  end

  def test_house_rooms_exist_after_add_room
    @house.add_room(@room_1)
    @house2.add_room(@room_2)

    assert_instance_of Room, @house.rooms.first
    assert_instance_of Room, @house2.rooms.first
  end

  def test_house_rooms_returns_instantiated_rooms

    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_instance_of Room, @house.rooms.first
    assert_instance_of Room, @house.rooms.last
  end

  def test_it_returns_market_average

    assert_equal 500000, @house.market_average
  end

  def test_it_returns_boolean_for_above_market_average

    assert_equal false, @house.above_market_average?
  end

  def test_added_rooms_each_instance_of_room

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_instance_of Room, @house.rooms.first
    assert_instance_of Room, @house.rooms[1]
    assert_instance_of Room, @house.rooms[2]
    assert_instance_of Room, @house.rooms.last
  end

  def test_it_can_sort_instantiated_rooms_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_it_can_calculate_entire_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_it_can_return_house_price_and_address_details_in_hash

    hash = {
      "price" => 400000,
      "address" => "123 sugar lane"
            }

    assert_equal hash, @house.details
  end

  def test_it_can_return_price_per_square_foot
    skip
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_it_can_return_rooms_sorted_by_area
    skip 
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    rooms_sorted = [@room_4, @room_3, @room_2, @room_1]

    assert_equal rooms_sorted, @house.rooms_sorted_by_area
  end

  def test_it_returns_rooms_by_category_in_hash
    skip 
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    category_hash = {
      bedroom: [@room_1, @room_2],
      living_room: @room_3,
      basement: @room_4
    }
    assert_equal category_hash, @house.rooms_by_category
end
