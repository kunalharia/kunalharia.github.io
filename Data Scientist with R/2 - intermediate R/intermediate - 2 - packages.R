# install.packages() # need administrator privileges

# loads packages
# attaches them to the search list on your R workspace
# library() 
library(ggplot2)
require(ggplot2)

# The library() and require() functions 
# are not very picky 
# when it comes down to argument types: 
# both library(rjson) and library("rjson") 
# work perfectly fine for loading a package.

# look at the currently attached packages
search()

# build a plot of two variables of the mtcars data frame.
qplot(mtcars$wt, mtcars$hp)