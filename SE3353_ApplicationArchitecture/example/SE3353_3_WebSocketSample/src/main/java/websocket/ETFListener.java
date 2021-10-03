package websocket;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ETFListener
 *
 */
@WebListener
public class ETFListener implements ServletContextListener {
	
	private Timer timer = null;

    /**
     * Default constructor. 
     */
    public ETFListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
	public void contextInitialized(ServletContextEvent event) {
		timer = new Timer(true);
		event.getServletContext().log("The Timer is started");
		timer.schedule(new ReportBean(event.getServletContext()), 0, 1000);
		event.getServletContext().log("The task is added");
	}

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
