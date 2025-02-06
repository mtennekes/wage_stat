# raw
df <- read_raw(file = "wage_stat/01_raw/Wages.csv")
write_raw(df, file = "wage_stat/02_input/Wage_input")

# input
df2 <- readRDS("wage_stat/02_input/Wage_input.rds")

