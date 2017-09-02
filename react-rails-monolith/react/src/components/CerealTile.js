import React from 'react';
import { Link } from 'react-router';

const CerealTile= (props) => {
  return (
    <div className="CerealTile">
      <Link to={`/cereals/${props.id}`}><h5>{props.name}</h5></Link>
    </div>
  )
}

export default CerealTile;
