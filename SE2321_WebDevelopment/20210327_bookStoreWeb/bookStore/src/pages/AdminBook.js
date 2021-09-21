import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import '../css/Admin.css';
import { Button } from '../components/Button';
import { BrowserRouter, Route, Link } from "react-router-dom";
import { render } from '@testing-library/react';
import Navbar from '../components/Navbar';
import axios from 'axios';

// const headers = ["isbn", "name", "type", "author","price", "description","inventory", "image"];
const data = [];
// const headers = ["Book id", "ISBN", "Name", "Type", "Author", "Price", "description", "Inventory", "image"];

export default class Excel extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      data: [],
      deleteTarget:[],
      sortby: null,
      descending: false,
      edit: null, // [row index, cell index],
      search: false,
      preSearchData: null,
      headers: ["Book id", "ISBN", "Name", "Type", "Author", "Price/￥", "Inventory", "Image", "Description"],
      newBook:['1','989-9799-98','BookName','noval','alice','2000','200','images/xx.png','good'],
      
    };
    
    this.getBooks();
    // this.addBookId = this.addBookId.bind(this);
    this.addBookISBN = this.addBookISBN.bind(this);
    this.addBookName = this.addBookName.bind(this);
    this.addBookType = this.addBookType.bind(this);
    this.addBookAuthor = this.addBookAuthor.bind(this);
    this.addBookPrice = this.addBookPrice.bind(this);
    this.addBookInventory = this.addBookInventory.bind(this);
    this.addBookImage = this.addBookImage.bind(this);
    this.addBookDescription = this.addBookDescription.bind(this);
    this.saveNewBook = this.saveNewBook.bind(this);
    this.changeDeleteTarget=this.changeDeleteTarget.bind(this);
    this.deleteBook=this.deleteBook.bind(this);
  }

  sort = (e) => {
    let column = e.target.cellIndex;
    let data = this.state.data.slice();
    let descending = this.state.sortby === column && !this.state.descending;
    data.sort(function (a, b) {
      return descending
        ? (a[column] < b[column] ? 1 : -1)
        : (a[column] > b[column] ? 1 : -1);
    });
    this.setState({
      data: data,
      sortby: column,
      descending: descending,
    });
  };

  showEditor = (e) => {
    this.setState({
      edit: {
        row: parseInt(e.target.dataset.row, 10),
        cell: e.target.cellIndex,
      }
    });
  };

  save = (e) => {
    e.preventDefault();
    let input = e.target.firstChild;
    let data = this.state.data.slice();
    data[this.state.edit.row][this.state.edit.cell] = input.value;
  
      axios({
        method: 'GET',
        url: 'http://localhost:9090/changeBook',
        params: {
            id:data[this.state.edit.row][0],
            isbn:data[this.state.edit.row][1],
            name:data[this.state.edit.row][2],
            type:data[this.state.edit.row][3],
            author:data[this.state.edit.row][4],
            price:data[this.state.edit.row][5],
            description:data[this.state.edit.row][8],
            inventory:data[this.state.edit.row][6],
            image:data[this.state.edit.row][7]
        }
    }).then(response => {
        console.log(response);
    })
    

  };

  toggleSearch = () => {
    if (this.state.search) {
      this.setState({
        data: this.preSearchData,
        search: false,
      });
      this.preSearchData = null;
    } else {
      this.preSearchData = this.state.data;
      this.setState({
        search: true,
      });
    }
  };

  updateInput=(event) =>{
    this.setState({
      bookName: event.target.value
    });
  }

  search = (e) => {
    let needle = e.target.value.toLowerCase();
    if (!needle) {
      this.setState({ data: this.preSearchData });
      return;
    }
    let idx = e.target.dataset.idx;
    let searchdata = this.preSearchData.filter(function (row) {
      return row[idx].toString().toLowerCase().indexOf(needle) > -1;
    });
    this.setState({ data: searchdata });
  };

  download(format, ev) {
    let contents = format === 'json'
      ? JSON.stringify(this.state.data)
      : this.state.data.reduce(function (result, row) {
        return result
          + row.reduce(function (rowresult, cell, idx) {
            return rowresult
              + '"'
              + cell.replace(/"/g, '""')
              + '"'
              + (idx < row.length - 1 ? ',' : '');
          }, '')
          + "\n";
      }, '');

    let URL = window.URL || window.webkitURL;
    let blob = new Blob([contents], { type: 'text/' + format });
    ev.target.href = URL.createObjectURL(blob);
    ev.target.download = 'data.' + format;
  };

  getBooks = () => {
    fetch("http://localhost:9090/adminBook")
      .then(response => response.json())
      .then(data => {
        this.setState({
          data: data
        });
        // console.log(this.state.data);
      }).catch(function (ex) {
        console.log('parsing failed', ex)
      })
  }

  saveBooks = () => {
    fetch("http://localhost:9090/adminBook")
      .then(response => response.json())
      .then(data => {
        this.setState({
          data: data
        });

      }).catch(function (ex) {
        console.log('parsing failed', ex)
      })
  }
  
  addBookId=(e)=>{
    this.state.newBook[0]=e.target.value;
  }
  addBookISBN=(e)=>{
    this.state.newBook[1]=e.target.value;
  }
  addBookName=(e)=>{
    this.state.newBook[2]=e.target.value;
  }
  addBookType=(e)=>{
    this.state.newBook[3]=e.target.value;
  }
  addBookAuthor=(e)=>{
    this.state.newBook[4]=e.target.value;
  }
  addBookPrice=(e)=>{
    this.state.newBook[5]=e.target.value;
    console.log(this.state.newBook[5]);
  }
  addBookInventory=(e)=>{
    this.state.newBook[6]=e.target.value;
  }
  addBookImage=(e)=>{
    this.state.newBook[7]=e.target.value;
    // console.log(this.state.newBook);
  }
  addBookDescription=(e)=>{
    this.state.newBook[8]=e.target.value;
    // console.log(this.state.newBook);
  }

  saveNewBook=()=>{

    let newBook =  this.state.newBook.slice();
    newBook[0]= String(this.state.data.length+1);
    this.state.data.push(newBook);
    console.log("newBook:");
    // console.log(newBook);
    // console.log("data");
    // console.log(this.state.data);
    this.render();
    axios({
      method: 'GET',
      url: 'http://localhost:9090/addBook',
      params: {
        isbn:newBook[1],
        name:newBook[2],
        type:newBook[3],
        author:newBook[4],
        price:parseInt(newBook[5]),
        inventory:parseInt(newBook[6]),
        image:newBook[7],
        description:newBook[8]
      }
  }).then(response => {
      console.log(response);
      alert("The administrator has successfully added a book named "+newBook[2]);
  })
  }

  changeDeleteTarget=(e)=>{
    this.state.deleteTarget=e.target.value;
  }

  deleteBook(){
    var flag=0;
    console.log("delete");
    console.log(this.state.deleteTarget);
    for(var i in this.state.data){
      var book=this.state.data[i];
      if(book[0]===this.state.deleteTarget){
        flag=1;
        console.log(book);
        console.log(this.state.data);
        console.log(i);
        this.state.data.splice(i,1);
        break;
      }
    }
    // console.log(this.state.data);
    console.log("target:");
    console.log(this.state.deleteTarget);
    if(flag===1){
      axios({
        method: 'GET',
        url: 'http://localhost:9090/deleteBook',
        params: {
          bookId:this.state.deleteTarget
        }
    }).then(response => {
        console.log(response);
        alert("The administrator has successfully deleted a book named "+ response.data.name);
    })


    }

    this.render();
  }

  renderSaveInput() {
    // if(this.state.save==1)
    return (
      <>
      <table>
        <tr>
        <input type="text" onChange={this.updateInput} placeholder="Book Name?" ></input>
        {/* <input type="text" onChange={this.addBookId} placeholder="Book id" ></input> */}
        <input type="text" onChange={this.addBookISBN} placeholder="ISBN" ></input>
        <input type="text" onChange={this.addBookName} placeholder="Name" ></input>
        <input type="text" onChange={this.addBookType} placeholder="Type" ></input>
        <input type="text" onChange={this.addBookAuthor} placeholder="Author" ></input>
        </tr>
        <tr>
        <input type="text" onChange={this.addBookPrice} placeholder="Price" ></input>
        <input type="text" onChange={this.addBookInventory} placeholder="Inventory" ></input>
        <input type="text" onChange={this.addBookImage} placeholder="Image" ></input>
        <input type="text" onChange={this.addBookDescription} placeholder="Description" ></input>
       
         </tr>
         <Button onClick={this.saveNewBook} > Add new Book</Button>
        </table>
        <table>
        <input type="text" onChange={this.changeDeleteTarget} placeholder="book id" ></input>

        <Button onClick={this.deleteBook} > Delete </Button>
        </table>

      </>
    )
  }


  render = () => {
    return (
      <div>
        <h1>Book Information</h1>
     
        {this.renderToolbar()}
        {this.renderSaveInput()
        }
        {this.renderTable()}
      </div>
    );
  };

  renderToolbar = () => {
    return (
      <div className="toolbar">

        <button onClick={this.getBooks}>Get Books</button>
        <button onClick={this.toggleSearch}>Search</button>
        <a onClick={this.download.bind(this, 'json')}
          href="data.json">Export JSON</a>
        <a onClick={this.download.bind(this, 'csv')}
          href="data.csv">Export CSV</a>
      </div>
    );
  };

  renderSearch = () => {
    if (!this.state.search) {
      return null;
    }
    return (
      <tr onChange={this.search}>
        {this.state.headers.map(function (ignore, idx) {
          return <td key={idx}><input type="text" data-idx={idx} /></td>;
          // return <td key={idx}><input /></td>;
        })}
      </tr>
    );
  };
  renderLine = (idx, rowidx, content) => {

    // if (!this.state.search) {
    //     return null;
    // }
    return (
      <td key={idx} data-row={rowidx}>{content}</td>);
  }

  renderTable = () => {
    return (
      <table>
        <thead onClick={this.sort}>
          <tr>{
            this.state.headers.map(function (title, idx) {
              if (this.state.sortby === idx) {
                title += this.state.descending ? ' \u2191' : ' \u2193';
              }
              return <th key={idx}>{title}</th>;
            }, this)
          }</tr>
        </thead>

        <tbody onDoubleClick={this.showEditor}>
          {this.renderSearch()}
          {this.state.data.map(function (row, rowidx) {
            return (
              <tr key={rowidx}>{
                row.map(function (cell, idx) {
                  let content = cell;
                  let edit = this.state.edit;
                  if (edit && edit.row === rowidx && edit.cell === idx) {
                    content = (
                      <form onSubmit={this.save}>
                        <input type="text" defaultValue={cell} />
                      </form>

                    );
                  }
                  console.log("content");
                  console.log(rowidx);
                  console.log(idx);
                  console.log(content);
                  this.renderLine(idx, rowidx, content);
                  if(idx===7){
                      return(
                        <div className="adminImage">
                          <td className="adminImageWrapper" key={idx} data-row={rowidx}>{content}</td>
                          <img src={content} alt='book image' className="adminImage" />
                          
                        </div>
                      )
                  }
                  return <td key={idx} data-row={rowidx}>{content}</td>
                }, this)}
              </tr>
            );
          }, this)}
        </tbody>
      </table>
    );
  }
};





// Excel
//     .propTypes = {
//     headers: PropTypes.arrayOf(
//         PropTypes.string
//     ),
//     initialData: PropTypes.arrayOf(
//         PropTypes.arrayOf(
//             PropTypes.string
//         )
//     ),
// };

// function AdminBook1() {
//     return (
//         ReactDOM.render(
//             React.createElement(Excel, {
//                 headers: headers,
//                 initialData: data
//             }),
//             document.getElementById("root")
//         )
//     );
// }

// export default class  AdminBook extends React.Component {
//   constructor(props){
//     super(props);
//     this.state={}
//   }
//   render(){
//   return(
//     <div>
//      <Excel/>
//     </div>
//   );
// }
// }
