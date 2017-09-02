import React, { Component } from 'react';
import CerealTile from '../components/CerealTile';

class CerealsIndexContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      cereals: []
    }
  }

  componentDidMount() {
    fetch('/api/v1/cereals/')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ cereals: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let cereals = this.state.cereals.map(cereal =>{
      return (
        <CerealTile
          key={cereal.id}
          id={cereal.id}
          name={cereal.name}
        />
      )

    })
    return (
      <div>
        <h1> Cereals Index </h1>
        {cereals}
      </div>
    );
  }
}

export default CerealsIndexContainer;
