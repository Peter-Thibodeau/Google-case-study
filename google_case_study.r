# ride length
cyclistic$ride_length <- (as.double(difftime(cyclistic $ended_at, cyclistic$started_at, units="mins")))

# plot the ride_length outliers
ggplot(data = cyclistic) + geom_point(mapping = aes(x = ride_length, y = day_of_week))
