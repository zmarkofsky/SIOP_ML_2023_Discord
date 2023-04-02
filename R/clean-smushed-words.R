library(tidyverse)
library(hunspell)

tidy_train_OG <- read_csv("data/tidy_stopwords_removed.csv") 

rating_cols <- tidy_train_OG |> 
    select(response_id, starts_with("rating"))

text_cols <- tidy_train_OG |> 
    select(response_id, starts_with("text"))


# Function to correct a single word
correct_word <- function(word) {
  if (hunspell_check(word)) {
    return(word)
  } else {
    suggestions <- hunspell_suggest(word)
    if (length(suggestions[[1]]) > 0) {
      return(suggestions[[1]][1])
    } else {
      return(word)
    }
  }
}

# Function to correct a sentence
correct_sentence <- function(sentence) {
  if (is.na(sentence)) {
    return(sentence)
  }
  
  words <- unlist(strsplit(sentence, "\\s+"))
  corrected_words <- sapply(words, correct_word)
  return(paste(corrected_words, collapse = " "))
}


correct_text <- text_cols |> 
    mutate(across(everything(), ~sapply(., correct_sentence)))

no_smush_df <- rating_cols |> 
  inner_join(correct_text, by = "response_id")

write_csv(no_smush_df, "data/cleaned_smushed_words.csv")
