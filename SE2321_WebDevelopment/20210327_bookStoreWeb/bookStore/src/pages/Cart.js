import React from 'react';
import '../css/App.css';
import '../css/Cart.css';
import '../components/CartItem'
import CartItem from '../components/CartItem';
import axios from 'axios';
import { useState, useEffect } from 'react';

function formatPrice(price) {
  if (typeof price !== "number") {
    price = Number("aaa") || 0
  }
  price=price/100;
  return "¥" + price.toFixed(2)
}

const castyle = {
  width: 800,
  marginTop: 60,
  textAlign: 'center',
}


export default class Carts extends React.Component {


  constructor() {
    super()
    this.state = {
      books:[],
      totalPrice: 0,
      order_id: 0,
      user_id:1
    }
    if(localStorage.getItem("userId")===null){
      alert("please log in!");
      <script type="text/javascript">
　　function jumurl(){
　　window.location.href = 'http://localhost:3000/login'
　　}
　　setTimeout(jumurl,3000);
　　</script>
    }




    axios({
      method: 'GET',
      url: 'http://localhost:9090/getUserCart',
      params: {
        userId: localStorage.getItem("userId")
      }
  }).then(response => {
    console.log(response.data);
      this.setState({
          books: response.data
      })
  })
  }

  changePage(){
    if(localStorage.getItem("userId")===null){
      <script type="text/javascript">
　　function jumurl(){
　　window.location.href = 'http://localhost:3000/login'
　　}
　　setTimeout(jumurl,3000);
　　</script>
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
                          <td>{item.author}</td>
                          <td>{formatPrice(item.price)}</td>
                          <td>
                            <button onClick={() => this.changeBookCount(index, -1)} style={{ width: '15px' }}
                              disabled={item.number == 1}>-</button>
                            <>{item.number}</>

                            <button onClick={() => this.changeBookCount(index, 1)} style={{ width: '15px' }} >+</button>
                          </td>
                          <td><button onClick={() => this.removeItem(index)} style={{ width: '60px' }} > delete </button></td>
                        </tr>)
                    })
                  }
                </tbody>
              </table>
           
            </div>
 
          </div>
          <div class="col-md-4 summary">
            <div>
              <h5><b>Summary</b></h5>
            </div>

            <div class="row">
           
            </div>

            <form>
              <p>SHIPPING</p> <select>
                <option class="text-muted">Standard-Delivery- ¥0.00</option>
                {/* <option class="text-muted">Fast-Delivery- ¥10.00</option> */}
              </select>
              <p>Remarks to merchants</p> <input type="text" id="grayInput" placeholder="Remarks" />
            </form>

            <div class="row" style={{ color: '#fff', padding: '2vh 0' }}>
              {/* <div class="row" style={{border-top: '1px' solid rgba(0,0,0,.1); padding: 2vh 0;"> */}
              <h4 class="col" id="totalText" style={{ color: '#000' }} >TOTAL PRICE</h4>
              {/* <Button style={{ marginLeft: 550, backgroundColor: 'black' ,color:'white' }}>总价格:{this.getTotalprice()}</Button> */}
              <h4 class="col text-right" style={{ color: '#000' }}  > {this.getTotalprice()}</h4>
            </div>
            <button class="cartBtn" onClick={this.handleCheckOut}>CHECKOUT</button>
          </div>
        </div>
      </div>
    )
  }

  renderNone() {
    return <h2>购物车为空</h2>
  }

  render() {
    const { books } = this.state.books
    var len = this.state.books.length
    return this.renderBooks();
    // return len == 0 ? this.renderNone() : this.renderBooks();
  }
  changeBookCount(index, count) {
    const newBooks = [...this.state.books]
    newBooks[index].number += count
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
      return pre + item.price * item.number
    }, 0)
    this.state.totalPrice = totalPrice
    return formatPrice(totalPrice)
  }

  removeAll(){
    this.setState({
      books:[]
    })
    const url = "http://localhost:9090/clearCart";
    axios.get(url).then((response) => {
      console.log("clear");
      console.log(response);
  })
  }
  getDate(){
    var date = new Date();       
  var mon = date.getMonth() + 1;       
  var day = date.getDate();
  var currDate = date.getFullYear() + "-"+ (mon<10?"0"+mon:mon) + "-"+(day<10?"0"+day:day);
  // console.log(currDate);
  return currDate;
  }

  handleCheckOut = e => {
    e.preventDefault();
    var d=new Date();
    var normalDate=this.getDate();
    if(this.state.totalPrice ===0){
      alert("The shopping cart is empty!");
      return;
    }
    axios({
      method: 'GET',
      url: 'http://localhost:9090/addOrderFromUser',
      params: {
        user_id: localStorage.getItem("userId"),
        order_price:this.state.totalPrice,
        date:normalDate
      }
  }).then(response => {
    console.log("response");
      console.log(response)
      if (response.status === 200) {
        this.state.order_id=response.data.orderId;
        console.log("orderId");
        console.log(this.state.order_id);
        for(var book in this.state.books){
          console.log("book:");
          var i=this.state.books[book];
          console.log(i);
          axios({
            method: 'GET',
            url: 'http://localhost:9090/addOrderItem',
            params: {
              order_id: this.state.order_id,
              book_id:i.bookId,
              book_num:i.number
            }
        }).then(response=>{
          console.log(response.data);
        })
        }
        this.removeAll();
        alert("Place an order successfully.");
      }
  }).catch(error => {
      console.log(error);
  })
};
}
