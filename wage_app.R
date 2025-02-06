library(shiny)
library(bslib)
library(tidyverse)

w <- read.csv("01_raw/Wage.csv")

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
	# App title ----
	title = "Hello Shiny!",
	# Sidebar panel for inputs ----
	sidebar = sidebar(
		# Input: Slider for the number of bins ----
		selectInput(
			inputId = "var",
			label = "Group by Variable",
			choices = names(w)[3:9]
			
		),
		sliderInput(
			inputId = "bins",
			label = "Number of bins:",
			min = 1,
			max = 50,
			value = 30
		),
		
		radioButtons(
			inputId = "color",
			label = "Color the bars with:",
			choices = c("Light blue" = "#007bc2", "Dark blue" =  "blue", Orange = "orange"))
	),
	# Output: Histogram ----
	plotOutput(outputId = "distPlot")
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
	
	output$distPlot <- renderPlot({
		
		x    <- w$wage
		bins <- seq(min(x), max(x), length.out = input$bins + 1)
		w$by = w[[input$var]]
		
		# hist(x, breaks = bins, col = input$color, border = "white",
		# 	 xlab = "Waiting time to next eruption (in mins)",
		# 	 main = "Histogram of waiting times")
		ggplot(w, aes(x = wage)) +
			geom_histogram(breaks = bins, fill = input$color, color = "white") +
			labs(
				x = "Waiting time to next eruption (in mins)",
				title = "Histogram of waiting times"
			) +
			facet_wrap(~by) +
			theme_minimal()
	})
	
}

shinyApp(ui, server)
