require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')


class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Emily", "Sex bomb", 10)
end

def test_guest_name
  assert_equal("Emily", @guest1.name)

end

def test_favorite_song
  assert_equal("Sex bomb", @guest1.favorite_song)
end

def test_remove_money
  @guest1.remove_money(5)
  assert_equal(5, @guest1.money)
end


end
