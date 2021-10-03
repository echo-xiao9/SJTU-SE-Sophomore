import javax.jms.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Properties;
import java.util.logging.Logger;
/**
 * Created by gao on 16-3-28.
 */
public class JMSPub {
    private static final String DEFAULT_USERNAME = "root";
    private static final String DEFAULT_PASSWORD = "reins2011!";
    private static final String INITIAL_CONTEXT_FACTORY = "org.wildfly.naming.client.WildFlyInitialContextFactory";
    private static final String PROVIDER_URL = "http-remoting://localhost:8080";
    private static final String DEFAULT_CONNECTION_FACTORY = "jms/RemoteConnectionFactory";
    private static final String DEFAULT_DESTINATION = "/jms/topic/HelloWorldMDBTopic";
    private static final Logger log = Logger.getLogger(JMSPub.class.getName());
    public static void main(String[] args) throws Exception {
        ConnectionFactory connectionFactory = null;
        Connection connection = null;
        Session session = null;
        Topic topic = null;
        Context context = null;
        MessageProducer producer = null;
        BufferedReader msgStream = null;
        try {
            log.info("设置JNDI访问环境信息也就是设置应用服务器的上下文信息!");
            final Properties env = new Properties();
            env.put(Context.INITIAL_CONTEXT_FACTORY, INITIAL_CONTEXT_FACTORY);
            env.put(Context.PROVIDER_URL, PROVIDER_URL);
            env.put(Context.SECURITY_PRINCIPAL, DEFAULT_USERNAME);
            env.put(Context.SECURITY_CREDENTIALS, DEFAULT_PASSWORD);
            context = new InitialContext(env);
            log.info("初始化上下文,'JNDI驱动类名','服务提供者URL','应用用户的账户','密码'完毕.");
            log.info("获取连接工厂!");
            connectionFactory = (ConnectionFactory) context.lookup(DEFAULT_CONNECTION_FACTORY);
            log.info("创建JMS连接、会话、主题!");
            connection = connectionFactory.createConnection(DEFAULT_USERNAME, DEFAULT_PASSWORD);
            session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            topic = (Topic) context.lookup(DEFAULT_DESTINATION);
            producer = session.createProducer(topic);
            msgStream = new BufferedReader(new InputStreamReader(System.in));
            String line = null;
            boolean quitNow = false;
            do {
                System.out.print("输入要发送的消息：(数字0退出)");
                line = msgStream.readLine();
                if (line != null && line.trim().length() != 0) {
                    TextMessage textMessage = session.createTextMessage();
                    textMessage.setText(line);
                    textMessage.setStringProperty("Selector", "Funny");
                    producer.send(textMessage);
                    quitNow = line.equalsIgnoreCase("0");
                }
            } while (!quitNow);
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