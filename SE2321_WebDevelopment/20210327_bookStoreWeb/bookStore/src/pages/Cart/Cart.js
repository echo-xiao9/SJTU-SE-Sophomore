import React from 'react';
import '../../App.css';
import './Cart.css';
import { Link } from 'react-router-dom';
import Divider from '@material-ui/core/Divider';

import { makeStyles, useTheme } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import SkipPreviousIcon from '@material-ui/icons/SkipPrevious';
import PlayArrowIcon from '@material-ui/icons/PlayArrow';
import SkipNextIcon from '@material-ui/icons/SkipNext';
import { Button } from '@material-ui/core';
import TextField from '@material-ui/core/TextField';
import DeleteICon from '@material-ui/icons/Delete';


function Carts() {
  return (

    <div class="card">
      <div class="row">
        <div class="col-md-8 cart">
          <div class="title">
            <div class="row">
              <div class="col">
                <h4><b>Shopping Cart</b></h4>
              </div>
              <div class="col align-self-center text-right text-muted">3 items</div>
            </div>
          </div>
          <Divider />
          <div className="card-text">
            <Link to='/Book'>
              <div className="portada" id='cartPortada'>
                {/* <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: '50%' }} /> */}
                <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: 150 }} />
              </div>
            </Link>
            <div className="title-total">
              {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
              <h2>Harry Potter (Books 1-7)</h2>
              <h2 className="orderPrice"> $49.99</h2>
              <div className="desc">author: J. K. Rowling</div>
              <div className="actions">
                <button>Delete</button>
                <button>Add to favorite</button>
                <TextField type='number' placeholder="number" />
              </div>
            </div>
          </div>
          <Divider />
          <div className="card-text">
            <Link to='/Book'>
              <div className="portada" id='cartPortada'>
                {/* <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: '50%' }} /> */}
                <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: 150 }} />
              </div>
            </Link>
            <div className="title-total">
              {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
              <h2>Harry Potter (Books 1-7)</h2>
              <h2 className="orderPrice"> $49.99</h2>
              <div className="desc">author: J. K. Rowling</div>
              <div className="actions">
                <button>Delete</button>
                <button>Add to favorite</button>
                <TextField type='number' placeholder="number" />
              </div>
            </div>
          </div>
          <Divider />
          <div className="card-text">
            <Link to='/Book'>
              <div className="portada" id='cartPortada'>
                {/* <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: '50%' }} /> */}
                <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: 150 }} />
              </div>
            </Link>
            <div className="title-total">
              {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
              <h2>Harry Potter (Books 1-7)</h2>
              <h2 className="orderPrice"> $49.99</h2>
              <div className="desc">author: J. K. Rowling</div>
              <div className="actions">
                <button>Delete</button>
                <button>Add to favorite</button>
                <TextField type='number' placeholder="number" />
              </div>
            </div>
          </div>
          <Divider />

          <div class="back-to-shop">

            <a href="/">
              &leftarrow;
                </a>
            <span class="text-muted">Back to shop</span>
          </div>
        </div>
        <div class="col-md-4 summary">
          <div>
            <h5><b>Summary</b></h5>
          </div>

          <div class="row">
            <div class="col" style={{ paddingRight: '0px' }}>ITEMS 3</div>
            <div class="col text-right">&euro; 132.00</div>
          </div>

          <form>
            <p>SHIPPING</p> <select>
              <option class="text-muted">Standard-Delivery- &euro;5.00</option>
              <option class="text-muted">Fast-Delivery- &euro;10.00</option>
            </select>
            <p>Remarks to merchants</p> <input type="text" id="grayInput" placeholder="Remarks" />
          </form>

          <div class="row" style={{ color: '#fff', padding: '2vh 0' }}>
            {/* <div class="row" style={{border-top: '1px' solid rgba(0,0,0,.1); padding: 2vh 0;"> */}
            <div class="col">TOTAL PRICE</div>
            <div class="col text-right">&euro; 137.00</div>
          </div>
          <button class="cartBtn">CHECKOUT</button>
        </div>
      </div>
    </div>

  );
}

export default Carts;

