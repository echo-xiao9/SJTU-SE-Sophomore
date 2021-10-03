import javax.jms.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Properties;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

public class JMSConsumer {
    private static final Logger log = Logger.getLogger(JMSConsumer.class.getName());
    private static final String DEFAULT_CONNECTION_FACTORY = "jms/RemoteConnectionFactory";
    private static final String DEFAULT_DESTINATION = "/jms/queue/HelloWorldMDBQueue";
    private static final String DEFAULT_USERNAME = "root";
    private static final String DEFAULT_PASSWORD = "reins2011!";
    private static final String INITIAL_CONTEXT_FACTORY = "org.wildfly.naming.client.WildFlyInitialContextFactory";
    private static final String PROVIDER_URL = "http-remoting://localhost:8080";
    private static final int WAIT_COUNT = 5;

    public static void main(String[] args) throws Exception {
        ConnectionFactory connectionFactory = null;
        Connection connection = null;
        Session session = null;
        MessageConsumer consumer = null;
        Destination destination = null;
        TextMessage message = null;
        Context context = null;
        try {
            final Properties env = new Properties();
            env.put(Context.INITIAL_CONTEXT_FACTORY, INITIAL_CONTEXT_FACTORY);
            env.put(Context.PROVIDER_URL, PROVIDER_URL);
            env.put(Context.SECURITY_PRINCIPAL, DEFAULT_USERNAME);
            env.put(Context.SECURITY_CREDENTIALS, DEFAULT_PASSWORD);
            context = new InitialContext(env);
            connectionFactory = (ConnectionFactory) context.lookup(DEFAULT_CONNECTION_FACTORY);
            destination = (Destination) context.lookup(DEFAULT_DESTINATION);
            connection = connectionFactory.createConnection(DEFAULT_USERNAME, DEFAULT_PASSWORD);
            session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            consumer = session.createConsumer(destination);
            connection.start();
            // 等待30秒退出
            CountDownLatch latch = new CountDownLatch(1);
            log.info("开始从JBOSS端接收信息-----");
            int i = 0;
            for (; i < WAIT_COUNT; i++) {
                if (message != null) {
                    log.info("接收到的消息的内容:" + message.getText());
                    i = 0;
                }
                log.info("开始从JBOSS端接收信息-----");
                message = (TextMessage) consumer.receive(5000);
                latch.await(1, TimeUnit.SECONDS);
            }
        } catch (Exception e) {
            log.severe(e.getMessage());
            throw e;
        } finally {
            if (context != null) {
                context.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
}