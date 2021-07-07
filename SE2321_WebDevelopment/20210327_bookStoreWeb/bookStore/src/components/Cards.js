import React from 'react';
import './Cards.css';
import CardItem from './CardItem';
import SearchBox from './SearchBox'
import Pagination from './Pagination'
import Carousel from "../components/Carousel";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import { Button } from '../components/Button';


function changeTarget(e){

}
function search(){

}

function Cards() {
  let { keyword } = useParams();
  const [books, setBooks] = useState(null);
  useEffect(function effectFunction() {
    async function fetchBooks() {
      const res = await fetch("http://localhost:9090/getBooks");
      if (!res.ok) throw res;
      const json = await res.json();
      if (json.error) throw res;
      setBooks(json);
    }
    fetchBooks();
  }, []);
  var cards;
  if (typeof keyword == "undefined")
    cards =
      books == null
        ? () => <div />
        : Object.values(books).map((i) => (
            <CardItem 
            id={i.bookId} 
            text={i.name} 
            author={i.author} 
            price={i.price} 
            ISBN ={i.isbn} 
            src={i.image} 
            inventory = {i.inventory}
            label={i.type}
            path= '/Book'
            />
          ));
  else
    cards =
      books == null
        ? () => <div />
        : Object.values(books)
            .filter((i) => Object.values(i).join().includes(keyword))
            .map((i) => (
              <CardItem 
              id={i.bookId} 
              text={i.name} 
              author={i.author} 
              price={i.price} 
              ISBN ={i.isbn} 
              src={i.image} 
              inventory = {i.inventory}
              label={i.type}
              path= '/Book'
              />
            ))
  

    return (
        <div className='cards'>
            <h1>Have a look at our best seller!</h1>
            {/* <SearchBox /> */}
            <input type="text" onChange={changeTarget} placeholder="ISBN" ></input>
            <Button onClick={search} > Search</Button>
            <Carousel />
           
            <div className='cards__container' >
                <div className='cards__wrapper' >
                    <ul className='cards__items'>
                    {cards}
                    
                    </ul>
                    <Pagination />
                </div>
            </div>
        </div>
    );
}




export default Cards;