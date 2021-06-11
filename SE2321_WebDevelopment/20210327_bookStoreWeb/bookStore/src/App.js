import React from 'react';
import Navbar from './components/Navbar';
import './App.css';
import Home from './pages/Home';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Carts from './pages/Cart';
// import Order from './pages/Order';
import Order from './pages/Orders';
import Login from './pages/Login';
import Book from './pages/Book'
import Administrator from './pages/Administrator';
import AdminUser from './pages/AdminUser';
import AdminBook from './pages/AdminBook';
import AdminOrder from './pages/AdminOrder';
import AdminIndex from './pages/AdminIndex';
import AdminOrders from './pages/AdminOrders';
import UserOrder from './pages/UserOrders';



function App() {
  return (
    <>
      <Router>
        <Navbar />
        <Switch>
          <Route path='/' exact component={Home} />
          <Route path='/Carts' component={Carts} />
          <Route path='/Login' component={Login} />
          <Route path='/Book' component={Book} />
          <Route path='/Order' component={UserOrder} />
          {/* <Route path ='/Administrator' component={Administrator}/> */}
          <Route path ='/AdminBook' component={AdminBook}/>
          <Route path ='/AdminUser' component={AdminUser}/>
          <Route path ='/AdminIndex' component={AdminIndex}/>
          {/* <Route path ='/AdminOrder' component={AdminOrder}/> */}
          <Route path ='/AdminOrder' component={AdminOrders}/>

        </Switch>
      </Router>
    </>
  );
}

export default App;
