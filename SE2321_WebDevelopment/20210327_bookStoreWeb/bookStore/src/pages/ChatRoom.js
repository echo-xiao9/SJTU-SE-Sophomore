import React from 'react';

export default class ChatRoom extends React.Component {


    constructor(props) {
        super(props);
        this.state = {
            name: "",
            input: "",
            join: "",
            wsconsole: "",
            nameDisable: false,
            joinDisable: false,
            inputDisable: false,
            isOpened: false,
        }
        this.changeNameAndCheckJoin = this.changeNameAndCheckJoin.bind(this);
        this.sendJoin = this.sendJoin.bind(this);
        this.changeInputAndsendMessage = this.changeInputAndsendMessage.bind(this);
        this.onMessage = this.onMessage.bind(this);
        this.sendMessage = this.sendMessage.bind(this);
        this.showHideConsole = this.showHideConsole.bind(this);

        this.wsocket = new WebSocket("ws://localhost:9090/websocketbot");
        this.wsocket.onmessage = this.onMessage;
        this.render = this.render.bind(this);
    }

    changeNameAndCheckJoin(e) {
        this.setState({name: e.target.value});
        // if(e.nativeEvent.keyCode === 13 && this.state.name.length > 0){
        //   this.sendJoin();
        // }
    }

    showHideConsole() {
        this.setState({isOpened: true});
    }


    sendJoin() {
        var jsonstr;
        if (this.state.name.length > 0) {
            /* Create a message as a JavaScript object */
            var joinMsg = {};
            joinMsg.type = "join";
            joinMsg.name = this.state.name;
            /* Convert the message to JSON */
            jsonstr = JSON.stringify(joinMsg);
            /* Send the JSON text */
            this.wsocket.send(jsonstr);
            console.log(jsonstr);
            /* Disable join controls */
            this.setState({
                nameDisable: true,
                joinDisable: false,
                inputDisable: false
            });

            this.setState({wsconsole: this.state.wsconsole + "<- " + jsonstr + "\n"});
            console.log(this.state.wsconsole);
            // this.state.wsconsole.scrollTop = 999999;
        }
    }

    changeInputAndsendMessage(e) {
        this.setState({input: e.target.value});
        if (e.nativeEvent.keyCode === 13 && this.state.input.length > 0) {
            this.sendMessage();
        }

    }

    sendMessage() {
        var jsonstr;
        var msgstr;
        var chatMsg = {};
        chatMsg.type = "chat";
        chatMsg.name = this.state.name;
        msgstr = this.state.input;
        console.log("input");
        console.log(this.state.input);
        chatMsg.target = this.getTarget(msgstr.replace(/,/g, ""));
        chatMsg.message = this.cleanTarget(msgstr);
        chatMsg.message = chatMsg.message.replace(/(\r\n|\n|\r)/gm, "");
        /* Convert the object to JSON */
        jsonstr = JSON.stringify(chatMsg);
        /* Send the message as JSON text */
        console.log("chat message");
        console.log(jsonstr);
        this.wsocket.send(jsonstr);
        /* Update the Websocket console area */
        this.setState({wsconsole: this.state.wsconsole + "<- " + jsonstr + "\n"})
        this.setState({input: ""});
        document.getElementById("input").value = "";
    }

    getTarget(str) {
        var arr = str.split(" ");
        var target = "";
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].charAt(0) === '@') {
                target = arr[i].substring(1, arr[i].length);
                target = target.replace(/(\r\n|\n|\r)/gm, "");
            }
        }
        return target;
    }

    onMessage(evt) {
        console.log("onMessage");
        var line = "";
        console.log("wsocket");
        console.log(this.wsocket);
        /* Parse the message into a JavaScript object */
        var msg = JSON.parse(evt.data);
        console.log("type");
        console.log(msg.type);
        if (msg.type === "chat") {
            line = msg.name + ": ";
            if (msg.target.length > 0)
                line += "@" + msg.target + " ";
            line += msg.message + "\n";
            console.log("line");
            console.log(line);
            /* Update the chat area */
            this.setState({textarea: this.state.textarea + line});
            // this.textarea += "" + line;
        } else if (msg.type === "info") {
            line = "[--" + msg.info + "--]\n";
            /* Update the chat area */
            this.textarea += "" + line;
        } else if (msg.type === "users") {
            line = "Users:\n";
            for (var i = 0; i < msg.userlist.length; i++)
                line += "-" + msg.userlist[i] + "\n";
            /* Update the user list area */
            this.setState({userlist: line})
            console.log("userList");
            console.log(this.state.userlist);
        }
        // this.textarea.scrollTop = 999999;
        /* Update the Websocket console area */
        // this.wsconsole += "-> " +  evt.data + "\n";
        this.setState({wsconsole: this.state.wsconsole + "-> " + evt.data + "\n"});
        // this.wsconsole.scrollTop = 999999;
        // this.render();
    }


    cleanTarget(str) {
        var arr = str.split(" ");
        var cleanstr = "";
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].charAt(0) !== '@')
                cleanstr += arr[i] + " ";
        }
        return cleanstr.substring(0, cleanstr.length - 1);
    }

    render = () => {
        // this.logRow();
        return (
            <div>

                <h1 onClick={this.show}>WebsocketBot</h1>
                Your name: <input id="name" type="text" size="20" maxlength="20" onChange={this.changeNameAndCheckJoin}
                                  value={this.state.name} disabled={this.state.nameDisable}/>
                <input type="submit" id="join" value="Join!" onClick={this.sendJoin} disabled={this.state.joinDisable}/>
                <br/>
                {/* <textarea id="input" cols="70" rows="1" disabled="true"
          onKeyUp={this.changeInputAndsendMessage}> */}
                <textarea id="input" cols="70" rows="1"
                          onKeyUp={this.changeInputAndsendMessage} disabled={this.state.inputDisable}>
        </textarea>
                <br/>

                <textarea id="textarea" cols="70" rows="20" readOnly="true" value={this.state.textarea}> </textarea>
                <textarea id="userlist" cols="20" rows="20" readOnly="true" value={this.state.userlist}></textarea>
                <br/><br/><br/>
                <input id="showhideconsole" type="checkbox" onClick={this.showHideConsole}/>
                Show WebSocket console<br/>
                {this.state.isOpened && (

                    <div id="consolediv">
          <textarea id="wsconsole" cols="80" rows="8" readOnly="true" value={this.state.wsconsole} visibility="false">
          </textarea>
                    </div>
                )}
            </div>
        );
    }

}


