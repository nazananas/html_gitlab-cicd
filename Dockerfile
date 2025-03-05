# Используем официальный образ Nginx
FROM nginx:latest

# Создаем директории для статики и медиа
RUN mkdir -p /app/media /app/static

# Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Копируем файлы из локальной директории в контейнер
COPY media /app/media
COPY static /app/static
COPY index.html /usr/share/nginx/html/index.html

# Даем права на доступ к media и static
RUN chmod -R 755 /app/media /app/static

# Открываем порт 80
EXPOSE 80

# Запуск Nginx
CMD ["nginx", "-g", "daemon off;"]

