library(gWidgets)
library(gWidgetstcltk)

# textboxes, checkboxes, etc are widgets. They need to be contained inside a window
window <- gwindow("Tab delimited file upload example")

# We can create groups of widgets that are stacked horizontally with ggroup.
# All widgets must specify their container
groupName <- ggroup(container = window)

# glabel is a widget that represents a text label. Is is contained inside the group
#   we just created
labelDataFrameName <- glabel("Variable to save data to: ", container = groupName)

# gedit is a single line textbox
textDataFrameName <- gedit("dfr", container = groupName)

# Another horizontal group, for the upload button
groupUpload <- ggroup(container = window)

# Widgets that we want to respond to an action, we need to add a handler argument. This is
#   a funtion accepting a list as firt argument and dots.
# The gbutton handler is called whenever the button is clicked.
buttonUpload <- gbutton(text = "Upload tab delimited file", container = groupUpload,
                        function(h, ...)
                        {
                          gfile(
                            text    = "Upload tab delimited file",
                            type    = "open",
                            action  = ifelse(svalue(checkEuroStyle), "read.delim2", "read.delim"),
                            handler = function(h, ...)
                            {
                              tryCatch(
                                {
                                  dataFrameName <- make.names(svalue(textDataFrameName))
                                  theData <- do.call(h$action, list(h$file))
                                  assign(dataFrameName, theData, envir = globalenv())
                                  svalue(statusBar) <-
                                    paste(nrow(theData), "records saved to variable", dataFrameName)
                                },
                                error = function(e) svalue(statusBar) <- "Could not upload data"
                              )
                            },
                            filter = list(
                              "Tab delimited" = list(patterns = c("*.txt","*.dlm","*.tab")),
                              "All files" = list(patterns = c("*"))
                            )
                          )
                        })

# Now we will create a checkbox to choose between full-stops or commas.
# We define a function to get the default value from the system locale settings.
useCommaForDecimal <- function() {
  unname(Sys.localeconv()["decimal_point"] == ",")
}

checkEuroStyle <- gcheckbox(text = "Use comma for decimal place", checked = useCommaForDecimal(),
                            container = groupUpload)

# Now a status bar
statusBar <- gstatusbar("", container = window)