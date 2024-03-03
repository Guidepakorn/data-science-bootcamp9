library(nycflights13)
library(tidyverse) #dplyr
data("flights")
view(flights)

Q1 : Summarize about distance in Jan 2013
flights%>%
  filter(month == 1 ,year == 2013)%>%
  summarize(Total_Dis = sum(distance),
            Avg_Dis = mean(distance),
            Max_Dis = max(distance),
            Min_Dis = min(distance),
            Med_Dis = median(distance))

Answer : 
Total_Dis Avg_Dis Max_Dis Min_Dis Med_Dis
      <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
1  27188805   1007.    4983      80     872

Q2 : Top 5 most departure delay carrier in 2013
flights%>%
  filter(year == 2013) %>%
  select(carrier ,dep_delay, dep_time,tailnum,flight) %>%
  arrange(dep_delay)%>%
  head(5)

Answer :
carrier dep_delay dep_time tailnum flight
  <chr>       <dbl>    <int> <chr>    <int>
1 B6            -43     2040 N592JB      97
2 DL            -33     2022 N612DL    1715
3 EV            -32     1408 N825AS    5713
4 DL            -30     1900 N934DL    1435
5 F9            -27     1703 N208FR     837

Q3 : Total flight in Feb 2013
flights %>%
  filter(month == 2 , year == 2013)%>%
  count(carrier)%>%
  arrange(desc(n))%>%
  left_join(airlines ,by = "carrier")%>%
  select(name , Total_flight = n)

Answer :
name                        Total_flight
   <chr>                              <int>
 1 United Air Lines Inc.               4346
 2 JetBlue Airways                     4103
 3 ExpressJet Airlines Inc.            3827
 4 Delta Air Lines Inc.                3444
 5 American Airlines Inc.              2517
 6 Envoy Air                           2044
 7 US Airways Inc.                     1552
 8 Endeavor Air Inc.                   1459
 9 Southwest Airlines Co.               911
10 AirTran Airways Corporation          296
11 Virgin America                       271
12 Alaska Airlines Inc.                  56
13 Frontier Airlines Inc.                49
14 Mesa Airlines Inc.                    48
15 Hawaiian Airlines Inc.                28

Q4 : Which countries do the most flights from LGA in January?
flights %>%
  select(month , origin , dest)%>%
  filter(month == 1 , origin == "LGA")%>%
  group_by(dest)%>%
  count(dest)%>%
  arrange(desc(n))%>%
  head(3)

Answer : 
dest      n
  <chr> <int>
1 ATL     878
2 ORD     583
3 MIA     451

Q5 : Most top 3 flight each month
flights %>%
  group_by(month)%>%
  count(carrier)%>%
  arrange(month,desc(n))%>%
  top_n(3)

Answer :
month carrier     n
   <int> <chr>   <int>
 1     1 UA       4637
 2     1 B6       4427
 3     1 EV       4171
 4     2 UA       4346
 5     2 B6       4103
 6     2 EV       3827
 7     3 UA       4971
 8     3 B6       4772
 9     3 EV       4726
10     4 UA       5047
