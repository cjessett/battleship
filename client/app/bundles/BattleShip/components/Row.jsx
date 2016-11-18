import React from 'react';
import Tile from './Tile';

export default class Row extends React.Component {
  render() {
    const tiles = this.props.tiles.map((tile, index) => {
      return (
        <Tile
          key={index}
          coordinates={[this.props.id, index]}
          status={tile}
          handleShot={this.props.handleShot}
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
