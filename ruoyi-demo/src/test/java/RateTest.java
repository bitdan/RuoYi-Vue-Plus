import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.redisson.Redisson;
import org.redisson.api.RRateLimiter;
import org.redisson.api.RateIntervalUnit;
import org.redisson.api.RateType;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

import java.util.concurrent.CountDownLatch;

/**
 * @version 1.0
 * @description test
 * @date 2024/8/1 15:57:12
 */
@Slf4j
public class RateTest {

    @Test
    public void test() throws InterruptedException {
        RRateLimiter rateLimiter = createLimiter();


        int allThreadNum = 20;

        CountDownLatch latch = new CountDownLatch(allThreadNum);

        long startTime = System.currentTimeMillis();
        for (int i = 0; i < allThreadNum; i++) {
            int finalI = i;
            new Thread(() -> {
            if (finalI % 3 == 0) {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
            boolean pass = rateLimiter.tryAcquire();
            if (pass) {
                log.info("get ");
            } else {
                log.info("no");
            }
          latch.countDown();
            }).start();
        }
        latch.await();
        System.out.println("Elapsed " + (System.currentTimeMillis() - startTime));

    }


    public static RRateLimiter createLimiter() {
        Config config = new Config();
        config.useSingleServer()
            .setTimeout(1000000)
            .setDatabase(4)
            .setAddress("redis://127.0.0.1:6379");

        RedissonClient redisson = Redisson.create(config);
        RRateLimiter rateLimiter = redisson.getRateLimiter("myRateLimiter3");
        // 初始化：PER_CLIENT 单实例执行，OVERALL 全实例执行
        // 最大流速 = 每10秒钟产生3个令牌
        rateLimiter.trySetRate(RateType.OVERALL, 3, 10, RateIntervalUnit.SECONDS);
        return rateLimiter;
    }


}
