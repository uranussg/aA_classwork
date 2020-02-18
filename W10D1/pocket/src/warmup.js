
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if (htmlElement.children) {
        Array.from(htmlElement.children).forEach((el) => {

            htmlElement.removeChild(el)
        })
    }
    let p = document.createElement("p")
    let str = document.createTextNode(string)
    p.appendChild(str)
    htmlElement.appendChild(p)
};

htmlGenerator('Party Time.', partyHeader);
const h1 = document.querySelector("h1")
htmlGenerator("I <3 Vanilla DOM manipulation.", h1)


document.query