// Хранилище привычек
let habits = JSON.parse(localStorage.getItem('habits')) || [];
 
// Инициализация при загрузке
document.addEventListener('DOMContentLoaded', () => {
    renderHabits();
    updateStats();
});
 
// Добавление новой привычки
function addHabit() {
    const input = document.getElementById('habitInput');
    const text = input.value.trim();
 
    // Валидация
    if (text === '') {
        alert('Введите название привычки!');
        input.focus();
        return;
    }
 
    if (text.length < 2) {
        alert('Название слишком короткое (минимум 2 символа)');
        return;
    }
 
    if (habits.some(h => h.text.toLowerCase() === text.toLowerCase())) {
        alert('Такая привычка уже есть!');
        return;
    }
 
    const newHabit = {
        id: Date.now(),
        text: text,
        done: false,
        createdAt: new Date().toISOString()
    };
 
    habits.push(newHabit);
    saveHabits();
    renderHabits();
    updateStats();
 
    input.value = '';
    input.focus();
}
 
// Сохранение в localStorage
function saveHabits() {
    localStorage.setItem('habits', JSON.stringify(habits));
}
 
// Отрисовка списка
function renderHabits() {
    const list = document.getElementById('habitList');
    list.innerHTML = '';
 
    if (habits.length === 0) {
        list.innerHTML = '<li class="empty-message">Пока нет привычек. Добавьте первую!</li>';
        return;
    }
 
    habits.forEach(habit => {
        const li = document.createElement('li');
        li.className = 'habit-item' + (habit.done ? ' done' : '');
        li.dataset.id = habit.id;
 
        li.innerHTML = `
            <span class="habit-text">${escapeHtml(habit.text)}</span>
            <div class="habit-actions">
                <button class="btn-done" onclick="toggleDone(${habit.id})">
                    ${habit.done ? '↩' : '✓'}
                </button>
                <button class="btn-delete" onclick="deleteHabit(${habit.id})">✕</button>
            </div>
        `;
        list.appendChild(li);
    });
}
 
// Экранирование HTML (защита от XSS)
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}
 
// Обновление статистики
function updateStats() {
    document.getElementById('totalCount').textContent = 'Всего: ' + habits.length;
    document.getElementById('doneCount').textContent = 'Выполнено: ' + habits.filter(h => h.done).length;
}
 
// Заглушки (будут реализованы в следующих PR)
// Переключение статуса выполнения
function toggleDone(id) {
    const habit = habits.find(h => h.id === id);
    if (!habit) return;
 
    habit.done = !habit.done;
    saveHabits();
    renderHabits();
    updateStats();
}

 
function deleteHabit(id) {
    // будет реализовано позже
}
