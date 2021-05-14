
import './App.css';

function App() {
    const [movieName, setMovieName]=useState('');
    const [review, setReview] = useState('')



  return (
    <div className="App">
     <h1>hello</h1>
     <div className="form">
       <label>Movie Name:</label>
     <input type="text" name="movieName"/>
     <label>  Review:</label>
     <input type="text" name="review"/>
     <button>Submit </button>
     </div>
    </div>
  );
}

export default App;
