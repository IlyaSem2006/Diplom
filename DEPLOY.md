# 🚀 Деплой КалькКал на Render

## Быстрый деплой (рекомендуется)

### 1. Подготовка репозитория
```bash
git init
git add .
git commit -m "Initial commit - КалькКал app ready for deployment"
git remote add origin <your-github-repo-url>
git push -u origin main
```

### 2. Деплой на Render
1. Зайдите на [render.com](https://render.com) и создайте аккаунт
2. Нажмите "New" → "Blueprint"
3. Подключите ваш GitHub репозиторий
4. Render автоматически:
   - Создаст PostgreSQL базу данных
   - Развернет веб-приложение
   - Настроит переменные окружения
   - Установит все зависимости

### 3. После деплоя
- Приложение будет доступно по адресу: `https://your-app-name.onrender.com`
- База данных автоматически инициализируется с базовыми продуктами
- Все таблицы создаются автоматически

## Ручной деплой (альтернативный способ)

### 1. Создание PostgreSQL базы
1. В Render: "New" → "PostgreSQL"
2. Выберите план Free
3. Скопируйте External Database URL

### 2. Создание веб-сервиса
1. "New" → "Web Service"
2. Подключите GitHub репозиторий
3. Настройки:
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
   - **Environment:** Python 3

### 3. Переменные окружения
В разделе Environment добавьте:
- `DATABASE_URL`: URL вашей PostgreSQL базы
- `SECRET_KEY`: любая случайная строка (или сгенерируйте автоматически)

## Структура проекта для деплоя

```
dsbot/
├── app.py                 # Главное приложение
├── requirements.txt       # Зависимости Python
├── render.yaml           # Конфигурация для автоматического деплоя
├── .env.example          # Пример переменных окружения
├── .gitignore            # Исключения для Git
├── README.md             # Документация
├── DEPLOY.md             # Этот файл с инструкциями
└── templates/            # HTML шаблоны
    ├── base.html
    ├── index.html
    ├── add_food.html
    ├── add_product.html
    ├── products.html
    ├── profile.html
    └── statistics.html
```

## Проверка деплоя

После успешного деплоя проверьте:
1. ✅ Главная страница загружается
2. ✅ База продуктов содержит базовые продукты
3. ✅ Можно добавлять новые продукты
4. ✅ Работает дневник питания
5. ✅ Отображается статистика

## Возможные проблемы и решения

### База данных не подключается
- Проверьте правильность DATABASE_URL в настройках Render
- Убедитесь, что PostgreSQL сервис создан и запущен

### Приложение не запускается
- Проверьте логи в Render Dashboard
- Убедитесь, что все зависимости установились корректно

### Ошибки в шаблонах
- Все шаблоны должны быть в папке `templates/`
- Проверьте кодировку файлов (UTF-8)

## Полезные команды

### Локальное тестирование с Render базой
```bash
# Установите переменную окружения
export DATABASE_URL="your-render-database-url"
# Или для Windows PowerShell:
$env:DATABASE_URL="your-render-database-url"

# Запустите приложение
python app.py
```

### Проверка логов на Render
Логи доступны в Render Dashboard → ваш сервис → Logs

---

**Удачного деплоя! 🎉**

Ваше приложение КалькКал готово к работе в продакшене!