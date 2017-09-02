import React, { Component } from 'react';
import CerealShowTile from '../components/CerealShowTile'

class CerealShowContainer extends Component{
  constructor(props){
    super(props);
    this.state = {
      cereal:''
    }
  }

  componentDidMount() {
    let cerealId= this.props.params.id
    fetch(`/api/v1/cereals/${cerealId}`)
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
        this.setState({ cereal: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }



  render() {
    return (
      <div>
        <h1> Cereal Name and Description </h1>
        <CerealShowTile
          key = {this.state.cereal.id}
          name = {this.state.cereal.name}
          description= {this.state.cereal.description}
        />
      </div>
    );
  }
}


export default CerealShowContainer;
