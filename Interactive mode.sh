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
