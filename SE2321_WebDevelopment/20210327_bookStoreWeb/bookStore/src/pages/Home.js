import React from 'react';
import '../App.css';
import Cards from '../components/Cards';
import HeroSection from '../components/HeroSection';
import Footer from '../components/Footer';
import  Pagination from '../components/Pagination';

function Home() {
  return (
    <>
      <HeroSection />
      <Cards />
      <Footer />
      <Pagination />
    </>
  );
}

export default Home;
