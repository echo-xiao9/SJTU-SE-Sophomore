import React from 'react';
import { Link } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';

const useStyles = makeStyles({
  table: {
    minWidth: 300,
    maxWidth:1000
  },
});


export default  function BasicTable(props) {
  const classes = useStyles();

  console.log(props);

  return (
    <TableContainer component={Paper} align="center">
      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell align="center"></TableCell>
            <TableCell align="center">Book Name</TableCell>
            <TableCell align="center">Price &nbsp;/￥</TableCell>
            <TableCell align="center">Number</TableCell>
            {/* <TableCell align="right">Protein&nbsp;(g)</TableCell> */}
          </TableRow>
        </TableHead>
        <TableBody>
          {props.rows.map((row) => (
            <TableRow key={row.book.name}>
              <TableCell component="th" scope="row"align="center">
                {row.book_id}
              </TableCell>
              <TableCell align="center">{row.book.name}</TableCell>
              <TableCell align="center">{row.book.price/100}</TableCell>
              <TableCell align="center">{row.book_num}</TableCell>
              {/* <TableCell align="right">{row.protein}</TableCell> */}
            </TableRow>
          ))}
         </TableBody>

         <TableBody>
          <TableRow component={Paper}>
            <TableCell align="center">Order ID:{props.order_id}</TableCell>
            <TableCell align="center">total prices：{props.orderPrice/100}</TableCell>
            <TableCell align="center">time:{props.date}</TableCell>
            <TableCell align="center">User Id:{props.user_id}</TableCell>
            {/* <TableCell align="right">Protein&nbsp;(g)</TableCell> */}
          </TableRow>

        </TableBody>
      </Table>
      
    </TableContainer>
  
  );
}




