#plot and connect each plot for each country by using ggplot
ggplot(data = data_sub1)+ #using subset data named"data_sub1"
  geom_point(mapping = aes(x=health_spending, y=mortality, color=country))+ #add plots for each country
  geom_path(mapping = aes(x=health_spending, y=mortality, color=country))+ #add connecting line for each country
  scale_color_manual(values = c("Angola"="tan","Sierra Leone"="steelblue","Malaysia"="red","China"="blue","Vietnam"="green")) + #assign specific color to each country manually
  labs(x = "Health Expenditure per person (US$)", y = "0-5 years-old Mortality per 1000 live birhts") #add labels to x and y axis
ggplot(data = data_sub2)+
  geom_point(mapping = aes(x=health_spending, y=mortality, color=country))+
  geom_path(mapping = aes(x=health_spending, y=mortality, color=country))+
  labs(x = "Health Expenditure per person (US$)", y = "0-5 years-old Mortality per 1000 live birhts (log scale)")
