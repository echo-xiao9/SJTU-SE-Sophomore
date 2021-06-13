import { Button } from '../components/Button';


function AdminIndex() {
  // const [button, setButton] = useState(true);
  return(
    <div>
    <Button buttonStyle='btn--test'  buttonLink='/AdminUser'>User Message</Button>
    <Button buttonStyle='btn--test'  buttonLink='/AdminBook'>Book Message</Button>
    <Button buttonStyle='btn--test'  buttonLink='/AdminOrder'>Order Message</Button>
    <Button buttonStyle='btn--test'  buttonLink='/HotSelling'>Hot Selling Board</Button>
    <Button buttonStyle='btn--test'  buttonLink='/getHotUsers'>Hot Users Board</Button>
    </div>

  )
}
export default AdminIndex;