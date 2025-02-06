source("01_raw/read_write_raw.R")

# raw
df <- read_raw(file = "01_raw/Wage.csv")

dir.create("02_input")
write_raw(df, file = "02_input/Wage_input")

# input
df2 <- readRDS("02_input/Wage_input.rds")

