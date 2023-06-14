# Hash Game

# Function to display the game board
print_board <- function(board) {
  cat("\n")
  for (i in 1:3) {
    cat(" ")
    for (j in 1:3) {
      cat(board[i, j], " ")
    }
    cat("\n")
  }
  cat("\n")
}

# Function to check if a player has won
check_win <- function(board, player) {
  # Check rows
  for (i in 1:3) {
    if (all(board[i, ] == player)) {
      return(TRUE)
    }
  }
  
  # Check columns
  for (j in 1:3) {
    if (all(board[, j] == player)) {
      return(TRUE)
    }
  }
  
  # Check diagonals
  if (all(diag(board) == player) || all(diag(board[, 3:1]) == player)) {
    return(TRUE)
  }
  
  # No win
  return(FALSE)
}

# Function to get the next move from the player
get_player_move <- function(board) {
  repeat {
    move <- readline("Enter your move (1-9): ")
    move <- as.integer(move)
    
    if (is.na(move) || move < 1 || move > 9) {
      cat("Invalid input. Please enter a number between 1 and 9.\n")
      next
    }
    
    row <- ceiling(move / 3)
    col <- (move - 1) %% 3 + 1
    
    if (board[row, col] != " ") {
      cat("Invalid move. That cell is already occupied.\n")
      next
    }
    
    break
  }
  
  return(c(row, col))
}

# Function to get the next move from the computer
get_computer_move <- function(board) {
  # Check if computer can win
  for (i in 1:3) {
    for (j in 1:3) {
      if (board[i, j] == " ") {
        board[i, j] <- "O"
        if (check_win(board, "O")) {
          board[i, j] <- " "
          return(c(i, j))
        }
        board[i, j] <- " "
      }
    }
  }
  
  # Check if player can win and block them
  for (i in 1:3) {
    for (j in 1:3) {
      if (board[i, j] == " ") {
        board[i, j] <- "X"
        if (check_win(board, "X")) {
          board[i, j] <- "O"
          return(c(i, j))
        }
        board[i, j] <- " "
      }
    }
  }
  
  # Make a random move
  while (TRUE) {
    row <- sample(1:3, 1)
    col <- sample(1:3, 1)
    
    if (board[row, col] == " ") {
      return(c(row, col))
    }
  }
}

# Function to check if the game is a draw
check_draw <- function(board) {
  return(all(board != " "))
}

# Main game loop
play_game <- function() {
  # Create an empty game board
  board <- matrix(" ", nrow = 3, ncol = 3)
  
  # Print start instructions and example board
  cat("Welcome to the Hash Game!\n")
  cat("To make a move, enter a number between 1 and 9 corresponding to the position on the board:\n")
  example_board <- matrix(1:9, nrow = 3, ncol = 3)
  print_board(example_board)
  
  # Game loop
  while (TRUE) {
    # Player's turn
    print_board(board)
    move <- get_player_move(board)
    board[move[1], move[2]] <- "X"
    
    # Check if player wins
    if (check_win(board, "X")) {
      print_board(board)
      cat("Congratulations! You win!\n")
      break
    }
    
    # Check if it's a draw
    if (check_draw(board)) {
      print_board(board)
      cat("It's a draw!\n")
      break
    }
    
    # Computer's turn
    cat("Computer's turn...\n")
    move <- get_computer_move(board)
    board[move[1], move[2]] <- "O"
    
    # Check if computer wins
    if (check_win(board, "O")) {
      print_board(board)
      cat("Computer wins! Better luck next time.\n")
      break
    }
    
    # Check if it's a draw
    if (check_draw(board)) {
      print_board(board)
      cat("It's a draw!\n")
      break
    }
  }
}

# Start the game
play_game()
