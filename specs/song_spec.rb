require('minitest/autorun')
require('minitest/rg')
require_relative('../song')


class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Tom Jons", "Sex bomb")
    @song2 = Song.new("Madonna", "Frozen")
    @song3 = Song.new("Lady in Red", "Chris de Burgh")
    @song4 = Song.new("Yes Sir, I Will", "Crass")

  end

  def test_song_has_name
    assert_equal("Frozen", @song2.name())
  end

  def test_song_has_artist
    assert_equal("Madonna", @song2.artist())
  end

end
