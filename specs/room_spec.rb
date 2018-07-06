require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("Yeah", 5)
    @guest1 = Guest.new("Emily", "Sex bomb", 10)
    @song1 = Song.new("Tom Jons", "Sex bomb")
    @song2 = Song.new("Madonna", "Frozen")

  end

def test_check_in_guest
  @room1.check_in_guest(@guest1)
  check = @room1.guests.length
  p @room1.guests
  assert_equal(1, check)
end

def check_out_guest
  @room1.check_out_guest(@guest1)
  check = @room1.guests.length
  p @room1.guests
  assert_equal(1,check)
end

def test_add_song
  @room1.add_song(@song2)
  check = @room1.songs.length
p @room1.songs
 assert_equal(1, check)
end

def check_favourite_song

  assert_equal("Whoo! That's my song!", @room1)

end
end
