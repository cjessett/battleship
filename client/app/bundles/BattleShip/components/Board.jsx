import React from 'react';
import Row from '../components/Row';

export default class Board extends React.Component {
  render() {
    const rows = this.props.board.map((tiles, index) => {
      return (
      <Row
        key={index}
        tiles={tiles}
        id={index}
        handleShot={this.props.handleShot}
      />
      );
    });
    return (
      <div className="container">
        {rows}
      </div>
    );
  }
}
