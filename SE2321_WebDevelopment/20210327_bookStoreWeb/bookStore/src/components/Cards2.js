import React from 'react';
import './Cards.css';
import CardItem from './CardItem';
import SearchBox from './SearchBox'
import Pagination from './Pagination'
import Carousel from "../components/Carousel";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import { Button } from '../components/Button';
import { render } from '@testing-library/react';
import axios from 'axios'


export default class Orders extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      book: [],
      targetBookName: ""
    }
    this.updateInput = this.updateInput.bind(this);
    this.search = this.search.bind(this);



    const url = "http://localhost:9090/getBooks";
    axios.get(url).then((response) => {
      const books = response.data;
      this.setState({
        book: books
      })

      console.log(this.state.book);

    })
  }

  updateInput(e) {
    console.log(e.target.value);

    this.state.targetBookName = e.target.value;
    console.log(this.state.targetBookName);
  }
  search() {
    if (this.state.targetBookName.length == 0) {
      alert("please input target book name!");
      return;
    }
    var allBook = this.state.book;
    var result = [];
    console.log(allBook);
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
              <Button>Reset</Button>
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
          </div>
        </div>
      </div>
    );
  }

}
