package com.reins.bookstore.websocketbot.decoders;

import java.io.StringReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.json.Json;
import javax.json.stream.JsonParser;
import javax.json.stream.JsonParser.Event;
import javax.websocket.DecodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.Decoder.Text;

import com.reins.bookstore.websocketbot.messages.ChatMessage;
import com.reins.bookstore.websocketbot.messages.JoinMessage;
import com.reins.bookstore.websocketbot.messages.Message;


public class MessageDecoder implements Text<Message> {
    private Map<String, String> messageMap;

    public MessageDecoder() {
    }

    public void init(EndpointConfig ec) {
    }

    public void destroy() {
    }

    public Message decode(String string) throws DecodeException {
        System.out.println("decode string");
        System.out.println(string);
        Message msg = null;
        if (this.willDecode(string)) {
            String var3 = (String)this.messageMap.get("type");
            byte var4 = -1;
            switch(var3.hashCode()) {
                case 3052376:
                    if (var3.equals("chat")) {
                        var4 = 1;
                    }
                    break;
                case 3267882:
                    if (var3.equals("join")) {
                        var4 = 0;
                    }
            }

            switch(var4) {
                case 0:
                    msg = new JoinMessage((String)this.messageMap.get("name"));
                    break;
                case 1:
                    msg = new ChatMessage((String)this.messageMap.get("name"), (String)this.messageMap.get("target"), (String)this.messageMap.get("message"));
            }

            return (Message)msg;
        } else {
            throw new DecodeException(string, "[Message] Can't decode.");
        }
    }

    // see if the string can be decode
    public boolean willDecode(String string) {
        boolean decodes = false;
        this.messageMap = new HashMap();
        JsonParser parser = Json.createParser(new StringReader(string));
        System.out.println(string);
        String value;
        while(parser.hasNext()) {
            if (parser.next() == Event.KEY_NAME) {
                String key = parser.getString();
                parser.next();
                value = parser.getString();
                this.messageMap.put(key, value);
            }
        }

        Set keys = this.messageMap.keySet();
        if (keys.contains("type")) {
            value = (String)this.messageMap.get("type");
            byte var6 = -1;
            switch(value.hashCode()) {
                case 3052376:
                    if (value.equals("chat")) {
                        var6 = 1;
                    }
                    break;
                case 3267882:
                    if (value.equals("join")) {
                        var6 = 0;
                    }
            }

            switch(var6) {
                case 0:
                    if (keys.contains("name")) {
                        decodes = true;
                    }
                    break;
                case 1:
                    String[] chatMsgKeys = new String[]{"name", "target", "message"};
                    if (keys.containsAll(Arrays.asList(chatMsgKeys))) {
                        decodes = true;
                    }
            }
        }

        return decodes;
    }
}

