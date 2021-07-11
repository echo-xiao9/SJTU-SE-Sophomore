import React from 'react';
import { Link } from 'react-router-dom';

function CardItem(props) {
  return (
    <>
      <li className='cards__item'>
    
      <Link className='cards__item__link' to={`/Book/?isbn=${props.ISBN}`}>
          <figure className='cards__item__pic-wrap' data-category={props.label}>
            <img
              className='cards__item__img'
              alt='Travel Image'
              src={props.src}
            />
          </figure>
          <div className='cards__item__info'>
            <h5 className='cards__item__text'>{props.text}</h5>
            <h6 className='cards__item__author'>{props.author}</h6>
            <h6 className='cards__item__price'>{props.price/100}$</h6>
            <h6 className='cards__item__author'>ISBN:{props.ISBN}</h6>
            <h6 className='cards__item__author'>inventory:{props.inventory}</h6>
          </div>
        </Link>
      </li>
    </>
  );
}
export default CardItem;