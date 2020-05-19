class Round

  attr_accessor :symbol

  def initialize(player_symbol)

    @symbol = player_symbol
  end

  def box_choice(choice) #permets de selectionner la bonne casse en fonction du choix du joueur

    choice = choice.split(//)

    if choice[0] == "A"
      choice[0] = "0"
    elsif choice[0] == "B"
      choice[0] = "1"
    elsif choice[0] == "C"
      choice[0] = "2"
    else
      puts "Il y a un problème avec Round.box_choice"
    end

    return choice[0].to_i*3 + choice[1].to_i - 1
  end


end