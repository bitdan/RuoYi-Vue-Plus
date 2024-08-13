import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @version 1.0
 * @description test
 * @date 2024/8/11 23:58:13
 */
@Slf4j
public class BitMapTest {
    static final int MAXIMUM_CAPACITY = 1 << 30;
    @Test
    public void test() {
        int nums[] = {5, 3, 7, 5, 9, 3, 8, 7};
        BitSet bitSet = new BitSet();
        for (int i = 0; i < nums.length; i++) {
            if (!bitSet.get(nums[i])) {
                bitSet.set(nums[i]);
            }
        }
        log.info("bitSet: {}", bitSet);
    }

    @Test
    public void test1() {
        Student ace = new Student(1, "ace", 22);
        Student ace1 = new Student(1, "ace", 23);
        Student ab = new Student(1, "ab", 23);
        Student[] students = {ace, ace1, ab};
        Arrays.sort(students);
        for (Student student : students) {
            log.info("id: " + student.id + ", name: " + student.name + ", age: " + student.age);
        }
    }

    @Test
    public void test2() {
        Student ace = new Student(1, "ace", 22);
        Student ace1 = new Student(1, "ace", 23);
        Student ab = new Student(1, "ab", 23);
        // 将数组转换为List
        List<Student> students = Arrays.asList(ace, ace1, ab);

        // 使用Collections.sort对List进行排序
        Collections.sort(students);

        // 输出排序结果
        log.info("students is : {}", students);
    }

    @Test
    public void test3() {
        Student ace = new Student(1, "ace", 22);
        Student ace1 = new Student(1, "ace", 23);
        Student ab = new Student(1, "ab", 23);
        List<Student> students = Arrays.asList(ace, ace1, ab);
        Collections.sort(students, (o1, o2) -> {
            int i = o1.name.compareTo(o2.name);
            if (i == 0) {
                return Integer.compare(o1.age, o2.age);
            }
            return i;
        });
        log.info("students is : {}", students);
    }

    @Test
    public void test4() {
        Student ace = new Student(1, "ace", 22);
        Student ace1 = new Student(1, "ace", 23);
        Student ab = new Student(1, "ab", 23);
        List<Student> students = new ArrayList<>(Arrays.asList(ace, ace1, ab));
        List<Student> collect = students.stream().sorted().collect(Collectors.toList());
        log.info("students is : {}", collect);

//        Iterator<Student> iterator = students.iterator();
//        while (iterator.hasNext()) {
//            Student student = iterator.next();
//            if (student.name.equals("ab")) {
//                iterator.remove();
//            }
//        }
        students.removeIf(o->o.name.equals("ab"));
        log.info("students is : {}", students);
    }

    @Test
    public void test5() {
        LruListCache<Student> studentLruListCache = new LruListCache<>(3);
        studentLruListCache.add(new Student(1, "ace", 22));
        studentLruListCache.add(new Student(1, "ace", 23));
        studentLruListCache.add(new Student(1, "ab", 23));
        studentLruListCache.add(new Student(1, "ax", 23));
        log.info("studentLruListCache is : {}", studentLruListCache);

    }

    @Test
    public void test6() {
        int tableSize = tableSizeFor(3);
        log.info("tableSize is : {}", tableSize);
    }

    static final int tableSizeFor(int cap) {
        int n = cap - 1;
        n |= n >>> 1;
        n |= n >>> 2;
        n |= n >>> 4;
        n |= n >>> 8;
        n |= n >>> 16;
        return (n < 0) ? 1 : (n >= MAXIMUM_CAPACITY) ? MAXIMUM_CAPACITY : n + 1;
    }

    @Test
    public void test7() {
        MyHashMap map = new MyHashMap();
        map.put(1,1);
        map.put(2,2);
        map.put(1,40);
        map.put(2,200);

        log.info(map.get(1).toString());
        log.info(map.get(2).toString());
    }

    @Test
    public void test8() {
        HashMap map = new HashMap<Integer,Integer>();
        map.put(1,1);
        map.put(2,2);
        map.put(1,40);
        map.put(2,200);

        log.info(map.get(1).toString());
        log.info(map.get(2).toString());
        Set set = map.keySet();
        log.info(set.toString());
        Set set1 = map.entrySet();
        log.info(set1.toString());
    }
}
