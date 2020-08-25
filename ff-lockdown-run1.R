library(surveillance)

ff_control <- list(
  b=3,
  w=3,
  limit54=c(0,1),
  noPeriods=7,
  pastWeeksNotIncluded=7,
  glmWarnings=F,
  thresholdMethod='nbPlugin',
  pThresholdTrend=1
)
alpha <- 0.05

observ <- c(108, 121, 140, 145, 143, 152, 141, 169, 162, 188, 203, 241, 221, 261, 280, 255, 298,
  349, 356, 421, 352, 455, 458, 482, 499, 547, 576, 565, 611, 648, 700, 726, 789, 824, 894, 906,
  870, 819, 829, 778, 765, 768)

sts <- sts(observ, frequency=7)
ff_out <- farringtonFlexible(sts, control = append(list(alpha=alpha), ff_control))

plot(observ)
plot(ff_out)
print(ff_out@control$trend)
