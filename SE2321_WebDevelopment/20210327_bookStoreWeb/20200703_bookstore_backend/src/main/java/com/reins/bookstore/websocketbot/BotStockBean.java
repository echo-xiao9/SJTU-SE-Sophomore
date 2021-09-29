package com.reins.bookstore.websocketbot;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Named;

@Named
public class BotStockBean {
    private static final Logger logger = Logger.getLogger("BotStockBean");

    public BotStockBean() {
    }

    public String respond(String msg) {
        msg = msg.toLowerCase().replaceAll("\\?", "");
        String response;
        if (msg.contains("how are you")) {
            response = "I'm doing great, thank you!";
        } else if (msg.contains("do you recommend ")) {
            String[] msgarr = msg.split(" ");
            String ticker = "";

            for(int i = 0; i < msgarr.length - 1; ++i) {
                if (msgarr[i].compareTo("recommend") == 0) {
                    ticker = msgarr[i + 1];
                }
            }

            ticker = ticker.toUpperCase();
            if (ticker.length() > 0) {
                try {
                    if (this.get6mChange(ticker) > 1.0D) {
                        response = ticker + " is doing well. I recommend it.";
                    } else {
                        response = ticker + " is not doing well. I'm bearish on this one.";
                    }
                } catch (FileNotFoundException var6) {
                    response = "Sorry, I don't know this stock (" + ticker + ")";
                } catch (Exception var7) {
                    response = "Sorry, I'm having trouble with my sources today :-( ";
                    response = response + "Ensure that your proxy configuration for Glassfish is correct.";
                }
            } else {
                response = "Tell me what stock you want a recommendation on.";
            }
        } else {
            response = "Sorry, I did not understand what you said. ";
            response = response + "Enter a stock symbol and ask me if I recommend buying the stock. ";
            response = response + "I'm good at that! For example: ";
            response = response + "@Duke Do you recommend ORCL?";
        }

        return response;
    }

    private double get6mChange(String ticker) throws IOException, MalformedURLException, FileNotFoundException {
        Calendar cal = Calendar.getInstance();
        cal.add(2, -6);
        int m = cal.get(2);
        int d = cal.get(5);
        int y = cal.get(1);
        URL url = new URL("http://ichart.yahoo.com/table.csv?s=" + ticker + "&a=" + m + "&b=" + d + "&c=" + y + "&g=w&ignore=.csv");
        logger.log(Level.INFO, "[BotStockBean] Opening {0}", url.toString());
        URLConnection con = url.openConnection();
        InputStreamReader ir = new InputStreamReader(con.getInputStream());
        BufferedReader reader = new BufferedReader(ir);
        String line = reader.readLine();
        logger.log(Level.INFO, "[BotStockBean] {0}", line);
        line = reader.readLine();
        logger.log(Level.INFO, "[BotStockBean] {0} ...", line);
        String[] fields = line.split(",");
        float priceNow = Float.parseFloat(fields[fields.length - 1]);

        for(line = reader.readLine(); reader.ready(); line = reader.readLine()) {
        }

        fields = line.split(",");
        float price6m = Float.parseFloat(fields[fields.length - 1]);
        return (double)(priceNow / price6m);
    }
}
