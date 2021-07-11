import React from 'react';
import Navbar from './components/Navbar';
import './css/App.css';
import Home from './pages/Home';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Carts from './pages/Cart';
import Login from './pages/Login';
import Register from './pages/Register';
import Book from './pages/Book'
import AdminUser from './pages/AdminUser';
import AdminBook from './pages/AdminBook';
import AdminIndex from './pages/AdminIndex';
import AdminOrders from './pages/AdminOrders';
import UserOrder from './pages/UserOrders';
import HotSelling from './pages/HotSelling';
import HotUsers from './pages/HotUsers';
import Statistics from './pages/Statistics';

function App() {
  return (
    <>
      <Router>
        <Navbar />
        <Switch>
          <Route path='/' exact component={Home} />
          <Route path='/page' exact component={Home} />
          <Route path='/Carts' component={Carts} />
          <Route path='/Login' component={Login} />
          <Route path ='/Register' component={Register}/>
          <Route path='/Book' component={Book} />
          <Route path='/Order' component={UserOrder} />
          {/* <Route path ='/Administrator' component={Administrator}/> */}
          <Route path ='/AdminBook' component={AdminBook}/>
          <Route path ='/AdminUser' component={AdminUser}/>
          <Route path ='/AdminIndex' component={AdminIndex}/>
          {/* <Route path ='/AdminOrder' component={AdminOrder}/> */}
          <Route path ='/AdminOrder' component={AdminOrders}/>
          <Route path ='/HotSelling' component={HotSelling}/>
          <Route path ='/getHotUsers' component={HotUsers}/>
          <Route path ='/Statistics' component={Statistics}/>
        </Switch>
      </Router>
    </>
  );
}

export default App;
