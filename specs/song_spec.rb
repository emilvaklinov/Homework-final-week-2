require('minitest/autorun')
require('minitest/rg')
require_relative('../song')


class SongTest < MiniTest::Test

  def setup

    @song1 = Song.new("Tom Jons", "Sex bomb")
    @song2 = Song.new("Madonna", "Frozen")

  end

  def test_song_artist
    assert_equal("Tom Jons", @song1.artist)


  end

  def test_song_title
    assert_equal("Frozen", @song2.title)
  end


end
