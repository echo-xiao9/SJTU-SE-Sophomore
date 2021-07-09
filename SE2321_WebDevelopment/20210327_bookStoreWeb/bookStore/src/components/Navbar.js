import React, { useState, useEffect } from 'react';
import { Button } from './Button';
import { Link } from 'react-router-dom';
import '../css/Navbar.css';

function Navbar() {
  const [click, setClick] = useState(false);
  const [button, setButton] = useState(true);

  const handleClick = () => setClick(!click);
  const closeMobileMenu = () => setClick(false);

  const showButton = () => {
    if (window.innerWidth <= 960) {
      setButton(false);
    } else {
      setButton(true);
    }
  };

  useEffect(() => {
    showButton();
  }, []);

  window.addEventListener('resize', showButton);

  return (
    <>
      <nav className='navbar'>
        <div className='navbar-container'>
          <Link to='/' className='navbar-logo' onClick={closeMobileMenu}>
            Book Store
            <i class='fab fa-typo3' />
          </Link>
          <div className='menu-icon' onClick={handleClick}>
            <i className={click ? 'fas fa-times' : 'fas fa-bars'} />
          </div>
          <ul className={click ? 'nav-menu active' : 'nav-menu'}>
            <li className='nav-item'>
              <Link to='/' className='nav-links' onClick={closeMobileMenu}>
                Home
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/Order'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Orders
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/Carts'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Cart
              </Link>
            </li>

            <li>
              <Link
                to='/Login'
                className='nav-links-mobile'
                onClick={closeMobileMenu}
              >
                Login
              </Link>
              <li className='nav-item'>
              <Link
                to='/Statistics'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Statistics
              </Link>
            </li>
            </li>
          </ul>
          {button && <Button buttonStyle='btn--outline' buttonLink='/Login'>Login</Button>}
        </div>
      </nav> 
    </>
  );
}

export default Navbar;
