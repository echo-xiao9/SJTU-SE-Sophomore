/**
 * Copyright (c) 2013 Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software except in
 * compliance with  the terms of the License at:
 * http://java.net/projects/javaeetutorial/pages/BerkeleyLicense
 */
package websocketbot.encoders;

import websocketbot.messages.ChatMessage;
import java.io.StringWriter;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;


/* Encode a ChatMessage as JSON.
 * For example, (new ChatMessage("Peter","Duke","How are you?"))
 * is encoded as follows:
 * {
 *   "type": "chat",
 *   "target": "Duke",
 *   "message": "How are you?"
 * }
 */
public class ChatMessageEncoder implements Encoder.Text<ChatMessage> {
    
    @Override
    public void init(EndpointConfig ec) { }
    
    @Override
    public void destroy() { }
    
    @Override
    public String encode(ChatMessage chatMessage) throws EncodeException {
        StringWriter swriter = new StringWriter();
        try (JsonGenerator jsonGen = Json.createGenerator(swriter)) {
            jsonGen.writeStartObject()
                .write("type", "chat")
                .write("name", chatMessage.getName())
                .write("target", chatMessage.getTarget())
                .write("message", chatMessage.getMessage())
            .writeEnd();
        }
        return swriter.toString();
    }
}
