/**
 * Copyright (c) 2013 Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software except in
 * compliance with  the terms of the License at:
 * http://java.net/projects/javaeetutorial/pages/BerkeleyLicense
 */
package websocketbot.encoders;

import websocketbot.messages.InfoMessage;
import java.io.StringWriter;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

/* Encode an InfoMessage as JSON.
 * For example, (new InfoMessage("Peter has joined the chat."))
 * is encoded as follows:
 * {
 *   "type": "info",
 *   "info": "Peter has joined the chat"
 * }
 */
public class InfoMessageEncoder implements Encoder.Text<InfoMessage> {
    @Override
    public void init(EndpointConfig ec) { }
    
    @Override
    public void destroy() { }
    
    @Override
    public String encode(InfoMessage joinMessage) throws EncodeException {
        StringWriter swriter = new StringWriter();
        try (JsonGenerator jsonGen = Json.createGenerator(swriter)) {
            jsonGen.writeStartObject()
                .write("type", "info")
                .write("info", joinMessage.getInfo())
            .writeEnd();
        }
        return swriter.toString();
    }
}
