

class Game

  attr_accessor :nb_party

  def initialize(number) #on initialise une nouvelle partie complette

    @nb_party = number.to_i
  end

  def end_game?(win_for_player_1, win_for_player_2) #permets de savoir si la partie est fini ou non

    win_for_player_1 != @nb_party && win_for_player_2 != @nb_party
  end
end