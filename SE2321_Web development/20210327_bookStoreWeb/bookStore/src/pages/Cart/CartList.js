import React from 'react';
import './CartList.css';
import  CartListItem from './CartListItem';

function Carts() {
  return (
    <div className='carts'>
      <div className='carts__container'>
        <div className='carts__wrapper'>
          <ul className='carts__items'>
            <CartListItem
              src='images/img-9.jpg'
              text='Explore the hidden waterfall deep inside the Amazon Jungle'
              label='Adventure'
              path='/services'
            />
          </ul>
          <ul className='carts__items'>
            <CartListItem
              src='images/img-2.jpg'
              text='Travel through the Islands of Bali in a Private Cruise'
              label='Luxury'
              path='/services'
            />
          </ul>
          <ul className='carts__items'>
            <CartListItem
              src='images/img-3.jpg'
              text='Set Sail in the Atlantic Ocean visiting Uncharted Waters'
              label='Mystery'
              path='/services'
            />
          </ul>
            
 
        </div>
      </div>
    </div>
  );
}

export default Carts;
