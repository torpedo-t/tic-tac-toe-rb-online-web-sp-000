require "pry"
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
def won?(board)
    WIN_COMBINATIONS.detect do |index|
      board[index[0]] == board[index[1]] &&
      board[index[1]] == board[index[2]] &&
      position_taken?(board, index[0])
  end
end

def full?(board)
#binding.pry
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
 winning_combo = won?(board)
 return board[winning_combo[0]]
end
end
