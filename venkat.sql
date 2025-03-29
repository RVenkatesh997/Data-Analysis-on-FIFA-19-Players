use ds_mar_2025;
# How many players are there in the dataset?
select count(distinct(id)) from fifa; 

# How many nationalities do these players belong to
select count(distinct(nationality)) as cnt from fifa ; 

# Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select nationality ,count(*) as player_count from fifa  group by nationality order by player_count desc limit 3;

# What is the total wage given to all players?What’s the average and standard deviation?
select sum(wage),avg(wage),stddev(wage) from fifa;

#Which player has the highest wage? Who has the lowest
select Name, wage  from fifa where wage=(select max(wage) from fifa) or wage=(select min(wage) from fifa); 

#The player having the best overall rating? Worst overall rating
select Name,Overall from fifa where Overall=(select max(Overall) from fifa) or Overall=(select min(Overall) from fifa);

#Club having the highest total of overall rating? Highest Average of overall rating
select * from fifa;
select club,Overall from fifa where Overall=(select max(Overall) from fifa) or Overall=(select min(Overall) from fifa);

# What  are the top 5 clubs based on the average rating of their players?
select club,avg(Overall) from fifa  group by club order by avg(overall) desc limit 5;

#What is the distribution of players whose preferred foot is left vsright
select count(*),Preferred_Foot from fifa group by Preferred_Foot;

# Which jersey number is the luckiest?
select Jersey_Number, Overall from fifa group by Jersey_Number,Overall order by Overall desc limit 1;

#What is the frequency distribution of nationalities among players whose club name starts with M
select Name,nationality,club from fifa where club like 'm%';

#How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019(both inclusive)?
SELECT club, COUNT(DISTINCT ID) AS count 
FROM fifa 
WHERE STR_TO_DATE(joined, '%d-%m-%Y') BETWEEN '2018-05-20' AND '2019-04-10'
GROUP BY club;

#How many players have joined their respective clubs date wise 
select Name,Joined,club from fifa;

#  How many players have joined their respective clubs yearly
SELECT club, name, YEAR(STR_TO_DATE(joined, '%Y-%m-%d')) AS joined_year  
FROM fifa order by joined_year;
