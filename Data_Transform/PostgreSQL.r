## connect to postgresql server
library(RPostgreSQL)
library(tidyverse)

## Create Connection
con <- dbConnect (
  PostgreSQL(),
  host = "arjuna.db.elephantsql.com",
  dbname = "qnyvwnkx",
  user = "qnyvwnkx",
  password = "XX3iXXwgHvEdd-j8SIMmozj8XV_FnLgF",
  port = 5432
)

## Create dataframe
customers <- tribble (
  ~customerId, ~name, ~age, ~gender, ~occupation ,
  1,'Guide',25,'Male',"Investor",
  2,'John',26,'Male',"Audit",
  3,'Tom',28,'Male',"Manager",
  4,'Jerry',26,"Male","Sales",
  5,'Emma',28,"Female","Cook",
  6,'Lisa',32,"Female","Celebrity"
)

orders <- tribble(
  ~customerid, ~orderid,~menu_name,~Qty,~price,~orderdate,
  1,101,"Hawaiian",1,300,"2022-09-11",
  2,102,"Seafood Deluxe",1,400,"2022-09-12",
  3,103,"Meat Deluxe",2,700,"2022-09-13",
  4,104,"Veggie Mushroom",2,500,"2022-09-14",
  5,105,"Chicken Trio",4,1200,"2022-09-15",
  6,106,"Hawaiian",3,900,"2022-09-16"
)

menus <- tribble(
  ~menu_name , ~price,
  "Hawaiian",300,
  "Seafood Deluxe",400,
  "Meat Deluxe" , 350,
  "Veggie Mushroom",250,
  "Chicken Trio",300
)

## Write table to database
dbWriteTable(con, "customers", customers)
dbWriteTable(con, "orders", orders) 
dbWriteTable(con, "menus", menus) 

## get query
df <- dbGetQuery(con, "select menu_name,price from menus")

df

## Close connection
dbDisconnect(con)
