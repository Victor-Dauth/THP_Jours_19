class View

  attr_accessor

  def initialize_game #permts d'initier la partie

    initialization_values = ["0"]
  
    puts " ------------------------------------------------------------- "
    puts "| Bien venue. Vous venez de démarer le jeux 'Death's-Morpion' |"
    puts " ------------------------------------------------------------- "
    puts ""
    puts "Avant de commencer j'ai quelque question a vous posez :"
    
    while initialization_values[0].count("123456789") == 0
      puts "En combien de manche gagnante voulez vous jouer cette partie ?"
      print "> "
      initialization_values[0] = gets.chomp
      puts "Désoler mais j'ai besoin d'un chiffre supérieur ou égale à 1 pour fonctionner" if initialization_values[0].count("123456789") == 0
      puts ""
    end
  
    puts "Quel est le nom du joueur 1 ?"
    print "> "
    initialization_values << gets.chomp
  
    puts "Quel est le nom du joueur 2 ?"
    print "> "
    initialization_values << gets.chomp

    puts "Merci pour ses inforations"
    puts "Bien. Que la partie commence et que le meilleur gagne !!!"
    print "> "
    gets.chomp
    puts ""
  
    return initialization_values
  end

  def initialize_board(win_player_1, win_player_2, player_1, player_2, nb_total_party) #permts d'initier une manche

    puts "§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§"
    puts ""
    
    puts "Commençons la partie n°#{win_player_1 + win_player_2 + 1}"
    puts "Pour rappel, #{player_1} à #{win_player_1} victoires et #{player_2} à #{win_player_2} victoires"
    puts "Le premier à #{nb_total_party} à gagnier la partie !!!"
    puts "Fait attention #{player_1}" if win_player_2 > win_player_1
    puts "Fait attention #{player_2}" if win_player_1 > win_player_2
    print "> "
    gets.chomp
    puts ""
    puts ""
  end

  def initialize_round(board) #permts d'initier un tour

    puts "Voilà l'état du jeux"
    puts board
    puts ""
  end

  def list_choice(player_name) #permts d'afficher les choix de jeux

    puts "c'est à #{player_name} de jouer"
    choice = "problème"
    
    while choice[0].count("ABC") != 1 || choice[1].count("123") != 1 || choice.length != 2

      puts "Ou voulais vous jouer ? (exemple : A3)"
      print "> "
      choice = gets.chomp
      puts ""
      puts "je ne comprend pas ta réponse recommance" if choice.count("ABC") != 1 || choice.count("123") != 1 || choice.length != 2
    end

    return choice
  end

  def end_round #permts de mettre fin a un tour de jeu

    puts "C'est entendu"
    puts ""
    puts "-----------------------------------------------------------"
    puts ""
  end

  def end_board(player_winner) ##permts de mettre fin a la manche en cours

    if player_winner == "nul"
      puts "Matche nul ..."
      puts "On recommence cette manche"
    else
      puts "Le vainqueur de cette manche est #{player_winner}"
      puts "Felicitation a toi !!!!"
    end

    puts ""
  end

  def end_game(player_winner) #permts de mettre fin au jeu

    puts "§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§"
    puts ""
    puts "Est le Grand Vainqueur de cette partie est :"
    puts ""
    puts " ------------------------ "
    puts "|" + "#{player_winner}".center(24) + "|"
    puts " ------------------------ "
    print "> "
    gets.chomp
    puts ""

    puts "Voulez-vous refaire une partie ?"
    puts "Si oui tapé 1"
    print "> "
    replay = gets.chomp.to_i
    puts ""
    puts ""
    return replay
  end
end