-- НОРМАЛИЗОВАННАЯ СХЕМА ДО 3NF ДЛЯ SQLITE
-- Трекер привычек (Treker-Privicki)

CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Labels (
    label_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    color TEXT
);

CREATE TABLE Habits (
    habit_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    due_date TEXT,
    priority TEXT DEFAULT 'medium' CHECK(priority IN ('low', 'medium', 'high')),
    status TEXT DEFAULT 'active' CHECK(status IN ('active', 'completed', 'paused')),
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Habit_Categories (
    habit_id INTEGER,
    category_id INTEGER,
    PRIMARY KEY (habit_id, category_id),
    FOREIGN KEY (habit_id) REFERENCES Habits(habit_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

CREATE TABLE Habit_Labels (
    habit_id INTEGER,
    label_id INTEGER,
    PRIMARY KEY (habit_id, label_id),
    FOREIGN KEY (habit_id) REFERENCES Habits(habit_id) ON DELETE CASCADE,
    FOREIGN KEY (label_id) REFERENCES Labels(label_id) ON DELETE CASCADE
);

-- Индексы для оптимизации
CREATE INDEX idx_habits_user_id ON Habits(user_id);
CREATE INDEX idx_habits_due_date ON Habits(due_date);
CREATE INDEX idx_habits_status ON Habits(status);
CREATE INDEX idx_habit_categories_habit_id ON Habit_Categories(habit_id);
CREATE INDEX idx_habit_labels_habit_id ON Habit_Labels(habit_id);
