package com.reins.bookstore.websocketbot.messages;

public class InfoMessage extends Message {
    private String info;

    public InfoMessage(String info) {
        this.info = info;
    }

    public String getInfo() {
        return this.info;
    }

    public String toString() {
        return "[InfoMessage] " + this.info;
    }
}

