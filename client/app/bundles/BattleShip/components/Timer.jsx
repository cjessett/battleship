import React from 'react';

export default class Timer extends React.Component {
  constructor() {
    super();
    this.startTime = Date.now();
    this.state = { time: 0 };
  }
  componentDidMount = () => {
    this.timer = setInterval(this.tick, 1000);
  }
  componentWillUnmount = () => {
    clearInterval(this.timer)
  }
  tick = () => {
    this.setState({ time: Date.now() - this.startTime })
  }
  convert = (mSec) => {
    const seconds = Math.round(mSec / 1000)
    let minutes = Math.floor(seconds / 60)
    let sec = seconds % 60
    sec = sec < 10 ? `0${sec}` : `${sec}`
    return `${minutes}:${sec}`
  }
  handleGameOver = () => {
    clearInterval(this.timer)
  }
  render() {
    if (this.props.gameOver) { this.handleGameOver(); }
    return <span>{this.convert(this.state.time)}</span>
  }
}
