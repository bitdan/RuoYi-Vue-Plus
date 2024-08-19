import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.redisson.Redisson;
import org.redisson.api.RScoredSortedSet;
import org.redisson.api.RedissonClient;
import org.redisson.client.codec.StringCodec;
import org.redisson.config.Config;

import java.util.AbstractMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @version 1.0
 * @description HotNewsRanking
 * @date 2024/8/19 12:55:06
 */
@Slf4j
public class HotNewsRanking {
    private static final String HOT_NEWS_KEY = "hot_news_key";
    public static final Integer TOP_NEWS_COUNT = 10;
    private final RedissonClient redisson;
    private final RScoredSortedSet<String> hotNews;


    public HotNewsRanking() {
        Config config = new Config();
        config.setCodec(new StringCodec());
        config.useSingleServer()
            .setDatabase(15)
            .setPassword("dudu0.0@")
            .setAddress("redis://139.159.140.112:30379");
        this.redisson = Redisson.create(config);
        this.hotNews = redisson.getScoredSortedSet(HOT_NEWS_KEY);
    }

    public void incrementNewsVisit(String newsId) {
        hotNews.addScore(newsId, 1);
    }

    public List<Map.Entry<String, Double>> getTopNews() {
        return hotNews.entryRangeReversed(0, TOP_NEWS_COUNT - 1)
            .stream()
            .map(entry -> new AbstractMap.SimpleEntry<>(entry.getValue(), entry.getScore()))
            .collect(Collectors.toList());
    }

    public void removeNews(String newsId) {
        hotNews.remove(newsId);
    }

    public void clearRanking() {
        hotNews.clear();
    }

    public long getTotalNewsCount() {
        return hotNews.size();
    }
    public Double getNewsScore(String newsId) {
        return hotNews.getScore(newsId);
    }

    public  void close(){
        redisson.shutdown();
    }

    @Test
    public void test(){
        HotNewsRanking ranking = new HotNewsRanking();
        ranking.clearRanking();
        for (int i = 0; i < 100; i++) {
            ranking.incrementNewsVisit("news1");
        }

        for (int i = 0; i < 150; i++) {
            ranking.incrementNewsVisit("news2");
        }

        for (int i = 0; i < 80; i++) {
            ranking.incrementNewsVisit("news3");
        }

        for (int i = 0; i < 200; i++) {
            ranking.incrementNewsVisit("news4");
        }

        for (int i = 0; i < 120; i++) {
            ranking.incrementNewsVisit("news5");
        }

        List<Map.Entry<String, Double>> topNews = ranking.getTopNews();
        log.info("topNews is : {}", topNews);
        ranking.close();
    }
}
