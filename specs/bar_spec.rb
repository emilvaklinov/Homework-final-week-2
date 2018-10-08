require("minitest/autorun")
require_relative("../bar.rb")
require_relative("../guest.rb")

class BarTest < MiniTest::Test

  def setup
    @bar1 = Bar.new()
    @guest1 = Guest.new("Emily", 10, @song1)
    @guest2 = Guest.new("Michael", 15, @song3)
    @guest3 = Guest.new("Wiliam", 5, @song4)
    @guest4 = Guest.new("Clare", 15, @song2)
    @guest5 = Guest.new("Emil", 20, @song3)
  end

  def test_bar_return_tab_array
    assert_equal({},@bar1.tab)
  end

  def test_bar_add_guest_to_tab_no_method
    @bar1.tab()[@guest1] = 0
    assert_equal({@guest1 => 0}, @bar1.tab())
  end

  def test_bar_add_guest_to_tab
    @bar1.new_tab(@guest1)
    assert_equal({@guest1 => 0}, @bar1.tab())
  end

  def test_add_to_existing_tab_no_method
    @bar1.new_tab(@guest1)
    @bar1.increase_tab(@guest1, 5)
    assert_equal({@guest1 => 5}, @bar1.tab)
  end

  def test_bar_refuses_unaffordable_tab
    @bar1.new_tab(@guest1)
    assert_equal("You can't afford this", @bar1.increase_tab(@guest1, 20) )
  end

#these could be inherited from Till class
  def test_bar_has_till
    assert_equal(0, @bar1.till())
  end

  def test_room_can_receive_cash
    @bar1.receive_cash(5)
    assert_equal(5, @bar1.till())
  end

  #end potential inherit

end
