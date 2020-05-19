class User

  attr_accessor :name, :nb_of_win, :symbol

  def initialize(player_name) #on initialise un nouveau joueur

    @name = player_name
    @nb_of_win = 0
    @symbol = "probleme"
  end

  def win #permets d'incrémenter les victoirs du joueur

    @nb_of_win += 1
  end
end