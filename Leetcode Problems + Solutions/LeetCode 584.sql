
-- Leetcode qs 584 
-- Create table If Not Exists Customer (id char, name varchar(25), referee_id varchar(255));
-- Truncate table Customer;
-- insert into Customer (id, name, referee_id) values ('1', 'Will', 'None');
-- insert into Customer (id, name, referee_id) values ('2', 'Jane', 'None');
-- insert into Customer (id, name, referee_id) values ('3', 'Alex', '2');
-- insert into Customer (id, name, referee_id) values ('4', 'Bill', 'None');
-- insert into Customer (id, name, referee_id) values ('5', 'Zack', '1');
-- insert into Customer (id, name, referee_id) values ('6', 'Mark', '2');

-- Ans
-- SELECT name
-- FROM Customer
-- WHERE IFNULL(referee_id,0) <> 2;
