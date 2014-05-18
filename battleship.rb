class Battleship
  attr_accessor :debug
  
  def initialize
    @debug = false
    @board = setup_board
    @ship_row = ship_row
    @ship_col = ship_col
  end
  
  def setup_board
    (1..5).map do |x|
      ["O"] * 5
    end
  end
  
  def ship_row
    Random.rand(0..@board.length - 1)
  end
  
  def ship_col
    Random.rand(0..@board[0].length - 1)
  end
  
  def print_board
    board = @board.map do |row|
      puts row.join
    end
  end
  
  def game
    puts "Let's play Battleship!"
    print_board
    if @debug
      puts "My ship is at row: #{@ship_row + 1} col: #{@ship_col + 1}"
    end
    (1..5).each do |turn|
      puts "===== Turn #{turn.to_s} ====="
      puts "Guess Row:" 
      guess_row = gets.chomp.to_i - 1
      puts "Guess Col:"
      guess_col = gets.chomp.to_i - 1
      if guess_row == @ship_row && guess_col == @ship_col
        puts "Congratulations! You sunk my battleship!"
        @board[guess_row][guess_col] = "!"
        print_board
        another_game
      elsif (guess_row < 0 || guess_row > 4) || (guess_col < 0 || guess_col > 4)
        puts "Oops, that's not even in the ocean."
        print_board
      elsif (@board[guess_row][guess_col] == "X")
        puts "You guessed that one already."
        print_board
      else
        puts "You missed my battleship!"
        @board[guess_row][guess_col] = "X"
        print_board
      end
    end
    puts "Game Over"
    puts "It was at row: #{@ship_row + 1} col: #{@ship_col + 1}"
    another_game   
  end
  
  def another_game
    puts "Play again? (y/n)"
    again = gets.chomp.to_s.downcase
    if again == "y"
      replay
    elsif again == "n"
      puts "Thanks for playing, see you next time captain!"
      exit
    else
      puts "Please make a correct selection of (y/n)"
      another_game
    end
  end
  
  def replay
    @board = setup_board
    @ship_row = ship_row
    @ship_col = ship_col
    game
  end
  
end

battleship = Battleship.new
battleship.debug = false
battleship.game