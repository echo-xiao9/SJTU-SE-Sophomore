import React from 'react';
import './Cards.css';
import CardItem from './CardItem';
import SearchBox from './SearchBox'
import Pagination from './Pagination'

function Cards() {
  return (
    <div className='cards'>
      <h1>Have a look at our best seller!</h1>
      <SearchBox />
      <div className='cards__container'>
        <div className='cards__wrapper'>
          <ul className='cards__items'>
            <CardItem
              src='images/harryCoverSingle.jpeg'
              text='Harry Potter'
              label='novel'
              path='/Book'
            />
            <CardItem
              src='images/3bodyCoverSingle.jpeg'
              text='Three body'
              label='novel'
              path='/services'
            />
            <CardItem
              src='images/JobsCover.jpeg'
              text='Steve Jobs'
              label='biographies'
              path='/services'
            />
             <CardItem
              src='images/MuskCover.jpeg'
              text='Elon Musk'
              label='biographies'
              path='/services'
            />
            
          </ul>
          <ul className='cards__items'>
            <CardItem
              src='images/PPCoverSingle.jpeg'
              text='Pride and Prejudice'
              label='Classic'
              path='/services'
              author = 'J·K·Rowling'
              price = '$50'
              
            />
            <CardItem
              src='images/APromiseCoverSingle.jpg'
              text= 'A Promised Land'
              label='Classic'
              path='/products'
            />
            <CardItem
              src='images/travelHomeCoverSingle.jpg'
              text='Travel Home: Design with a Global Spirit'
              label='Classic'
              path='/Login'
            />
            <CardItem
              src='images/madeSingleCover.jpeg'
              text='One hundred years of solitude'
              label='Classic'
              path='/Login'
            />
          </ul>
          <ul className='cards__items'>
            <CardItem
              src='images/theFourWindCover.jpeg'
              text='The Four Winds'
              label='Classic'
              path='/services'
            />
            <CardItem
              src='images/loveCover.png'
              text='Love in the time of cholera'
              label='Classic'
              path='/products'
            />
            <CardItem
              src='images/downToEarthSingleCover.jpeg'
              text='One hundred years of solitude'
              label='Classic'
              path='/Login'
            />
            <CardItem
              src='images/lonelyCover.jpg'
              text='One hundred years of solitude'
              label='Classic'
              path='/Login'
            />
          </ul>
          <Pagination />
        </div>
      </div>
    </div>
  );
}

export default Cards;
