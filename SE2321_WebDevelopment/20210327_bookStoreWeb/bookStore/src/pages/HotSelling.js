import React from 'react';

import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';
import Button from '../components/Button';
import BasicTable from "../components/hotBoard";
import axios from "axios"

export default class HotSelling extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      books:[],
      from:  "2021-04-05",
      to:"2021-05-04"
    }
  
    this.handleFromChange=this.handleFromChange.bind(this);
    this.handleToChange=this.handleToChange.bind(this);
    this.dateSelectBook=this.dateSelectBook.bind(this);


      axios({
        method: 'GET',
        url: 'http://localhost:9090/getHotSelling',
        params: {
          from:this.state.from,
          to:this.state.to
        }
      }).then(response => {
       console.log(response);
        this.state.books=response.data;
      })
    }
    


    handleFromChange(e){
      this.state.from=e.target.value;
    }
    
    handleToChange(e){
      this.state.to=e.target.value;
    }

    
dateSelectBook(){
  // console.log(this.state);

  var allOrders = this.state.newOrders;
  var result = [];
  for (var i in allOrders) {
    // console.log(allOrders[i]);
    var month=allOrders[i].month;
    if(month.length==1)month="0"+month;
    var date= allOrders[i].year+"-"+month+"-"+allOrders[i].day;
    if(date<=this.state.to && date>=this.state.from){
      result.push(allOrders[i]);
    }
  }
  this.setState({
    orders: this.state.orders,
    newOrders: result,
    bookName: this.state.bookName,
    from:this.state.from,
    to:this.state.to
  });
  this.render();
}



  render() {
    // this.logRow();
    return (
      <div>
      
          <h1> Hot Selling Board</h1>
       
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

          <BasicTable
         
            rows={ this.state.books}
          />
  
      </div>
    );
  }
  
}

