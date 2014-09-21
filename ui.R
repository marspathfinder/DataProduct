# ui.R

shinyUI(fluidPage(
  titlePanel("The Central Limit Theorem Demo: Coin Flips"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("This app will demonistrate the Central Limit Theorem, or the Law of Large Numbers, as demonstrated in Coursera Course Statistical Inference -- Asymptopia."),
      helpText("We will draw a coin a number of times, and observe the approximation to normal distribution when both number of flips per run, and number of runs are large."),
      sliderInput("probability", 
                  label = "Probability of Head",
                  min = 0, max = 1, value = 0.5), 
      sliderInput("flips", 
                  label = "Number of Flips Per Run",
                  min = 1, max = 5000, value = 100),
      sliderInput("trials", 
                  label = "Number of Runs",
                  min = 1, max = 5000, value = 100),
      sliderInput("bins", 
                  label = "Histogram: Number of Bins",
                  min = 2, max = 100, value = 20),
      checkboxInput("checkbox", label = "Draw Approximated Normal Distribution", value = TRUE),
      submitButton("Run")
      ),
    
    mainPanel(
      textOutput("help1"),
      textOutput("help2"),
      textOutput("text1"),
      textOutput("text2"),
      plotOutput("result")
    )
  )
))