import React from 'react';
import Tile from './Tile';

export default class Row extends React.Component {
  render() {
    const tiles = this.props.tiles.map((tile, index) => {
      return (
        <Tile
          key={index}
          id={`${this.props.id},${index}`}
          status={tile.status}
          handleShoot={this.props.handleShoot}
        />
      );
    });
    return (
      <div className="row">
        {tiles}
      </div>
    );
  }
}
