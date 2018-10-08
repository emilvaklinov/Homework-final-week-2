require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')


class GuestTest < MiniTest::Test

  def setup
    @song1 = Song.new("Tom Jons", "Sex bomb")
    @guest1 = Guest.new("Emily", 10, @song1)
    @room1 = Room.new(1)
    @bar1 = Bar.new()
  end

  def test_guest_has_name
    assert_equal("Emily", @guest1.name())
  end

  def test_guest_has_cash
    assert_equal(10, @guest1.wallet())
  end

  def test_guest_can_pay
    @guest1.pay(5)
    assert_equal(5, @guest1.wallet())
  end

  def test_guest_has_favourite_song
    assert_equal(@song1, @guest1.favourite_song())
  end

  def test_return_woo_if_favourite_song
    @room1.check_in(@guest1)
    @room1.add_to_playlist(@song1)
    assert_equal("Woo! This is my song", @guest1.favourite_song_on_playlist(@room1))
  end

  def test_can_pay_tab
    @bar1.new_tab(@guest1)
    @bar1.increase_tab(@guest1, 5)
    @guest1.pay_tab(@bar1)
    assert_equal(5, @guest1.wallet)
  end

  def test_paying_tab_sets_to_zero
    @bar1.new_tab(@guest1)
    @bar1.increase_tab(@guest1, 5)
    @guest1.pay_tab(@bar1)
    assert_equal(0, @bar1.tab[@guest1])
  end

  def test_paying_tab_gives_bar_money
    @bar1.new_tab(@guest1)
    @bar1.increase_tab(@guest1, 5)
    @guest1.pay_tab(@bar1)
    assert_equal(5, @bar1.till)
  end
end
