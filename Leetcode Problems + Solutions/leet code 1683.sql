-- Leetcode no. 1683 
-- Create table If Not Exists Tweets(tweet_id int, content varchar(50));
-- Truncate table Tweets;
-- insert into Tweets (tweet_id, content) values ('1', 'Vote for Biden');
-- insert into Tweets (tweet_id, content) values ('2', 'Let us make America great again!');

-- Ans
-- SELECT tweet_id
-- from tweets
-- where length(content) > 15