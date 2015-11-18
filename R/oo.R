# R has 3 object oriented systems (plus the base types).

## A class defines the behaviour of objects by describing their attributes
##  and their relationship to other classes.

# R's 3 OO systems differ in how classes and methods are defined

## S3: implements a style of OO called ** generic-function OO **
##  This is different from most programming languages (like java, which implements
##      message-passing OO).
##  Message-passing: messages (methods) are sent to objects and the object
##      determines which function to call.  (canvas.drawRect("blue")).
##  S3 is different. A special type of function called ** generic function **
##      decides which method to call (drawRect(canvas, "blue")).

## S4: more formal than S3.

## Reference classes (RC): implements message-passing OO.
##  Methods belongs to classes, not funtions.
##  $ is used to separate objects and methods (canvas$drawRect("blue"))

library(pryr)

df <-data.frame(letters)
otype(df)    # A data frame is an S3 class
#> [1] "S3"
otype(df$x)  # A numeric vector isn't
#> [1] "base"
otype(df$y)  # A factor is
#> [1] "S3"

## In S3, methods belongs to functions, called generic functions.
## S3 methods do not belongs to objects or classes.