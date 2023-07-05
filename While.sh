bash
#!/bin/bash

# Connect to the FTP server and establish a persistent connection
lftp -u username,password ftp://example.com <<EOF

# Loop until the user enters "quit"
while true; do
  # Read a command from user input
  read -r -p "Enter a command (or 'quit' to exit): " command
  
  # Check if the command is "quit" and exit the loop if true
  if [ "$command" = "quit" ]; then
    break
  fi
  
  # Execute the command in lftp
  echo "Executing command: $command"
  $command
done

# Exit the lftp session
quit

EOF
