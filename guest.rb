class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def pay(amount)
    @wallet -= amount
  end

  def favourite_song_on_playlist(room)
    return "Woo! This is my song" if room.favourite_song_on_playlist(self) == true
  end

  def pay_tab(bar)
    tab = (bar.tab[self])
    self.pay(tab)
    bar.receive_cash(tab)
    bar.tab[self] = 0
  end

end
