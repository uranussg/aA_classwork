function TabItem=(props)=>{
 
  return(
    <li>
    <header>{props.name}</header>
    <article>{props.content}</article>

    </li>
  )
}