# Guessing Game

# Generate a random number between 1 and 100
secret_number <- sample(1:100, 1)

# Initialize the number of attempts
attempts <- 0

# Welcome message
cat("Welcome to the Guessing Game!\n")
cat("I've chosen a number between 1 and 100.\n")
cat("Can you guess the number?\n\n")

# Game loop
while (TRUE) {
  # Read the user's guess
  guess <- as.integer(readline("Enter your guess (1-100): "))
  
  # Increment the number of attempts
  attempts <- attempts + 1
  
  # Check the guess
  if (guess == secret_number) {
    # The guess is correct
    cat("\nCongratulations! You guessed the correct number.\n")
    cat("Number of attempts: ", attempts, "\n")
    break
  } else if (guess < secret_number) {
    # The guess is too low
    cat("Too low! Try again.\n\n")
  } else {
    # The guess is too high
    cat("Too high! Try again.\n\n")
  }
}
