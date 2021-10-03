package websocket;

import java.util.Random;
import java.util.TimerTask;

import javax.servlet.ServletContext;

public class ReportBean extends TimerTask {
	
	private ServletContext context = null;
	
	private Random random = new Random();
    private double price = 100.0;
    private int volume = 300000;
	
	public ReportBean(ServletContext context)
	{
		this.context = context;
	}

	public void run() {

		//context.log("Task started");

		price += 1.0*(random.nextInt(100)-50)/100.0;
		volume += random.nextInt(5000) - 2500;
		ETFEndpoint.send(price, volume);

		//context.log("Task ended");

	}
}
