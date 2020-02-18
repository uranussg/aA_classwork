const todos = JSON.parse(localStorage.getItem('todos')) || []

window.todos = todos

class ToDos {
    constructor(val){
        this.done = false
        this.val = val
    }
}

function addTodo() {
    let el = document.getElementsByName("add-todo")[0]
    todos.push(new ToDos(el.value))
    el.setAttribute("value", "")
    localStorage.setItem('todos', JSON.stringify(todos))
    populateList()
}

let ul = document.getElementsByClassName('todos')[0]
function populateList() {
    todos.forEach(todo => {
        // debugger
        let outLi = document.createElement('li')
        let input = document.createElement("input")
        input.setAttribute("type", "checkbox")
        if (todo.done) input.setAttribute("checked", 'true');
        let la = document.createElement("label")
        la.innerHTML = todo.val
        outLi.appendChild(input)
        outLi.appendChild(la)
        ul.appendChild(outLi)
    });
}


let submit = document.querySelector("[type=submit]")


submit.addEventListener('click', ()=>{
    addTodo()
})

ul.addEventListener('click', ()=> {
    // debugger

    for (let i = 1; i< ul.children.length; i++) {
        let box = ul.children[i].querySelector("input")
        if (box.checked) todos[i - 1].done = true;
    }
    localStorage.setItem('todos', JSON.stringify(todos))

})
populateList()
