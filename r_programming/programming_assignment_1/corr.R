corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  cors <- vector("numeric")
  for (basename in list.files(directory))
  {
    filename <- paste(directory, basename, sep="/")
    raw_data <- read.csv(file=filename, header=TRUE)
    if(sum(complete.cases(raw_data)) >= threshold)
    {
      cleaned_data <- raw_data[complete.cases(raw_data), ]
      cors <- c(cors,cor(cleaned_data[["sulfate"]], cleaned_data[["nitrate"]]))
    }
  }
  cors[!is.na(cors)]
}