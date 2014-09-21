# server.R

shinyServer(function(input, output) {
  output$help1 <- renderText({
    "To use app, change probabilty of head (default=0.5), 
     number of trials (default=100), number of bins in the histogram (default=20), 
     and whether or not to show the approximated normal distribution curve."
  })
  output$help2 <- renderText({
    "Running the experiment many times, we will observe the distribution of the mean 
    of the coin flips, and how the distribution approaches normal distribution 
    when number of runs are large."
  })
  output$text1 <- renderText({ 
    paste("Probability of head (1):",input$probability,", Number of runs:",input$trials)
  })
  output$text2 <- renderText({ 
    paste("For binomial distribution, expected mean:",input$probability,"standard deviation:", sqrt(input$probability*(1-input$probability)))
  })

  output$result <- renderPlot({
    meanvalue <- numeric()
    for (i in 1:input$trials)
    {
      FlipCoin = function(n,p) sample(c(1,0),size=n,prob=c(p,1-p),rep=T)
      simresults = FlipCoin(input$flips, input$probability)
      meanvalue <- c(meanvalue, mean(simresults))
    }
    
    if (input$checkbox==TRUE)
    {
      hist(meanvalue,input$bins,prob=TRUE,col="lightblue")
      abline(v = mean(meanvalue), col = "black", lwd = 2)
      abline(v = input$probability, col = "yellow", lwd = 2)
      x <- seq(0,2,length=1000)
      curve(dnorm(x, mean(meanvalue), sd(meanvalue)), add=TRUE, col="red", lwd=2)
      legend("topright", c("Simulated Mean","Expected Mean","Normal Approximation"),lty=c(1,1,1),
           lwd=c(2.5,2.5,2.5),col=c("black","yellow","red"))
    }
    else
    {
      hist(meanvalue,input$bins,prob=TRUE,col="lightblue")
      abline(v = mean(meanvalue), col = "black", lwd = 2)
      abline(v = input$probability, col = "yellow", lwd = 2)
      legend("topright", c("Simulated Mean","Expected Mean"),lty=c(1,1),
             lwd=c(2.5,2.5),col=c("black","yellow"))      
    }
    })
}
)