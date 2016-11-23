import React from 'react';
import axios from 'axios';

export default class Tile extends React.Component {
  handleClick = () => {
    this.props.handleShoot(this.props.id)
  }
  render() {
    return (
      <div
        className={`col-sm-1 offset-sm-1 tile ${this.props.status}`}
        onClick={this.handleClick}
      >
      </div>
    );
  }
}
