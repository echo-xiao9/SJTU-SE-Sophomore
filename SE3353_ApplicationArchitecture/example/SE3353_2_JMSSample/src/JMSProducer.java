import javax.jms.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Properties;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

public class JMSProducer {
    private static final Logger log = Logger.getLogger(JMSProducer.class.getName());
    private static final String DEFAULT_MESSAGE = "这是JMS信息.....";
    private static final String DEFAULT_CONNECTION_FACTORY = "jms/RemoteConnectionFactory";
    private static final String DEFAULT_DESTINATION = "/jms/queue/HelloWorldMDBQueue";
    private static final String DEFAULT_MESSAGE_COUNT = "10";
    private static final String DEFAULT_USERNAME = "root";
    private static final String DEFAULT_PASSWORD = "reins2011!";
    private static final String INITIAL_CONTEXT_FACTORY = "org.wildfly.naming.client.WildFlyInitialContextFactory";
    private static final String PROVIDER_URL = "http-remoting://localhost:8080";
    public static void main(String[] args) throws Exception {
        Context context=null;
        Connection connection=null;
        try {
            // 设置上下文的JNDI查找
            log.info("设置JNDI访问环境信息也就是设置应用服务器的上下文信息!");
            final Properties env = new Properties();
            env.put(Context.INITIAL_CONTEXT_FACTORY, INITIAL_CONTEXT_FACTORY);// 该KEY的值为初始化Context的工厂类,JNDI驱动的类名
            env.put(Context.PROVIDER_URL, PROVIDER_URL);// 该KEY的值为Context服务提供者的URL.命名服务提供者的URL
            env.put(Context.SECURITY_PRINCIPAL, DEFAULT_USERNAME);
            env.put(Context.SECURITY_CREDENTIALS, DEFAULT_PASSWORD);//应用用户的登录名,密码.
            // 获取到InitialContext对象.
            context = new InitialContext(env);
            log.info("初始化上下文,'JNDI驱动类名','服务提供者URL','应用用户的账户','密码'完毕.");
            log.info("获取连接工厂!");
            ConnectionFactory connectionFactory = (ConnectionFactory) context.lookup(DEFAULT_CONNECTION_FACTORY);
            log.info("获取目的地!");
            Destination destination = (Destination) context.lookup(DEFAULT_DESTINATION);
            // 创建JMS连接、会话、生产者和消费者
            connection = connectionFactory.createConnection(DEFAULT_USERNAME, DEFAULT_PASSWORD);
            Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            MessageProducer producer = session.createProducer(destination);
            connection.start();
            int count = Integer.parseInt(DEFAULT_MESSAGE_COUNT);
            // 发送特定数目的消息
            TextMessage message = null;
            for (int i = 0; i < count; i++) {
                message = session.createTextMessage(DEFAULT_MESSAGE);
                producer.send(message);
                log.info("message:"+message);
                log.info("message:"+DEFAULT_MESSAGE);
            }
            // 等待30秒退出
            CountDownLatch latch = new CountDownLatch(1);
            latch.await(30, TimeUnit.SECONDS);
        } catch (Exception e) {
            log.severe(e.getMessage());
            throw e;
        } finally {
            if (context != null) {
                context.close();
            }
            // 关闭连接负责会话,生产商和消费者
            if (connection != null) {
                connection.close();
            }
        }
    }
}