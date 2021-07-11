import React from 'react';
import { Link } from 'react-router-dom';
import '../css/SearchBox.css';


function SearchBox() {
    return (
        <div className='input-areas'>
            <form>
            <input type="text" id="grayInput" placeholder="Search for books!"/>
            </form>
        </div>
    );
}

export default SearchBox;

