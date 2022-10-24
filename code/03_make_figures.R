library(labelled)
library(gtsummary)
library(knitr)
library(kableExtra)
library(ggplot2)

rm(list=ls())
here::i_am("code/03_make_figures.R")

data <- readRDS(here::here("output/labeled_data.rds"))

figure1a <- ggplot(data, aes(x=age, fill=DEATH_EVENT)) +
  geom_histogram(alpha = 0.5, position = "identity") +
  xlab("Patient age (years)") + ylab("Count") +
  ggtitle("Figure 1A. Histogram of patient age by death events.") +
  guides(fill=guide_legend(title="Group")) +
  theme_light()

saveRDS(figure1a,here::here("output/figure1a.rds"))

figure1b <- ggplot(data, aes(x=ejection_fraction, fill=DEATH_EVENT)) +
  geom_histogram(alpha = 0.5, position = "identity") +
  xlab("Ejection Fraction (%)") + ylab("Count") +
  ggtitle("Figure 1B. Histogram of ejection fraction by death events.") +
  guides(fill=guide_legend(title="Group")) +
  theme_light()

saveRDS(figure1b,here::here("output/figure1b.rds"))

figure1c <- ggplot(data, aes(x=serum_sodium, fill=DEATH_EVENT)) +
  geom_histogram(alpha = 0.5, position = "identity") +
  xlab("Blood Sodium (mEq/L)") + ylab("Count") +
  ggtitle("Figure 1C. Histogram of blood sodium by death events.") +
  guides(fill=guide_legend(title="Group")) +
  theme_light()

saveRDS(figure1c,here::here("output/figure1c.rds"))

figure1d <- ggplot(data, aes(x=serum_creatinine, fill=DEATH_EVENT)) +
  geom_histogram(alpha = 0.5, position = "identity") +
  xlab("Serum Creatinine (mg/dL)") + ylab("Count") +
  ggtitle("Figure 1D. Histogram of serum creatinine by death events.") +
  guides(fill=guide_legend(title="Group")) +
  theme_light()

saveRDS(figure1d,here::here("output/figure1d.rds"))

