import React from 'react';
import '../App.css';
import Cards from '../components/Cards';
import Cards2 from '../components/Cards2';
import HeroSection from '../components/HeroSection';
import Footer from '../components/Footer';
import  Pagination from '../components/Pagination';
import CardItem from'../components/CardItem';

function Home() {
  return (
    <>
      <HeroSection />
       
      <Cards2  page="2" />
      <Footer />
      <Pagination />
    </>
  );
}

export default Home;
