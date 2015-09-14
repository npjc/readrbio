


[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/readrbio)](http://cran.r-project.org/package=readrbio)
[![Travis-CI Build Status](https://travis-ci.org/npjc/readrbio.svg?branch=master)](https://travis-ci.org/npjc/readrbio)
[![Coverage Status](http://codecov.io/github/npjc/readrbio/coverage.svg?branch=master)](http://codecov.io/github/npjc/readrbio?branch=master)

### readrbio

`readrbio` is an R pkg that provides some wrappers around [`readr`](https://github.com/hadley/readr) for common file formats, such as the common biological formats `.gff3`, `.wig`, and `.bed` using a consistent extension mechanism.


```r
# install.packages("devtools")
devtools::install_github("npjc/readrbio")
```



### How it wraps
`readrbio` is centered around `file_spec`ifications. This is simply a named list with a standard set of parameters. Specifically, the some or all of formals (arguments) for [readr's](https://github.com/hadley/readr) `read_delimited()`.


```r
library(readrbio)
#> Beginner minions about. Be on the lookout.
file <- "my-file.tab2"
spec(file, type = "biogrid", "tab2i")
#> <file spec>
#>   type:      biogrid
#>   subtype:   tab2i
#>   variables: 24
#>   delimiter: '\t'
#>   skip:      <NULL>
#>   n_max:     <NULL>
#> <variable spec>
#>   $ biogrid_interaction_id           collector_integer
#>   $ a.entrez_gene_id                 collector_integer
#>   $ b.entrez_gene_id                 collector_integer
#>   $ a.biogrid_id                     collector_integer
#>   $ b.biogrid_id                     collector_integer
#>   $ a.systematic_name                collector_character
#>   $ b.systematic_name                collector_character
#>   $ a.official_symbol                collector_character
#>   $ b.official_symbol                collector_character
#>   $ a.synonyms                       collector_character
#>   $ b.synonyms                       collector_character
#>   $ experimental_system_name         collector_character
#>   $ experimental_system_type         collector_character
#>   $ first_author_surname             collector_character
#>   $ pubmed_id                        collector_integer
#>   $ a.organism_id                    collector_integer
#>   $ b.organism_id                    collector_integer
#>   $ interaction_throughput           collector_character
#>   $ quantitative_score               collector_double
#>   $ post_translational_modification  collector_character
#>   $ phenotypes                       collector_character
#>   $ qualifications                   collector_character
#>   $ tags                             collector_character
#>   $ source_database                  collector_character
file <- "my-other-file.gff3"
spec(file, "gff", "gff3")
#> <file spec>
#>   type:      gff
#>   subtype:   gff3
#>   variables: 9
#>   delimiter: '\t'
#>   skip:      <NULL>
#>   n_max:     <NULL>
#> <variable spec>
#>   $ seqid       collector_character
#>   $ source      collector_character
#>   $ type        collector_character
#>   $ start       collector_integer
#>   $ end         collector_integer
#>   $ score       collector_double
#>   $ strand      collector_character
#>   $ phase       collector_character
#>   $ attributes  collector_character
```

You can then modify a file spec with `infr_*` functions. For example, `infr_skip()`
will figure out how many rows to skip based on the expected number of fields and by ignoring rows that start with a certain pattern (`"#"` by default). The resulting modified `file_spec` is passed onto `do_read()` which will read in the file according to its specification, filling in any unspecified arguments with defaults if need be.

```r
spec(file, "gff", "gff3") %>% 
  infr_skip() %>% 
  do_read()
```

### Exported
Pkg currently exports 4 functions:

```
#> [1] "\"%>%\""   "do_read"   "infr_skip" "spec"
```

The `%>%` operator is from [magrittr](https://github.com/smbache/magrittr).
