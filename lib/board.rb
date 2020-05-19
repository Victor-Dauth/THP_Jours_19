class Board

  attr_accessor :box_array, :round_nb, :winner

  def initialize (array) #on initialise une nouvelle aire de jeux

    @box_array = array
    @round_nb = 0
    @winner = "personne"
  end

  def draw_board #permet de desciner l'aire de jeux à l'écran
    
    board = letter

    3.times do |n|
      board += "       " + " -------"*3 + "\n"
      4.times do |l|
        ligne = number[l + n*4]
        3.times do |a|
          ligne += "|" + @box_array[n + 3*a].push_box[l]
        end
        board += ligne + "|" + "\n"
      end
    end
    board += "       " + " -------"*3 + "\n"

    return board
  end

  def end_party? #permets de savoir si la manche en cours est fini ou pas 

    @round_nb != 9 && @winner == "personne"
  end

  def condition_win_party(player_name, player_symbol)

    condition = false

    3.times {|n| condition = true if (box_array[0+3*n].symbol == player_symbol && box_array[1+3*n].symbol == player_symbol && box_array[2+3*n].symbol == player_symbol) || (box_array[n].symbol == player_symbol && box_array[3+n].symbol == player_symbol && box_array[6+n].symbol == player_symbol)}
    condition = true if (box_array[0].symbol == player_symbol && box_array[4].symbol == player_symbol && box_array[8].symbol == player_symbol) || (box_array[2].symbol == player_symbol && box_array[4].symbol == player_symbol && box_array[6].symbol == player_symbol)

    @winner = player_name if condition
  end

  private

  def letter #desine les lettre du haut
    "                          ___  \n          /\\      |\\     |     \n         /__\\     |/     |     \n        /    \\    |\\     |     \n       /      \\   |/     |___  \n"
  end

  def number #desine les chiffre sur le coté
    ["  /|   "," / |   ","   |   ","   |   "," __    ","   /   ","  /    "," /__   ","____   ", "____|  ", "____|  ","       "]
  end
end