import '../css/Pagination.css';


function Pagination() {
    return (
        <div class="pagination">
  
        {/* <a href="/">&laquo;</a> */}
        <a href="/?page=1">1</a>
        <a href="/?page=2">2</a>
        <a href="/?page=3">3</a>
        <a href="/?page=4">4</a>
        {/* <a href="#">&raquo;</a> */}
      </div>
        
      
    );
  }
  
  export default Pagination;
  