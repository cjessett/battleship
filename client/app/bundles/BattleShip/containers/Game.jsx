import React from 'react';
import Board from '../components/Board';
import Stats from '../components/Stats';
import GameOverButton from '../components/GameOverButton';
import { Modal } from 'react-bootstrap';

import client from '../utils/helpers';

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: props.initialBoard,
      boats: props.initialBoats,
      shotsLeft: props.initialShots,
      gameOver: false,
      score: 0,
      signedIn: props.signedIn
    };
  }
  handleShot = (coordinates) => {
    client.shoot(coordinates).then((game) => {
      this.setState({
        board: game.board,
        shotsLeft: game.shotsLeft,
        boats: game.boats,
        gameOver: game.gameOver,
        score: game.score
      });
    });
  }
  render() {
    const { board, shotsLeft, boats, gameOver, score, signedIn } = this.state;
    return (
      <div className="row">
        <div className="col-sm-9">
          <Board board={board} handleShot={this.handleShot} />
        </div>
        <div className="col-sm-3">
          <Stats shots={shotsLeft} boats={boats} gameOver={gameOver} />
        </div>
        <Modal show={gameOver}>
          <Modal.Header>
            <Modal.Title>
              You scored {score} points!
            </Modal.Title>
            <Modal.Body>
              <GameOverButton signedIn={signedIn} />
            </Modal.Body>
          </Modal.Header>
        </Modal>
      </div>
    );
  }
}
