import React from 'react';
import '../css/Register.css';
import { Button } from '../components/Button';
import axios from 'axios';

export default class Register extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      username: "",
      nameValid:1,
      emailValid:0,
      pswValid:0,
      email: "",
      psw: "",
      psw2: ""

    }
    this.handleUsernameChange = this.handleUsernameChange.bind(this);
    this.handleEmailChange = this.handleEmailChange.bind(this);
    this.handlePswChange = this.handlePswChange.bind(this);
    this.handlePsw2Change = this.handlePsw2Change.bind(this);
    this.registerButtonClicked=this.registerButtonClicked.bind(this);
  }
  handleUsernameChange(e) {
    this.state.username = e.target.value;
    console.log(this.state.username);
    this.render();
  }
  handleEmailChange(e) {
    this.state.email = e.target.value;
    this.validateEmail(this.state.email);
    this.render();
  }
  handlePswChange(e) {
    this.state.psw = e.target.value;
    this.render();
  }
  handlePsw2Change(e) {
    this.state.psw2 = e.target.value;
    this.render();
  }

  checkMatch() {
    if (this.state.psw === "" || this.state.psw === "") return (
      <div>
        <h7 class="error">please fill in the password</h7>
      </div>
    )
    else if (this.state.psw === this.state.psw2) {
      this.state.pswValid=1;
    return (
      <div>
        <h7 class="ok">password match</h7>
      </div>
    )
    }
    else {
      this.state.pswValid=0;
      return (
      <div>
        <h7 class="error">password mismatch</h7>
      </div>
    )}
  }

  validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
  }
  checkEmail() {
    if (this.validateEmail(this.state.email) === true) {
      this.state.emailValid=1;
      return (<h7 class="ok">Valid email</h7>);
    }
    else this.state.emailValid=0;
    return (<h7 class="error">Invalid email!</h7>);
  }

  checkUsername() {
    axios({
      method: 'GET',
      url: "http://localhost:9090/getUserByName",
      params: {
        username: this.state.username
      }
    }).then(response => {
      if (response.data != "") this.state.nameValid=0;
      else this.state.nameValid=1;
    })
    if(this.state.nameValid===1) {
      return (<h7 class="ok">Valid user name!</h7>);}
    return (<h7 class="error">Invalid user name!</h7>);
  }
  
  registerButtonClicked(){
    if(this.state.nameValid===1 && 
      this.state.emailValid===1 &&
      this.state.pswValid===1){
        axios({
          method: 'GET',
          url: "http://localhost:9090/addUser",
          params: {
            username: this.state.username,
            password:this.state.psw,
            email:this.state.email
          }
        }).then(response => {
          alert("Registration successful! Please log in.");
          <script type="text/javascript">
　　function jumurl(){
　　window.location.href = 'http://localhost:3000/login'
　　}
　　setTimeout(jumurl,3000);
　　</script>
        })
      }
  }

  render() {
    return (
      <div>
        <div class="container">
          <div class="card">
            <div class="card-image">
              <h2 class="card-heading">
                Get started
              </h2>
              {/* <h3>Let us create your account</h3> */}
            </div>
            <form class="card-form">
              <div class="input">
                {this.checkUsername()}
                <input
                  className='form-input'
                  type='text'
                  name='username'
                  // value={values.username}
                  onChange={this.handleUsernameChange}
                  id="register"
                />
                <label class="input-label" >user name</label>

              </div>

              <div class="input">

                {this.checkEmail()}
                <input type="email"  id="register" onChange={this.handleEmailChange} />
                <label class="input-label">Email</label>
              </div>

              <div class="input">

                <input type="password" id="register" required onChange={this.handlePswChange} />
                <label class="input-label">Password</label>
              </div>

              <div class="input">

                <input type="password" id="register" class="input-field" required onChange={this.handlePsw2Change} />
                <label class="input-label">Input password again</label>
              </div>
              {this.checkMatch()}
              <div class="action">
                <Button buttonStyle='btn--blackBG' onClick={this.registerButtonClicked}>Get started</Button>
              </div>

            </form>
            <div class="card-info">
              <p>By signing up you are agreeing to our <a href="#">Terms and Conditions</a></p>
            </div>
          </div>
        </div>

      </div>
    );
  }

}

