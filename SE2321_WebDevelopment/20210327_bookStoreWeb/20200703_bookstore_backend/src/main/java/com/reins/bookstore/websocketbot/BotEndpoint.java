package com.reins.bookstore.websocketbot;


import com.reins.bookstore.websocketbot.decoders.MessageDecoder;
import com.reins.bookstore.websocketbot.encoders.ChatMessageEncoder;
import com.reins.bookstore.websocketbot.encoders.InfoMessageEncoder;
import com.reins.bookstore.websocketbot.encoders.JoinMessageEncoder;
import com.reins.bookstore.websocketbot.encoders.UsersMessageEncoder;
import com.reins.bookstore.websocketbot.messages.*;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(
        value = "/websocketbot",
        decoders = {MessageDecoder.class},
        encoders = {JoinMessageEncoder.class, ChatMessageEncoder.class, InfoMessageEncoder.class, UsersMessageEncoder.class}
)
@Component
public class BotEndpoint {
    private static final Logger logger = Logger.getLogger("BotEndpoint");
    private static Queue<Session> mySession = new ConcurrentLinkedQueue();

    public BotEndpoint() {
    }

    @OnOpen
    public void openConnection(Session session) {
        mySession.add(session);
        logger.log(Level.INFO, "Connection opened.");
    }

    @OnMessage
    public void message(Session session, Message msg) {
        logger.log(Level.INFO, "Received: {0}", msg.toString());
        if (msg instanceof JoinMessage) {
            JoinMessage jmsg = (JoinMessage)msg;
            session.getUserProperties().put("name", jmsg.getName());
            session.getUserProperties().put("active", true);
            logger.log(Level.INFO, "Received: {0}", jmsg.toString());
            this.sendAll(session, new InfoMessage(jmsg.getName() + " has joined the chat"));
            this.sendAll(session, new ChatMessage("Duke", jmsg.getName(), "Hi there!!"));
            this.sendAll(session, new UsersMessage(this.getUserList(session)));
        } else if (msg instanceof ChatMessage) {
            ChatMessage cmsg = (ChatMessage)msg;
            logger.log(Level.INFO, "Received: {0}", cmsg.toString());
            this.sendAll(session, cmsg);
        }

    }

    @OnClose
    public void closedConnection(Session session) {
        session.getUserProperties().put("active", false);
        if (session.getUserProperties().containsKey("name")) {
            String name = session.getUserProperties().get("name").toString();
            this.sendAll(session, new InfoMessage(name + " has left the chat"));
            this.sendAll(session, new UsersMessage(this.getUserList(session)));
        }

        logger.log(Level.INFO, "Connection closed.");
    }

    @OnError
    public void error(Session session, Throwable t) {
        logger.log(Level.INFO, "Connection error ({0})", t.toString());
    }

    public synchronized void sendAll(Session session, Object msg) {
        try {
            Iterator var3 = mySession.iterator();

            while(var3.hasNext()) {
                Session s = (Session)var3.next();
                if (s.isOpen()) {
                    s.getBasicRemote().sendObject(msg);
                    logger.log(Level.INFO, "Sent: {0}", msg.toString());
                }
            }
        } catch (EncodeException | IOException var5) {
            logger.log(Level.INFO, var5.toString());
        }

    }

    public List<String> getUserList(Session session) {
        List<String> users = new ArrayList();
        Iterator var3 = mySession.iterator();

        while(var3.hasNext()) {
            Session s = (Session)var3.next();
            if (s.isOpen() && (Boolean)s.getUserProperties().get("active")) {
                users.add(s.getUserProperties().get("name").toString());
            }
        }

        return users;
    }
}
