/**
 * Copyright (c) 2013 Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software except in
 * compliance with  the terms of the License at:
 * http://java.net/projects/javaeetutorial/pages/BerkeleyLicense
 */
package websocketbot.encoders;

import websocketbot.messages.JoinMessage;
import java.io.StringWriter;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

/* Encode a JoinMessage as JSON.
 * For example, (new JoinMessage("Peter"))
 * is encoded as follows:
 * {
 *   "type": "join",
 *   "name": "Peter"
 * }
 */
public class JoinMessageEncoder implements Encoder.Text<JoinMessage> {
    @Override
    public void init(EndpointConfig ec) { }
    
    @Override
    public void destroy() { }
    
    @Override
    public String encode(JoinMessage joinMessage) throws EncodeException {
        StringWriter swriter = new StringWriter();
        try (JsonGenerator jsonGen = Json.createGenerator(swriter)) {
            jsonGen.writeStartObject()
                .write("type", "join")
                .write("name", joinMessage.getName())
            .writeEnd();
        }
        return swriter.toString();
    }
}
