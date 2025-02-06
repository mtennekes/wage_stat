#' Read raw csv data
#' 
#' This function takes a filename of a csv and reads it.
#' 
#' @param file valid file name. If not specified and there is only one file, this file is read
#' @param use_csv2 if `TRUE` it uses `read.csv2` (; sep and , dec). Otherwise (default) `read.csv` (using , sep and . dec)
#' @return data.frame
#' @examples
#' # example code
#' df <- read_raw()
#' head(df)
read_raw <- function(file = NULL, use_csv2 = FALSE) {
	fls <- list.files("01_raw", pattern = ".csv", full.names = TRUE)
	
	if (length(fls) == 0) {
		stop("No csv files found")
	}
	
	if (is.null(file)) {
		if (length(fls) > 1) {
			stop("Multiple files found, please specify using file")
		}
		file <- fls
	} else {
		if (!file.exists(file)) stop("File ", file, " not found. Exisiting files: ", paste(fls, collapse = ", "))
	}
	if (use_csv2) {
		read.csv2(file)		
	} else {
		read.csv(file)	
	}
}

#' Write raw data
#' 
#' This function writes a data.frame to a csv file, and to a rds file
#' 
#' @param data data.frame
#' @param file file name (without extension!)
#' @param use_csv2 if `TRUE` it uses `read.csv2` (; sep and , dec). Otherwise (default) `read.csv` (using , sep and . dec)
#' @return nothing
write_raw <- function(data, file, use_csv2 = FALSE) {
	file_csv = paste0(file, ".csv")
	file_rds = paste0(file, ".rds")
	
	if (use_csv2) {
		write.csv2(data, file = file_csv, row.names = FALSE)
	} else {
		write.csv2(data, file = file_csv, row.names = FALSE)
	}
	saveRDS(data, file = file_rds)
}

