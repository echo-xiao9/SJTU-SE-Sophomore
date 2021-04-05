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


// function Carts() {
//   return (

//     <div class="card">
//       <div class="row">
//         <div class="col-md-8 cart">
//           <div class="title">
//             <div class="row">
//               <div class="col">
//                 <h4><b>Shopping Cart</b></h4>
//               </div>
//               <div class="col align-self-center text-right text-muted">3 items</div>
//             </div>
//           </div>
//           <Divider />
//           <div className="card-text">
//             <Link to='/Book'>
//               <div className="portada" id='cartPortada'>
//                 {/* <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: '50%' }} /> */}
//                 <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: 150 }} />
//               </div>
//             </Link>
//             <div className="title-total">
//               {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
//               <h2>Harry Potter (Books 1-7)</h2>
//               <h2 className="orderPrice"> $49.99</h2>
//               <div className="desc">author: J. K. Rowling</div>
//               <div className="actions">
//                 <button>Delete</button>
//                 <button>Add to favorite</button>
//                 <TextField type='number' placeholder="number" />
//               </div>
//             </div>
//           </div>
//           <Divider />
//           <div className="card-text">
//             <Link to='/Book'>
//               <div className="portada" id='cartPortada'>
//                 {/* <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: '50%' }} /> */}
//                 <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: 150 }} />
//               </div>
//             </Link>
//             <div className="title-total">
//               {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
//               <h2>Harry Potter (Books 1-7)</h2>
//               <h2 className="orderPrice"> $49.99</h2>
//               <div className="desc">author: J. K. Rowling</div>
//               <div className="actions">
//                 <button>Delete</button>
//                 <button>Add to favorite</button>
//                 <TextField type='number' placeholder="number" />
//               </div>
//             </div>
//           </div>
//           <Divider />
//           <div className="card-text">
//             <Link to='/Book'>
//               <div className="portada" id='cartPortada'>
//                 {/* <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: '50%' }} /> */}
//                 <img src="images/harryCoverSingle.jpeg" alt="Nature" style={{ width: 150 }} />
//               </div>
//             </Link>
//             <div className="title-total">
//               {/* <div className="title">Harry Potter (Books 1-7)</div>  */}
//               <h2>Harry Potter (Books 1-7)</h2>
//               <h2 className="orderPrice"> $49.99</h2>
//               <div className="desc">author: J. K. Rowling</div>
//               <div className="actions">
//                 <button>Delete</button>
//                 <button>Add to favorite</button>
//                 <TextField type='number' placeholder="number" />
//               </div>
//             </div>
//           </div>
//           <Divider />

//           <div class="back-to-shop">

//             <a href="/">
//               &leftarrow;
//                 </a>
//             <span class="text-muted">Back to shop</span>
//           </div>
//         </div>
//         <div class="col-md-4 summary">
//           <div>
//             <h5><b>Summary</b></h5>
//           </div>

//           <div class="row">
//             <div class="col" style={{ paddingRight: '0px' }}>ITEMS 3</div>
//             <div class="col text-right">&euro; 132.00</div>
//           </div>

//           <form>
//             <p>SHIPPING</p> <select>
//               <option class="text-muted">Standard-Delivery- &euro;5.00</option>
//               <option class="text-muted">Fast-Delivery- &euro;10.00</option>
//             </select>
//             <p>Remarks to merchants</p> <input type="text" id="grayInput" placeholder="Remarks" />
//           </form>

//           <div class="row" style={{ color: '#fff', padding: '2vh 0' }}>
//             {/* <div class="row" style={{border-top: '1px' solid rgba(0,0,0,.1); padding: 2vh 0;"> */}
//             <div class="col">TOTAL PRICE</div>
//             <div class="col text-right">&euro; 137.00</div>
//           </div>
//           <button class="cartBtn">CHECKOUT</button>
//         </div>
//       </div>
//     </div>

//   );
// }

// export default Carts;





// import React from 'react';
// import {fade, makeStyles} from "@material-ui/core/styles";
import { blueGrey } from "@material-ui/core/colors";


function formatPrice(price) {
  if (typeof price !== "number") {
    price = Number("aaa") || 0
  }
  return "¥" + price.toFixed(2)
}


const castyle = {
  width: 850,
  // height: 240,
  // marginLeft: 180,
  marginTop: 60,
  // backgroundColor: blueGrey[50],
  textAlign: 'center',
}


export default class Carts extends React.Component {

  constructor() {
    super()
    this.state = {
      books: [
        { id: 1, name: "Harry Poter", datas: 'J·K·Rowling', price: 50, numbers: 1 },
        { id: 2, name: "Three Body", datas: 'CiXing Liu', price: 45, numbers: 1 },
        { id: 3, name: "Pride and Prejudice", datas: 'Jane Austen', price: 70, numbers: 2 },
        { id: 4, name: "Steve Jobs", datas: 'Walter Isaacson', price: 115, numbers: 1 },
      ],
    }
  }

  renderBooks() {
    return (
      <div class="card">
        <div class="row">
          <div class="col-md-8 cart">
            <div class="title">
              <div class="row">
                <div class="col">
                  <h4><b>Shopping Cart</b></h4>
                </div>
                {/* <div class="col align-self-center text-right text-muted">3 items</div> */}
              </div>
            </div>
            <div style={castyle}>
              <table style={castyle}>
                <thead>
                  <tr>
                    <th></th>
                    <th>Book name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Number</th>
                    <th>Operations</th>
                  </tr>
                </thead>
                <tbody>
                  {
                    this.state.books.map((item, index) => {
                      return (
                        <tr>
                          <td>{index + 1}</td>
                          <td>{item.name}</td>
                          <td>{item.datas}</td>
                          <td>{formatPrice(item.price)}</td>
                          <td>
                            <button onClick={() => this.changeBookCount(index, -1)} style={{ width: '15px' }}
                              disabled={item.numbers == 1}>-</button>
                            <>{item.numbers}</>

                            <button onClick={() => this.changeBookCount(index, 1)} style={{ width: '15px' }} >+</button>

                          </td>
                          <td><button onClick={() => this.removeItem(index)} style={{ width: '60px' }} > delete </button></td>
                        </tr>)
                    })
                  }
                </tbody>
              </table>
              {/* <h2 style={{ marginLeft: 850, backgroundColor: blueGrey[50], }}>总价格:{this.getTotalprice()}</h2> */}
              {/* <Button style={{ marginLeft: 550, backgroundColor: 'black' ,color:'white' }}>总价格:{this.getTotalprice()}</Button> */}
            </div>
            {/* <div class="back-to-shop">

              <a href="/">
                back to shop;
             </a>
        
            </div> */}
          </div>
          <div class="col-md-4 summary">
            <div>
              <h5><b>Summary</b></h5>
            </div>

            <div class="row">
              {/* <div class="col" style={{ paddingRight: '0px' }}>ITEMS 3</div> */}
              {/* <div class="col text-right">&euro; 132.00</div> */}
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
              <h4 class="col" id="totalText" style={{ color: '#000' }} >TOTAL PRICE</h4>
              {/* <Button style={{ marginLeft: 550, backgroundColor: 'black' ,color:'white' }}>总价格:{this.getTotalprice()}</Button> */}
              <h4 class="col text-right" style={{ color: '#000' }}  > {this.getTotalprice()}</h4>
            </div>
            <button class="cartBtn">CHECKOUT</button>
          </div>
        </div>
      </div>
    )
  }

  renderNone() {
    return <h2>购物车为空</h2>
  }

  render() {
    const { books } = this.state
    return books.length == 0 ? this.renderNone() : this.renderBooks()
  }
  changeBookCount(index, count) {
    const newBooks = [...this.state.books]
    newBooks[index].numbers += count
    this.setState({
      books: newBooks
    })
  }
  removeItem(index) {
    this.setState({
      books: this.state.books.filter((item, indey) => index != indey)
    })
  }
  getTotalprice() {
    let totalPrice = this.state.books.reduce((pre, item) => {
      return pre + item.price * item.numbers
    }, 0)
    return formatPrice(totalPrice)
  }
}
