
library(tidyverse)

# quiz 2

# 1.
sleep

median(sleep[sleep$group == 2,"extra"])
median(sleep$extra)
aggregate(extra ~ group, data = sleep, median)

sleep %>% group_by(group) %>% summarise(median(extra))
sleep %>% filter(group == 2) %>% summarise(median(extra))

#2.
esoph
head(esoph)

esoph[esoph$ncases != 0 , ]

esoph %>% 
    filter(ncases != 0) %>% 
    group_by(agegp) %>% 
    summarise(sum(ncontrols))

esoph %>% filter(ncases != 0) 

(soma <- aggregate(ncontrols ~ agegp, 
                  data = esoph[esoph$ncases != 0 , ], 
                  sum, na.rm = T))
soma

    #filtrando por meio de um OUTRO pacote, com OUTRA sintaxe
    esoph <- as.data.table(esoph)
    esoph[ncases != 0 , ]


#5.

starwars %>% summarise(n = n())
dim(starwars)
str(starwars)
nrow(starwars)

#6. 
    #trazendo uma coluna NA
    starwars[(starwars$species == "Human") & !is.na(starwars$species), ] 
    starwars[is.na(starwars$species), ] 
    
    
starwars %>% 
    filter(species == "Human")


#7
sum(ifelse(starwars$sex == "male", 1, 0), na.rm = T)
sum(ifelse(starwars["sex"] == "male", 1, 0), na.rm=T)
sum((starwars["sex"] == "male"), na.rm = T)
nrow(starwars[starwars$sex == "male", ])
nrow(starwars[(starwars$sex == "male") &
                  !is.na(starwars$sex), ])



#quiz 3

#1
data("starwars")

#2
starwars %>% select(-hair_color, 
                    -skin_color,
                    -eye_color)
starwars %>% select(!(4:6))

#3
starwars %>% 
    filter(species %in% c("Human", "Droid")) %>% 
    group_by(species) %>% 
    count

starwars %>% 
    filter(species == c("Human", "Droid"))%>% 
    group_by(species) %>% 
    count

#4
starwars %>% mutate(teste = sum(mass, na.rm = T))

starwars %>% 
    mutate(teste = sum(mass, na.rm = T)) %>% 
    select(teste, mass)


starwars %>% 
    mutate(teste = sum(mass + height, na.rm = T)) %>% 
    select(teste, mass, height)

starwars %>% 
    mutate(teste = mass * 2) %>% 
    select(teste, mass, height)

starwars %>% 
     rowwise() %>% 
     mutate(teste = sum(mass + height, na.rm = T)) %>% 
     select(teste, mass, height)

#5.

starwars %>% 
    group_by(gender) %>% 
    distinct(species)

starwars %>%
    group_by(gender,species) %>%
    summarise(n())

starwars %>%
    group_by(gender) %>%
    summarise(n_distinct(species))
