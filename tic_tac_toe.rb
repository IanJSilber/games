array = [
  ["#", "#", "#"],
  ["#", "#", "#"],
  ["#", "#", "#"]
]
def toes(array)
  continue = true
  p1_continue = true
  p1_turn = 0
  vertical1p1 = 0
  vertical2p1 = 0
  vertical3p1 = 0
  diagonalp1 = 0
  
  p2_continue = true
  p2_turn = 0
  vertical1p2 = 0
  vertical2p2 = 0
  vertical3p2 = 0
  diagonalp2 = 0
  
  p ["$","1", "2", "3"]
  p ["1", array[0]]
  p ["2", array[1]]
  p ["3", array[2]]
  
  while continue

    while p1_continue
      p1_continue = false

      puts "player 1 enter y coordinates"
      y_coordinates = gets.chomp.to_i
      y_coordinates -= 1

      puts "player 1 enter x coordinates"
      x_coordinates = gets.chomp.to_i
      x_coordinates -= 1

      if array[y_coordinates][x_coordinates] == "O" || array[y_coordinates][x_coordinates] == "X"
        puts "Player spot already in use, try again dumbass"
      else
        if x_coordinates == y_coordinates
          diagonalp1 += 1
        end
        if x_coordinates == 0
          vertical1p1 += 1
        elsif x_coordinates == 1
          vertical2p1 += 1
        elsif x_coordinates == 2
          vertical3p1 += 1
        end

        array[y_coordinates][x_coordinates] = "X"
        p1_turn += 1
        p ["$","1", "2", "3"]
        p ["1", array[0]]
        p ["2", array[1]]
        p ["3", array[2]]
      end
      if p1_turn == 3 && p1_turn == p2_turn + 1
        if array[0].join("") == "XXX" || array[1].join("") == "XXX" || array[2].join("") == "XXX"
          puts "PLAYER 1 WINS!!!"
          continue = false
        elsif vertical1p1 == 3 || vertical2p1 == 3 || vertical3p1 == 3 || diagonalp1 == 3
          puts "PLAYER 1 WINS!!!"
          continue = false
        end
      end
      if p1_turn == p2_turn
        p1_continue = true
      end
      p2_continue = continue
    end

    while p2_continue
      p2_continue = false
      puts "player 2 enter y coordinates"
      y_coordinates = gets.chomp.to_i
      puts "player 2 enter x coordinates"
      x_coordinates = gets.chomp.to_i
      x_coordinates -= 1
      y_coordinates -= 1
      if array[y_coordinates][x_coordinates] == "X" || array[y_coordinates][x_coordinates] == "O"
        puts "Player spot already in use, try again dumbass"
      else
        if x_coordinates == y_coordinates
          diagonalp2 += 1
        end
        if x_coordinates == 0
          vertical1p2 += 1
        elsif x_coordinates == 1
          vertical2p2 += 1
        elsif x_coordinates == 2
          vertical3p2 += 1
        end

        array[y_coordinates][x_coordinates] = "O"
        p2_turn += 1
        p ["$","1", "2", "3"]
        p ["1", array[0]]
        p ["2", array[1]]
        p ["3", array[2]]
      end
      if p2_turn == 3 && p2_turn == p1_turn
        if array[0].join("") == "OOO" || array[1].join("") == "OOO" || array[2].join("") == "OOO"
          puts "PLAYER 2 WINS!!!"
          continue = false
        elsif vertical1p2 == 3 || vertical2p2 == 3 || vertical3p2 == 3 || diagonalp2 == 3
          puts "PLAYER 2 WINS!!!"
          continue = false
        end
      end
      if p2_turn != p1_turn
        p2_continue = true
      end
      p1_continue = continue
    end
  end
end

toes(array)