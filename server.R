library(shiny)
shinyServer(function(input, output) {
    output$plot1 <- renderPlot({
        set.seed(2020-12-06)
        number_of_observations <- input$obs
        beta0 <- input$beta0
        beta1 <- input$beta1
        dataX <- runif(number_of_observations, 0, 1)
        sigma <- numeric(number_of_observations)
        f <- as.numeric(input$functionX)
        if(f == 1){sigma <- dataX^2}
        else if(f == 2){sigma <- sqrt(dataX)}
        else if(f == 3){sigma <- exp(dataX)}
        else{sigma <- dataX^(-1)}
        dataU <- numeric(number_of_observations)
        for(i in 1:number_of_observations){
            dataU[i] <- rnorm(1, 0, sigma[i])
        }
        dataY <- beta0 + beta1*dataX + dataU
        xlab <- ifelse(input$show_xlab, "X ~ U(0,1)", "")
        ylab <- ifelse(input$show_ylab, "Y Axis", "")
        main <- ifelse(input$show_title, "Y = beta0 + beta1*X + u, u ~ N(0, f(x))", "")
        plot(dataX, dataY, xlab = xlab, ylab = ylab, main = main)
    })
})