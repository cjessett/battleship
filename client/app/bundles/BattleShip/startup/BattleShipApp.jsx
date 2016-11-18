import React from 'react';
import ReactOnRails from 'react-on-rails';

import Game from '../containers/Game';

const BattleShipApp = (props) => (
  <Game {...props} />
);

// This is how react_on_rails can see the BattleShipApp in the browser.
ReactOnRails.register({ BattleShipApp });


