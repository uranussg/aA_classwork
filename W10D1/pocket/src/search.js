const pokemonAPI = 'https://pokeapi.co/api/v2/pokemon/?offset=150&limit=150'


const resps = []
fetch(pokemonAPI).then((response)=>{
    return response.json()
})
.then((myjson) => {
//   debugger
//   console.log(`${myjson.results[0]}`)
myjson.results.forEach((el)=>{

    resps.push(el);
})
 console.log(`${resps.length}`)
})
;
function findMatches(word) {
    
    
    // debugger
    let rex = new RegExp(word)
    let matched = []
    resps.forEach((res) => {
        console.log(`${Object.keys(res)}`)
        if (res.name.match(rex)) matched.push(res)
    })
    // debugger
    return matched
}


function displayMatches() {

    let trigger = document.getElementsByClassName("search")[0]
    trigger.addEventListener("keyup",()=>{
        event.stopPropagation()
        event.preventDefault()
        let word = trigger.value
        debugger
        let matchArray = findMatches(word)
        let ul = document.getElementsByClassName("suggestions")[0]
        // debugger
        matchArray.forEach((po) => {
            // debugger
            let li = document.createElement("li")
            let a = document.createElement("a")
            a.innerHTML = po.name
            a.src = po.url  
            li.append(a)
            ul.append(li)
        })

    })

}


displayMatches()