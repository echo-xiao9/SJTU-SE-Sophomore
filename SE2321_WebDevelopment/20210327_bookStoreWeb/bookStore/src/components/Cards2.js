import React from 'react';
import '../css/Cards.css';
import CardItem from './CardItem';
import {Button} from '../components/Button';
import axios from 'axios'
import Carousel from "./Carousel";
import Pagination from "./Pagination";

export default class Orders extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            book: [],
            targetBookName: "",
            page: 1
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
            url: 'http://localhost:9090/books',
            params: {
                page: props.props
            }
        }).then(response => {
            const books = response.data;
            this.setState({
                book: books
            })
            console.log("getBook result:" + response.data);
            console.log(this.state.book);

        })
    }

    reset = () => {
        console.log("page");
        console.log(this.state.page);
        axios({
            method: 'GET',
            url: 'http://localhost:9090/books',
            params: {
                page: this.state.page
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
        axios({
            method: 'GET',
            url: 'http://localhost:9090/books',
            params: {
                query: this.state.targetBookName
            }
        }).then(response => {
            console.log("search result:");
            console.log(response.data);
            this.setState({book: response.data});
            console.log(this.state.book);
        })

    }

    renderBooks() {
        console.log("Books");
        console.log(this.state.book);
        if (!this.state.book) {
            alert("No matching book, please search again.");
            return <h1>No matching book, please search again.</h1>
        } else {
            console.log("Books Xempty ");
            console.log(this.state.book.size);
            return (<div className='cards__wrapper'>
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
            </div>);
        }
    }


    render() {
        // this.logRow();
        return (
            <div>
                <div className='cards__container'>
                    <h1> Books</h1>
                    <input type="text" onChange={this.updateInput} placeholder="search for book"></input>
                    <Button onClick={this.search} className="">Search</Button>
                    <Button onClick={this.reset}>Reset</Button>
                    <Carousel/>
                    {this.renderBooks()}
                </div>
            </div>
        );
    }

}