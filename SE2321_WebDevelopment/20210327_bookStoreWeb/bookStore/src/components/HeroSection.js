import React from 'react';
import '../css/App.css';
import { Button } from './Button';
import '../css/HeroSection.css';

function HeroSection() {
  return (
    <div className='hero-container'>
      <video src='/videos/girlReading.mp4' autoPlay loop muted />
      <h1>The Largest E-book Store</h1>
      <p>What are you waiting for?</p>
      <div className='hero-btns'>
        <Button
          className='btns'
          buttonStyle='btn--outline'
          buttonSize='btn--large'
          buttonLink='/Login'
        >
          LOG IN / REGISTER
        </Button>
        <Button
          className='btns'
          buttonStyle='btn--primary'
          buttonSize='btn--large'
          onClick={console.log('hey')}
          buttonLink='/'
        >
          About  Us <i className='far fa-play-circle' />
        </Button>
      </div>
    </div>
  );
}

export default HeroSection;
