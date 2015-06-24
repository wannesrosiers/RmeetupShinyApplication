# RmeetupShinyApplication
This is the final application presented at the RBelgium meetup (23 june 2015)

A general shiny application consists of 3 files: global.R, server.R and ui.R which should all be contained in the same directory.

global.r: start up file.

global.r is sourced when the application is launched.  I use the global.r file to load all data, to load some functions and to do some preliminary calculations.

ui.r: The user interface.

In the user interface I create both plot outputs, 4 slider widgets and one uiOutput (where the data.frame will be displayed after clicking on the plot).

server.r: Where the magic happens.

Inside the server, R shiny is making all its calculations and its reactivity.  In this file I will create a subset of my data, define both plots, keep track of my mouse-pointer... I calculate to which point I am hovering (or clicking) the closest, in order to show it differently. I can create user interface items in the server as well, as is shown in this application.
  
Finaly I have added a scripts folder, where all necessary functions are located.  This in order to easily re-use my code, and keep it readable.

If you have any questions about this shiny application, do not hesitate to contact me via wannes.rosiers@infofarm.be
