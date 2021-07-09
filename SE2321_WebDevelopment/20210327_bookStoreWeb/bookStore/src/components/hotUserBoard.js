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


export default  function BasicTable(props) {
  const classes = useStyles();
  console.log(props);

  return (

    <TableContainer align="center">
      <Table className={classes.table} aria-label="simple table">

        <TableHead>
          <TableRow>
            <TableCell align="center">User Name</TableCell>
            <TableCell align="center">Total Purchase Amount / $</TableCell>
          
          
          </TableRow>
        </TableHead>
        <TableBody>
        {props.rows.map((row) => (
            <TableRow key={row.name}>
           
              <TableCell align="center">{row.name}</TableCell>
              <TableCell align="center">{row.num/100}</TableCell>
              {/* <TableCell align="center">{row.inventory}</TableCell> */}
              {/* <TableCell align="center">{row.num}</TableCell> */}
              {/* <TableCell align="right">{row.protein}</TableCell> */}
            </TableRow>
          ))}
         </TableBody>

   

      </Table>
      
    </TableContainer>
  

  
  );
}




