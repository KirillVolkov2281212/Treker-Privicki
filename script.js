function toggleDone(id) {
    const habit = habits.find(h => h.id === id);
    if (!habit) return;
 
    habit.done = !habit.done;
    saveHabits();
    renderHabits();
    updateStats();
}
