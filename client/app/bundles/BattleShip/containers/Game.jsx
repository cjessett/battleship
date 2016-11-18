import React from 'react';
import Board from '../components/Board';
import client from '../utils/helpers';

export default class Game extends React.Component {
  state = {
    board: []
  }
  componentDidMount = () => {
    this.updateState();
  }
  updateState = () => {
    client.getStatus().then((game) => {
      this.setState({ board: game.board });
    });
  }
  handleShot = (coordinates) => {
    client.shoot(coordinates).then((r) => {
      this.updateState();
    });
  }
  render() {
    return (
      <div className="container">
        <Board board={this.state.board} handleShot={this.handleShot} />
      </div>
    );
  }
}
