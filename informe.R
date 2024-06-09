#Cargamos el dataset
spotifyr<- read.csv('C:/Users/Usuario/Documents/trabajoED24/spotify-2023.csv')

str(data.spotify)
head(data.spotify)

#Eliminamos fila con error
data.spotify<-spotifyr[-575,]
View(data.spotify)

#Cargamos librerias
library(ggplot2)
library(tidyverse)

#Variable 'streams'

data.spotify$streams<-as.numeric(data.spotify$streams)

ggplot(data.spotify)+
  geom_histogram(aes(x=streams), bins = 30)+
  labs(title = 'Histograma escuchas', x='Streams', y='Count')

ggplot(data.spotify)+
  geom_histogram(aes(x= sqrt(streams)), bins = 30)+
  labs(title = 'Histograma escuchas (sqrt)', x='Streams', y='Count')

ggplot(data.spotify)+
  geom_histogram(aes(x= sqrt(streams), fill=after_stat(count)), bins = 30 , color='bisque4')+
  scale_fill_gradient('Streams', low = 'cadetblue', high = 'blue')+
  labs(title = 'Histograma escuchas (sqrt)', x='Streams', y='Count')+
  scale_x_continuous(breaks = seq(0, max(sqrt(data.spotify$streams)), by = 5000)) +
  theme_minimal()
