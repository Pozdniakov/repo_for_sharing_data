
# Арифметические операции -------------------------------------------------

2 + 2
3 + 5 #это сложение
2 + 2 * 2
(2 + 2) * 2
5 / 2
6 ^ 2
7 - 1

# Functions ---------------------------------------------------------------


log(8)
?log
log(x = 8, base = 2)
sqrt(16)
16 ^ .5

a = 4
b <- -4
a == b
abs(b) == a
#5!=120
a != b
a > b
a < b
a >= a
b <= b

# Data types --------------------------------------------------------------

sqrt(2)^2 == 2
w <- "какой-то текст"
w <- 'какой-то текст'
t1 <- b <= b
b <= b
t1 <- TRUE
f1 <- FALSE
!t1
!f1
f1 & f1
f1 & t1
t1 & f1
t1 & t1

f1 | f1
f1 | t1
t1 | f1
t1 | t1
xor(t1, t1)

?`+`
`+`(4, 5)
`&`(t1, f1)

# Vectors -----------------------------------------------------------------

v1 <- c(4, 8, 15, 16, 23, 42)
c("Hi", "Neo", "welcome", "to", "vector")
c(TRUE, FALSE, TRUE)
c(v1, v1, v1)
c(1, 2, 3, 4, 5, 6, "семь")

1:10
5.7:20
20:1
seq(0, 120000, by = 10000)
age <- c(30, 20, 35, 27, 32)
age[1]
age[5]
age[length(age)]
head(age, 1)
tail(age, 2)
age[c(2, 4)]
age[c(TRUE, FALSE, TRUE, FALSE, TRUE)]

age_of_work <- c(20, 18, 25, 20, 20)
age
age_of_work
age - age_of_work
?union
#union(age, age_of_work)

v1 <- c(4, 8, 15, 16, 23, 42)
v1 * c(10, 100)
age_of_work * c(10, 100)
age_of_work * 1000
age ^ age_of_work

age >= 30
age[age >= 25]
age[age > mean(age)]


# lists -------------------------------------------------------------------

simple_list <- list(42, TRUE, "welcome")
simple_list
named_list <- list(simple = simple_list,
     num = 1:10,
     text = "welcome",
     fun = mean)

named_list
named_list$simple
str(named_list)

# Dataframes --------------------------------------------------------------

age <- c(30, 20, 35, 27, 32)
age_of_work <- c(20, 18, 25, 20, 20)
name <- c("Марк", "Алиса", "Петр", "Рома", "Карл")
student <- c(TRUE, TRUE, FALSE, TRUE, FALSE)

str(list(age, age_of_work, name, student))
str(data.frame(age, age_of_work, name, student))

df <- data.frame(age, age_of_work, name, student)
df[,2]
df$age_of_work
df$exp <- df$age - df$age_of_work
df[df$exp >= 10, ]
names(df)[5] <- "Опыт"
df$`Опыт`

install.packages("skimr")
library(skimr)
skim(df)

#install.packages("tidyverse")
library(tidyverse)

salaries <- read_csv("https://raw.githubusercontent.com/Pozdniakov/repo_for_sharing_data/refs/heads/main/jobs_blastim_nd.csv")
salaries
class(salaries)
salaries 

sum(log(abs(sin(1:10))))
1:10 %>% sin() %>% abs() %>% log() %>% sum()

salaries %>%
  select(job_type, salary_bottom, salary_top)
salaries %>%
  select(starts_with("salary"))

mean(salaries$salary_bottom)
mean(salaries$salary_top)
median(salaries$salary_bottom)
options(scipen = 999)
median(salaries$salary_top)
hist(salaries$salary_bottom)
hist(salaries$salary_top)
salaries %>%
  filter(salary_top >= 600000)

salaries %>%
  filter(city_new != "Москва и МО" & salary_bottom >= 200000)

salaries <- salaries %>%
  mutate(salary_mid = (salary_bottom + salary_top)/2, .after = salary_bottom)

salaries %>%
  summarise(median = median(salary_mid))
median(salaries$salary_mid)

salaries %>%
  group_by(city_new)

salaries %>%
  group_by(city_new, company_type) %>%
  summarise(median = median(salary_mid), n = n())

library(hrbrthemes)

salaries %>%
  group_by(company_type) %>%
  summarise(median = median(salary_mid), n = n()) %>%
  ggplot(aes(x = company_type, y = median)) +
  geom_col(fill = "#119999") +
  geom_text(aes(label = median), nudge_y = 6000, colour = "#119999") +
  scale_x_discrete(guide = guide_axis(angle = 45)) +
  labs(x = "", y = "Медианная зарплата", 
       title = "Медианная зарплата в биотехе по типу работодателя",
       caption = "Blastim webinar") +
  theme_ipsum()
  
ggsave("median_salary.png", scale = 1.9, bg = "white")
