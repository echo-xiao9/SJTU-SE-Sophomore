import React, { Component } from "react";
import ReactDOM from "react-dom";
import BasicTable from "../components/OrderCard"
import axios from "axios"
import { Link } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';
import Button from '../components/Button'
import TableContainer from '@material-ui/core/TableContainer';
import Paper from '@material-ui/core/Paper';

export default class Orders extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      orders: [],
      newOrders: [],
      bookName: "",
      from: "2021-05-4",
      to: "2021-06-11"
    }

    axios({
      method: 'GET',
      url: 'http://localhost:9090/getUserOrders',
      params: {
        user_id:localStorage.getItem("userId")
      }
    }).then(response => {
      console.log(response.data);
      this.componentDidMount(response.data);
      this.state.orders=response.data;
      this.setState({
        orders: response.data,
        newOrders: this.state.newOrders,
        bookName: this.state.bookName,
        from: this.state.from,
        to: this.state.to
      })
    })

    this.updateInput = this.updateInput.bind(this);
    this.search = this.search.bind(this);
    this.reset = this.reset.bind(this);
    this.handleFromChange = this.handleFromChange.bind(this);
    this.handleToChange = this.handleToChange.bind(this);
    this.dateSelectBook = this.dateSelectBook.bind(this);
  }

  processData() {
    this.state.orders.map((line) => {
      var lineRow = new Array();

      axios({
        method: 'GET',
        url: 'http://localhost:9090/getOrderItems',
        params: {
          order_id: line[5]
        }
      }).then(response => {
        var row = response.data;
        var singleOrder = this.createOrderData(line[0], line[1], line[2], line[3], line[4], line[5], row);
     
        this.state.newOrders.push(singleOrder);
        this.setState({
          orders: this.state.orders,
          newOrders: this.state.newOrders,
          bookName: this.state.bookName,
          from: this.state.from,
          to: this.state.to
        });
      })
    })
  }


  createOrderData(orderPrice, user_id, year, month, day, order_id, row) {
    return { orderPrice, user_id, year, month, day, order_id, row };
  }



  updateInput(event) {
    this.setState({
      orders: this.state.orders,
      newOrders: this.state.newOrders,
      bookName: event.target.value,
      from: this.state.from,
      to: this.state.to
    });
  }

  search() {
    if (this.state.bookName.length === 0) {
      alert("please input target book name!");
      return;
    }

    axios({
      method: 'GET',
      url: 'http://localhost:9090/getUserBookOrders',
      params: {
        user_id:localStorage.getItem("userId"),
        bookName: this.state.bookName
      }
    }).then(response => {
      console.log("response data");
      console.log(response.data);
      this.setState({orders:response.data});
      console.log(this.state.orders);
    })
  }

  reset() {
    axios({
      method: 'GET',
      url: 'http://localhost:9090/getUserOrders',
      params: {
        user_id:localStorage.getItem("userId")
      }
    }).then(response => {
      const data = response.data;
      this.setState({
        orders: data,
        newOrders: this.state.newOrders,
        bookName: this.state.bookName,
        from: this.state.from,
        to: this.state.to
      })
      this.updateInput = this.updateInput.bind(this);
      this.search = this.search.bind(this);
    })

    this.render();
  }

  useStyles = makeStyles((theme) => ({
    container: {
      display: 'flex',
      flexWrap: 'wrap',
    },
    textField: {
      marginLeft: theme.spacing(1),
      marginRight: theme.spacing(1),
      width: 200,
    },
  }));




  handleFromChange(e) {
    this.setState({
      orders: this.state.orders,
      newOrders: this.state.newOrders,
      bookName: this.state.bookName,
      from: e.target.value,
      to: this.state.to
    })
  }

  handleToChange(e) {
    this.setState({
      orders: this.state.orders,
      newOrders: this.state.newOrders,
      bookName: this.state.bookName,
      from: this.state.from,
      to: e.target.value
    })
   
  }

  dateSelectBook() {
    var allOrders = this.state.orders;
    var result = [];
  
    var i;
    var to=this.state.to;
    var arr=to.split("-");
    for(i=1;i<=2;i++)if(arr[i].length===1)arr[i]="0"+arr[i];
    var newTo=arr[0]+'-'+arr[1]+'-'+arr[2];

    var from=this.state.from;
    var arr2=from.split("-");
    for(i=1;i<=2;i++)if(arr2[i].length===1)arr2[i]="0"+arr2[i];
    var newFrom=arr2[0]+'-'+arr2[1]+'-'+arr2[2];
    console.log("select");
    axios({
      method: 'GET',
      url: 'http://localhost:9090/getUserDateOrder',
      params: {
        user_id:localStorage.getItem("userId"),
        from:newFrom,
        to:newTo
      }
    }).then(response => {
      console.log("response");
      console.log(response.data);
      this.setState({orders:response.data})
    })
    
    console.log("result");
    console.log(result);
    console.log("orders");

    // setTimeout(function(){
    //   this.setState({orders:result});
    //   console.log(this.state.orders);
    // },100);
    // this.render();
    this.componentDidMount(result);
    console.log(this.state.orders);
  }

  componentDidMount(result) {
    this.setState({orders: result},()=>{
    console.log(this.state.orders);//该是啥就是是啥
    });
  }
  renderTable(){
    if(this.state.orders!=null){return(
        this.state.orders.map((obj) => (
          <BasicTable
            orderPrice={obj.order_price}
            user_id={localStorage.getItem("userId")}
            date={obj.date}
            order_id={obj.orderId}
            rows={obj.orderItemList}
          />
        )
        ))
        }
  }

  render() {
    // this.logRow();
    return (
      <div>
        <h1> Order</h1>
        <TableContainer align="center" marginTop="10">
        <input type="text" onChange={this.updateInput} placeholder="Book Name?" ></input>
        <Button onClick={this.search} className="">Search</Button>
        <Button onClick={this.reset}>Reset</Button>
        </TableContainer>
        <TableContainer align="center" marginTop="10">
          <TextField
            id="date"
            label="From"
            type="date"
            defaultValue="2021-05-04"
            InputLabelProps={{
              shrink: true,
            }}
            onChange={this.handleFromChange}
          />

          <TextField
            id="date"
            label="To"
            type="date"
            ref="myField"
            defaultValue="2021-06-11"
            onChange={this.handleToChange}
            InputLabelProps={{
              shrink: true,
            }}

          />
          <Button onClick={this.dateSelectBook}>select</Button>
        
        </TableContainer>
        {this.renderTable}
        {console.log(this.state.orders)}

      </div>
    );
  }

}
