import ReactOnRails from 'react_on_rails'
import axios from 'axios';

const client = axios.create({
  headers: {'csrf_authenticity_token': ReactOnRails.authenticityToken()}
})

const helpers = {
  getStatus: () => {
    client.get('/game/status').then((r) => r)
  },
  shoot: (id) => {
    client.put('/game/shoot', { id: id })
    .then((response) => {console.log(response)
    });
  },
}


