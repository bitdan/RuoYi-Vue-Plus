import java.util.*;

/**
 * @version 1.0
 * @description Solution
 * @date 2024/8/26 14:42:59
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param meetings int整型ArrayList<ArrayList<>>
     * @return int整型
     */



    public int attendmeetings (ArrayList<ArrayList<Integer>> meetings) {
        int result = 0;
        int cur=0;
        int size = meetings.size();
        int day=meetings.get(0).get(0);
        Collections.sort(meetings, (o1, o2) -> o1.get(0) - o2.get(0));
        PriorityQueue<Integer> queue = new PriorityQueue<>();
        while (cur<size||!queue.isEmpty()){
            while (cur<size&&meetings.get(cur).size()==day){
                queue.offer(meetings.get(cur).get(1));
                cur++;
            }
            if (!queue.isEmpty()&&queue.peek()<day){
                queue.poll();
            }
            while(!queue.isEmpty()){
                queue.poll();
                result++;
                break;
            }
            day++;
        }
        return result;
    }
}
