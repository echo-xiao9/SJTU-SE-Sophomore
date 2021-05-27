import React from 'react';
import '../App.css';
import '../css/Cart.css';
import '../components/CartItem'
import CartItem from '../components/CartItem';
import axios from 'axios';
import {useState, useEffect} from 'react';

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
            <button class="cartBtn" onClick={this.test}>CHECKOUT</button>
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




  test(){
  // super();
  const values = {
    user_id:1,
    order_price: 100
  };

 

    axios({
      method: 'GET',
      url: 'http://localhost:9090/addOrderFromUser',
      params: {
        user_id: 1,
        order_price: 100
      }
    }).then(response =>{
      console.log(response)
    })
    .catch(error => {
      console.log(error)
      console.log("写入order失败！")
      // this.$notify({
      //     title: '提示信息', message: '账号或密码错误', type: 'error'
      // })
  })

  }
}
