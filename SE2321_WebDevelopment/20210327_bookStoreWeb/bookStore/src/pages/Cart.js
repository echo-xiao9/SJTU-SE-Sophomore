import React from 'react';
import '../App.css';
import '../css/Cart.css';
import '../components/CartItem'
import CartItem from '../components/CartItem';
import axios from 'axios';


function formatPrice(price) {
  if (typeof price !== "number") {
    price = Number("aaa") || 0
  }
  return "¥" + price.toFixed(2)
}


const castyle = {
  width: 900,
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
        // { id: 2, name: "Three Body", datas: 'CiXing Liu', price: 45, numbers: 1 },
        // { id: 3, name: "Pride and Prejudice", datas: 'Jane Austen', price: 70, numbers: 2 },
        // { id: 4, name: "Steve Jobs", datas: 'Walter Isaacson', price: 115, numbers: 1 },
        // { id: 1, name: "Harry Poter", datas: 'J·K·Rowling', price: 50, numbers: 1 },
        // { id: 2, name: "Three Body", datas: 'CiXing Liu', price: 45, numbers: 1 },
        // { id: 3, name: "Pride and Prejudice", datas: 'Jane Austen', price: 70, numbers: 2 },
        // { id: 4, name: "Steve Jobs", datas: 'Walter Isaacson', price: 115, numbers: 1 },
      ],
    }
    console.log(this.state);
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
                <option class="text-muted">Standard-Delivery- ¥5.00</option>
                <option class="text-muted">Fast-Delivery- ¥10.00</option>
              </select>
              <p>Remarks to merchants</p> <input type="text" id="grayInput" placeholder="Remarks" />
            </form>

            <div class="row" style={{ color: '#fff', padding: '2vh 0' }}>
              {/* <div class="row" style={{border-top: '1px' solid rgba(0,0,0,.1); padding: 2vh 0;"> */}
              <h4 class="col" id="totalText" style={{ color: '#000' }} >TOTAL PRICE</h4>
              {/* <Button style={{ marginLeft: 550, backgroundColor: 'black' ,color:'white' }}>总价格:{this.getTotalprice()}</Button> */}
              <h4 class="col text-right" style={{ color: '#000' }}  > {this.getTotalprice()}</h4>
            </div>
            <button class="cartBtn" onClick={this.checkOut}>CHECKOUT</button>
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


  // public ResponseEntity<Integer> addOrderFromUser (@RequestParam(required = true) String username,
  //                                                    @RequestParam (required = true) String password,
  //                                                    @RequestParam (required = true) Integer id,
  //                                                    @RequestParam (required = true) Integer item_id,
  //                                                    @RequestParam (required = true) Integer book_id,
  //                                                    @RequestParam (required = true) Integer book_cnt) {

  


  async checkOut() {
    const Username = "echo";
    const password= "password";
    const id = 0;
    const item_id=0;
    const book_id=0;
    const book_cnt=2;
    const order = {
      username:"echo", 
      password:"password", 
      id:JSON.stringify(0), 
      item_id:JSON.stringify(0), 
      book_id:JSON.stringify(0), 
      book_cnt:JSON.stringify(1),
    };

    console.log(order);
    const options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(order)
    }
    const response = await fetch('http://localhost:9090/addOrderFromUser', options);
    console.log(response.json())
  };

  test() {
    const username = "echo";
    const password= "password";
    const id = 0;
    const item_id=0;
    const book_id=0;
    const book_cnt=2;
    const order = {username, password, id, item_id, book_id, book_cnt};
    const data = { username: 'example' };
    fetch('http://localhost:9090/addOrderFromUser', {
      method: 'POST', // or 'PUT’ 
      headers: {
      'Content-Type': 'application/json',
    },
      body: JSON.stringify(order),
    })
    .then((response)=> response.json()) 
    .then((data) => {
    console.log('Success:', data);
  })
  .catch((error) => {
    console.error('Error:', error);
  });
  }
}
