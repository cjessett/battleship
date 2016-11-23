import React from 'react';
import ReactOnRails from 'react-on-rails';

import Board from '../containers/Board';

const BattleShipApp = (props) => (
  <Board {...props} token={ReactOnRails.authenticityToken()} />
);

// This is how react_on_rails can see the BattleShipApp in the browser.
ReactOnRails.register({ BattleShipApp });


