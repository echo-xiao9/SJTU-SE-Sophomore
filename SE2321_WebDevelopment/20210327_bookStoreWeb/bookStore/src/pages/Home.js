import React from 'react';
import '../App.css';
import Cards from '../components/Cards';
import HeroSection from '../components/HeroSection';
import Footer from '../components/Footer';
import  Pagination from '../components/Pagination';
import Carousel from "../components/Carousel";

function Home() {
  return (
    <>
      <HeroSection />
      {/* <Carousel /> */}
      <Cards />
      <Footer />
      <Pagination />
    </>
  );
}

export default Home;
