\# ride length  
cyclistic$ride_length <- (as.double(difftime(cyclistic $ended_at, cyclistic$started_at, units="mins")))

\# plot the ride_length outliers  
ggplot(data = cyclistic) + geom_point(mapping = aes(x = ride_length, y = day_of_week))

<img width="454" alt="image" src="https://github.com/Peter-Thibodeau/Google-case-study/assets/158618486/58d907c4-9476-40ce-907f-5e7d853b3a60">
