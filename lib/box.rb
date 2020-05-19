class Box

  attr_accessor :x, :y, :symbol

  def initialize(letter, number) #on initialise une nouvelle case

    @x = letter
    @y = number
    @symbol = "empty"
  end

  def change_symbol(new_symbol) #permets de changer la forme à l'intérieur de la case
    
    if new_symbol != "cercle" && new_symbol != "empty" && new_symbol != "cross"
      return puts "l'argument qui a été envoyer avec Box.change_symbol n'ai pas bon"
    else
      @symbol = new_symbol
    end
  end

  def push_box #permets de dessiner la case

    case @symbol
    when "empty"
      ["       ","       ","       ","       "]
    when "cercle"
      ["  ___  "," |   | "," |___| ","       "]
    when "cross"
      [" \\  /  ","  \\/   ","  /\\   "," /  \\  "]
    else
    puts 'il y a un problème avec Box.print'
    end
  end

end