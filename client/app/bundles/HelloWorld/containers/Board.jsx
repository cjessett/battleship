import React from 'react';
import Row from '../components/Row';
import helpers from '../utils/helpers';

export default class Board extends React.Component {
  componentDidMount = () => {
    this.updateState();
  }
  updateState = () => {
    helpers.getStatus().then((response) => {
      console.log(response)
    })
  }
  handleShoot = (id) => {
    helpers.shoot(id).then((response) => console.log(response))
  }
  render() {
    const rows = this.props.board.map((tiles, index) => {
      <Row
        key={index}
        tiles={tiles}
        id={index}
        handleShoot={this.handleShoot}
      />
    });
    return (
      <div className="container">
        {rows}
      </div>
    );
  }
}
