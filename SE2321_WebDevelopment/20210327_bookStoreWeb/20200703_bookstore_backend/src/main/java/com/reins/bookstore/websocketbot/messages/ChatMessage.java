package com.reins.bookstore.websocketbot.messages;


public class ChatMessage extends Message {
    private String name;
    private String target;
    private String message;

    public ChatMessage(String name, String target, String message) {
        this.name = name;
        this.target = target;
        this.message = message;
    }

    public String getName() {
        return this.name;
    }

    public String getTarget() {
        return this.target;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String toString() {
        return "[ChatMessage] " + this.name + "-" + this.target + "-" + this.message;
    }
}
