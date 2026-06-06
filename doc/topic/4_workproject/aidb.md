### Описание базы данных PostgreSQL

#### Общая архитектура

База данных реализована на PostgreSQL с использованием ORM SQLAlchemy. Система включает четыре основные таблицы, связанные между собой.

#### Описание таблиц

**1. Таблица users**

Хранит информацию о пользователях системы.

**Поля:**
* `id` (INTEGER PRIMARY KEY) — уникальный идентификатор пользователя
* `username` (VARCHAR(80) UNIQUE NOT NULL) — имя пользователя
* `email` (VARCHAR(120) UNIQUE) — электронная почта (может быть NULL)
* `password_hash` (VARCHAR(200) NOT NULL) — хешированный пароль
* `created_at` (TIMESTAMP DEFAULT CURRENT_TIMESTAMP) — дата создания аккаунта

**Ограничения:**
* уникальность `username` и `email`
* обязательное заполнение `username` и `password_hash`

---

**2. Таблица products**

Содержит базу продуктов с пищевой ценностью.

**Поля:**
* `id` (INTEGER PRIMARY KEY) — уникальный идентификатор продукта
* `name` (VARCHAR(100) NOT NULL) — название продукта
* `calories_per_100g` (FLOAT NOT NULL) — калорийность на 100г
* `protein` (FLOAT DEFAULT 0) — белки на 100г
* `carbs` (FLOAT DEFAULT 0) — углеводы на 100г
* `fat` (FLOAT DEFAULT 0) — жиры на 100г
* `category` (VARCHAR(50) DEFAULT 'Прочее') — категория продукта
* `created_at` (TIMESTAMP DEFAULT CURRENT_TIMESTAMP) — дата добавления

---

**3. Таблица food_entries**

Хранит записи о потреблении продуктов пользователями.

**Поля:**
* `id` (INTEGER PRIMARY KEY) — уникальный идентификатор записи
* `user_id` (INTEGER FOREIGN KEY REFERENCES users(id) ON DELETE CASCADE) — ID пользователя
* `product_id` (INTEGER FOREIGN KEY REFERENCES products(id)) — ID продукта
* `weight` (FLOAT NOT NULL) — вес потреблённого продукта в граммах
* `date` (DATE NOT NULL) — дата потребления
* `meal_type` (VARCHAR(20) NOT NULL) — тип приёма пищи
* `created_at` (TIMESTAMP DEFAULT CURRENT_TIMESTAMP) — время создания записи

**Связи:**
* связь с таблицей users через `user_id` с каскадным удалением
* связь с таблицей products через `product_id`

---

**4. Таблица user_profile**

Содержит персональные данные пользователей.

**Поля:**
* `id` (INTEGER PRIMARY KEY) — уникальный идентификатор профиля
* `user_id` (INTEGER UNIQUE NOT NULL REFERENCES users(id)) — ID пользователя
* `name` (VARCHAR(100) NOT NULL) — имя пользователя
* `age` (INTEGER) — возраст
* `gender` (VARCHAR(10)) — пол
* `weight` (FLOAT) — текущий вес
* `height` (FLOAT) — рост
* `activity_level` (VARCHAR(20)) — уровень активности
* `goal` (VARCHAR(20)) — цель (похудение/набор/поддержание)
* `target_calories` (INTEGER) — целевое количество калорий
* `created_at` (TIMESTAMP DEFAULT CURRENT_TIMESTAMP) — дата создания профиля

---

**5. Таблица user_levels**

Хранит информацию об уровнях пользователей.

**Поля:**
* `id` (INTEGER PRIMARY KEY) — уникальный идентификатор записи
* `user_id` (INTEGER UNIQUE NOT NULL REFERENCES users(id)) — ID пользователя
* `level` (INTEGER DEFAULT 1) — текущий уровень
* `experience` (INTEGER DEFAULT 0) — накопленный опыт
* `total_food_entries` (INTEGER DEFAULT 0) — количество записей о еде
* `total_products_added` (INTEGER DEFAULT 0) — количество добавленных продуктов
* `days_active` (INTEGER DEFAULT 0) — количество активных дней
* `last_activity_date` (DATE) — дата последней активности
* `achievements` (TEXT) — достижения в JSON формате
* `created_at` (TIMESTAMP DEFAULT CURRENT_TIMESTAMP) — дата создания
* `updated_at` (TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP) — дата последнего обновления

#### Связи между таблицами

1. **users → food_entries** (один‑ко‑многим): один пользователь может иметь множество записей о потребленной пище.
3. **users → user_profile** (один‑к‑одному): у каждого пользователя есть ровно один профиль.
1. **users → food_entries** (один‑ко‑многим): один пользователь может иметь множество записей о потреблённой пище.
2. **products → food_entries** (один‑ко‑многим): один продукт может упоминаться во множестве записей разных пользователей.

#### Нормализация и целостность данных

База данных приведена к третьей нормальной форме (3NF):
* устранены повторяющиеся группы;
* все неключевые поля зависят только от первичного ключа;
* отсутствуют транзитивные зависимости.

**Меры обеспечения целостности:**
* внешние ключи с каскадными операциями (ON DELETE CASCADE);
* уникальные ограничения на логины и email;
* NOT NULL для обязательных полей;
* индексы для ускорения запросов по ключевым полям.

#### Заключение

Разработанная структура базы данных PostgreSQL обеспечивает:
* надёжное хранение пользовательских данных и информации о питании;
* быстрый доступ к записям за счёт индексирования;
* целостность связей между сущностями;
* масштабируемость для добавления новых функций (например, рецептов, тренировок);
* точность расчётов КБЖУ благодаря использованию типа DECIMAL.

Такая архитектура соответствует требованиям проекта и готова к интеграции с бэкендом на Flask.
