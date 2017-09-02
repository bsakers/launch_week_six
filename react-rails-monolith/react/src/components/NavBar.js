import React from 'react';
import { Link } from 'react-router';

const NavBar = props => {
  return(
    <div>
      <Link to='/cereals'> HOME </Link>
      <h1 className="page-title"></h1>
      { props.children }
    </div>
  )
}

export default NavBar;
