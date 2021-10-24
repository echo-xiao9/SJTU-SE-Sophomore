import React from 'react';
import {BrowserRouter as Router, Switch, Route, Link} from "react-router-dom";
import './App.css';
import Info from './component/Info';

function App() {
    return (
        <Router>
            <div>
                <nav>
                    <ul>
                        <li><Link to="/">Home</Link></li>
                        <li><Link to="/about">About</Link></li>
                        <li><Link to="/users">Users</Link></li>
                    </ul>
                </nav>
                <Switch>
                    <Route path="/about"><Info menu="about"/></Route>
                    <Route path="/users"><Info menu="users"/></Route>
                    <Route path="/"><Info menu=""/></Route>
                </Switch>
            </div>
        </Router>
    );
}

export default App;
