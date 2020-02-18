
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export function dogLinkCreator() {
  let links = []
  Object.keys(dogs).forEach((dog) => {
    let dogLi = document.createElement("li")
    let a = document.createElement("a")
    a.innerHTML = dog
    a.href = dogs[dog]
    a.setAttribute("class","dog-link")
    dogLi.appendChild(a)
    links.push(dogLi)
  })
  return links
}

export function attachDogLinks() {
  const ul = document.getElementsByClassName("drop-down-dog-list")[0]
  let dogLinks = dogLinkCreator()
  dogLinks.forEach((li) => {
    ul.appendChild(li)
  })
  function handleEnter() {
    
    const trigger = document.getElementsByClassName("drop-down-dog-nav")[0]
    // debugger
    trigger.addEventListener('mouseenter', () =>{
      // console.log("here")
      event.preventDefault()
      event.stopPropagation()
      // debugger
      let list = event.currentTarget.querySelectorAll("a")
      list.forEach((child) => {
        child.setAttribute("class", "")
      })
    }) 
  }
  
  function handleLeave() {
    const trigger = document.getElementsByClassName("drop-down-dog-nav")[0]
    trigger.addEventListener("mouseleave", () =>{
      event.preventDefault()
      event.stopPropagation()
      let list = event.currentTarget.querySelectorAll("a")
      list.forEach((child) => {
        // child.removeClass("dog-link")
        child.setAttribute("class", "dog-link")
      })
    }) 
  
  }
  handleEnter()
  handleLeave()
}


attachDogLinks()
