require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')


class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Sex bomb", "Tom Jons" )
    @song2 = Song.new("Madonna", "Frozen")
    @song3 = Song.new("Lady in Red", "Chris de Burgh")
    @song4 = Song.new("Yes Sir, I Will", "Crass")

    @guest1 = Guest.new("Emily", 10, @song1)
    @guest2 = Guest.new("Michael", 15, @song3)
    @guest3 = Guest.new("Wiliam", 5, @song4)
    @guest4 = Guest.new("Clare", 15, @song2)
    @guest5 = Guest.new("Emil", 20, @song3)

    @room1 = Room.new(1)


  end

  def test_room_has_room_number
    assert_equal(1, @room1.room_number())
  end

  def test_room_has_empty_guests
    assert_equal([], @room1.guests())
  end

  def test_room_can_count_guests
    assert_equal(0, @room1.guests().count())
  end

  def test_room_can_check_in_guest_no_method
    @room1.guests().push(@guest1)
    assert_equal(1, @room1.guests().count())
  end

  def test_room_can_check_in_guest_no_method
    @room1.check_in(@guest1)
    assert_equal(1, @room1.guests().count())
  end

  def test_room_can_check_guests_out_no_method
    @room1.check_in(@guest1)
    guest_to_remove = @room1.guests().index(@guest1)
    @room1.guests().delete_at(guest_to_remove)
    assert_equal(0, @room1.guests().count())
  end

  def test_room_can_check_guests_out
    @room1.check_in(@guest1)
    @room1.check_out(@guest1)
    assert_equal(0, @room1.guests().count())
  end

  def test_room_return_playlist
    assert_equal([], @room1.playlist())

  end

  def test_room_add_to_playlist_no_method
    @room1.playlist().push(@song2)
    assert_equal([@song2], @room1.playlist())
      p @room1.playlist()
  end

  def test_room_add_to_playlist_with_method
    @room1.add_to_playlist(@song2)
    assert_equal([@song2], @room1.playlist())
  end

  def test_room_return_song_name
    @room1.playlist().push(@song2)
    assert_equal("Frozen", @room1.playlist().at(0).name())
  end

  def test_room_has_capacity
    assert_equal(4, @room1.capacity())
  end

  def test_checking_in_reduces_capacity
    @room1.check_in(@guest1)
    assert_equal(3, @room1.capacity())
  end

  def test_check_out_increases_capacity
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_out(@guest1)
    assert_equal(3, @room1.capacity())

  end

  def test_room_refuses_check_in_if_at_capacity
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_in(@guest3)
    assert_equal("The room is full",     @room1.check_in(@guest4))
  end

  #these could be inherited from Till class

  def test_room_has_till
    assert_equal(0, @room1.till())
  end

  def test_room_can_recieve_cash
    @room1.receive_cash(5)
    assert_equal(5, @room1.till())
  end

  #end potential inherit

  def test_check_in_takes_entry_fee
    @room1.check_in(@guest1)
    assert_equal(5, @room1.till())
  end

  def test_room_has_guests_favourite_song__true
    @room1.check_in(@guest1)
    @room1.add_to_playlist(@song1)
    assert_equal(true, @room1.favourite_song_on_playlist(@guest1))
  end

  def test_room_has_guests_favourite_song__false
    @room1.check_in(@guest2)
    @room1.add_to_playlist(@song1)
    assert_equal(false, @room1.favourite_song_on_playlist(@guest2))
  end

  # def test_can_play_song
  #   @room1.add_to_playlist(@song1)
  #   assert_equal("Now Playing: Tom Jons by Sex Bomb", @room1.play())
  # end

  # def test_refuse_entry_customer_can_not_afford
  #   assert_equal("You can't afford entry", @room1.check_in(@guest5))
  # end

end
