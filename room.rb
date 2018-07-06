class Room


attr_reader :name, :guests, :songs, :entry_fee

  def initialize(name, entry_fee)

@name = name
@guests = []
@songs = []
@entry_fee = entry_fee

end


def check_in_guest(guest)
  @guests << guest.name
end

def check_out_guest(guest)
  @guests -= guest.name
end

def add_song(song)
  @songs << song.title
end

def favourite_song()
  if @room1.include?(guest.favourite_song)
  guest.favourite_song
  end
end

end
