class Bar
  attr_reader :tab, :till

  def initialize()
    @tab = {}
    @till = 0
  end

  def new_tab(guest)
    @tab[guest] = 0
  end

  def increase_tab(guest, amount)
    return "You can't afford this" if guest.wallet() - ((@tab[guest]) + amount) < 0
    @tab[guest] = (@tab[guest]) + amount
  end

  def receive_cash(amount)
    @till += amount
  end
end
