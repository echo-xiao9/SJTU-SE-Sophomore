import React from 'react';
import '../../App.css';
import './OrderCard.css';

function OrderCard() {
  return (
    <div className="card">
      <div className="card-text">
        <div className="portada">
        <img src="images/harryCover.jpg" alt="Nature" style={{ width: '100%' }} />
        </div>
        <div className="title-total">
           {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
           <h2>Harry Potter (Books 1-7)</h2> 
           <h2 className = "orderPrice"> $49.99</h2>
           <div className="desc">author: J. K. Rowling</div> 
           <div className="actions">
           <button>Confirm the goods</button>
           <button>refund</button>
           <button>check logistics</button>
            {/* <button><i className="far fa-heart" /></button>
            
            <button><i className="far fa-envelope" /></button>
            <button><i className="fas fa-user-friends" /></button> */}
          </div> 
        </div>
      </div>
    </div>
  );
}

export default OrderCard;

