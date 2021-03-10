$stdout.sync = true

# This is a very simple and inneficient implemntation of conways game of life. It is serial and it uses double the
# memory than it needs to
class SerialBoard
  def initialize(size = 50)
    # Initialize an empty game board
    @size = size
    @board = Array.new(size) { Array.new(size, false) }
  end

  def revive_coordinate(x, y)
    @board[x][y] = true
  end

  # Step will compute the new board after one round of the Conway's game of life. The rules are:
  # 1. Any live cell with two or three live neighbours survives.
  # 2. Any dead cell with three live neighbours becomes a live cell.
  # 3. All other live cells die in the next generation. Similarly, all other dead cells stay dead.
  def step
    new_board = Array.new(@size) { Array.new(@size, false) }

    (0...@size).each do |x|
      (0...@size).each do |y|
        new_board[x][y] = compute_cell_fate(x, y)
      end
    end

    @board = new_board
  end

  def compute_cell_fate(x, y)
    live_neighbours = 0

    # check the 8 neighbours and count how many are alive
    (-1..1).each do |xi|
      (-1..1).each do |yi|
        next if xi.zero? && yi.zero? # don't count self

        live_neighbours += @board[(x - xi) % @size][(y - yi) % @size] ? 1 : 0
      end
    end

    # this boolean logic could be condensed into one if but it be less readable
    return true if @board[x][y] && live_neighbours >= 2 && live_neighbours <= 3
    return true if !@board[x][y] && live_neighbours == 3

    # else (condition 3)
    false
  end

  def print_board
    @board.each { |row| row.each { |cell| cell ? (print 'X') : (print 'O') }; puts '' }
  end
end

board = SerialBoard.new(10)
[[0, 0], [1, 0], [0, 1], [2, 1], [1, 5], [5, 1], [1, 7], [1, 6], [1, 8], [2, 3], [2, 6], [2, 9], [4, 5]].each do |cell|
  board.revive_coordinate(cell[0], cell[1])
end

puts 'Starting Conway\'s game of life'
sleep 1
system 'clear'

puts 'Step: 0'
board.print_board

puts 'press enter to step'
gets

(1..100).each do |step|
  system 'clear'
  puts "Step: #{step}"
  board.step
  board.print_board

  puts 'press enter to step'
  gets
end
