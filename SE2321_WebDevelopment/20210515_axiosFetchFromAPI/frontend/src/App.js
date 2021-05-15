
import './App.css';
import axios from "axios";
import React, {useState} from 'react';

function App() {

  const [joke, setJoke] = useState("")

  const getJoke = () => {
    fetch("https://official-joke-api.appspot.com/random_joke")
    .then((response) => response.json())
    .then((data) =>{
      setJoke(data.setup+"..." + data.punchline);
    });
  };

  return (
    // every time click on the button, the getJock fun is called
    <div>
      Hello Youtube <button onClick={getJoke}>Get Joke Right Now </button>
      {joke}
    </div>
  );

}

export default App;
