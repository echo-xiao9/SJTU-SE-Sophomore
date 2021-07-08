import React from 'react';
import '../App.css';
import '../css/OrderCard.css';
import Divider from '@material-ui/core/Divider';
import { Link } from 'react-router-dom';
import SearchBox from '../components/SearchBox';


function Order() {
  return (
    <div className="card">
      <h1>My Order</h1>
      {/* <button>non-payment</button>
      <button> wait diliver</button>
      <button> wait diliver</button>
 */}

 <SearchBox />
 
   <Divider />
      <>

      <div className="card-text">
        <Link to='/Book'>
          <div className="portada">
            <img src="images/harryCover.jpg" alt="Nature" style={{ width: '80%' }} />
          </div>
        </Link>
        <div className="title-total">
          <h2>Harry Potter (Books 1-7)</h2>
          <h2 className="orderPrice"> $49.99</h2>
          <div className="desc">author: J. K. Rowling</div>
          <div className="actions">
            <button>Confirm the goods</button>
            <button>refund</button>
            <button>check logistics</button>
          </div>
        </div>
      </div>
      <Divider />

      <div className="card-text">
        <Link to='/Book'>
          <div className="portada">
            <img src="images/harryCover.jpg" alt="Nature" style={{ width: '80%' }} />
          </div>
        </Link>
        <div className="title-total">
          <h2>Harry Potter (Books 1-7)</h2>
          <h2 className="orderPrice"> $49.99</h2>
          <div className="desc">author: J. K. Rowling</div>
          <div className="actions">
            <button>Confirm the goods</button>
            <button>refund</button>
            <button>check logistics</button>
          </div>
        </div>
      </div>
      <Divider />

      <div className="card-text">
        <Link to='/Book'>
          <div className="portada">
            <img src="images/harryCover.jpg" alt="Nature" style={{ width: '80%' }} />
          </div>
        </Link>
        <div className="title-total">
          {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
          <h2>Harry Potter (Books 1-7)</h2>
          <h2 className="orderPrice"> $49.99</h2>
          <div className="desc">author: J. K. Rowling</div>
          <div className="actions">
            <button>Confirm the goods</button>
            <button>refund</button>
            <button>check logistics</button>
          </div>
        </div>
      </div>

      <div className="card-text">
        <Link to='/Book'>
          <div className="portada">
            <img src="images/harryCover.jpg" alt="Nature" style={{ width: '80%' }} />
          </div>
        </Link>
        <div className="title-total">
          {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
          <h2>Harry Potter (Books 1-7)</h2>
          <h2 className="orderPrice"> $49.99</h2>
          <div className="desc">author: J. K. Rowling</div>
          <div className="actions">
            <button>Confirm the goods</button>
            <button>refund</button>
            <button>check logistics</button>
          </div>
        </div>
      </div>
      
    </>
</div>
  );
}

export default Order;

