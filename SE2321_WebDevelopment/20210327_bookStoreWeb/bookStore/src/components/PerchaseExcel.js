import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';


const useStyles = makeStyles({
  table: {
    minWidth: 300,
    maxWidth:1000
  },
});


export default  function PerchaseExcel(props) {
  const classes = useStyles();
  console.log("props");
  console.log(props);

  return (

    <TableContainer align="center">
      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell align="center">Book Name</TableCell>
            <TableCell align="center">Number</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
        {props.rows.map((row) => (
            <TableRow key={row.name}>
              <TableCell align="center">{row.name}</TableCell>
              <TableCell align="center">{row.num}</TableCell>
              {/* <TableCell align="right">{row.protein}</TableCell> */}
            </TableRow>
          ))}
         </TableBody>
      </Table>


      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell align="center">Total Price /$ </TableCell>
            <TableCell align="center">Total Number</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
            <TableRow >
              <TableCell align="center">{props.totalPrice/100}</TableCell>
              <TableCell align="center">{props.totalNum}</TableCell>
              {/* <TableCell align="right">{row.protein}</TableCell> */}
            </TableRow>
  
         </TableBody>
      </Table>

      
    </TableContainer>
  

  
  );
}




