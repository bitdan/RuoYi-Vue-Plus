import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import java.util.BitSet;

/**
 * @version 1.0
 * @description test
 * @date 2024/8/11 23:58:13
 */
@Slf4j
public class BitMapTest {

    @Test
    public void test() {
        int nums[]={5, 3, 7, 5, 9, 3, 8, 7};
        BitSet bitSet = new BitSet();
        for (int i = 0; i < nums.length; i++) {
            if (!bitSet.get(nums[i])) {
                bitSet.set(nums[i]);
            }
        }
        log.info("bitSet: {}", bitSet);
    }
}
