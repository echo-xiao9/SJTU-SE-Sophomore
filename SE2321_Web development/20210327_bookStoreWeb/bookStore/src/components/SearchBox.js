import React from 'react';
import { Link } from 'react-router-dom';

function SearchBox() {
    return (
        <div className='input-areas'>
            <form>
                <input
                    className='footer-input'
                    name='email'
                    type='email'
                    placeholder='Search for book'
                />
                {/* <Button buttonStyle='btn--primary'>Subscribe</Button> */}
            </form>
        </div>

    );
}

export default SearchBox;

