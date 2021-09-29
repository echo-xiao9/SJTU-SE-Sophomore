package com.reins.bookstore.websocketbot.encoders;


import com.reins.bookstore.websocketbot.messages.UsersMessage;

import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import java.io.StringWriter;
import java.util.Iterator;

public class UsersMessageEncoder implements Encoder.Text<UsersMessage> {
    public UsersMessageEncoder() {
    }

    public void init(EndpointConfig ec) {
    }

    public void destroy() {
    }

    public String encode(UsersMessage usersMessage) throws EncodeException {
        StringWriter swriter = new StringWriter();
        JsonGenerator jsonGen = Json.createGenerator(swriter);

        try {
            jsonGen.writeStartObject().write("type", "users").writeStartArray("userlist");
            Iterator var4 = usersMessage.getUserList().iterator();

            while(true) {
                if (!var4.hasNext()) {
                    jsonGen.writeEnd().writeEnd();
                    break;
                }

                String user = (String)var4.next();
                jsonGen.write(user);
            }
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

