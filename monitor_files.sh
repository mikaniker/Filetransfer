bash
#!/bin/bash

# Директория, которую мониторим на наличие новых файлов
input_dir="input"

# Создаем временный именованный пайп
pipe_file="/tmp/ftp_pipe"
mkfifo $pipe_file

# Мониторим директорию с помощью inotifywait
inotifywait -m -e create "$input_dir" |
while read -r directory event file
do
    # Передача имен файлов во второй скрипт через пайп
    echo "$file" > $pipe_file
done

# Удаляем временный пайп
rm $pipe_file

# Конец скрипта
