CREATE TABLE `test` (
                        `id` int NOT NULL,
                        `a` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        `b` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        `c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        `d` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        `e` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `idx_a` (`a`) USING BTREE,
                        KEY `idx_bcd` (`b`,`c`,`d`) USING BTREE,
                        KEY `idx_e` (`e`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


EXPLAIN select * FROM `test` WHERE b='b' and c>'c';

EXPLAIN select c,d FROM `test` WHERE b='b';

EXPLAIN SELECT * FROM test WHERE a = 'a';

EXPLAIN select a.* FROM `test` a join test b on a.a =b.a WHERE a.a='a';

EXPLAIN select a.* FROM `test` a join test b on a.id =b.id WHERE a.id=1;


EXPLAIN select a.* FROM `test` a join test b on a.id =b.id WHERE a.a='a';

EXPLAIN SELECT a.* FROM test a JOIN test b ON a.id = b.id WHERE b.a = 'a';


EXPLAIN select * FROM `test`WHERE id=1;


EXPLAIN SELECT * FROM test WHERE e='e';


EXPLAIN SELECT * FROM test WHERE b = 'b' AND c = 'c' AND d LIKE 'd%' AND a> 0;


EXPLAIN SELECT b FROM test WHERE b in('a','b');
