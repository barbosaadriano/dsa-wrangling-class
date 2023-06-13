# Version 1

# 2st version

# Introduction to Version Control with Git
# Using the console to explain Git commands

# Display introductory message
cat("Welcome to Version Control with Git in R!\n")
cat("Version control is important for managing code changes and collaborating with others.\n\n")

# Create a new Git repository
cat("Let's start by creating a new Git repository.\n")
system("git init")
cat("A new Git repository has been created.\n\n")

# Create a new file and add it to the repository
cat("Now let's create a new R script file and add it to the Git repository.\n")
script_file <- "my_script.R"
cat("Creating a new file: ", script_file, "\n")
file.create(script_file)
system(paste("git add", script_file))
cat("The file has been added to the repository.\n\n")

# Make changes to the file
cat("Let's make some changes to the script file.\n")
writeLines(c("# My R script", "print('Hello, Git!')"), script_file)
cat("Changes have been made to the file.\n\n")

# Check the status of the repository
cat("To see the current status of the repository, use the 'git status' command.\n")
system("git status")

# Commit the changes
cat("Next, let's commit the changes to the repository.\n")
commit_message <- "Added initial script"
system(paste("git commit -m", commit_message))
cat("Changes have been committed.\n\n")

# Display the commit history
cat("To see the commit history, use the 'git log' command.\n")
system("git log --oneline")

# Create a new branch
cat("Let's create a new branch to work on a new feature.\n")
new_branch <- "feature-branch"
system(paste("git branch", new_branch))
cat("A new branch '", new_branch, "' has been created.\n\n")

# Switch to the new branch
cat("Now let's switch to the new branch.\n")
system(paste("git checkout", new_branch))
cat("Switched to branch '", new_branch, "'.\n\n")

# Make changes in the new branch
cat("Make some changes in the new branch.\n")
writeLines(c("# My R script", "print('Hello, Git! This is a new feature.')"), script_file)
cat("Changes have been made in the new branch.\n\n")

# Merge the new branch into the main branch
cat("To merge the new branch into the main branch, use the 'git merge' command.\n")
system("git checkout main")
system(paste("git merge", new_branch))
cat("The new branch '", new_branch, "' has been merged into the main branch.\n\n")

# Display the commit history again
cat("Let's see the updated commit history.\n")
system("git log --oneline")

# Conclusion
cat("This concludes the basic demonstration of version control with Git in R.\n")

