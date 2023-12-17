import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import java.util.Random;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

@Slf4j
public class CompletableFutureTest {
    private class CustomThreadFactory implements ThreadFactory {

        private AtomicInteger count = new AtomicInteger(0);

        @Override
        public Thread newThread(Runnable r) {
            Thread t = new Thread(r);
            String threadName = CompletableFutureTest.class.getSimpleName() + count.addAndGet(1);
            System.out.println(threadName);
            t.setName(threadName);
            return t;
        }
    }


    private class CustomRejectedExecutionHandler implements RejectedExecutionHandler {

        @Override
        public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
            // 记录异常
            // 报警处理等
            System.out.println("error.............");
        }
    }

    ThreadPoolExecutor pool = new ThreadPoolExecutor(
        10,
        30,
        30,
        TimeUnit.MINUTES,
        new ArrayBlockingQueue<Runnable>(10), //有界队列
        new CustomThreadFactory(),
        new ThreadPoolExecutor.AbortPolicy());

    //无返回值
    @Test
    public void testRunAsync() throws Exception {
        CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
            }
            System.out.println("run end ...");
        }, pool).thenRunAsync(() -> {
            log.info("whoe is : {}", "whoe");
        }, pool);

        future.get();
    }

    //有返回值
    @Test
    public void testSupplyAsync() throws Exception {
        CompletableFuture<Long> future = CompletableFuture.supplyAsync(() -> {
            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
            }
            System.out.println("run end ...");
            return System.currentTimeMillis();
        });

        long time = future.get();
        System.out.println("time = " + time);
    }

    @Test
    public void testWhenComplete() throws Exception {
        CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
                try {
                    TimeUnit.SECONDS.sleep(1);
                } catch (InterruptedException e) {
                }
                if (new Random().nextInt() % 2 >= 0) {
                    int i = 12 / 2;
                }
                System.out.println(Thread.currentThread().getName() + ", run end ...");
            }).whenCompleteAsync((t, action) -> System.out.println(Thread.currentThread().getName() + ", whenComplete 1 执行完成！"))
            .whenCompleteAsync((t, action) -> System.out.println(Thread.currentThread().getName() + ", whenComplete 2 执行完成！")).exceptionally(t -> {
                System.out.println(Thread.currentThread().getName() + ", 执行失败！" + t.getMessage());
                return null;
            });
        future.get();
//        TimeUnit.SECONDS.sleep(2);
    }

    @Test
    public void testThenApply() throws Exception {
        CompletableFuture<Long> future = CompletableFuture.supplyAsync(() -> {
            long result = new Random().nextInt(100);
            System.out.println(Thread.currentThread().getName() + ", result1=" + result);
            return result;
        }).thenApplyAsync(t -> {
            long result = t * 5;
            System.out.println(Thread.currentThread().getName() + ", result2=" + result);
            return result;
        });

        long result = future.get();
        System.out.println(Thread.currentThread().getName() + ", result=" + result);
    }

    @Test
    void testHandle() throws Exception {
        CompletableFuture<Integer> future = CompletableFuture.supplyAsync(() -> {
            System.out.println(Thread.currentThread().getName() + ", in async task");
            int i = 10 / 0;
            return new Random().nextInt(10);
        }).handle((param, throwable) -> {
            int result = -1;
            if (throwable == null) {
                result = param * 2;
            } else {
                System.out.println(Thread.currentThread().getName() + "," + throwable.getMessage());
            }
            return result;
        });
        System.out.println(Thread.currentThread().getName() + "," + future.get());
    }

    @Test
    public void testThenAccept() throws Exception {
        CompletableFuture<Void> future = CompletableFuture.supplyAsync(() -> {
            System.out.println(Thread.currentThread().getName() + ", in async task");
            return new Random().nextInt(10);
        }).thenAccept(integer -> {
            System.out.println(Thread.currentThread().getName() + ", integer=" + integer);
        });
        future.get();
        System.out.println(Thread.currentThread().getName() + ", caller");
    }

    @Test
    void testThenRun() throws Exception {
        CompletableFuture<Integer> future = CompletableFuture.supplyAsync(() -> {
            System.out.println(Thread.currentThread().getName() + ", in async task");
            return new Random().nextInt(10);
        }).thenApplyAsync((res) -> {
            System.out.println(Thread.currentThread().getName() + ", in thenRun " + res);
            return res;
        });
        Integer i = future.get();
        log.info("i is : {}", i);
    }

    @Test
    void thenCombine() throws Exception {
        CompletableFuture<String> future1 = CompletableFuture.supplyAsync(() -> {
            System.out.println(Thread.currentThread().getName() + ", in async task 1");
            return "hello";
        });
        CompletableFuture<String> future2 = CompletableFuture.supplyAsync(() -> {
            System.out.println(Thread.currentThread().getName() + ", in async task 2");
            return "world";
        });
        CompletableFuture<String> result = future1.thenCombineAsync(future2, (t, u) -> {
            System.out.println(Thread.currentThread().getName() + ", in combine task");
            return t + " " + u;
        });
        log.info(Thread.currentThread().getName() + "," + result.get());
    }




}
