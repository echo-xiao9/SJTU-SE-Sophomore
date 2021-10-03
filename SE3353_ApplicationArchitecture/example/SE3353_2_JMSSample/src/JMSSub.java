import javax.jms.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.Properties;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

public class JMSSub {
    private static final String DEFAULT_USERNAME = "root";
    private static final String DEFAULT_PASSWORD = "reins2011!";
    private static final String INITIAL_CONTEXT_FACTORY = "org.wildfly.naming.client.WildFlyInitialContextFactory";
    private static final String PROVIDER_URL = "http-remoting://localhost:8080";
    private static final String DEFAULT_CONNECTION_FACTORY = "jms/RemoteConnectionFactory";
    private static final Logger log = Logger.getLogger(JMSSub.class.getName());


    public static void main(String[] args) throws Exception {
        ConnectionFactory connectionFactory = null;
        Connection connection = null;
        Session session = null;
        Topic topic = null;
        Context context = null;
        MessageConsumer consumer = null;
        try {
            log.info("设置JNDI访问环境信息也就是设置应用服务器的上下文信息!");
            final Properties env = new Properties();
            env.put(Context.INITIAL_CONTEXT_FACTORY, INITIAL_CONTEXT_FACTORY);
            env.put(Context.PROVIDER_URL, PROVIDER_URL);
            env.put(Context.SECURITY_PRINCIPAL, DEFAULT_USERNAME);
            env.put(Context.SECURITY_CREDENTIALS, DEFAULT_PASSWORD);
            context = new InitialContext(env);
            log.info("初始化上下文,'JNDI驱动类名','服务提供者URL','应用用户的账户','密码'完毕.");
            log.info("创建JMS连接、会话、主题!");
            connectionFactory = (ConnectionFactory) context.lookup(DEFAULT_CONNECTION_FACTORY);
            connection = connectionFactory.createConnection(DEFAULT_USERNAME, DEFAULT_PASSWORD);
            session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            topic = session.createTopic("HelloWorldMDBTopic");

            String selector;
            selector = new String("(Selector = 'Funny')");

            consumer = session.createConsumer(topic, selector);
            consumer.setMessageListener(new javax.jms.MessageListener() {
                public void onMessage(Message message) {
                    try {
                        TextMessage tm = (TextMessage) message;
                        System.out.println("接收到的消息内容: " + tm.getText().toString());
                        System.out.println("JMS目的地: " + tm.getJMSDestination());
                        System.out.println("JMS回复: " + tm.getJMSReplyTo());
                        System.out.println("JMS消息ID号: " + tm.getJMSMessageID());
                        System.out.println("是否重新接收: " + tm.getJMSRedelivered());
                    } catch (JMSException e1) {
                        e1.printStackTrace();
                    }
                }
            });
            connection.start();
            //等待30秒退出
            CountDownLatch latch = new CountDownLatch(1);
            latch.await(100, TimeUnit.SECONDS);
        } catch (Exception e) {
            log.severe(e.getMessage());
            throw e;
        } finally {
            if (context != null) {
                context.close();
            }
            // 关闭连接负责会话,发布者和订阅者
            if (connection != null) {
                connection.close();
            }
        }
    }
}
