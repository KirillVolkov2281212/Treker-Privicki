INSERT INTO Users (username, email) VALUES 
('kirill', 'kirill@example.com'),
('maria', 'maria@example.com');

INSERT INTO Categories (name, description) VALUES 
('Здоровье', 'Привычки, связанные со здоровьем и спортом'),
('Продуктивность', 'Рабочие и учебные привычки'),
('Личное развитие', 'Чтение, обучение, навыки');

INSERT INTO Labels (name, color) VALUES 
('Важно', '#FF0000'),
('Ежедневно', '#00FF00'),
('Утро', '#0000FF');

INSERT INTO Habits (title, description, due_date, priority, status, user_id) VALUES 
('Пить воду', 'Выпивать 2 литра воды в день', '2026-12-31', 'high', 'active', 1),
('Читать 30 минут', 'Читать книгу перед сном', '2026-12-31', 'medium', 'active', 1),
('Зарядка', 'Утренняя зарядка 15 минут', NULL, 'high', 'active', 1),
('Медитация', '10 минут медитации', NULL, 'medium', 'paused', 2);

INSERT INTO Habit_Categories (habit_id, category_id) VALUES 
(1, 1),
(2, 3),
(3, 1),
(4, 3);

INSERT INTO Habit_Labels (habit_id, label_id) VALUES 
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(3, 3);
