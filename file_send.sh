bash
#!/bin/bash

# Открываем соединение с FTP сервером
lftp -u username,password ftp.example.com -c "

while true; do
    # Проверяем статус соединения
    if ! lftp -u username,password ftp.example.com -c 'ls'; then
        # Если соединение закрыто, перезапускаем скрипт
        exec "$0"
    fi
    
    # Считываем имя файла
    read -r filename
    
    # Проверяем, что имя файла не пустое
    if [[ -n $filename ]]; then
        # Отправляем файл на FTP сервер
        put $filename
    fi
done
"
