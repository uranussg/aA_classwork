import React from 'react'

class Clock extends React.Component {
  constructor(){
    super();
    this.state = {time: new Date()};
    this.tick = this.tick.bind(this);
    this.parseTime = this.parseTime.bind(this);
  }
  
    tick(){
      this.setState({
        time: new Date()
      }, this.parseTime)
    }
  componentDidMount(){ 
    // debugger
    this.interval = setInterval(this.tick, 1000)
  }

  parseTime(){
    this.hours = this.state.time.getHours();
    this.minutes = this.state.time.getMinutes() < 10 ? `0${this.state.time.getMinutes()}` : this.state.time.getMinutes()
    this.seconds = this.state.time.getSeconds() < 10 ? `0${this.state.time.getSeconds()}` : this.state.time.getSeconds();
    this.date = this.state.time.getDate();
    this.month = this.state.time.getMonth();
    this.year = this.state.time.getFullYear();

 
  }

  printDate(){
    return `${this.month}/${this.date}/${this.year}`
  }

  printTime(){
    return `${this.hours}: ${this.minutes}: ${this.seconds}`;
  }
  
  render(){
    return (
      <div className="clock">
      
        
        <div className="time">
          <h1>Time to close the boys!</h1>
          <p>{this.printTime()}</p>
        </div>
        <div className="date">
          <h1>Date</h1>
          <p>{this.printDate()}</p>
        </div>
      

      </div>
    )

  }
}
export default Clock