maze = [
  ["#", "#", "#", " ", "#", "#", "#", "#", "#", "#", "#"],
  ["#", "#", "#", " ", "#", "#", "#", "#", "#", "#", "#"],
  ["#", " ", "#", " ", "#", "#", "#", "#", "#", "#", "#"],
  ["#", " ", " ", " ", " ", " ", "#", "#", "#", "#", "#"],
  ["#", "#", " ", "#", "#", " ", " ", " ", " ", "#", "#"],
  ["#", "#", " ", "#", "#", " ", "#", "#", "#", "#", "#"],
  ["#", "#", " ", "#", "#", " ", "#", "#", "#", "#", "#"],
  ["#", " ", " ", "#", "#", " ", " ", " ", " ", "#", "#"],
  ["#", " ", "#", "#", "#", " ", "#", "#", " ", "#", "#"],
  ["#", " ", " ", "#", " ", " ", "#", "#", " ", "#", "#"],
  ["#", "#", "#", "#", " ", "#", "#", "#", " ", "#", "#"],
  ["#", "#", "#", "#", " ", "#", "#", "#", " ", "#", "#"],
  ["#", "#", "#", "#", " ", "#", "#", "#", " ", "#", "#"],
  ["#", "#", "#", "#", " ", "#", "#", " ", " ", "#", "#"],
  ["#", "#", "#", "#", "#", "#", "#", " ", "#", "#", "#"]
]
def maze_solver(maze)
  continue = true
  current_y = 0
  current_x = 0
  maze[0].each_with_index { |el, i| 
    if el == " "
      maze[0][i] = "S" #D for move down from here
      current_x = i
    end
  }
  puts "unsolved maze ---"
  pp maze
  puts "================="
  while continue
    if maze[current_y + 1][current_x] == " "
      current_y += 1
      maze[current_y][current_x] = "X"
    elsif maze[current_y - 1][current_x] == " "
      current_y -= 1
      maze[current_y][current_x] = "X"
    elsif maze[current_y][current_x + 1] == " "
      current_x += 1
      maze[current_y][current_x] = "X"
    elsif maze[current_y][current_x - 1] == " "
      current_x -= 1
      maze[current_y][current_x] = "X"
    elsif maze[current_y + 1][current_x] == "X"
      maze[current_y][current_x] = "#"
      current_y += 1
    elsif maze[current_y - 1][current_x] == "X"
      maze[current_y][current_x] = "#"
      current_y -= 1
    elsif maze[current_y][current_x + 1] == "X"
      maze[current_y][current_x] = "#"
      current_x += 1
    elsif maze[current_y][current_x - 1] == "X"
      maze[current_y][current_x] = "#"
      current_x -= 1
    end
    if current_y >= maze.length - 1
      continue = false
    end
  end
  puts "solved maze -----"
  pp maze
  puts "================="
end

maze_solver(maze)