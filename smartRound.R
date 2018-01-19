smartRound <- function(number, i=0) {
  output <- floor(number) + ifelse(number%%1 == 0.5, 1, round(round(number%%1, nchar(signif(number%%1))-2), i))
  return(output)
  
  # Test Cases
  # round(0.408475*10*1000,1)
  # 4084.7
  # smartRound(0.408475*10*1000,1)
  # 4084.8
  # round(4084.75,1)
  # 4084.8
  # smartRound(4084.75,1)
  # 4084.8
  # round(1.5)
  # 2
  # smartRound(1.5)
  # 2
  # round(2.5)
  # 2
  # smartRound(2.5)
  # 3
  
}
