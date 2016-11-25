import React from 'react';
import { Button } from 'react-bootstrap';

export default class GameOverButton extends React.Component {
  handleClick = () => { $('form').submit }
  render() {
    if (this.props.signedIn) {
      const buttonProp = { onClick: this.handleClick() };
      const buttonContent = 'Leaderboard';
    } else {
      const buttonProp = { href: this.props.LoginPath };
      const buttonContent = 'Log In/Register To Save Score';
    }
    return <Button {...buttonProp}>{buttonContent}</Button>
  }
}
