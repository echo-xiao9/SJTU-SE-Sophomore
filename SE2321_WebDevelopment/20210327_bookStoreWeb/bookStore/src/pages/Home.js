import React from 'react';
import '../css/App.css';
import { Component } from 'react';
import { withRouter } from "react-router-dom";
import Cards2 from '../components/Cards2';
import HeroSection from '../components/HeroSection';
import Footer from '../components/Footer';
import  Pagination from '../components/Pagination';
import Button from '../components/Button';

class Home extends Component {

  getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split('=');
      if (decodeURIComponent(pair[0]) === variable) {
        return decodeURIComponent(pair[1]);
      }
    }
    return 1;
    // console.log('Query variable %s not found', variable);
  }

  constructor(props) {
    super(props);
    this.state = {
    }
  }

  render (){
    return(
    <div>
      <HeroSection />
      <Cards2 props={this.getQueryVariable('page')}/>
      <Footer />
      <Pagination />
    </div>
    );
  }

}



export default withRouter(Home);