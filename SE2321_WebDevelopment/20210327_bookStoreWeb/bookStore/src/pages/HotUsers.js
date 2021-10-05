import React from 'react';

import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';
import Button from '../components/Button';
import BasicTable from "../components/hotUserBoard";
import axios from "axios"
import TableContainer from '@material-ui/core/TableContainer';

export default class HotUsers extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      hotSelling:[],
      from:  "2021-04-05",
      to:"2021-12-12"
    }
  
    this.handleFromChange=this.handleFromChange.bind(this);
    this.handleToChange=this.handleToChange.bind(this);
    this.getHotUser=this.getHotUser.bind(this);

      axios({
        method: 'GET',
        url: 'http://localhost:9090/getHotUsers',
        params: {
          from:this.state.from,
          to:this.state.to
        }
      }).then(response => {
       console.log(response);
       this.setState({hotSelling:response.data})
      
      })
    }

    handleFromChange=(e)=>{
      this.setState({from:e.target.value});
    }
    
    handleToChange=(e)=>{
      this.setState({to:e.target.value});
    }

    

    getHotUser=()=>{
       axios({
        method: 'GET',
        url: 'http://localhost:9090/getHotUsers',
        params: {
          from:this.state.from,
          to:this.state.to
        }
      }).then(response => {
       console.log(response);
       this.setState({users:response.data})
      })
    }
    
    

  render() {
    return (
      <div>
          <h1> Hot User Board</h1>
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
          defaultValue="2021-12-12"
          onChange={this.handleToChange}
          InputLabelProps={{
            shrink: true,
          }}

        />
        <Button onClick={this.getHotUser}>select</Button>
        </TableContainer>
          <BasicTable
            rows={ this.state.hotSelling}
          />
  
      </div>
    );
  }
  
}

