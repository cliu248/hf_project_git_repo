library(labelled)
library(gtsummary)
library(knitr)
library(kableExtra)
library(ggplot2)

rm(list=ls())
here::i_am("code/02_make_tables.R")

data <- readRDS(here::here("output/labeled_data.rds"))

table1a<-tbl_summary(data) %>%
  add_n() %>% 
  modify_header(label = "**Variable**") %>%
  bold_labels() %>% 
  modify_caption("**Table 1A. Summary statistics in the overall cohort (N = {N}).**\n
                 Categorical variables shown as N (%), continuous variables shown as median (IQR).") %>%
  as_kable() %>%
  kable_material(c("striped", "hover"))

saveRDS(table1a,here::here("output/table1a.rds"))

table1b <- tbl_summary(data,by = DEATH_EVENT) %>%
  add_p() %>% 
  modify_header(label = "**Variable**") %>%
  bold_labels() %>% 
  bold_p() %>%
  modify_caption("**Table 1B. Summary statistics by death events (N = {N}).**\n
                 Categorical variables shown as N (%), continuous variables shown as median (IQR), p values are from Chi-squared and Wilcoxon rank sum test.") %>%
  as_kable() %>%
  kable_material(c("striped", "hover")) 

saveRDS(table1b,here::here("output/table1b.rds"))
