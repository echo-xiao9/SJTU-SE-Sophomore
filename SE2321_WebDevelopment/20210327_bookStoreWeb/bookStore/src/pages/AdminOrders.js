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


export default class Orders extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      orders: [],
      newOrders: [],
      bookName: "",
      from:  "2021-05-03",
      to:"2021-06-20"
    }

    const url = "http://localhost:9090/getOrders";
    axios.get(url).then((response) => {
      const data = response.data;
      this.setState({
        orders: data
      })

      console.log(this.state.orders);
      // this.processData();
      this.updateInput=this.updateInput.bind(this);
      this.search = this.search.bind(this);
      this.reset = this.reset.bind(this);
      this.handleFromChange=this.handleFromChange.bind(this);
      this.handleToChange=this.handleToChange.bind(this);
      this.dateSelectBook=this.dateSelectBook.bind(this);
    })
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
          from:this.state.from,
          to:this.state.to
        });

        console.log(this.state.bookName);
      })
    })
    // console.log(this.state.newOrders);

  }


  createOrderData(orderPrice, user_id, year, month, day, order_id, row) {
    return { orderPrice, user_id, year, month, day, order_id, row };
  }



  fetchData() {
    const url = "http://localhost:9090/getOrders";
    axios.get(url).then((response) => {
      const data = response.data;
      return data;
    })
  }
  updateInput = (event) => {
    // this.state.bookName=event.target.value;
    this.setState({bookName:event.target.value});
    console.log(event.target.value);
    // console.log(event.target.value);
  }

  search=()=> {
    if (this.state.bookName.length === 0) {
      alert("please input target book name!");
      return;
    }

    axios({
      method: 'GET',
      url: 'http://localhost:9090/getAdminBookOrders',
      params: {
        bookName: this.state.bookName
      }
    }).then(response => {
      console.log("response data");
      console.log(response.data);
      this.setState({orders:response.data});
      console.log(this.state.orders);
    })
  }





  reset=()=> {
    const url = "http://localhost:9090/getOrders";
    axios.get(url).then((response) => {
      const data = response.data;
      console.log("reset");
      console.log(response.data);
      this.setState({
        orders: data,
        newOrders: this.state.newOrders,
        bookName: this.state.bookName,
        from:this.state.from,
        to:this.state.to
      })
      console.log("orders");
      console.log(this.state.orders);
      this.processData();
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

handleFromChange=(e)=>{
  this.setState({
    from:e.target.value
  })
  console.log(this.state.from);
}

handleToChange=(e)=>{
  this.setState({
    
    to:e.target.value
  })
  console.log(this.state.to);
}

dateSelectBook=()=>{
  var i;
  var to=this.state.to;
  var arr=to.split("-");
  for(i=1;i<=2;i++)if(arr[i].length===1)arr[i]="0"+arr[i];
  var newTo=arr[0]+'-'+arr[1]+'-'+arr[2];

  var from=this.state.from;
  var arr2=from.split("-");
  for(i=1;i<=2;i++)if(arr2[i].length===1)arr2[i]="0"+arr2[i];
  var newFrom=arr2[0]+'-'+arr2[1]+'-'+arr2[2];

  axios({
    method: 'GET',
    url: 'http://localhost:9090/getAdminDateOrder',
    params: {
      from:newFrom,
      to:newTo
    }
  }).then(response => {
    console.log("response data");
    console.log(response.data);
    this.setState({orders:response.data});
    console.log(this.state.orders);
  })
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
          defaultValue="2021-05-03"
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
          defaultValue="2021-06-20"
          onChange={this.handleToChange}
          InputLabelProps={{
            shrink: true,
          }}

        />
        <Button onClick={this.dateSelectBook}>select</Button>
        </TableContainer>
        {this.state.orders.map((obj) => (
          <BasicTable
            orderPrice={obj.order_price}
            user_id={obj.userId}
            date={obj.date}
            order_id={obj.orderId}
            rows={obj.orderItemList}
          />
          
        )
        )}

      </div>
    );
  }

}
