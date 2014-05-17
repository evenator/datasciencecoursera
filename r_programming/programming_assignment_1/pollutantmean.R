pollutantmean <- function(directory, pollutant, id = 1:332)
{
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  data <- cbind()
  for (index in id)
  {
    filename <- paste(directory, '/', formatC(index,2, flag='0'), '.csv', sep="")
    raw_data <- read.csv(file=filename, header=TRUE)
    data <-c(data, raw_data[[pollutant]])
  }
  mean(data[!is.na(data)])
}