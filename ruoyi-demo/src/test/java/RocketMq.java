import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.apis.ClientConfiguration;
import org.apache.rocketmq.client.apis.ClientConfigurationBuilder;
import org.apache.rocketmq.client.apis.ClientException;
import org.apache.rocketmq.client.apis.ClientServiceProvider;
import org.apache.rocketmq.client.apis.consumer.ConsumeResult;
import org.apache.rocketmq.client.apis.consumer.FilterExpression;
import org.apache.rocketmq.client.apis.consumer.FilterExpressionType;
import org.apache.rocketmq.client.apis.consumer.PushConsumer;
import org.apache.rocketmq.client.apis.message.Message;
import org.apache.rocketmq.client.apis.producer.Producer;
import org.apache.rocketmq.client.apis.producer.SendReceipt;
import org.apache.rocketmq.client.apis.producer.Transaction;
import org.apache.rocketmq.client.apis.producer.TransactionResolution;
import org.junit.jupiter.api.Test;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.UUID;

/**
 * @version 1.0
 * @description test
 * @date 2024/8/16 22:50:40
 */
@Slf4j
public class RocketMq {


    @Test
    public void test12() throws ClientException, IOException {
        // 接入点地址，需要设置成 Proxy 的地址和端口列表，一般是xxx:8081
        String endpoint = "1.12.245.89:8081";
        // 消息发送的目标Topic名称，需要提前创建。
        String topic = "test";
        ClientServiceProvider provider = ClientServiceProvider.loadService();
        ClientConfigurationBuilder builder = ClientConfiguration.newBuilder().setEndpoints(endpoint);
        ClientConfiguration configuration = builder.build();

        // 初始化Producer时需要设置通信配置以及预绑定的Topic
        Producer producer = provider.newProducerBuilder()
            .setTopics(topic)
            .setClientConfiguration(configuration)
            .build();

        // 普通消息发送
        Message message = provider.newMessageBuilder()
            .setTopic(topic)
            // 设置消息索引键，可根据关键字精确查找某条消息
            .setKeys("messageKey")
            // 设置消息Tag，用于消费端根据指定Tag过滤消息
            .setTag("messageTag")
            // 消息内容实体（byte[]）
            .setBody("hello rocketMQ".getBytes())
            .build();
        try {
            // 发送消息，需要关注发送结果，并捕获失败等异常。
            SendReceipt sendReceipt = producer.send(message);
            log.info("send message successfully, messageId={}", sendReceipt.getMessageId());
        } catch (ClientException e) {
            log.error("failed to send message", e);
        }
        // 关闭
        producer.close();
    }

    @Test
    public void pushConsumerTest() throws Exception {
        ClientServiceProvider provider = ClientServiceProvider.loadService();
        // 接入点地址，需要设置成Proxy的地址和端口列表，一般是xxx:8081;xxx:8081
        String endpoint = "1.12.245.89:8081";
        ClientConfiguration clientConfiguration = ClientConfiguration.newBuilder()
            .setEndpoints(endpoint)
            .build();
        // 订阅消息的过滤规则，表示订阅所有Tag的消息
        String tag = "*";
        FilterExpression filterExpression = new FilterExpression(tag, FilterExpressionType.TAG);
        // 为消费者指定所属的消费者分组，Group需要提前创建
        String consumerGroup = "TestGroup";

        // 指定需要订阅哪个目标Topic，Topic需要提前创建
        String topic = "test";
        // 初始化 PushConsumer，需要绑定消费者分组ConsumerGroup、通信参数以及订阅关系
        PushConsumer pushConsumer = provider.newPushConsumerBuilder()
            .setClientConfiguration(clientConfiguration)
            // 设置消费者分组
            .setConsumerGroup(consumerGroup)
            // 设置预绑定的订阅关系
            .setSubscriptionExpressions(Collections.singletonMap(topic, filterExpression))
            // 设置消费监听器
            .setMessageListener(messageView -> {
                // 处理消息并返回消费结果
                log.info("consume message successfully, messageId={}", messageView.getMessageId());
                // 消息内容处理
                ByteBuffer body = messageView.getBody();
                String message = StandardCharsets.UTF_8.decode(body).toString();
                body.flip();
                log.info("message body={}", message);
                return ConsumeResult.SUCCESS;
            }).build();
        Thread.sleep(Long.MAX_VALUE);
        // 如果不需要再使用 PushConsumer，可关闭该实例。
        pushConsumer.close();
    }

    @Test
    public void transactionProviderTest() throws Exception {
        String endpoint = "1.12.245.89:8081";// Proxy的地址和端口
        ClientConfiguration configuration = ClientConfiguration.newBuilder()
            .setEndpoints(endpoint).build();

        String topic = "transaction_topic";
        // 构造事务生产者：事务消息需要生产者构建一个事务检查器，用于检查确认异常事务的中间状态
        ClientServiceProvider provider = ClientServiceProvider.loadService();
        Producer producer = provider.newProducerBuilder()
            .setTopics(topic)
            .setClientConfiguration(configuration)
            // 设置事务检查器（不知道啥时候触发的。。。遇到了在研究一下吧）
            .setTransactionChecker(messageView -> {
                // 事务检查器一般是根据业务的ID去检查本地事务是否正确提交还是回滚，此处以订单ID属性为例
                // 在订单表找到了这个订单，说明本地事务插入订单的操作已经正确提交；如果订单表没有订单，说明本地事务已经回滚
                String orderId = messageView.getProperties().get("orderId");
                if (!StringUtils.hasText(orderId)) {
                    // 没有业务ID直接回滚
                    return TransactionResolution.ROLLBACK;
                }
                // 检查本地事务是否提交
                String order = getOrderById(orderId);
                log.info("check transaction start order={} [orderId={}]", order, orderId);
                if (!StringUtils.hasText(order)) {
                    // 本地事务没有正常提交直接回滚
                    return TransactionResolution.ROLLBACK;
                }
                // 通过业务ID查询到了对应的记录说明本地事务已经正常提交了
                // 消息事务也正常提交
                return TransactionResolution.COMMIT;
            }).build();

        // 开启事务分支
        Transaction transaction;
        try {
            transaction = producer.beginTransaction();
        } catch (ClientException e) {
            e.printStackTrace();
            // 事务分支开启失败则直接退出
            return;
        }

        // 构建事务消息
        Message message = provider.newMessageBuilder()
            .setTopic(topic)
            .setKeys("transaction_key")
            .setTag("transaction_tag")
            .addProperty("orderId", UUID.randomUUID().toString()) // 一般事务消息都会设置一个本地事务关联的唯一ID，用来做本地事务回查的校验
            .setBody("hello rocketMQ this is a transaction message".getBytes(StandardCharsets.UTF_8))
            .build();

        // 发送事务消息
        SendReceipt sendReceipt;
        try {
            sendReceipt = producer.send(message, transaction);
        } catch (ClientException e) {
            e.printStackTrace();
            // 事务消息发送失败，事务可以直接退出并回滚
            return;
        }
        /**
         * 执行本地事务，并确定本地事务结果
         * 1. 如果本地事务提交成功，则提交消息事务
         * 2. 如果本地事务提交失败，则回滚消息事务
         * 3. 如果本地事务未知异常，则不处理，等待事务消息回查
         */
        boolean localTransactionOk = doLocalTransaction();
        if (localTransactionOk) {
            try {
                transaction.commit();
            } catch (ClientException e) {
                // 业务可以自身对实时性的要求选择是否重试，如果放弃重试，可以依赖事务消息回查机制进行事务状态的提交
                e.printStackTrace();
            }
        } else {
            try {
                transaction.rollback();
            } catch (ClientException e) {
                // 建议记录异常信息，回滚异常时可以无需重试，依赖事务消息回查机制进行事务状态的提交
                e.printStackTrace();
            }
        }
        Thread.sleep(Long.MAX_VALUE);
    }

    // 模拟订单查询服务用来确认订单事务是否提交成功
    private static String getOrderById(String orderId) {
        return "order";
    }

    // 模拟本地事务执行结果
    private static boolean doLocalTransaction() {
        return true;
    }

}
