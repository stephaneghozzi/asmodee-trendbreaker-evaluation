# Evaluation of ASMODEE

ASMODEE is an outbreak detection algorithm, implemented as `asmodee` in the package [trendbreaker](https://github.com/reconhub/trendbreaker). Here it is evaluated on simulations (time series generated by the function `project` of the package [projections](https://github.com/reconhub/projections)) and on the English CCG's (see https://covid19-nhs-pathways-asmodee.netlify.app/).

The method and results are presented in a preprint (first version [here](https://doi.org/10.1101/2020.09.02.20186502), revised version accepted for publication).

With the ASMODEE method `evaluate_aic`, the only randomness in this analysis comes from the simulations. Since random seeds are not set (cf. issue [#1](https://gitlab.com/stephaneghozzi/asmodee-trendbreaker-evaluation/-/issues/1)), each run will produce slightly different results. However all relevant intermediate objects are stored in [data/](data/): if you want to reproduce exactly the results presented in the upcoming publication, you can set `compute_simulations <- FALSE` at the beginning of the script, the simulations will then be loaded from [data/simulations.rds](data/simulations.rds). 

It takes about 4 hours to run on a laptop for model selection through AIC (`method = evaluate_aic`) and about 2 days with cross-validation (`method = evaluate_resampling`).

In this repository further results, not included in the article, can be found in [img/sim-project/](img/sim-project/) in the subfolders scenario-\*. We caution however that, when not computed on either class *decrease* or *increase*, those are not directly comparable with the results shown in the article. Here the scores (sensitivity, specificity, precision, ...) are defined either separately on different periods or reflect a multiclass classification framing. Further plots about the CCG's can be found in [img/ccgs/](img/ccgs/).

## Session information

The packages *trending* and *trendbreaker* where downloaded on 14 February 2021 from their respective "bootstrap" branches via:
```
remotes::install_github("reconhub/trending@bootstrap")
remotes::install_github("reconhub/trendbreaker@bootstrap")
```

Overall session information: 

```
R version 4.0.3 (2020-10-10)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur 10.16

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] tools     grid      stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] dplyr_1.0.4         dtplyr_1.0.1        data.table_1.13.6   surveillance_1.18.0
 [5] xtable_1.8-4        sp_1.4-4            ggtext_0.1.0        gridExtra_2.3      
 [9] RColorBrewer_1.1-2  trendbreaker_0.0.2  caret_6.0-86        ggplot2_3.3.3      
[13] lattice_0.20-41     projections_0.5.1   tidyr_1.1.2         distcrete_1.0.3    
[17] epitrix_0.2.2       MASS_7.3-53         here_1.0.0         

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.6            lubridate_1.7.9.2     deldir_0.2-3          class_7.3-17         
 [5] assertthat_0.2.1      rprojroot_2.0.2       ipred_0.9-9           foreach_1.5.1        
 [9] R6_2.5.0              plyr_1.8.6            stats4_4.0.3          tensor_1.5           
[13] pillar_1.4.7          rlang_0.4.10          goftest_1.2-2         rpart_4.1-15         
[17] Matrix_1.2-18         splines_4.0.3         incidence_1.7.3       gower_0.2.2          
[21] stringr_1.4.0         polyclip_1.10-0       munsell_0.5.0         gridtext_0.1.1       
[25] spatstat.data_1.5-2   compiler_4.0.3        pkgconfig_2.0.3       trendeval_0.0.1      
[29] mgcv_1.8-33           nnet_7.3-14           tidyselect_1.1.0      tibble_3.0.6         
[33] prodlim_2019.11.13    codetools_0.2-18      crayon_1.4.1          withr_2.4.1          
[37] recipes_0.1.15        ModelMetrics_1.2.2.2  nlme_3.1-150          gtable_0.3.0         
[41] lifecycle_0.2.0       DBI_1.1.0             polyCub_0.7.1         magrittr_2.0.1       
[45] pROC_1.17.0.1         scales_1.1.1          stringi_1.5.3         reshape2_1.4.4       
[49] spatstat_1.64-1       timeDate_3043.102     xml2_1.3.2            spatstat.utils_1.17-0
[53] ellipsis_0.3.1        generics_0.1.0        vctrs_0.3.6           lava_1.6.8.1         
[57] iterators_1.0.13      glue_1.4.2            purrr_0.3.4           trending_0.0.2.9     
[61] abind_1.4-5           survival_3.2-7        colorspace_2.0-0   
```

## Licence

Code, data and images are made available under a [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/) licence, i.e. others may freely build upon, enhance and reuse the works for any purposes without restriction under copyright or database law.
