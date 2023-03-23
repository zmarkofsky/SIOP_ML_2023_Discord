library(tidytext)
library(tidyverse)
library(tokenizers)
library(stopwords)


#=============================== IMPORT ===================================#
# read the dev_pub.csv file and store it in the dev_data variable
dev_data <- read_csv("data/dev_pub.csv")

# read the train_pub.csv file and store it in the train_data variable
train_data <- read_csv("data/train_pub.csv")


#=============================== Clean ===================================#
# Function to clean text
clean_text <- function(column) {
  
  column <- str_remove(column, '^c\\(')
  column <- str_remove(column, '\\)$')
  column <- str_replace_all(column, '[[:punct:]]+', '')
  
}


rating_cols <- train_data |> 
  select(response_id, starts_with("rating"))

text_cols <- train_data |> 
  select(response_id, starts_with("text"))

# with stop words removed:
tidy_text_cols_1 <- text_cols |> 
  modify(~ tokenize_words(.x, lowercase = FALSE, stopwords = stopwords::stopwords("en"))) |> 
  mutate(across(1:last_col(), ~ clean_text(.x))) 

# with stop words kept:
tidy_text_cols_2 <- text_cols |> 
  modify(~ tokenize_words(.x, lowercase = FALSE)) |> 
  mutate(across(1:last_col(), ~ clean_text(.x))) 


# with stop words removed:
tidy_join_1 <- rating_cols |> 
  inner_join(tidy_text_cols_1, by = "response_id") |> 
  mutate(across(starts_with("text"), ~ str_to_lower(.x)))

# with stop words kept:
tidy_join_2 <- rating_cols |> 
  inner_join(tidy_text_cols_2, by = "response_id") |> 
  mutate(across(starts_with("text"), ~ str_to_lower(.x)))


# write_csv(tidy_join_1, "data/tidy_stopwords_removed.csv")
# write_csv(tidy_join_2, "data/tidy_stopwords_kept.csv")
