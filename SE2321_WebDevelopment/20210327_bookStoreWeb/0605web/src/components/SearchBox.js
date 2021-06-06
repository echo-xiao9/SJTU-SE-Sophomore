import React from 'react';
import { Link } from 'react-router-dom';

function SearchBox() {
    return (
        <div className='input-areas'>
            <form>
            <input type="text" id="grayInput" placeholder="Search for books!"/>
                {/* <Button buttonStyle='btn--primary'>Subscribe</Button> */}
            </form>
        </div>

    );
}

export default SearchBox;

