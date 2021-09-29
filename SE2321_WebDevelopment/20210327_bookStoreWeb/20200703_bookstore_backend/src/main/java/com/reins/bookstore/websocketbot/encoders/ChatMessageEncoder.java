package com.reins.bookstore.websocketbot.encoders;

import com.reins.bookstore.websocketbot.messages.ChatMessage;

import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import java.io.StringWriter;

public class ChatMessageEncoder implements Encoder.Text<ChatMessage> {
    public ChatMessageEncoder() {
    }

    public void init(EndpointConfig ec) {
    }

    public void destroy() {
    }

    public String encode(ChatMessage chatMessage) throws EncodeException {
        StringWriter swriter = new StringWriter();
        JsonGenerator jsonGen = Json.createGenerator(swriter);

        try {
            jsonGen.writeStartObject().write("type", "chat").write("name", chatMessage.getName()).write("target", chatMessage.getTarget()).write("message", chatMessage.getMessage()).writeEnd();
        } catch (Throwable var7) {
            if (jsonGen != null) {
                try {
                    jsonGen.close();
                } catch (Throwable var6) {
                    var7.addSuppressed(var6);
                }
            }

            throw var7;
        }

        if (jsonGen != null) {
            jsonGen.close();
        }

        return swriter.toString();
    }
}

