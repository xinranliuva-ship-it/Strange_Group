library(tidyverse)
big5 = read.csv("SurveyBig5.csv")
# check the dataset
head(big5)
colnames(big5)
big5 = big5 |> 
  # rename and rank the data according to participant id
  rename(participants = X) |> 
  arrange(participants) |> 
  # calculate the mean values for each variable in the Big5 survey
  transmute(
    participants,
    BFI_EXT = mean(c_across(c(Q1,Q6,Q11,Q16,Q21,Q26,Q31,Q36)), na.rm = TRUE), 
    BFI_AGR = mean(c_across(c(Q2,Q7,Q12,Q17,Q22,Q27,Q32,Q37,Q42)), na.rm = TRUE),
    BFI_CON = mean(c_across(c(Q3,Q8,Q13,Q18,Q23,Q28,Q33,Q38,Q43)), na.rm = TRUE),
    BFI_NEU = mean(c_across(c(Q4,Q9,Q14,Q19,Q24,Q29,Q34,Q39)), na.rm = TRUE),
    BFI_OPEN = mean(c_across(c(Q5,Q10,Q15,Q20,Q25,Q30,Q35,Q40,Q41,Q44)), na.rm = TRUE)
  )
# check out the cleaned dataset
head(big5)
colnames(big5)

