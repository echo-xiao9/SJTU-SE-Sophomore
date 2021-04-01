import React from 'react';
import Navbar from './components/Navbar';
import './App.css';
import Home from './pages/Home';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Services from './pages/Services';
import Carts from './pages/Cart/Cart';
import Order from './pages/Order/Order';
import Login from './pages/Login';
import Book from './pages/Book/Book'
import Administrator from './pages/Administrator'
function App() {
  return (
    <>
      <Router>
        <Navbar />
        <Switch>
          <Route path='/' exact component={Home} />
          <Route path='/services' component={Services} />
          <Route path='/Carts' component={Carts} />
          <Route path='/Login' component={Login} />
          <Route path='/Book' component={Book} />
          <Route path='/Order' component={Order} />
          <Route path ='/Administrator' component={Administrator}/>
        </Switch>
      </Router>
    </>
  );
}

export default App;
