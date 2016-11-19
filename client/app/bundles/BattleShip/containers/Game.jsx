import React from 'react';
import Board from '../components/Board';
import Stats from '../components/Stats';
import client from '../utils/helpers';

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: props.initialBoard,
      boats: props.initialBoats,
      shotsLeft: props.initialShots
    };
  }
  handleShot = (coordinates) => {
    client.shoot(coordinates).then((game) => {
      this.setState({
        board: game.board,
        shotsLeft: game.shotsLeft,
        boats: game.boats
      });
    });
  }
  render() {
    const { board, shotsLeft, boats } = this.state;
    return (
      <div className="row">
        <div className="col-sm-9">
          <Board board={board} handleShot={this.handleShot} />
        </div>
        <div className="col-sm-3">
          <Stats shots={shotsLeft} boats={boats} />
        </div>
      </div>
    );
  }
}
