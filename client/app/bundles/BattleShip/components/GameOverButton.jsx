import React from 'react';
import { Button } from 'react-bootstrap';

export default class GameOverButton extends React.Component {
  handleClick = () => { $('form').submit() }
  render() {
    let buttonProp, buttonContent
    if (this.props.signedIn) {
      buttonProp = { onClick: this.handleClick() };
      buttonContent = 'Leaderboard';
    } else {
      buttonProp = { href: this.props.loginPath };
      buttonContent = 'Log In/Register To Save Score';
    }
    return <Button {...buttonProp}>{buttonContent}</Button>
  }
}
