import React from 'react';
import '../App.css';
import Cards2 from '../components/Cards2';
import HeroSection from '../components/HeroSection';
import Footer from '../components/Footer';
import  Pagination from '../components/Pagination';
import Button from '../components/Button';

function Home() {
  return (
    <>
      <HeroSection />
      <Cards2 />
      <Footer />
      <Pagination />
     
    </>
  );
}

export default Home;
