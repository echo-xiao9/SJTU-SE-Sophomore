import React from 'react';
import '../css/App.css';
import '../css/Login.css';
import validate from './validateInfo';
import useForm from './useForm';
import { Button } from '../components/Button';



function renderAdmin(){
    console.log(localStorage.getItem('userType'));
    if(localStorage.getItem('userType')==='1')return  <Button buttonStyle='btn--outline' buttonLink='/AdminIndex'>Administrator</Button>;
    else return null;
}

function renderLogOut(){
  console.log(localStorage.getItem('userType'));
  if(localStorage.getItem('userType')!=null)return  <Button buttonStyle='btn--outline' onClick={logOut}>Log Out</Button>;
}

function logOut(){
  localStorage.removeItem('userId');
  localStorage.removeItem('userType');
  localStorage.removeItem('username');
}

  const SignUp = ({submitForm}) => {
    const {handleChange, handleSubmit, values, errors} = useForm(
        submitForm,
        validate
    );

  return (
    <div class="container" id="login">
      <div class="row">
        <div class="col-lg-3 col-md-2"></div>
        <div class="col-lg-6 col-md-8 login-box"id="login" onSubmit={handleSubmit}  noValidate>
          <div class="col-lg-12 login-key">
            <i class="fa fa-key" aria-hidden="true"></i>
          </div>
          <div class="col-lg-12 login-title">
            ADMIN PANEL
                </div>
          <div class="col-lg-12 login-form">
            <div class="col-lg-12 login-form">
              <form>
                <div class="form-group">
                  <label class="form-control-label">USERNAME</label>
                  {/*<input type="text" class="form-control" />*/}

                  <input
                  
                      class="login"
                      type="username"
                      name='username'
                      placeholder='Enter your username'
                      value={values.username}
                      onChange={handleChange}
                  />{errors.username && <p>{errors.username}</p>}

                </div>
                <div class="form-group">
                  <label class="form-control-label">PASSWORD</label>
                  <input
                  
                      className='form-control'
                      type="password"
                      name='password'
                      placeholder='Enter your password'
                      value={values.password}
                      onChange={handleChange}
                  />{errors.password && <p>{errors.password}</p>}
                </div>

                <div class="col-lg-12 loginbttm">
                  <Button buttonStyle='btn--outline' onClick={handleSubmit} >Log in  </Button>
                  <Button buttonStyle='btn--outline'buttonLink="/Register" >Register</Button>
                  
                  {/* <Button buttonStyle='btn--outline' buttonLink='/AdminIndex'>Administrator</Button> */}
                {renderAdmin()}
                {renderLogOut()}
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-3 col-md-2"></div>
        </div>
      </div>
      </div> 

  );
}

export default SignUp;

