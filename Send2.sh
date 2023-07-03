bash
#!/bin/bash

fifo_file="/path/to/fifo_file"

# Создание FIFO файла, если он не существует
if [[ ! -p $fifo_file ]]; then
    mkfifo $fifo_file
fi

# Процесс 1 - чтение строк из FIFO файла
process_1() {
    while read -r line; do
        if ! grep -Fxq "$line" "$fifo_file"; then
            # Обработка строки процессом 1
            echo "Процесс 1: $line"
            
            # Удаление обработанной строки из FIFO файла
            sed -i "/$line/d" "$fifo_file"
        fi
    done < "$fifo_file"
}

# Процесс 2 - чтение строк из FIFO файла
process_2() {
    while read -r line; do
        if ! grep -Fxq "$line" "$fifo_file"; then
            # Обработка строки процессом 2
            echo "Процесс 2: $line"
            
            # Удаление обработанной строки из FIFO файла
            sed -i "/$line/d" "$fifo_file"
        fi
    done < "$fifo_file"
}

# Запуск двух процессов
process_1 &
process_2 &

# Ожидание завершения процессов
wait

# Удаление FIFO файла
rm "$fifo_file"

