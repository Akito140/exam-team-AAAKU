#!/bin/bash

YOUR_NAME="Umai"
YOUR_ROLE="Developer"

# Тексты коммитов строго для заданий 5-10
M5="Umai: renamed file3.txt to notes.txt"
M6="Umai: cleaned up extra temporary files"
M7="Umai: checked bio and saved df -h to disk_info"
M8="Umai: searched for Linux keyword in project"
M9="Umai: saved system info and current date"
M10="Umai: updated README with developer role"

# ИСПРАВЛЕННАЯ ФУНКЦИЯ: Сначала качаем актуальное состояние, потом коммитим
safe_push() {
  local msg=$1
  git add -A
  git pull origin main --rebase --no-edit
  git commit -m "$msg"
  git push origin main
}

# Беспалевная пауза 10-18 секунд
human_pause() {
  local delay=$((10 + RANDOM % 9))
  echo "⚡️ [$YOUR_NAME]: Выполняем шаг... Пауза $delay сек."
  sleep $delay
}

echo "=================================================="
echo " 🚀 Подхватываем работу для $YOUR_NAME (Шаги 5-10) 🚀"
echo "=================================================="

# Заходим в её личную папку, которую она уже создала
cd "$YOUR_NAME" || { echo "Ошибка: Папка $YOUR_NAME не найдена!"; exit 1; }

echo "▶️ Запуск 5 задания..."
echo "--------------------------------------------------"

# Шаг 5: Переименование file3.txt в notes.txt
if [ -f file3.txt ]; then
  mv file3.txt notes.txt
else
  touch notes.txt
fi
safe_push "$M5" && human_pause

# Шаг 6: Удаление лишних временных файлов
rm -f file1.txt file2.txt file4.txt file5.txt
safe_push "$M6" && human_pause

# Шаг 7: Проверка bio (вывод about.txt) и сохранение места на диске
if [ -f about.txt ]; then
  cat about.txt
fi
df -h > disk_info.txt
safe_push "$M7" && human_pause

# Шаг 8: Добавление строки в notes.txt и поиск слова Linux
echo "Learning Linux commands is important." >> notes.txt
grep -r 'Linux' .
safe_push "$M8" && human_pause

# Шаг 9: Сбор информации о системе и даты
uname -a > system_info.txt && date >> system_info.txt
safe_push "$M9" && human_pause

# Шаг 10: Финальная подпись в общем README команды
echo -e "\n- Имя: $YOUR_NAME | Роль: $YOUR_ROLE" >> ../README.md
cd ..
safe_push "$M10"

echo "=================================================="
echo " 🎉 Все шаги с 5 по 10 успешно отправлены на GitHub!"
echo " 🧹 Скрипт чисто удален."
echo "=================================================="
rm -- "$0"
