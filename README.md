


[![Travis-CI Build Status](https://travis-ci.org/npjc/readrbio.svg?branch=master)](https://travis-ci.org/npjc/readrbio)
[![Coverage Status](http://codecov.io/github/npjc/readrbio/coverage.svg?branch=master)](http://codecov.io/github/npjc/readrbio?branch=master)

### readrbio

`readrbio` is an R pkg that provides some wrappers around [`readr`](https://github.com/hadley/readr) for common file formats, such as the common biological formats `.gff3`, `.wig`, and `.bed` using a consistent extension mechanism.


```r
# install.packages("devtools")
devtools::install_github("npjc/readrbio")
```



### How it wraps
`read_*` functions take a file, generate a a list of named inputs that fed to [readr's](https://github.com/hadley/readr) `read_delimited()`.


```r
read_gff3 <- function(file) {
  skel_gff3(file) %>% # first generate a skeleton input list 
    infer_skip() %>%  # modify input list by infering the correct skip argument.
    do_read()         # call read_delimited using input list as argument.
}
```

### What it wraps
Pkg currently exports 5 functions:

```
#> [1] "\"%>%\""     "infer_seqid" "read_bed"    "read_gff3"   "read_wig"
```

The `%>%` operator is from [magrittr](https://github.com/smbache/magrittr).

### Some example uses


```r
library(readrbio)
#> Beginner developer minions about. Be on the lookout.
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> 
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> 
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
st <- "3R\treg\tbind_site\t46748\t48137\t0.499\t.\t.\tID=enr_reg_1\n"
read_gff3(st)
#> Source: local data frame [1 x 9]
#> 
#>   seqid source      type start   end score strand phase   attributes
#>   (chr)  (chr)     (chr) (int) (int) (dbl)  (chr) (chr)        (chr)
#> 1    3R    reg bind_site 46748 48137 0.499      .     . ID=enr_reg_1
read_gff3("data-raw/file.gff3.gz")
#> Source: local data frame [3,956 x 9]
#> 
#>    seqid                    source         type  start    end     score
#>    (chr)                     (chr)        (chr)  (int)  (int)     (dbl)
#> 1     3R Regions_of_sig_enrichment binding_site  46748  48137 0.4996189
#> 2     3R Regions_of_sig_enrichment binding_site  53729  56570 1.0976743
#> 3     3R Regions_of_sig_enrichment binding_site  59267  61693 0.9144886
#> 4     3R Regions_of_sig_enrichment binding_site  62055  63846 0.7766093
#> 5     3R Regions_of_sig_enrichment binding_site  64851  66430 0.4774212
#> 6     3R Regions_of_sig_enrichment binding_site  66787  67918 0.3644389
#> 7     3R Regions_of_sig_enrichment binding_site 133238 134639 0.9413324
#> 8     3R Regions_of_sig_enrichment binding_site 185631 187089 0.9109565
#> 9     3R Regions_of_sig_enrichment binding_site 200867 201974 0.5903201
#> 10    3R Regions_of_sig_enrichment binding_site 204287 205678 0.8156522
#> ..   ...                       ...          ...    ...    ...       ...
#> Variables not shown: strand (chr), phase (chr), attributes (chr)
st <- "chr3R 2 37 0.13859536\n"
read_wig(st)
#> Source: local data frame [1 x 4]
#> 
#>   seqid start   end     score
#>   (chr) (int) (int)     (dbl)
#> 1 chr3R     2    37 0.1385954
read_wig("data-raw/wiggle_bedtype.wig.gz")
#> Source: local data frame [100 x 4]
#> 
#>    seqid start   end      score
#>    (chr) (int) (int)      (dbl)
#> 1  chr3R     2    37 0.13859536
#> 2  chr3R    41    76 0.14651860
#> 3  chr3R    81   116 0.15454514
#> 4  chr3R   120   155 0.16429267
#> 5  chr3R   158   193 0.18398379
#> 6  chr3R   197   232 0.23120311
#> 7  chr3R   237   272 0.26822898
#> 8  chr3R   276   311 0.24709969
#> 9  chr3R   316   351 0.17232764
#> 10 chr3R   359   394 0.08178642
#> ..   ...   ...   ...        ...
# read_bed("data-raw/six_col.bed.gz") # no eg data yet.
```

### how to extend:

1. make a `skel_*()` that outputs named `list` that can be passed as the arguments to `do_read()`. Give it a class of `"input_list"`
2. write necessary `infer_*()` functions to modify and or validate any intricacies to the format.
3. test, examples, etc.
