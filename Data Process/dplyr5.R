th_year` (in this order), and only one row.
# You can use:
#   - `summarize()`, `min()` and `max()` - make sure you use the
#   `na.rm` argument of `min()` and `max()` wisely.
# (dimensions should be `years (1x2)`)
# To check your solution, `years` prints to:
# # A tibble: 1 x 2
# min_birth_year max_birth_year
# <dbl>          <dbl>
# 1           1885           2000
#'
## Do not modify this line!
years<-trips %>%
  summarize(min_birth_year=min(birth_year,na.rm=TRUE),max_birth_year=max(birth_year,na.rm=TRUE))


# 4. Find all trips that started and ended on Broadway. Assign the result to
# tibble `broadway`. `broadway` should be similar to `trips`, but only contain
# the trips that started and ended on Broadway.
# You can use:
#   - `filter()` and `str_detect()` (and `|` in the `str_detect()` call).
# (dimensions should be `broadway (18,603x15)`)
# To check your solution, `broadway` prints to:
# # A tibble: 18,603 x 15
# tripduration starttime stoptime start_station_id start_station_nбн start_station_lбн start_station_lбн
# <dbl> <chr>     <chr>               <dbl> <chr>                       <dbl>            <dbl>
#  1          826 8/30/201бн 8/30/20бн             3301 Columbus Ave & бн             40.8            -74.0
#  2         2440 8/28/201бн 8/28/20бн             3147 E 85 St & 3 Ave              40.8            -74.0
#  3          660 8/16/201бн 8/16/20бн              362 Broadway & W 37бн             40.8            -74.0
#  4         1458 8/1/2016бн 8/1/201бн              321 Cadman Plaza E бн             40.7            -74.0
#  5          534 8/6/2016бн 8/6/201бн              536 1 Ave & E 30 St              40.7            -74.0
#  6          356 8/6/2016бн 8/6/201бн              257 Lispenard St & бн             40.7            -74.0
#  7          804 8/26/201бн 8/26/20бн              369 Washington Pl &бн             40.7            -74.0
#  8          555 8/5/2016бн 8/5/201бн              469 Broadway & W 53бн             40.8            -74.0
#  9          493 8/18/201бн 8/18/20бн              285 Broadway & E 14бн             40.7            -74.0
#  10          396 8/13/201бн 8/13/20бн             3063 Nostrand Ave & бн             40.7            -74.0
# бн with 18,593 more rows, and 8 more variables: end_station_id <dbl>, end_station_name <chr>,
#   end_station_latitude <dbl>, end_station_longitude <dbl>, bikeid <dbl>, usertype <chr>, birth_year <dbl>,
#   gender <dbl>
#'
## Do not modify this line!
names(trips)
broadway_right_answer<-trips %>%
  filter(str_detect(start_station_name,"Broadway")|str_detect(end_station_name,"Broadway"))
# zhizhang xitong
broadway<-trips %>%
  filter(str_detect(start_station_name,"wxl")|str_detect(end_station_name,"wxl"))
# 5. Create a `trips_counts` tibble that contains the counts of each
# possible trip (one possible trip = one starting station and one ending
# station).
# You can use:
#  - `group_by()` to group by `start_station_name` and `end_station_name`,
#  - `summarize()` along with `n()` to compute the counts across groups
# (dimensions should be `trips_counts (46,115x3)`)
# To check your solution, `trips_counts` prints to:
# # A tibble: 46,115 x 3
# # Groups:   start_station_name [564]
# start_station_name end_station_name  count
# <chr>              <chr>             <int>
#  1 1 Ave & E 16 St    1 Ave & E 16 St       3
#  2 1 Ave & E 16 St    1 Ave & E 18 St       4
#  3 1 Ave & E 16 St    1 Ave & E 30 St       9
#  4 1 Ave & E 16 St    1 Ave & E 44 St       1
#  5 1 Ave & E 16 St    1 Ave & E 68 St       2
#  6 1 Ave & E 16 St    1 Ave & E 78 St       2
#  7 1 Ave & E 16 St    2 Ave & E 31 St       2
#  8 1 Ave & E 16 St    5 Ave & E 29 St       2
#  9 1 Ave & E 16 St    6 Ave & Broome St     1
#  10 1 Ave & E 16 St    6 Ave & Canal St      4
# бн with 46,105 more rows
#'
## Do not modify this line!
trips_counts<-trips %>%
  group_by(start_station_name,end_station_name) %>%
  summarize(count=n())


# 6. Create a tibble `frequent_trips` containing the 10 most frequent
# station-to-station trips (it should contain three columns -
# `start_station_name`, `end_station_name` and `count` (in this order)).
# To do so you can:
#  - start with `trips_counts`,
#  - re-order it in descending order of `count` (using `arrange()`
#  and `desc()`),
#  - use `head()` to retain only the 10 first elements.
# (dimensions should be `frequent_trips (10x3)`)
# To check your solution, the first three lines of  `frequent_trips` print to:
# # A tibble: 10 x 3
# # Groups:   start_station_name [6]
# start_station_name      end_station_name        count
# <chr>                   <chr>                   <int>
#  1 Central Park S & 6 Ave  Central Park S & 6 Ave     73
#  2 Central Park S & 6 Ave  5 Ave & E 88 St            62
#  3 E 7 St & Avenue A       Cooper Square & E 7 St     48
#'
## Do not modify this line!
frequent_trips<-trips_counts %>%
  arrange(desc(count)) %>%
  head(10)
frequent_trips


