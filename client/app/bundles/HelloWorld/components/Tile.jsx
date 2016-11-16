import React from 'react';

styles = {

}

export default class Tile extends React.Component {
  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-sm-4">
            One of three columns
          </div>
          <div className="col-sm-4">
            One of three columns
          </div>
          <div className="col-sm-4">
            One of three columns
          </div>
        </div>
      </div>
    )
  }
}
