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

## S4: 