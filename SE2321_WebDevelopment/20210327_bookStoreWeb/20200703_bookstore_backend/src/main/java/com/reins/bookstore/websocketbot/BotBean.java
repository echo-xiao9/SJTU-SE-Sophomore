package com.reins.bookstore.websocketbot;



import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.inject.Named;

@Named
public class BotBean {
    public BotBean() {
    }

    public String respond(String msg) {
        msg = msg.toLowerCase().replaceAll("\\?", "");
        String response;
        if (msg.contains("how are you")) {
            response = "I'm doing great, thank you!";
        } else if (msg.contains("how old are you")) {
            Calendar dukesBirthday = new GregorianCalendar(1995, 4, 23);
            Calendar now = GregorianCalendar.getInstance();
            int dukesAge = now.get(1) - dukesBirthday.get(1);
            response = String.format("I'm %d years old.", dukesAge);
        } else if (msg.contains("when is your birthday")) {
            response = "My birthday is on May 23rd. Thanks for asking!";
        } else if (msg.contains("your favorite color")) {
            response = "My favorite color is blue. What's yours?";
        } else {
            response = "Sorry, I did not understand what you said. ";
            response = response + "You can ask me how I'm doing today; how old I am; or ";
            response = response + "what my favorite color is.";
        }

        try {
            Thread.sleep(1200L);
        } catch (InterruptedException var6) {
        }

        return response;
    }
}

