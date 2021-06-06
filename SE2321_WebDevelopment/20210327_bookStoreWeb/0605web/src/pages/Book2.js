import React from 'react';
import '../css/Book.css';
import '../css/w3.css'
import Button from '../components/Button';

function Book() {
  return (
    <div>
      {/* <title>W3.CSS Template</title>
      <meta charSet="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway" /> */}
      <style dangerouslySetInnerHTML={{ __html: "\nbody,h1,h2,h3,h4,h5 {font-family: \"Raleway\", sans-serif}\n" }} />
      {/* w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example */}
      <div className="w3-content" style={{ maxWidth: '1200px' }}>
        {/* Header */}
        <header className="w3-container w3-center w3-padding-32">
          <h1><b>Three Body </b></h1>
          <p> <span className="w3-tag">Science Fiction</span></p>
        </header>
        {/* Grid */}
        <div className="w3-row">
          {/* Blog entries */}
          <div className="w3-col l8 s12">
            {/* Blog entry */}
            <div className="w3-card-4 w3-margin w3-white" style={{ maxWidth: '1400px' }}>
              <img src="images/harryCover.jpg" alt="Nature" style={{ width: '100%' }} />
              <div className="w3-container">
                <h3><b>Three Body </b></h3>
                <h5> Liu Cixin <span className="w3-opacity">July 1, 2009</span></h5>
              </div>

              <div className="w3-container">
                <p>Best science fiction in the word!
                </p>
                <Button />
                  
                <div className="w3-row">
                  <div className="w3-col m8 s12">
                    <p>
                      <button className="w3-button w3-white  "><b>Price: $49.99</b></button>
                      <button className="w3-button w3-white w3-border"><b>Add to cart »</b></button>
                    </p>
                  </div>
                  <div className="w3-col m4 w3-hide-small">
                  <button className="w3-button w3-white w3-border"><b>Comment</b></button>
                  </div>
                </div>
              </div>
            </div>
            
            <hr />
            {/* Blog entry */}
            <div className="w3-card-4 w3-margin w3-white">
              <img src="images/jk-rowling.jpg" alt="Norway" style={{ width: '100%' }} />
              <div className="w3-container">
                <h3><b>Editorial Reviews</b></h3>
                <h5>About the Author  J.K. Rowling </h5>
              </div>
              <div className="w3-container">
                <h7>
                J.K. Rowling is the author of the seven Harry Potter books, first published between 1997 and 2007. The adventures of Harry, 
                Ron, and Hermione at Hogwarts School of Witchcraft and Wizardry have sold over 500 million copies, been translated into over 
                80 languages, and made into eight blockbuster films. Alongside the book series, she has written three short companion volumes 
                for charity, including Fantastic Beasts and Where to Find Them, which later became the inspiration for a new series of films, 
                also written by J.K. Rowling. She then continued Harry’s story as a grown-up in a stage play, Harry Potter and the Cursed Child, 
                which she wrote with playwright Jack Thorne and director John Tiffany, and which has been playing to great acclaim in theatres 
                in Europe, North America, and Australia.
J.K. Rowling has received many awards and honors for her writing. She also supports a number of causes through her charitable trust, Volant, 
and is the founder of the children’s charity Lumos, which fights for a world without orphanages and institutions, and reunites families.
For as long as she can remember, J.K. Rowling has wanted to be a writer, and is at her happiest in a room, making things up. She lives in Scotland 
with her family.
                </h7>
                <div className="w3-row">
                  <div className="w3-col m8 s12">
                  <button className="w3-button w3-white w3-border"><b>Follow »</b></button>
                  </div>
                  <div className="w3-col m4 w3-hide-small">
                  <button className="w3-button w3-white "><b>Add to cart »</b></button>
                  </div>
                </div>
              </div>
            </div>
            {/* END BLOG ENTRIES */}
          </div>
          {/* Introduction menu */}

          <div className="w3-col l4">
            {/* About Card */}
            <div className="w3-card w3-margin w3-margin-top">
              <img src="images/harryPoster.jpg" style={{ width: '100%' }} />
              
              <div className="w3-container w3-white">
                <h4><b>Product details</b></h4>
                <h6><b>Publisher :</b> Arthur A. Levine Books; Slp edition (July 1, 2009)</h6>
                <h6><b>  Language :</b> English</h6>
                <h6><b> Paperback :</b> 4167 </h6>
                 <h6><b> pagesISBN-10 :</b> 0545162076ISBN-13 : 978-0545162074</h6>
                <h6> <b> Reading age :</b> 8 years and up</h6>
                <h6> <b> Grade level :</b> 4 - 6</h6>
                <h6><b> Item Weight : </b>6.44 pounds</h6>
                <h6> <b> Dimensions :</b> 10.6 x 8.5 x 5.5 inches</h6>

                
              </div>
            </div><hr />
            {/* Posts */}
            <div className="w3-card w3-margin">
              <div className="w3-container w3-padding">
                <h4>Customers who viewed this item also viewed</h4>
              </div>
              <ul className="w3-ul w3-hoverable w3-white">
                <li className="w3-padding-16">
                  <img src="images/harry2.jpg" alt="Image" className="w3-left w3-margin-right" style={{ width: '50px' }} />
                  <span className="w3-large">Harry Potter: Illustrated Collection</span><br />
                  <h5>Jim Kay</h5>
                </li>
                <li className="w3-padding-16">
                  <img src="images/harry2.jpg"alt="Image" className="w3-left w3-margin-right" style={{ width: '50px' }} />
                  <span className="w3-large">Ipsum</span><br />
                  <h5>Praes tinci sed</h5>
                </li>
                <li className="w3-padding-16">
                  <img src="images/harry2.jpg" alt="Image" className="w3-left w3-margin-right" style={{ width: '50px' }} />
                  <span className="w3-large">Dorum</span><br />
                  <h5>Ultricies congue</h5>
                </li>
                <li className="w3-padding-16 w3-hide-medium w3-hide-small">
                  <img src="images/harry2.jpg" alt="Image" className="w3-left w3-margin-right" style={{ width: '50px' }} />
                  <span className="w3-large">Mingsum</span><br />
                  <h5>Lorem ipsum dipsum</h5>
                </li>
              </ul>
            </div>
            <hr />
            {/* Labels / tags */}
            <div className="w3-card w3-margin">
              <div className="w3-container w3-padding">
                <h4>Tags</h4>
              </div>
              <div className="w3-container w3-white">
                <span><h5 className="w3-tag w3-black w3-small w3-margin-bottom">Fiction</h5> <span className="w3-tag w3-light-grey w3-small w3-margin-bottom">Adventure</span> <span className="w3-tag w3-light-grey w3-small w3-margin-bottom">Magic</span>
                  <span className="w3-tag w3-light-grey w3-small w3-margin-bottom">Children's literature</span> <span className="w3-tag w3-light-grey w3-small w3-margin-bottom">Classics</span> <span className="w3-tag w3-light-grey w3-small w3-margin-bottom">England</span>
                  <span className="w3-tag w3-light-grey w3-small w3-margin-bottom">Ideas</span> 
                  
                </span>
              </div>
            </div>
            {/* END Introduction Menu */}
          </div>
          {/* END GRID */}
        </div><br />
        {/* END w3-content */}
      </div>
      {/* Footer */}
      <footer className="w3-container w3-dark-grey w3-padding-32 w3-margin-top">
        <button className="w3-button w3-black w3-disabled w3-padding-large w3-margin-bottom">Previous</button>
        <button className="w3-button w3-black w3-padding-large w3-margin-bottom">Next »</button>

      </footer>

    </div>
  );
}
export default Book;