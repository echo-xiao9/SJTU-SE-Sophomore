


import React from 'react';
import TableContainer from '@material-ui/core/TableContainer';
import TextField from '@material-ui/core/TextField';
import Button from '../components/Button';
import PerchaseExcel from "../components/PerchaseExcel";
import axios from "axios"


export default class HotSelling extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      userHotSelling:[],
      from:  "2021-04-05",
      to:"2021-07-12",
      totalPrice:0,
      totalNum:0
    }
  
    this.handleFromChange=this.handleFromChange.bind(this);
    this.handleToChange=this.handleToChange.bind(this);
    this.getHotUser=this.getHotUser.bind(this);

      axios({
        method: 'GET',
        url: 'http://localhost:9090/getUserHotSelling',
        params: {
          from:this.state.from,
          to:this.state.to,
          user_id:localStorage.getItem('userId')
        }
      }).then(response => {
       console.log(response);
        this.state.userHotSelling=response.data.hotSellingList;
        this.state.totalNum=response.data.totalNum;
        this.state.totalPrice=response.data.totalPrice;
      })
    }

    handleFromChange=(e)=>{
      this.state.from=e.target.value;
    }
    
    handleToChange=(e)=>{
      this.state.to=e.target.value;
    }

    getHotUser=()=>{
      axios({
        method: 'GET',
        url: 'http://localhost:9090/getUserHotSelling',
        params: {
          from:this.state.from,
          to:this.state.to,
          user_id:localStorage.getItem('userId')
        }
      }).then(response => {
        console.log("response data");
        console.log(response.data);
        this.state.userHotSelling=response.data.hotSellingList;
        this.state.totalNum=response.data.totalNum;
        this.state.totalPrice=response.data.totalPrice;
        console.log("userHot");
        console.log(this.state.userHotSelling);
      })
    }

  render() {
    return (
      <div>
          <h1> Perchase Board</h1>
         <TableContainer  align="center" marginTop="10">

        <TextField
          id="date"
          label="From"
          type="date"
          defaultValue="2021-04-05"
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
          defaultValue="2021-07-12"
          onChange={this.handleToChange}
          InputLabelProps={{
            shrink: true,
          }}
        />

        <Button onClick={this.getHotUser}>select</Button>
        </TableContainer>
          <PerchaseExcel
            rows={ this.state.userHotSelling}
            totalPrice={this.state.totalPrice}
            totalNum={this.state.totalNum}
          />
      </div>
    );
  }
  
}

