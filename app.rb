require 'bundler'
Bundler.require

require_relative 'lib/box.rb'
require_relative 'lib/board.rb'
require_relative 'lib/user.rb'
require_relative 'lib/game.rb'
require_relative 'lib/view.rb'
require_relative 'lib/round.rb'

def perform
  
  replay = 1
  
  while replay == 1
    view = View.new
    initial_values = view.initialize_game
    
    game = Game.new(initial_values[0])
    player_1 = User.new(initial_values[1])
    player_1.symbol = "cercle"
    player_2 = User.new(initial_values[2])
    player_2.symbol = "cross"

    while game.end_game?(player_1.nb_of_win, player_2.nb_of_win)

      view.initialize_board(player_1.nb_of_win, player_2.nb_of_win, player_1.name, player_2.name, game.nb_party)

      box_array = []
      ["A","B","C"].each {|l| 3.times {|n| box_array << Box.new(l,n)}}
      board = Board.new(box_array)

      while board.end_party?

        view.initialize_round(board.draw_board)

        condition = true

        while condition

          choice = ""
          if board.round_nb % 2 == 0
            choice = view.list_choice(player_1.name)
            round = Round.new(player_1.symbol) 
          elsif board.round_nb % 2 == 1
            choice = view.list_choice(player_2.name)
            round = Round.new(player_2.symbol) 
          else
            puts 'il y a un problème'
          end

          numero_box = round.box_choice(choice)
          if board.box_array[numero_box].symbol == "empty"
            board.box_array[numero_box].change_symbol(round.symbol)
            condition = false
          else
            puts "Tu ne peux pas changer le signe d'un case."
            puts "Tu dois choisir une case vide"
          end
        end

        board.condition_win_party(player_1.name, player_1.symbol)
        board.condition_win_party(player_2.name, player_2.symbol)
        view.end_round
        board.round_nb += 1
      end

      winner_party = board.winner
      player_1.nb_of_win += 1 if player_1.name == board.winner
      player_2.nb_of_win += 1 if player_2.name == board.winner
      view.end_board(winner_party)
    end
    
    if player_1.nb_of_win == game.nb_party
      winner_game = player_1.name 
    elsif player_2.nb_of_win == game.nb_party
      winner_game = player_2.name 
    else
      winner_game = "PROBLEME /!\\"
    end
    
    replay = 0
    replay = view.end_game(winner_game)
  end
end

perform