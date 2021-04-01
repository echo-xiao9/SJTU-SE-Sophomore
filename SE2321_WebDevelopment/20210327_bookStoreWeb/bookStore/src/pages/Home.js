import React from 'react';
import '../App.css';
import Cards from '../components/Cards';
import HeroSection from '../components/HeroSection';
import Footer from '../components/Footer';
import SearchBox from '../components/SearchBox';
import  Pagination from '../components/Pagination';
// import {Layout, Carousel} from 'antd';
import {BookCarousel} from "../components/BookCarousel";
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
