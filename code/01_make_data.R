library(labelled)
library(gtsummary)
library(knitr)
library(kableExtra)
library(ggplot2)

rm(list=ls())
here::i_am("code/01_make_data.R")

data <- read.csv(here::here("data/heart_failure_clinical_records_dataset.csv"))
data <- data[,c("sex","age","smoking",
              "ejection_fraction","diabetes","high_blood_pressure",
              "serum_sodium","anaemia","platelets",
              "creatinine_phosphokinase","serum_creatinine",
              "time","DEATH_EVENT")]

data$DEATH_EVENT <- ifelse(data$DEATH_EVENT==1, "Death Event", "No Death Event")

var_label(data) <- list(
  sex="Male",
  age="Patient age (years)",
  smoking="Current smoking",
  ejection_fraction="Ejection fraction (%)",
  diabetes="Diabetes",
  high_blood_pressure="Hypertension",
  serum_sodium="Blood sodium (mEq/L)",
  anaemia="Anaemia",
  platelets="Blood platelets (n/mL)",
  creatinine_phosphokinase="Creatinine phosphokinase (mcg/L)",
  serum_creatinine="Serum creatinine (mg/dL)",
  time="Follow-up (days)",
  DEATH_EVENT="Death")

saveRDS(data,here::here("output/labeled_data.rds"))
