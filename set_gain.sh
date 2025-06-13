#!/bin/bash

# Проверка на два аргумента
if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <mic_gain> <playback_gain>"
    echo "Пример: $0 -5.0 2.5"
    exit 1
fi

MIC_GAIN="$1"
PLAYBACK_GAIN="$2"
FILE="/home/pi/rescue/sip_client/lib/sip/Siphone.py"

# Проверка, что файл существует
if [ ! -f "$FILE" ]; then
    echo "Файл $FILE не найден!"
    exit 1
fi

# Замена значений с помощью sed
sed -i "s/self.__core.mic_gain_db = [-0-9.]*/self.__core.mic_gain_db = ${MIC_GAIN}/" "$FILE"
sed -i "s/self.__core.playback_gain_db = [-0-9.]*/self.__core.playback_gain_db = ${PLAYBACK_GAIN}/" "$FILE"

echo "Значения обновлены:"
echo "  mic_gain = $MIC_GAIN"
echo "  playback_gain = $PLAYBACK_GAIN"
