class Tab extends React.Component{
  constructor(){
    super()
    this.state = {selected:0}
  }
  render(){
    const items = this.props.items.forEach((item)=>{
      return <TabItem 
      id={item.id} 
      name = {item.name} 
      content = {item.content}
      onClick={className="show"}/>
    })
    return()

  }
}
