import React from 'react';
import Timer from './Timer';

export default class Stats extends React.Component {
  render() {
    const { boats } = this.props
    const boatTypes = Object.keys(boats).map((type, index) => {
      return <p key={index}>{type}:{boats[type]}</p>
    });
    return (
      <div>
        <h3>Shots Remaining</h3>
          <p>{this.props.shots}</p>
        <h3>Boats Remaining</h3>
          {boatTypes}
        <h3>Elapsed Time</h3>
          <Timer />
      </div>
    );
  }
}


