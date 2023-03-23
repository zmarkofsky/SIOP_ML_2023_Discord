# Project Notes
See [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) on how to use markdown to format this document.

## Zachary
Total Records: 1466  
All Respondents are Unique 

Rating Descriptives  

Stats | chooses_appropriate_action | commits_to_action | gathers_information | identifies_issues_opportunities | interprets_information | involves_others | final_score 
---------|----------|---------|---------|----------|---------|---------|----------
 Mean | 2.762626 | 3.092769 | 2.703274 | 2.668831 | 2.465211 | 2.80449 | 3.22101 
 STD | 0.608546 | 0.611261 | 0.648403 | 0.564276 | 0.619769 | 0.673092 | 1.308516 
 Median | 3.0 | 3.0 | 3.0 | 3.0 | 2.0 | 3.0 | 3.0 
 
- Interprets_information and involves_others have a minimum value of 2.0 in our data
  -  May lead to issues with training as there is no labeled data to indicate what the lowest value could be
-  Heavy skew towards the 3.0 value on most ratings except Interprets_information
-  Missing values for ratings are highly correlated, indicating that missing values may not be random
-  Text_exercise_final is actually a series of questions asking the subjects to further clarify their rationale of the questions they were given as well as a request to provide additional feedback
  -  This question may be highly relevant to our results but would require a large amount of feature engineering to become useful
-  Some text data 

## Ash

Resources:  
Looking into `tidytext, `tidymodels' `recipes()`  

Sources:
[Supervised Machine learner for text analysis with R](https://smltar.com/)  - free book  
[tidymodels](https://www.tidymodels.org/)  
[Text Mining with R](https://www.tidytextmining.com/index.html)  

[Ash's EDA](/R/ash-eda.md)

## Amy

- NA: rating_chooses_appropriate_action (80), rating_identifies_issues_opportunities (80), rating_involves_others (85)  

![](/assets/amy-cor.png)

## Randy


