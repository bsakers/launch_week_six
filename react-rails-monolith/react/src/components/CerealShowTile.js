import React from 'react';

const CerealShowTile= (props) => {
  return (
    <div className="CerealTile">
      <p>Cereal Name: {props.name}</p>
      <p>Cereal Description: {props.description}</p>
    </div>
  )
}

export default CerealShowTile;
