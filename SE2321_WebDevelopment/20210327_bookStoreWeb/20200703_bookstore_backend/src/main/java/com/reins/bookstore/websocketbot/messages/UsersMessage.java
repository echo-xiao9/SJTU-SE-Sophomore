package com.reins.bookstore.websocketbot.messages;

import java.util.List;

public class UsersMessage extends Message {
    private List<String> userlist;

    public UsersMessage(List<String> userlist) {
        this.userlist = userlist;
    }

    public List<String> getUserList() {
        return this.userlist;
    }

    public String toString() {
        return "[UsersMessage] " + this.userlist.toString();
    }
}

