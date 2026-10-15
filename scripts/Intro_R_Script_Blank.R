#------------------------------------------------------------------------------#
# 
# INTRO TO R AND RSTUDIO
#
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# (1) BASE R OPERATORS AND FUNCTIONS
#------------------------------------------------------------------------------#

#R as a Calculator: Arithmetic Operators (+, \, -, ^, sqrt(), *)



# Comparing Things: Logical Operators (==, !=, <, >)



# Functions: you can call a function by typing the function name followed by a 
#            set of parentheses. 



# Functions normally require "arguments", which go inside the parentheses. The 
#argument of the sqrt function is the number we want to calculate the square root of.

#Some functions have more than one argument: 
 


#------------------------------------------------------------------------------#
# (2) CREATING A VARIBLE
#------------------------------------------------------------------------------#

#Variables are used to store information:

x <- 7
x = 7

#If we want to see what is stored in a variable we can run it. It will also show
#up in the Environment tab on the right in R-Studio.

x

#Variables can be used to store the output of a mathematical expression or a
#function:



#Variables can also be used inside of a function.




#Variables can be reassigned:




#------------------------------------------------------------------------------#
# (3) DATA TYPES IN R
#------------------------------------------------------------------------------#

#The information you store in a variable does not have to be numeric. You can 
#store text information in a variable, but it must be wrapped in quotation marks.

weekday <- "Thursday"



#TIP: variable names can not have spaces in them. I use '_' in my variable names.

#If we try and add text variables together we get an error:

weekday + my_name

my_name + 5

#This is because weekday and my_name are not the right "data type". All data 
#in R has a type.

#Numeric (also called a Double):



#Character:



#There are 5 data types in R double, integer, complex, logical and character. 

#The type of data that you have will determine what you can do. For example, you
#can not use mathematical functions on characters, that's why we got an error 
#earlier when we tried to add "Thursday" to my_name.

last_name <- "Jones"
full_name <- paste0(my_name, " ", last_name)
full_name

#------------------------------------------------------------------------------#
# (4) DATA STRUCTURES IN R
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# (4.1) VECTORS
#------------------------------------------------------------------------------#

#So far we have not done very much that we can't do quickly with a calculator, 
#but what if we want to add together every number from between 525 and 779?

#Here we want to create something called a vector. We can create a vector of 
#every number between 525 and 779 using the ":" operator:




#We can use vectors as arguments to functions. Here we can use the sum function:




#Vectors are a set of values in a certain order. Vectors can be composed of any 
#data type, but all values in the vector must be the same type.

#We can create a vector of character data:

list_of_countries <- c("France", "Egypt", "China", "Iran")

#Numeric vectors do not have to be sequential or in ascending order

list_of_ages <- c(52, 23, 45, 77)

#In the environment tab in R-Studio we can see our new vectors.

#For list_of_ages, "num" tells us that the vector is numeric, and [1:4] tells us
#that the vector has 4 objects.

#What if we want to grab one specific value something from a vector?

#The square bracket `[]` indexes an object using it's position

colours <- c("green", "yellow", "blue", "red", "darkgreen")







#------------------------------------------------------------------------------#
# (4.2) DATAFRAMES
#------------------------------------------------------------------------------#

#R includes some built in data you can use to practice. We can load one of 
#these data into the environment:

data(iris)

#Click on the dataset in the environment to see the data!

#Each column of a data.frame is a vector. This means that all data in each 
#column is the same data type.

#To get a column from the dataframe we can use "$"



#or use [, column #]



#We can use functions on columns in the dataframe just like we did on vectors:






#------------------------------------------------------------------------------#
# (5.0) PACKAGES
#------------------------------------------------------------------------------#

#install packages (onto your computer)
install.packages("tidyverse") 

#load packages (every time you open R)
library(tidyverse) 

#look into packages tab to see if it shows up!

#------------------------------------------------------------------------------#
# (7.0) TIDYVERSE EXAMPLE
#------------------------------------------------------------------------------#

#The following is just an example of the potential of the tidyverse!

#Clean the data
iris_clean <- iris %>%
  mutate(
    Species = as.factor(Species),
    Sepal.Ratio = Sepal.Length / Sepal.Width
  )

# Custom palette
iris_colours <- c(
  "setosa"     = "#7B9E87",  
  "versicolor" = "#C8A2C8",  
  "virginica"  = "#4B6FA8"  
)

# 1. Distribution of sepal length
ggplot(iris_clean, aes(x = Sepal.Length, fill = Species, color = Species)) +
  geom_density(alpha = 0.4, linewidth = 1) +
  scale_fill_manual(values = iris_colours) +
  scale_color_manual(values = iris_colours) +
  labs(title = "Sepal Length Distribution by Species",
       x = "Sepal Length (cm)", y = "Density",
       fill = "Species", color = "Species") +
  theme_minimal()

# 2. Comparison of petal length
ggplot(iris_clean, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot(alpha = 0.6, outlier.shape = NA) +
  geom_jitter(aes(color = Species), width = 0.15, size = 2, alpha = 0.7) +
  scale_fill_manual(values = iris_colours) +
  scale_color_manual(values = iris_colours) +
  labs(title = "Petal Length by Species",
       x = "Species", y = "Petal Length (cm)") +
  theme_minimal() +
  theme(legend.position = "none")

# 3. Bar chart of mean petal width with error bars
iris_clean %>%
  group_by(Species) %>%
  summarise(
    Mean.Petal.Width = mean(Petal.Width),
    SE = sd(Petal.Width) / sqrt(n())
  ) %>%
  ggplot(aes(x = Species, y = Mean.Petal.Width, fill = Species)) +
  geom_col(alpha = 0.8) +
  geom_errorbar(aes(ymin = Mean.Petal.Width - SE, ymax = Mean.Petal.Width + SE),
                width = 0.2) +
  scale_fill_manual(values = iris_colours) +
  labs(title = "Mean Petal Width by Species",
       x = "Species", y = "Mean Petal Width (cm)") +
  theme_minimal() +
  theme(legend.position = "none")
              






