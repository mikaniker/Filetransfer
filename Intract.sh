bash
#!/bin/bash

# Connect to the FTP server and establish a persistent connection
lftp -u username,password ftp://example.com <<EOF

# Read commands from a file
while IFS= read -r command; do
  # Execute each command
  echo "Executing command: $command"
  $command
done < commands.txt

# Exit the lftp session
quit

EOF






bash
#!/bin/bash

# Connect to the FTP server and establish a persistent connection
lftp -u username,password ftp://example.com <<EOF

# Read commands from user input
while IFS= read -r -p "Enter a command (or 'quit' to exit): " command; do
  # Execute each command
  if [ "$command" = "quit" ]; then
    break
  fi
  echo "Executing command: $command"
  $command
done

# Exit the lftp session
quit

EOF
