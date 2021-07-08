import {useState, useEffect} from 'react';
import {message} from 'antd';
// import userService from "../../data/userService";
import axios from 'axios';

const useForm = (callback, validate) => {
    const [values, setValues] = useState({
        username: '',
        email: '',
        password: '',
        password2: ''
    });
    const [errors, setErrors] = useState({});
    const [isSubmitting, setIsSubmitting] = useState(false);

    const check= () => {
        if(!values.username){
          alert("用户名为空！");
          return;
        }
        if(!values.password){
          alert("密码为空！");
          return;
        }
        axios({
            method: 'GET',
            url: 'http://localhost:9090/login',
            params: {
                username: values.username,
                password: values.password
            }
        }).then(response => {
            console.log(response)
            if (response.status === 200) {
              if(response.data.data.userType===0)alert("您的账号已经被禁用");
                // this.$notify({ title: '提示信息', message: '登录成功', type: 'success'
                //                 // })
                else {
                  alert(response.data.msg);
                  var userId=response.data.data.userId;
                  var userType=response.data.data.userType;
                  var username=response.data.data.username;
                  console.log("userType");
                  console.log(userType);
                  localStorage.setItem('userId',userId);
                  localStorage.setItem('userType',userType);
                  localStorage.setItem('username',username);
                  console.log("userType");
                  console.log(localStorage.getItem('userType'));
                 
          <script type="text/javascript">
　　function jumurl(){
　　window.location.href = 'http://localhost:3000'
　　}
　　setTimeout(jumurl,3000);
　　</script>
                  
                }
            }
        }).catch(error => {
            console.log(error)
            console.log("登陆失败！")
            // this.$notify({
            //     title: '提示信息', message: '账号或密码错误', type: 'error'
            // })
            alert("账号或密码错误");
        })
    }

    const handleChange = e => {
        const {name, value} = e.target;
        setValues({
            ...values,
            [name]: value
        });
        // console.log(e.target)
    };


    const handleSubmit = e => {
        check();
    };


    return {handleChange, handleSubmit, values, errors};
};

export default useForm;