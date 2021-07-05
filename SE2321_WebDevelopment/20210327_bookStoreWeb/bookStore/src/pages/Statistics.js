


import React from 'react';

import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';
import Button from '../components/Button';
import PerchaseExcel from "../components/PerchaseExcel";
import axios from "axios"

export default class Statistics extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      books:[],
      from:  "2021-04-05",
      to:"2021-05-04",
      totalPrice:0,
      totalBook:0
    }
    this.handleToChange=this.handleToChange.bind(this);
    this.handleFromChange=this.handleFromChange.bind(this);
    this.processData=this.processData.bind(this);
    this.dateSelectBook=this.processData.bind(this);
      axios({
        method: 'GET',
        url: 'http://localhost:9090/getHotSelling',
        params: {
          from:this.state.from,
          to:this.state.to,
          user_id:localStorage.getItem('userId')
        }
      }).then(response => {
       console.log(response);
        this.state.books=response.data;
      })
    }
    
  processData(){
    this.state.totalBook=0;
    this.state.totalPrice=0;
    this.state.books.map((book)=>{
      this.state.totalBook+=parseInt(book.inventory);
      this.state.totalPrice+=parseInt(book.price)*parseInt(book.inventory);
    })
  }

  dateSelectBook(){
    axios({
      method: 'GET',
      url: 'http://localhost:9090/getHotSelling',
      params: {
        from:this.state.from,
        to:this.state.to,
        user_id:localStorage.getItem('userId')
      }
    }).then(response => {
     console.log(response);
      this.state.books=response.data;
    })
    this.processData();
    this.render();
  }


  handleFromChange(e){
    this.state.from=e.target.value;
  }
  
  handleToChange(e){
    this.state.to=e.target.value;
  }

  render() {
    // this.logRow();
    return (
      <div>
      
          <h1> Purchases</h1>
       
          <Grid container justify="space-around"  style={{ width: '100vh' }}>
      
        <TextField
          id="date"
          label="From"
          type="date"
          defaultValue="2021-05-10"
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
        </Grid>

          <PerchaseExcel
         
            rows={ this.state.books}
          />
        <h4>The Total book number:{this.state.totalBook}</h4>
        <h4>The total price:{this.state.totalPrice/100}¥</h4>
      </div>
    );
  }
  
}

