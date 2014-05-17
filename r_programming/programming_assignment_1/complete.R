complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  nobs <- vector("numeric", length=length(id))
  for (index in 1:length(id))
  {
    filename <- paste(directory, '/', formatC(id[index],digits=2, flag='0', format='d'), '.csv', sep="")
    raw_data <- read.csv(file=filename, header=TRUE)
    nobs[index] <- sum(complete.cases(raw_data))
  }
  data.frame(id=id, nobs = nobs)
}