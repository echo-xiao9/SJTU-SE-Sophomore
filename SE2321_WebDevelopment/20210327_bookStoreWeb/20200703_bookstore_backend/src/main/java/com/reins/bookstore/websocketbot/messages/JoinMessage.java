package com.reins.bookstore.websocketbot.messages;

public class JoinMessage extends Message {
    private String name;

    public JoinMessage(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public String toString() {
        return "[JoinMessage] " + this.name;
    }
}
