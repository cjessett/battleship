import axios from 'axios';
import ReactOnRails from 'react-on-rails';

const client = axios.create({
  headers: {
    'X-CSRF-Token': ReactOnRails.authenticityToken(),
    responseType: 'json'
  }
});

const helpers = {
  shoot: (coordinates) => {
    return client.put('/game', { coordinates: coordinates }).then((r) => r.data.game);
  },
};

export default helpers;

