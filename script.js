function addTask() { 
    const taskInput = document.getElementById('taskInput'); 
    const taskText = taskInput.value.trim(); 
     
    // Валидация - проверяем, что поле не пустое 
    if (taskText === '') { 
        alert('Введите текст задачи!'); 
        return; 
    } 
     
    // Создаем новый элемент списка 
    const taskList = document.getElementById('taskList'); 
    const li = document.createElement('li'); 
    li.innerHTML = ` 
        <span>${taskText}</span> 
        <button onclick="this.parentElement.remove()">Удалить</button> 
    `; 
    taskList.appendChild(li); 
     
    // Очищаем поле ввода и возвращаем фокус 
    taskInput.value = ''; 
    taskInput.focus(); 
} 
