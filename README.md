



`readrbio` is an R pkg that exposes some wrappers around [`readr`](https://github.com/hadley/readr) functions reading files common in biology (or at least the very small small subset that I work with most often).

It currently exports 3 functions:


```
#> [1] "ls_read"   "read_gff3" "read_wig"
```

- `ls_read()` reads in multiple .gff3 or .wig files into a list of dfs (via `read_gff3()` / `read_wig()`), adds a `file_name` variable (col) with the appropriate file name, and optionally binds all the dfs row-wise (via `dplyr::bind_rows`) to create one combined df that's easier to work with.

```r
library(readrbio)
#> Beginner developer minions about. Be on the lookout.
p <- "./data-raw"
ls_read(ptrn = ".gff3", path = p)
#> Source: local data frame [3,961 x 10]
#> 
#>    seqid                    source         type  start    end     score
#>    (chr)                     (chr)        (chr)  (dbl)  (dbl)     (dbl)
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
#> Variables not shown: strand (chr), phase (chr), attributes (chr),
#>   file_name (chr)
ls_read(".gff3", p, bind_rows = F)
#> [[1]]
#> Source: local data frame [3,956 x 10]
#> 
#>    seqid                    source         type  start    end     score
#>    (chr)                     (chr)        (chr)  (dbl)  (dbl)     (dbl)
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
#> Variables not shown: strand (chr), phase (chr), attributes (chr),
#>   file_name (chr)
#> 
#> [[2]]
#> Source: local data frame [5 x 10]
#> 
#>    seqid source  type start   end score strand phase
#>    (chr)  (chr) (chr) (dbl) (dbl) (dbl)  (chr) (chr)
#> 1 ctg123     NA  exon  1300  1500    NA      +    NA
#> 2 ctg123     NA  exon  1050  1500    NA      +    NA
#> 3 ctg123     NA  exon  3000  3902    NA      +    NA
#> 4 ctg123     NA  exon  5000  5500    NA      +    NA
#> 5 ctg123     NA  exon  7000  9000    NA      +    NA
#> Variables not shown: attributes (chr), file_name (chr)
```

- `read_gff3()` and `read_wig()` are wrappers around `readr::read_*()` funs that have format-specific defaults and use the handy `infer_data_records()` to infer which rows are the data records based on expected number of fields. See `?infer_data_records`... it is semi-general...and might not work for you.


```r
read_wig("data-raw/wiggle_bedtype.wig.gz")
#> Source: local data frame [100 x 4]
#> 
#>    seqid start   end      score
#>    (chr) (dbl) (dbl)      (dbl)
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
# read_gff3("data-raw/file.gff3.gz")
```

## Warning: Currently only bed-type wiggle files expected/supported!
