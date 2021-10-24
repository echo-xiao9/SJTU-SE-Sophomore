import React from 'react';

function Info(props) {
    let url = 'http://localhost:8080/' + props.menu;
    let username = 'root';
    let password = '123';

    let headers = new Headers();
    headers.set('Authorization', 'Basic ' + Buffer.from(username + ":" + password).toString('base64'));

    fetch(url, {
        method: 'GET',
        headers: headers,
        credentials: 'include'
    }).then(response => response.text())
        .then(data => {
            document.getElementById("info").innerText = data
        }).catch(function (ex) {
        console.log('parsing failed', ex)
    })
    return (
        <div>
            <h1 id="info">Welcome</h1>
        </div>
    );
}

export default Info;