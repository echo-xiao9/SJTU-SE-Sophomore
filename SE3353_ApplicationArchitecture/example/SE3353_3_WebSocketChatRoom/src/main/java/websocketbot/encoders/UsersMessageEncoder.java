/**
 * Copyright (c) 2013 Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software except in
 * compliance with  the terms of the License at:
 * http://java.net/projects/javaeetutorial/pages/BerkeleyLicense
 */
package websocketbot.encoders;

import websocketbot.messages.UsersMessage;
import java.io.StringWriter;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

/* Encode a UsersMessage as JSON.
 * For example, 
 *   List<String> list = new ArrayList<>();
 *   list.add("Peter");
 *   list.add("Duke");
 *   new UsersMessage(list)
 * is encoded as follows:
 * {
 *   "type": "users",
 *   "userlist": [ "Peter", "Duke" ]
 * }
 */
public class UsersMessageEncoder implements Encoder.Text<UsersMessage> {
    @Override
    public void init(EndpointConfig ec) { }
    
    @Override
    public void destroy() { }
    
    @Override
    public String encode(UsersMessage usersMessage) throws EncodeException {
        StringWriter swriter = new StringWriter();
        try (JsonGenerator jsonGen = Json.createGenerator(swriter)) {
            jsonGen.writeStartObject()
                .write("type", "users")
                .writeStartArray("userlist");
            for (String user : usersMessage.getUserList())
                jsonGen.write(user);
            jsonGen.writeEnd().writeEnd();
        }
        return swriter.toString();
    }
}
