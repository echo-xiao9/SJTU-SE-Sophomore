import React from 'react';
import '../css/Cards.css';
import CardItem from './CardItem';
import { Button } from '../components/Button';

import axios from 'axios'
import Carousel from "./Carousel";
import Pagination from"./Pagination";

export default class Orders extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      book: [],
      targetBookName: "",
      page:1
    }
    this.updateInput = this.updateInput.bind(this);
    this.search = this.search.bind(this);
    
    var query = window.location.href;
    console.log(query);
    console.log("props");
    console.log(props);
    this.setState({
      page: props.props
    })
    axios({
      method: 'GET',
      url: 'http://localhost:9090/getBooks',
      params: {
        page:props.props
      }
    }).then(response => {
      const books = response.data;
      this.setState({
        book: books
      })
      console.log(this.state.book);

    })
  }

  reset=()=>{
    console.log("page");
    console.log(this.state.page);
    axios({
      method: 'GET',
      url: 'http://localhost:9090/getBooks',
      params: {
        page:this.state.page
      }
    }).then(response => {
      const books = response.data;
      this.setState({
        book: books
      })
      console.log(this.state.book);
      this.render();
    })
  }

 
  updateInput(e) {
    console.log(e.target.value);

    this.state.targetBookName = e.target.value;
    console.log(this.state.targetBookName);
  }
  search() {
    if (this.state.targetBookName.length === 0) {
      alert("please input target book name!");
      return;
    }
    var allBook = this.state.book;
    var result = [];
    for (var i in allBook) {
      if (allBook[i].name == this.state.targetBookName) {
        result.push(allBook[i]);
        break;
      }
    }

    this.state.book = result;
    this.render();

  }


  render() {
    // this.logRow();
    return (
      <div>
        <div className='cards__container'>
        <h1> Books</h1>
              <input type="text" onChange={this.updateInput} placeholder="Book Name?" ></input>
              <Button onClick={this.search} className="">Search</Button>
              <Button onClick={this.reset}>Reset</Button>
              <Carousel />
          <div className='cards__wrapper'>
            <ul className='cards__items'>
              {this.state.book.map((i) => (
                <CardItem
                  id={i.bookId}
                  text={i.name}
                  author={i.author}
                  price={i.price}
                  ISBN={i.isbn}
                  src={i.image}
                  inventory={i.inventory}
                  label={i.type}
                  path='/Book'
                />
              )
              )}
            </ul>
      
            <Pagination/>
          </div>
        </div>
      </div>
    );
  }

}
