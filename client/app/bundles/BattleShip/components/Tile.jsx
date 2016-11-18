import React from 'react';

export default class Tile extends React.Component {
  handleClick = () => {
    const { coordinates, status, handleShot } = this.props;
    if (status === "hidden") { handleShot(coordinates); }
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
