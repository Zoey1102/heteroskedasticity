library(shiny)
shinyUI(fluidPage(
    titlePanel("Endogeneity and Heteroskedasticity"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("obs", "Number of observations:", 
                         value = 500, min = 0, max = 1000, step = 1),
            sliderInput("beta0", "beta0 value:",
                        -10, 10, value = 0),
            sliderInput("beta1", "bata1 value:",
                        -10, 10, value = 0),
            selectInput("functionX", "f(x):", 
                        choices = c("x^2" = 1, "sqrt(x)" = 2, 
                                    "exp(x)" = 3, "x^(-1)" = 4), 
                        selected = "x^2", multiple = FALSE),
            checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
            checkboxInput("show_title", "Show/Hide Title", value = TRUE)
        ),
        mainPanel(
            h3("Scatter Plot: Errors depend on X"),
            plotOutput("plot1")
        )
    )
))