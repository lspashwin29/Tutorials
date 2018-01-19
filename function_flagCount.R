function_flagCount <- function(dataFrame) {
  # A function to calculate number of non-missing values in each column of a data.frame
  # 
  # Args:
  #   dataFrame: The data.frame for which you want to calculate the number of non-missing values present in each column
  # Returns:
  #   An identical data.frame, but with a new row on top that contains the number of non-missing values for each column
  #
  # Use case:
  #   To count the number of rows flagged for each flag (represented in its own column)
  
  setDF(dataFrame)
  
  dataFrame <- dataFrame %>%
                mutate_all(as.character)
  
  counter <- apply(X = dataFrame, 2, FUN = function(x) length(which(x != "" & !is.na(x) & x != "NA" & x != "0"))) # Missing values are represented as empty spaces, NA, 0 in the input data.frame
  
  temp <- as.data.frame(counter) #Integer is converted to a data.frame
  colnames <- rownames(temp) #Temporary storage of the names because once we transpose, these are lost (the transposed data.frame will contain V1, V2, V3,... as column names)
  temp <- transpose(temp)
  colnames(temp) <- colnames
  
  cols <- which(unlist(sapply(1:ncol(dataFrame), FUN = function(x) class(dataFrame[, x])))=="Date")
  
  for(i in cols) {
    temp[[i]] <- as.Date(temp[[i]])
  }
  
  output <- rbind(temp, dataFrame) # Inserting a new top row to the input dataframe. This new row contains the number of non-missing values.
  row.names(output)[1] <- "Flag Count"
  
  return(output)
}
