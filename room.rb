class Room
  attr_reader :room_number, :guests, :playlist, :capacity, :till

  def initialize(room_number)
    @room_number = room_number
    @guests = []
    @playlist = []
    @capacity = 4
    @till = 0
  end

  def receive_cash(amount)
    @till += amount
  end

  def add_to_playlist(song)
    @playlist.push(song)
  end

  def check_in(guest)
    return "You can't afford entry" if guest.wallet < 5
    @guests.push(guest)
    return "The room is full" if @capacity - 1 <= 0
    guest.pay(5)
    self.receive_cash(5)
    @capacity -= 1
  end

  def check_out(guest)
    guest_to_remove = @guests.index(guest)
    @guests.delete_at(guest_to_remove)
    @capacity += 1
  end

  def favourite_song_on_playlist(guest)
    return @playlist.include?(guest.favourite_song)
  end

  def play
    return "Now Playing: #{@playlist.at(0).name()} by #{@playlist.at(0).artist()}"
  end

end
