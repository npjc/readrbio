


[![Travis-CI Build Status](https://travis-ci.org/npjc/readrbio.svg?branch=master)](https://travis-ci.org/npjc/readrbio)
[![Coverage Status](https://coveralls.io/repos/npjc/readrbio/badge.svg)](https://coveralls.io/r/npjc/readrbio)

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
Pkg currently exports 6 functions:

```
#> [1] "\"%>%\""      "infer_seqid"  "read_bed"     "read_catalog"
#> [5] "read_gff3"    "read_wig"
```

The `%>%` operator is from [magrittr](https://github.com/smbache/magrittr).

### Some example uses


```r
library(readrbio)
#> Beginner developer minions about. Be on the lookout.
st <- "3R\treg\tbind_site\t46748\t48137\t0.499\t.\t.\tID=enr_reg_1\n"
read_gff3(st)
#>   seqid source      type start   end score strand phase   attributes
#> 1    3R    reg bind_site 46748 48137 0.499      .     . ID=enr_reg_1
read_gff3("data-raw/file.gff3.gz")
#>      seqid                    source         type    start      end
#> 1       3R Regions_of_sig_enrichment binding_site    46748    48137
#> 2       3R Regions_of_sig_enrichment binding_site    53729    56570
#> 3       3R Regions_of_sig_enrichment binding_site    59267    61693
#> 4       3R Regions_of_sig_enrichment binding_site    62055    63846
#> 5       3R Regions_of_sig_enrichment binding_site    64851    66430
#> 6       3R Regions_of_sig_enrichment binding_site    66787    67918
#> 7       3R Regions_of_sig_enrichment binding_site   133238   134639
#> 8       3R Regions_of_sig_enrichment binding_site   185631   187089
#> 9       3R Regions_of_sig_enrichment binding_site   200867   201974
#> 10      3R Regions_of_sig_enrichment binding_site   204287   205678
#> 11      3R Regions_of_sig_enrichment binding_site   220598   221666
#> 12      3R Regions_of_sig_enrichment binding_site   228314   230319
#> 13      3R Regions_of_sig_enrichment binding_site   276941   280072
#> 14      3R Regions_of_sig_enrichment binding_site   293510   294709
#> 15      3R Regions_of_sig_enrichment binding_site   295952   298028
#> 16      3R Regions_of_sig_enrichment binding_site   303668   304787
#> 17      3R Regions_of_sig_enrichment binding_site   366376   367769
#> 18      3R Regions_of_sig_enrichment binding_site   466687   467991
#> 19      3R Regions_of_sig_enrichment binding_site   474756   476002
#> 20      3R Regions_of_sig_enrichment binding_site   480122   481804
#> 21      3R Regions_of_sig_enrichment binding_site   528827   532624
#> 22      3R Regions_of_sig_enrichment binding_site   532739   534460
#> 23      3R Regions_of_sig_enrichment binding_site   536006   538024
#> 24      3R Regions_of_sig_enrichment binding_site   564085   565676
#> 25      3R Regions_of_sig_enrichment binding_site   629736   631080
#> 26      3R Regions_of_sig_enrichment binding_site   631288   633182
#> 27      3R Regions_of_sig_enrichment binding_site   635635   637782
#> 28      3R Regions_of_sig_enrichment binding_site   640296   642857
#> 29      3R Regions_of_sig_enrichment binding_site   731365   732389
#> 30      3R Regions_of_sig_enrichment binding_site   736346   737939
#> 31      3R Regions_of_sig_enrichment binding_site   777409   778715
#> 32      3R Regions_of_sig_enrichment binding_site   787813   789968
#> 33      3R Regions_of_sig_enrichment binding_site   886230   888397
#> 34      3R Regions_of_sig_enrichment binding_site   911997   914031
#> 35      3R Regions_of_sig_enrichment binding_site  1013358  1014383
#> 36      3R Regions_of_sig_enrichment binding_site  1018485  1021033
#> 37      3R Regions_of_sig_enrichment binding_site  1041093  1043537
#> 38      3R Regions_of_sig_enrichment binding_site  1056471  1058208
#> 39      3R Regions_of_sig_enrichment binding_site  1086816  1088024
#> 40      3R Regions_of_sig_enrichment binding_site  1088973  1091333
#> 41      3R Regions_of_sig_enrichment binding_site  1092495  1093575
#> 42      3R Regions_of_sig_enrichment binding_site  1124084  1125969
#> 43      3R Regions_of_sig_enrichment binding_site  1132637  1134270
#> 44      3R Regions_of_sig_enrichment binding_site  1187070  1188861
#> 45      3R Regions_of_sig_enrichment binding_site  1189521  1191066
#> 46      3R Regions_of_sig_enrichment binding_site  1193169  1194347
#> 47      3R Regions_of_sig_enrichment binding_site  1288558  1290239
#> 48      3R Regions_of_sig_enrichment binding_site  1342255  1343706
#> 49      3R Regions_of_sig_enrichment binding_site  1389904  1391928
#> 50      3R Regions_of_sig_enrichment binding_site  1396602  1397874
#> 51      3R Regions_of_sig_enrichment binding_site  1418715  1422386
#> 52      3R Regions_of_sig_enrichment binding_site  1423233  1424359
#> 53      3R Regions_of_sig_enrichment binding_site  1424513  1427801
#> 54      3R Regions_of_sig_enrichment binding_site  1437147  1439249
#> 55      3R Regions_of_sig_enrichment binding_site  1472454  1474062
#> 56      3R Regions_of_sig_enrichment binding_site  1479749  1481330
#> 57      3R Regions_of_sig_enrichment binding_site  1483555  1486324
#> 58      3R Regions_of_sig_enrichment binding_site  1493954  1495552
#> 59      3R Regions_of_sig_enrichment binding_site  1495699  1497901
#> 60      3R Regions_of_sig_enrichment binding_site  1498977  1500298
#> 61      3R Regions_of_sig_enrichment binding_site  1510209  1511249
#> 62      3R Regions_of_sig_enrichment binding_site  1649253  1650276
#> 63      3R Regions_of_sig_enrichment binding_site  1686358  1688272
#> 64      3R Regions_of_sig_enrichment binding_site  1832684  1833940
#> 65      3R Regions_of_sig_enrichment binding_site  1835201  1836249
#> 66      3R Regions_of_sig_enrichment binding_site  1996114  1998108
#> 67      3R Regions_of_sig_enrichment binding_site  2170982  2172089
#> 68      3R Regions_of_sig_enrichment binding_site  2176391  2177700
#> 69      3R Regions_of_sig_enrichment binding_site  2178499  2181201
#> 70      3R Regions_of_sig_enrichment binding_site  2181908  2183662
#> 71      3R Regions_of_sig_enrichment binding_site  2220910  2223452
#> 72      3R Regions_of_sig_enrichment binding_site  2224798  2225912
#> 73      3R Regions_of_sig_enrichment binding_site  2229051  2231717
#> 74      3R Regions_of_sig_enrichment binding_site  2232627  2233733
#> 75      3R Regions_of_sig_enrichment binding_site  2233993  2236467
#> 76      3R Regions_of_sig_enrichment binding_site  2248763  2250229
#> 77      3R Regions_of_sig_enrichment binding_site  2273151  2274897
#> 78      3R Regions_of_sig_enrichment binding_site  2532120  2533139
#> 79      3R Regions_of_sig_enrichment binding_site  2605310  2606505
#> 80      3R Regions_of_sig_enrichment binding_site  2631431  2633545
#> 81      3R Regions_of_sig_enrichment binding_site  2646627  2647727
#> 82      3R Regions_of_sig_enrichment binding_site  2695799  2697276
#> 83      3R Regions_of_sig_enrichment binding_site  2897526  2903423
#> 84      3R Regions_of_sig_enrichment binding_site  2914991  2916064
#> 85      3R Regions_of_sig_enrichment binding_site  2919618  2922289
#> 86      3R Regions_of_sig_enrichment binding_site  2933741  2935079
#> 87      3R Regions_of_sig_enrichment binding_site  2947965  2950328
#> 88      3R Regions_of_sig_enrichment binding_site  3011141  3012465
#> 89      3R Regions_of_sig_enrichment binding_site  3013528  3015125
#> 90      3R Regions_of_sig_enrichment binding_site  3171839  3173274
#> 91      3R Regions_of_sig_enrichment binding_site  3298967  3300031
#> 92      3R Regions_of_sig_enrichment binding_site  3316145  3318125
#> 93      3R Regions_of_sig_enrichment binding_site  3329619  3333444
#> 94      3R Regions_of_sig_enrichment binding_site  3340059  3342055
#> 95      3R Regions_of_sig_enrichment binding_site  3348519  3350442
#> 96      3R Regions_of_sig_enrichment binding_site  3604766  3606256
#> 97      3R Regions_of_sig_enrichment binding_site  3606415  3607837
#> 98      3R Regions_of_sig_enrichment binding_site  3608118  3609885
#> 99      3R Regions_of_sig_enrichment binding_site  3619683  3621043
#> 100     3R Regions_of_sig_enrichment binding_site  3710943  3712874
#> 101     3R Regions_of_sig_enrichment binding_site  3788557  3789810
#> 102     3R Regions_of_sig_enrichment binding_site  3789922  3790982
#> 103     3R Regions_of_sig_enrichment binding_site  3792258  3794339
#> 104     3R Regions_of_sig_enrichment binding_site  3806979  3808088
#> 105     3R Regions_of_sig_enrichment binding_site  3853134  3854294
#> 106     3R Regions_of_sig_enrichment binding_site  3855418  3856763
#> 107     3R Regions_of_sig_enrichment binding_site  3926365  3927507
#> 108     3R Regions_of_sig_enrichment binding_site  3931700  3933233
#> 109     3R Regions_of_sig_enrichment binding_site  3933579  3934937
#> 110     3R Regions_of_sig_enrichment binding_site  3939367  3940942
#> 111     3R Regions_of_sig_enrichment binding_site  3941977  3943552
#> 112     3R Regions_of_sig_enrichment binding_site  3952421  3954102
#> 113     3R Regions_of_sig_enrichment binding_site  3964946  3966083
#> 114     3R Regions_of_sig_enrichment binding_site  4060773  4062180
#> 115     3R Regions_of_sig_enrichment binding_site  4087471  4088600
#> 116     3R Regions_of_sig_enrichment binding_site  4094049  4095844
#> 117     3R Regions_of_sig_enrichment binding_site  4131116  4133352
#> 118     3R Regions_of_sig_enrichment binding_site  4169432  4170995
#> 119     3R Regions_of_sig_enrichment binding_site  4180451  4183260
#> 120     3R Regions_of_sig_enrichment binding_site  4343006  4344402
#> 121     3R Regions_of_sig_enrichment binding_site  4475980  4477874
#> 122     3R Regions_of_sig_enrichment binding_site  4484226  4485944
#> 123     3R Regions_of_sig_enrichment binding_site  4487618  4488762
#> 124     3R Regions_of_sig_enrichment binding_site  4494749  4496158
#> 125     3R Regions_of_sig_enrichment binding_site  4501110  4502962
#> 126     3R Regions_of_sig_enrichment binding_site  4539363  4540474
#> 127     3R Regions_of_sig_enrichment binding_site  4631187  4632756
#> 128     3R Regions_of_sig_enrichment binding_site  4635973  4637946
#> 129     3R Regions_of_sig_enrichment binding_site  4639338  4641899
#> 130     3R Regions_of_sig_enrichment binding_site  4645417  4646920
#> 131     3R Regions_of_sig_enrichment binding_site  4670111  4671250
#> 132     3R Regions_of_sig_enrichment binding_site  4688172  4689562
#> 133     3R Regions_of_sig_enrichment binding_site  4752506  4755306
#> 134     3R Regions_of_sig_enrichment binding_site  4764180  4765661
#> 135     3R Regions_of_sig_enrichment binding_site  4766085  4767129
#> 136     3R Regions_of_sig_enrichment binding_site  4804968  4807206
#> 137     3R Regions_of_sig_enrichment binding_site  4807463  4809139
#> 138     3R Regions_of_sig_enrichment binding_site  4833716  4835186
#> 139     3R Regions_of_sig_enrichment binding_site  4839265  4841109
#> 140     3R Regions_of_sig_enrichment binding_site  4855568  4858811
#> 141     3R Regions_of_sig_enrichment binding_site  4859107  4860274
#> 142     3R Regions_of_sig_enrichment binding_site  4874554  4875867
#> 143     3R Regions_of_sig_enrichment binding_site  4876405  4879336
#> 144     3R Regions_of_sig_enrichment binding_site  4880353  4883978
#> 145     3R Regions_of_sig_enrichment binding_site  4885199  4886276
#> 146     3R Regions_of_sig_enrichment binding_site  4886514  4888288
#> 147     3R Regions_of_sig_enrichment binding_site  4892119  4894843
#> 148     3R Regions_of_sig_enrichment binding_site  4894964  4898081
#> 149     3R Regions_of_sig_enrichment binding_site  4940049  4941053
#> 150     3R Regions_of_sig_enrichment binding_site  4945177  4947595
#> 151     3R Regions_of_sig_enrichment binding_site  4954232  4955573
#> 152     3R Regions_of_sig_enrichment binding_site  4982340  4984329
#> 153     3R Regions_of_sig_enrichment binding_site  5051839  5056076
#> 154     3R Regions_of_sig_enrichment binding_site  5059777  5063015
#> 155     3R Regions_of_sig_enrichment binding_site  5065029  5066193
#> 156     3R Regions_of_sig_enrichment binding_site  5082976  5085787
#> 157     3R Regions_of_sig_enrichment binding_site  5154327  5155335
#> 158     3R Regions_of_sig_enrichment binding_site  5160217  5162897
#> 159     3R Regions_of_sig_enrichment binding_site  5163820  5168489
#> 160     3R Regions_of_sig_enrichment binding_site  5173168  5174897
#> 161     3R Regions_of_sig_enrichment binding_site  5175503  5179704
#> 162     3R Regions_of_sig_enrichment binding_site  5183637  5185003
#> 163     3R Regions_of_sig_enrichment binding_site  5189507  5195271
#> 164     3R Regions_of_sig_enrichment binding_site  5200688  5201807
#> 165     3R Regions_of_sig_enrichment binding_site  5218220  5220446
#> 166     3R Regions_of_sig_enrichment binding_site  5243203  5245649
#> 167     3R Regions_of_sig_enrichment binding_site  5253781  5257134
#> 168     3R Regions_of_sig_enrichment binding_site  5261437  5265713
#> 169     3R Regions_of_sig_enrichment binding_site  5267357  5269018
#> 170     3R Regions_of_sig_enrichment binding_site  5323471  5325248
#> 171     3R Regions_of_sig_enrichment binding_site  5325556  5330815
#> 172     3R Regions_of_sig_enrichment binding_site  5335623  5338337
#> 173     3R Regions_of_sig_enrichment binding_site  5339813  5341206
#> 174     3R Regions_of_sig_enrichment binding_site  5341865  5343198
#> 175     3R Regions_of_sig_enrichment binding_site  5352065  5355281
#> 176     3R Regions_of_sig_enrichment binding_site  5357678  5360693
#> 177     3R Regions_of_sig_enrichment binding_site  5376106  5377969
#> 178     3R Regions_of_sig_enrichment binding_site  5388594  5389821
#> 179     3R Regions_of_sig_enrichment binding_site  5396109  5397479
#> 180     3R Regions_of_sig_enrichment binding_site  5398644  5400609
#> 181     3R Regions_of_sig_enrichment binding_site  5416250  5417923
#> 182     3R Regions_of_sig_enrichment binding_site  5455413  5456907
#> 183     3R Regions_of_sig_enrichment binding_site  5502340  5504581
#> 184     3R Regions_of_sig_enrichment binding_site  5512561  5514408
#> 185     3R Regions_of_sig_enrichment binding_site  5517820  5519545
#> 186     3R Regions_of_sig_enrichment binding_site  5521021  5522504
#> 187     3R Regions_of_sig_enrichment binding_site  5528861  5531475
#> 188     3R Regions_of_sig_enrichment binding_site  5584958  5586111
#> 189     3R Regions_of_sig_enrichment binding_site  5606490  5608462
#> 190     3R Regions_of_sig_enrichment binding_site  5609663  5611524
#> 191     3R Regions_of_sig_enrichment binding_site  5630997  5632091
#> 192     3R Regions_of_sig_enrichment binding_site  5634211  5635563
#> 193     3R Regions_of_sig_enrichment binding_site  5698054  5699459
#> 194     3R Regions_of_sig_enrichment binding_site  5699656  5701315
#> 195     3R Regions_of_sig_enrichment binding_site  5702220  5704336
#> 196     3R Regions_of_sig_enrichment binding_site  5754281  5758134
#> 197     3R Regions_of_sig_enrichment binding_site  5904492  5911075
#> 198     3R Regions_of_sig_enrichment binding_site  5912453  5913991
#> 199     3R Regions_of_sig_enrichment binding_site  5914231  5916761
#> 200     3R Regions_of_sig_enrichment binding_site  5918475  5926850
#> 201     3R Regions_of_sig_enrichment binding_site  5927326  5928982
#> 202     3R Regions_of_sig_enrichment binding_site  5945177  5947235
#> 203     3R Regions_of_sig_enrichment binding_site  5970002  5971185
#> 204     3R Regions_of_sig_enrichment binding_site  6028671  6030020
#> 205     3R Regions_of_sig_enrichment binding_site  6089355  6091495
#> 206     3R Regions_of_sig_enrichment binding_site  6092138  6093316
#> 207     3R Regions_of_sig_enrichment binding_site  6135950  6137584
#> 208     3R Regions_of_sig_enrichment binding_site  6138765  6139869
#> 209     3R Regions_of_sig_enrichment binding_site  6175501  6178729
#> 210     3R Regions_of_sig_enrichment binding_site  6180941  6183313
#> 211     3R Regions_of_sig_enrichment binding_site  6206392  6219526
#> 212     3R Regions_of_sig_enrichment binding_site  6220286  6222187
#> 213     3R Regions_of_sig_enrichment binding_site  6231013  6232085
#> 214     3R Regions_of_sig_enrichment binding_site  6259864  6261037
#> 215     3R Regions_of_sig_enrichment binding_site  6500587  6502001
#> 216     3R Regions_of_sig_enrichment binding_site  6502745  6503937
#> 217     3R Regions_of_sig_enrichment binding_site  6586788  6587825
#> 218     3R Regions_of_sig_enrichment binding_site  6708233  6711002
#> 219     3R Regions_of_sig_enrichment binding_site  6711248  6713974
#> 220     3R Regions_of_sig_enrichment binding_site  6714168  6715614
#> 221     3R Regions_of_sig_enrichment binding_site  7023027  7028124
#> 222     3R Regions_of_sig_enrichment binding_site  7034006  7035252
#> 223     3R Regions_of_sig_enrichment binding_site  7035956  7037278
#> 224     3R Regions_of_sig_enrichment binding_site  7039129  7040617
#> 225     3R Regions_of_sig_enrichment binding_site  7044319  7045466
#> 226     3R Regions_of_sig_enrichment binding_site  7177613  7179615
#> 227     3R Regions_of_sig_enrichment binding_site  7261666  7263914
#> 228     3R Regions_of_sig_enrichment binding_site  7388391  7389635
#> 229     3R Regions_of_sig_enrichment binding_site  7391388  7393309
#> 230     3R Regions_of_sig_enrichment binding_site  7394341  7395498
#> 231     3R Regions_of_sig_enrichment binding_site  7406999  7409246
#> 232     3R Regions_of_sig_enrichment binding_site  7429927  7431249
#> 233     3R Regions_of_sig_enrichment binding_site  7438347  7440385
#> 234     3R Regions_of_sig_enrichment binding_site  7442757  7444186
#> 235     3R Regions_of_sig_enrichment binding_site  7444416  7445744
#> 236     3R Regions_of_sig_enrichment binding_site  7449727  7450744
#> 237     3R Regions_of_sig_enrichment binding_site  7459108  7460234
#> 238     3R Regions_of_sig_enrichment binding_site  7464375  7466474
#> 239     3R Regions_of_sig_enrichment binding_site  7471120  7472272
#> 240     3R Regions_of_sig_enrichment binding_site  7474115  7475150
#> 241     3R Regions_of_sig_enrichment binding_site  7504578  7505689
#> 242     3R Regions_of_sig_enrichment binding_site  7519972  7521768
#> 243     3R Regions_of_sig_enrichment binding_site  7566903  7568031
#> 244     3R Regions_of_sig_enrichment binding_site  7576761  7577766
#> 245     3R Regions_of_sig_enrichment binding_site  7583983  7589836
#> 246     3R Regions_of_sig_enrichment binding_site  7637987  7639013
#> 247     3R Regions_of_sig_enrichment binding_site  7712086  7713097
#> 248     3R Regions_of_sig_enrichment binding_site  7774015  7775367
#> 249     3R Regions_of_sig_enrichment binding_site  7779622  7782744
#> 250     3R Regions_of_sig_enrichment binding_site  7783875  7785018
#> 251     3R Regions_of_sig_enrichment binding_site  7792352  7794238
#> 252     3R Regions_of_sig_enrichment binding_site  7806757  7808981
#> 253     3R Regions_of_sig_enrichment binding_site  7809102  7810457
#> 254     3R Regions_of_sig_enrichment binding_site  7818009  7819275
#> 255     3R Regions_of_sig_enrichment binding_site  7900610  7901705
#> 256     3R Regions_of_sig_enrichment binding_site  7904247  7905430
#> 257     3R Regions_of_sig_enrichment binding_site  7908668  7910281
#> 258     3R Regions_of_sig_enrichment binding_site  8046901  8048660
#> 259     3R Regions_of_sig_enrichment binding_site  8084369  8085877
#> 260     3R Regions_of_sig_enrichment binding_site  8194348  8196977
#> 261     3R Regions_of_sig_enrichment binding_site  8207879  8211098
#> 262     3R Regions_of_sig_enrichment binding_site  8224080  8225169
#> 263     3R Regions_of_sig_enrichment binding_site  8249386  8250844
#> 264     3R Regions_of_sig_enrichment binding_site  8254838  8255908
#> 265     3R Regions_of_sig_enrichment binding_site  8266408  8268281
#> 266     3R Regions_of_sig_enrichment binding_site  8268502  8270375
#> 267     3R Regions_of_sig_enrichment binding_site  8273107  8274577
#> 268     3R Regions_of_sig_enrichment binding_site  8274866  8275992
#> 269     3R Regions_of_sig_enrichment binding_site  8453884  8454911
#> 270     3R Regions_of_sig_enrichment binding_site  8462178  8465720
#> 271     3R Regions_of_sig_enrichment binding_site  8475205  8478855
#> 272     3R Regions_of_sig_enrichment binding_site  8485295  8486580
#> 273     3R Regions_of_sig_enrichment binding_site  8516145  8517948
#> 274     3R Regions_of_sig_enrichment binding_site  8524824  8527259
#> 275     3R Regions_of_sig_enrichment binding_site  8527501  8528822
#> 276     3R Regions_of_sig_enrichment binding_site  8539741  8545878
#> 277     3R Regions_of_sig_enrichment binding_site  8785418  8786630
#> 278     3R Regions_of_sig_enrichment binding_site  8803086  8804353
#> 279     3R Regions_of_sig_enrichment binding_site  8804880  8807460
#> 280     3R Regions_of_sig_enrichment binding_site  8807582  8808859
#> 281     3R Regions_of_sig_enrichment binding_site  8813454  8814786
#> 282     3R Regions_of_sig_enrichment binding_site  8820031  8821164
#> 283     3R Regions_of_sig_enrichment binding_site  8822938  8824038
#> 284     3R Regions_of_sig_enrichment binding_site  8834250  8835486
#> 285     3R Regions_of_sig_enrichment binding_site  8837322  8838792
#> 286     3R Regions_of_sig_enrichment binding_site  8838904  8840422
#> 287     3R Regions_of_sig_enrichment binding_site  8840524  8845492
#> 288     3R Regions_of_sig_enrichment binding_site  8852024  8853136
#> 289     3R Regions_of_sig_enrichment binding_site  8855404  8856865
#> 290     3R Regions_of_sig_enrichment binding_site  9084891  9086607
#> 291     3R Regions_of_sig_enrichment binding_site  9134911  9135990
#> 292     3R Regions_of_sig_enrichment binding_site  9189404  9190733
#> 293     3R Regions_of_sig_enrichment binding_site  9203830  9205542
#> 294     3R Regions_of_sig_enrichment binding_site  9226570  9227848
#> 295     3R Regions_of_sig_enrichment binding_site  9259690  9260998
#> 296     3R Regions_of_sig_enrichment binding_site  9290934  9293168
#> 297     3R Regions_of_sig_enrichment binding_site  9294941  9296602
#> 298     3R Regions_of_sig_enrichment binding_site  9400858  9402398
#> 299     3R Regions_of_sig_enrichment binding_site  9469025  9471452
#> 300     3R Regions_of_sig_enrichment binding_site  9472445  9474089
#> 301     3R Regions_of_sig_enrichment binding_site  9477413  9479590
#> 302     3R Regions_of_sig_enrichment binding_site  9483151  9484456
#> 303     3R Regions_of_sig_enrichment binding_site  9501745  9502813
#> 304     3R Regions_of_sig_enrichment binding_site  9509605  9513057
#> 305     3R Regions_of_sig_enrichment binding_site  9517886  9519066
#> 306     3R Regions_of_sig_enrichment binding_site  9604079  9605772
#> 307     3R Regions_of_sig_enrichment binding_site  9607999  9609177
#> 308     3R Regions_of_sig_enrichment binding_site  9658989  9660853
#> 309     3R Regions_of_sig_enrichment binding_site  9802598  9803864
#> 310     3R Regions_of_sig_enrichment binding_site  9808498  9810809
#> 311     3R Regions_of_sig_enrichment binding_site  9849453  9850584
#> 312     3R Regions_of_sig_enrichment binding_site  9850906  9852062
#> 313     3R Regions_of_sig_enrichment binding_site  9861312  9862325
#> 314     3R Regions_of_sig_enrichment binding_site  9879393  9880647
#> 315     3R Regions_of_sig_enrichment binding_site  9881809  9885203
#> 316     3R Regions_of_sig_enrichment binding_site  9893828  9894847
#> 317     3R Regions_of_sig_enrichment binding_site  9895000  9897042
#> 318     3R Regions_of_sig_enrichment binding_site  9901412  9902737
#> 319     3R Regions_of_sig_enrichment binding_site  9913555  9915282
#> 320     3R Regions_of_sig_enrichment binding_site  9950977  9952244
#> 321     3R Regions_of_sig_enrichment binding_site 10049325 10050353
#> 322     3R Regions_of_sig_enrichment binding_site 10108268 10110897
#> 323     3R Regions_of_sig_enrichment binding_site 10111099 10112645
#> 324     3R Regions_of_sig_enrichment binding_site 10114440 10116471
#> 325     3R Regions_of_sig_enrichment binding_site 10132773 10134425
#> 326     3R Regions_of_sig_enrichment binding_site 10145609 10147310
#> 327     3R Regions_of_sig_enrichment binding_site 10149803 10152682
#> 328     3R Regions_of_sig_enrichment binding_site 10188368 10190095
#> 329     3R Regions_of_sig_enrichment binding_site 10190254 10191454
#> 330     3R Regions_of_sig_enrichment binding_site 10195872 10197051
#> 331     3R Regions_of_sig_enrichment binding_site 10197175 10198696
#> 332     3R Regions_of_sig_enrichment binding_site 10199521 10200738
#> 333     3R Regions_of_sig_enrichment binding_site 10298373 10301857
#> 334     3R Regions_of_sig_enrichment binding_site 10304754 10307921
#> 335     3R Regions_of_sig_enrichment binding_site 10382271 10383659
#> 336     3R Regions_of_sig_enrichment binding_site 10449599 10451912
#> 337     3R Regions_of_sig_enrichment binding_site 10474896 10477175
#> 338     3R Regions_of_sig_enrichment binding_site 10479922 10481825
#> 339     3R Regions_of_sig_enrichment binding_site 10484485 10485708
#> 340     3R Regions_of_sig_enrichment binding_site 10515435 10516468
#> 341     3R Regions_of_sig_enrichment binding_site 10522024 10523178
#> 342     3R Regions_of_sig_enrichment binding_site 10534887 10536192
#> 343     3R Regions_of_sig_enrichment binding_site 10541320 10542889
#> 344     3R Regions_of_sig_enrichment binding_site 10548088 10549090
#> 345     3R Regions_of_sig_enrichment binding_site 10549257 10550440
#> 346     3R Regions_of_sig_enrichment binding_site 10552762 10556553
#> 347     3R Regions_of_sig_enrichment binding_site 10556792 10558642
#> 348     3R Regions_of_sig_enrichment binding_site 10564041 10566104
#> 349     3R Regions_of_sig_enrichment binding_site 10566222 10567957
#> 350     3R Regions_of_sig_enrichment binding_site 10719976 10720991
#> 351     3R Regions_of_sig_enrichment binding_site 10914447 10916530
#> 352     3R Regions_of_sig_enrichment binding_site 10918247 10920480
#> 353     3R Regions_of_sig_enrichment binding_site 10941635 10942860
#> 354     3R Regions_of_sig_enrichment binding_site 10953836 10955039
#> 355     3R Regions_of_sig_enrichment binding_site 10955545 10957807
#> 356     3R Regions_of_sig_enrichment binding_site 10972009 10973798
#> 357     3R Regions_of_sig_enrichment binding_site 11021826 11023416
#> 358     3R Regions_of_sig_enrichment binding_site 11023866 11025065
#> 359     3R Regions_of_sig_enrichment binding_site 11088035 11089035
#> 360     3R Regions_of_sig_enrichment binding_site 11102346 11104485
#> 361     3R Regions_of_sig_enrichment binding_site 11111627 11113204
#> 362     3R Regions_of_sig_enrichment binding_site 11115302 11117333
#> 363     3R Regions_of_sig_enrichment binding_site 11117444 11120634
#> 364     3R Regions_of_sig_enrichment binding_site 11121387 11122741
#> 365     3R Regions_of_sig_enrichment binding_site 11189461 11191377
#> 366     3R Regions_of_sig_enrichment binding_site 11197272 11198358
#> 367     3R Regions_of_sig_enrichment binding_site 11233577 11237098
#> 368     3R Regions_of_sig_enrichment binding_site 11300909 11302604
#> 369     3R Regions_of_sig_enrichment binding_site 11318321 11319995
#> 370     3R Regions_of_sig_enrichment binding_site 11372395 11374629
#> 371     3R Regions_of_sig_enrichment binding_site 11477297 11478373
#> 372     3R Regions_of_sig_enrichment binding_site 11490040 11493367
#> 373     3R Regions_of_sig_enrichment binding_site 11502196 11505108
#> 374     3R Regions_of_sig_enrichment binding_site 11614856 11615980
#> 375     3R Regions_of_sig_enrichment binding_site 11617991 11619076
#> 376     3R Regions_of_sig_enrichment binding_site 11619191 11620407
#> 377     3R Regions_of_sig_enrichment binding_site 11623947 11625734
#> 378     3R Regions_of_sig_enrichment binding_site 11627381 11628476
#> 379     3R Regions_of_sig_enrichment binding_site 11678853 11681587
#> 380     3R Regions_of_sig_enrichment binding_site 11726179 11728217
#> 381     3R Regions_of_sig_enrichment binding_site 11729231 11730276
#> 382     3R Regions_of_sig_enrichment binding_site 11760151 11761704
#> 383     3R Regions_of_sig_enrichment binding_site 11789381 11791167
#> 384     3R Regions_of_sig_enrichment binding_site 11792266 11794110
#> 385     3R Regions_of_sig_enrichment binding_site 11797449 11802752
#> 386     3R Regions_of_sig_enrichment binding_site 11803394 11804833
#> 387     3R Regions_of_sig_enrichment binding_site 11808504 11810192
#> 388     3R Regions_of_sig_enrichment binding_site 11810302 11813783
#> 389     3R Regions_of_sig_enrichment binding_site 11818958 11820071
#> 390     3R Regions_of_sig_enrichment binding_site 11824927 11826685
#> 391     3R Regions_of_sig_enrichment binding_site 11828717 11830004
#> 392     3R Regions_of_sig_enrichment binding_site 11830152 11833458
#> 393     3R Regions_of_sig_enrichment binding_site 11855307 11857828
#> 394     3R Regions_of_sig_enrichment binding_site 11867077 11870167
#> 395     3R Regions_of_sig_enrichment binding_site 11873421 11875566
#> 396     3R Regions_of_sig_enrichment binding_site 11876076 11877602
#> 397     3R Regions_of_sig_enrichment binding_site 11893484 11894773
#> 398     3R Regions_of_sig_enrichment binding_site 11923280 11925149
#> 399     3R Regions_of_sig_enrichment binding_site 11980004 11981836
#> 400     3R Regions_of_sig_enrichment binding_site 11982453 11985137
#> 401     3R Regions_of_sig_enrichment binding_site 12012263 12014064
#> 402     3R Regions_of_sig_enrichment binding_site 12015557 12017619
#> 403     3R Regions_of_sig_enrichment binding_site 12024434 12025680
#> 404     3R Regions_of_sig_enrichment binding_site 12028216 12030271
#> 405     3R Regions_of_sig_enrichment binding_site 12030954 12032008
#> 406     3R Regions_of_sig_enrichment binding_site 12055322 12058805
#> 407     3R Regions_of_sig_enrichment binding_site 12059236 12061429
#> 408     3R Regions_of_sig_enrichment binding_site 12061904 12064484
#> 409     3R Regions_of_sig_enrichment binding_site 12065923 12066942
#> 410     3R Regions_of_sig_enrichment binding_site 12067060 12069019
#> 411     3R Regions_of_sig_enrichment binding_site 12070198 12071361
#> 412     3R Regions_of_sig_enrichment binding_site 12075004 12076708
#> 413     3R Regions_of_sig_enrichment binding_site 12077916 12079116
#> 414     3R Regions_of_sig_enrichment binding_site 12080008 12081485
#> 415     3R Regions_of_sig_enrichment binding_site 12081763 12082879
#> 416     3R Regions_of_sig_enrichment binding_site 12086058 12087971
#> 417     3R Regions_of_sig_enrichment binding_site 12092166 12093225
#> 418     3R Regions_of_sig_enrichment binding_site 12094265 12095357
#> 419     3R Regions_of_sig_enrichment binding_site 12104682 12108319
#> 420     3R Regions_of_sig_enrichment binding_site 12109462 12111210
#> 421     3R Regions_of_sig_enrichment binding_site 12113422 12114514
#> 422     3R Regions_of_sig_enrichment binding_site 12115463 12117986
#> 423     3R Regions_of_sig_enrichment binding_site 12129168 12130446
#> 424     3R Regions_of_sig_enrichment binding_site 12130594 12131794
#> 425     3R Regions_of_sig_enrichment binding_site 12133825 12136708
#> 426     3R Regions_of_sig_enrichment binding_site 12164047 12165501
#> 427     3R Regions_of_sig_enrichment binding_site 12173525 12175627
#> 428     3R Regions_of_sig_enrichment binding_site 12175901 12177635
#> 429     3R Regions_of_sig_enrichment binding_site 12257414 12259003
#> 430     3R Regions_of_sig_enrichment binding_site 12273264 12275499
#> 431     3R Regions_of_sig_enrichment binding_site 12277723 12279523
#> 432     3R Regions_of_sig_enrichment binding_site 12281971 12283254
#> 433     3R Regions_of_sig_enrichment binding_site 12398740 12400676
#> 434     3R Regions_of_sig_enrichment binding_site 12436980 12438087
#> 435     3R Regions_of_sig_enrichment binding_site 12464409 12468012
#> 436     3R Regions_of_sig_enrichment binding_site 12481665 12483364
#> 437     3R Regions_of_sig_enrichment binding_site 12808506 12809958
#> 438     3R Regions_of_sig_enrichment binding_site 12811477 12812639
#> 439     3R Regions_of_sig_enrichment binding_site 12821888 12823651
#> 440     3R Regions_of_sig_enrichment binding_site 12879136 12880888
#> 441     3R Regions_of_sig_enrichment binding_site 12881273 12883402
#> 442     3R Regions_of_sig_enrichment binding_site 12884583 12885857
#> 443     3R Regions_of_sig_enrichment binding_site 12887803 12889145
#> 444     3R Regions_of_sig_enrichment binding_site 12903313 12904399
#> 445     3R Regions_of_sig_enrichment binding_site 12906542 12909266
#> 446     3R Regions_of_sig_enrichment binding_site 12915114 12916653
#> 447     3R Regions_of_sig_enrichment binding_site 12934428 12935488
#> 448     3R Regions_of_sig_enrichment binding_site 12940222 12942043
#> 449     3R Regions_of_sig_enrichment binding_site 12945266 12946332
#> 450     3R Regions_of_sig_enrichment binding_site 12947314 12949664
#> 451     3R Regions_of_sig_enrichment binding_site 13211444 13212658
#> 452     3R Regions_of_sig_enrichment binding_site 13225229 13226487
#> 453     3R Regions_of_sig_enrichment binding_site 13275215 13276350
#> 454     3R Regions_of_sig_enrichment binding_site 13359567 13361842
#> 455     3R Regions_of_sig_enrichment binding_site 13440736 13443410
#> 456     3R Regions_of_sig_enrichment binding_site 13502655 13506727
#> 457     3R Regions_of_sig_enrichment binding_site 13510758 13512604
#> 458     3R Regions_of_sig_enrichment binding_site 13525500 13526598
#> 459     3R Regions_of_sig_enrichment binding_site 13526712 13529741
#> 460     3R Regions_of_sig_enrichment binding_site 13529944 13533373
#> 461     3R Regions_of_sig_enrichment binding_site 13537966 13539511
#> 462     3R Regions_of_sig_enrichment binding_site 13542101 13544413
#> 463     3R Regions_of_sig_enrichment binding_site 13629055 13630869
#> 464     3R Regions_of_sig_enrichment binding_site 13768835 13771020
#> 465     3R Regions_of_sig_enrichment binding_site 13991780 13992962
#> 466     3R Regions_of_sig_enrichment binding_site 13993450 13994522
#> 467     3R Regions_of_sig_enrichment binding_site 14045130 14046760
#> 468     3R Regions_of_sig_enrichment binding_site 14069674 14071856
#> 469     3R Regions_of_sig_enrichment binding_site 14074705 14075764
#> 470     3R Regions_of_sig_enrichment binding_site 14100240 14101384
#> 471     3R Regions_of_sig_enrichment binding_site 14122823 14125700
#> 472     3R Regions_of_sig_enrichment binding_site 14215472 14218001
#> 473     3R Regions_of_sig_enrichment binding_site 14222304 14223782
#> 474     3R Regions_of_sig_enrichment binding_site 14223974 14225509
#> 475     3R Regions_of_sig_enrichment binding_site 14237789 14238875
#> 476     3R Regions_of_sig_enrichment binding_site 14272781 14275276
#> 477     3R Regions_of_sig_enrichment binding_site 14298500 14299783
#> 478     3R Regions_of_sig_enrichment binding_site 14299907 14301260
#> 479     3R Regions_of_sig_enrichment binding_site 14303834 14306167
#> 480     3R Regions_of_sig_enrichment binding_site 14306596 14308094
#> 481     3R Regions_of_sig_enrichment binding_site 14309003 14310549
#> 482     3R Regions_of_sig_enrichment binding_site 14340873 14341879
#> 483     3R Regions_of_sig_enrichment binding_site 14389900 14393090
#> 484     3R Regions_of_sig_enrichment binding_site 14408711 14412004
#> 485     3R Regions_of_sig_enrichment binding_site 14483015 14484063
#> 486     3R Regions_of_sig_enrichment binding_site 14564624 14566616
#> 487     3R Regions_of_sig_enrichment binding_site 14568247 14569941
#> 488     3R Regions_of_sig_enrichment binding_site 14583868 14585033
#> 489     3R Regions_of_sig_enrichment binding_site 14739705 14741420
#> 490     3R Regions_of_sig_enrichment binding_site 14743569 14745411
#> 491     3R Regions_of_sig_enrichment binding_site 14748785 14750430
#> 492     3R Regions_of_sig_enrichment binding_site 14753730 14754894
#> 493     3R Regions_of_sig_enrichment binding_site 14854308 14855329
#> 494     3R Regions_of_sig_enrichment binding_site 14869526 14871267
#> 495     3R Regions_of_sig_enrichment binding_site 14919194 14920298
#> 496     3R Regions_of_sig_enrichment binding_site 14921757 14923008
#> 497     3R Regions_of_sig_enrichment binding_site 14972819 14974071
#> 498     3R Regions_of_sig_enrichment binding_site 14989530 14990889
#> 499     3R Regions_of_sig_enrichment binding_site 15044753 15046454
#> 500     3R Regions_of_sig_enrichment binding_site 15047337 15049658
#> 501     3R Regions_of_sig_enrichment binding_site 15049774 15050929
#> 502     3R Regions_of_sig_enrichment binding_site 15061084 15062534
#> 503     3R Regions_of_sig_enrichment binding_site 15063115 15066261
#> 504     3R Regions_of_sig_enrichment binding_site 15288776 15290239
#> 505     3R Regions_of_sig_enrichment binding_site 15454981 15455992
#> 506     3R Regions_of_sig_enrichment binding_site 15457609 15458874
#> 507     3R Regions_of_sig_enrichment binding_site 15464140 15467231
#> 508     3R Regions_of_sig_enrichment binding_site 15467354 15468634
#> 509     3R Regions_of_sig_enrichment binding_site 15468866 15470426
#> 510     3R Regions_of_sig_enrichment binding_site 15496831 15497960
#> 511     3R Regions_of_sig_enrichment binding_site 15592829 15604975
#> 512     3R Regions_of_sig_enrichment binding_site 15660039 15661150
#> 513     3R Regions_of_sig_enrichment binding_site 15661937 15662961
#> 514     3R Regions_of_sig_enrichment binding_site 15684892 15687517
#> 515     3R Regions_of_sig_enrichment binding_site 15689299 15690522
#> 516     3R Regions_of_sig_enrichment binding_site 15702574 15703687
#> 517     3R Regions_of_sig_enrichment binding_site 15705569 15707119
#> 518     3R Regions_of_sig_enrichment binding_site 15727921 15729714
#> 519     3R Regions_of_sig_enrichment binding_site 15729950 15731164
#> 520     3R Regions_of_sig_enrichment binding_site 15731591 15733823
#> 521     3R Regions_of_sig_enrichment binding_site 15734250 15736097
#> 522     3R Regions_of_sig_enrichment binding_site 15738496 15741807
#> 523     3R Regions_of_sig_enrichment binding_site 15789439 15791400
#> 524     3R Regions_of_sig_enrichment binding_site 15883729 15885897
#> 525     3R Regions_of_sig_enrichment binding_site 15954363 15956239
#> 526     3R Regions_of_sig_enrichment binding_site 15979304 15981285
#> 527     3R Regions_of_sig_enrichment binding_site 16078457 16079590
#> 528     3R Regions_of_sig_enrichment binding_site 16082816 16084944
#> 529     3R Regions_of_sig_enrichment binding_site 16086403 16087528
#> 530     3R Regions_of_sig_enrichment binding_site 16090107 16092269
#> 531     3R Regions_of_sig_enrichment binding_site 16136210 16137900
#> 532     3R Regions_of_sig_enrichment binding_site 16139862 16141616
#> 533     3R Regions_of_sig_enrichment binding_site 16141935 16143713
#> 534     3R Regions_of_sig_enrichment binding_site 16143815 16145053
#> 535     3R Regions_of_sig_enrichment binding_site 16148978 16150579
#> 536     3R Regions_of_sig_enrichment binding_site 16152093 16153909
#> 537     3R Regions_of_sig_enrichment binding_site 16157675 16159292
#> 538     3R Regions_of_sig_enrichment binding_site 16360002 16361324
#> 539     3R Regions_of_sig_enrichment binding_site 16369175 16371888
#> 540     3R Regions_of_sig_enrichment binding_site 16374500 16378902
#> 541     3R Regions_of_sig_enrichment binding_site 16382238 16383767
#> 542     3R Regions_of_sig_enrichment binding_site 16461091 16462101
#> 543     3R Regions_of_sig_enrichment binding_site 16584702 16585760
#> 544     3R Regions_of_sig_enrichment binding_site 16590071 16591169
#> 545     3R Regions_of_sig_enrichment binding_site 16591284 16592540
#> 546     3R Regions_of_sig_enrichment binding_site 16603683 16605005
#> 547     3R Regions_of_sig_enrichment binding_site 16605393 16606643
#> 548     3R Regions_of_sig_enrichment binding_site 16607188 16610722
#> 549     3R Regions_of_sig_enrichment binding_site 16647612 16649770
#> 550     3R Regions_of_sig_enrichment binding_site 16654377 16656398
#> 551     3R Regions_of_sig_enrichment binding_site 16658427 16660162
#> 552     3R Regions_of_sig_enrichment binding_site 16716213 16717773
#> 553     3R Regions_of_sig_enrichment binding_site 16734202 16735289
#> 554     3R Regions_of_sig_enrichment binding_site 16782014 16783845
#> 555     3R Regions_of_sig_enrichment binding_site 16848043 16849989
#> 556     3R Regions_of_sig_enrichment binding_site 16882382 16887245
#> 557     3R Regions_of_sig_enrichment binding_site 16890517 16891789
#> 558     3R Regions_of_sig_enrichment binding_site 16894526 16897836
#> 559     3R Regions_of_sig_enrichment binding_site 16918424 16919541
#> 560     3R Regions_of_sig_enrichment binding_site 16920036 16921409
#> 561     3R Regions_of_sig_enrichment binding_site 16921723 16922992
#> 562     3R Regions_of_sig_enrichment binding_site 16936637 16938677
#> 563     3R Regions_of_sig_enrichment binding_site 16952466 16953967
#> 564     3R Regions_of_sig_enrichment binding_site 16962886 16964115
#> 565     3R Regions_of_sig_enrichment binding_site 16977911 16979337
#> 566     3R Regions_of_sig_enrichment binding_site 16982150 16983488
#> 567     3R Regions_of_sig_enrichment binding_site 17012229 17013699
#> 568     3R Regions_of_sig_enrichment binding_site 17015599 17017278
#> 569     3R Regions_of_sig_enrichment binding_site 17024318 17025913
#> 570     3R Regions_of_sig_enrichment binding_site 17028510 17031026
#> 571     3R Regions_of_sig_enrichment binding_site 17074359 17075533
#> 572     3R Regions_of_sig_enrichment binding_site 17077457 17079672
#> 573     3R Regions_of_sig_enrichment binding_site 17093576 17094997
#> 574     3R Regions_of_sig_enrichment binding_site 17174218 17175582
#> 575     3R Regions_of_sig_enrichment binding_site 17184672 17186242
#> 576     3R Regions_of_sig_enrichment binding_site 17347072 17348210
#> 577     3R Regions_of_sig_enrichment binding_site 17406806 17408265
#> 578     3R Regions_of_sig_enrichment binding_site 17415654 17418415
#> 579     3R Regions_of_sig_enrichment binding_site 17424249 17425413
#> 580     3R Regions_of_sig_enrichment binding_site 17431180 17432671
#> 581     3R Regions_of_sig_enrichment binding_site 17438204 17439848
#> 582     3R Regions_of_sig_enrichment binding_site 17440199 17445625
#> 583     3R Regions_of_sig_enrichment binding_site 17457615 17458936
#> 584     3R Regions_of_sig_enrichment binding_site 17459189 17460636
#> 585     3R Regions_of_sig_enrichment binding_site 17476176 17477955
#> 586     3R Regions_of_sig_enrichment binding_site 17478257 17479853
#> 587     3R Regions_of_sig_enrichment binding_site 17482085 17484597
#> 588     3R Regions_of_sig_enrichment binding_site 17674024 17676112
#> 589     3R Regions_of_sig_enrichment binding_site 17677378 17681080
#> 590     3R Regions_of_sig_enrichment binding_site 17681587 17682659
#> 591     3R Regions_of_sig_enrichment binding_site 17692686 17694736
#> 592     3R Regions_of_sig_enrichment binding_site 17695145 17697602
#> 593     3R Regions_of_sig_enrichment binding_site 17700011 17701433
#> 594     3R Regions_of_sig_enrichment binding_site 17714328 17715718
#> 595     3R Regions_of_sig_enrichment binding_site 17779063 17780635
#> 596     3R Regions_of_sig_enrichment binding_site 17867572 17868784
#> 597     3R Regions_of_sig_enrichment binding_site 17897726 17899112
#> 598     3R Regions_of_sig_enrichment binding_site 18183993 18185817
#> 599     3R Regions_of_sig_enrichment binding_site 18193036 18194453
#> 600     3R Regions_of_sig_enrichment binding_site 18222191 18223395
#> 601     3R Regions_of_sig_enrichment binding_site 18236723 18237974
#> 602     3R Regions_of_sig_enrichment binding_site 18309448 18310854
#> 603     3R Regions_of_sig_enrichment binding_site 18349716 18351960
#> 604     3R Regions_of_sig_enrichment binding_site 18352199 18353506
#> 605     3R Regions_of_sig_enrichment binding_site 18353622 18358935
#> 606     3R Regions_of_sig_enrichment binding_site 18449189 18451302
#> 607     3R Regions_of_sig_enrichment binding_site 18451584 18453737
#> 608     3R Regions_of_sig_enrichment binding_site 18456338 18457365
#> 609     3R Regions_of_sig_enrichment binding_site 18492020 18493445
#> 610     3R Regions_of_sig_enrichment binding_site 18509317 18510453
#> 611     3R Regions_of_sig_enrichment binding_site 18551921 18553609
#> 612     3R Regions_of_sig_enrichment binding_site 18578996 18581590
#> 613     3R Regions_of_sig_enrichment binding_site 18882334 18883759
#> 614     3R Regions_of_sig_enrichment binding_site 18943299 18945481
#> 615     3R Regions_of_sig_enrichment binding_site 18999344 19001508
#> 616     3R Regions_of_sig_enrichment binding_site 19007087 19008194
#> 617     3R Regions_of_sig_enrichment binding_site 19010575 19012061
#> 618     3R Regions_of_sig_enrichment binding_site 19015814 19017000
#> 619     3R Regions_of_sig_enrichment binding_site 19045578 19048094
#> 620     3R Regions_of_sig_enrichment binding_site 19051535 19053030
#> 621     3R Regions_of_sig_enrichment binding_site 19119950 19122092
#> 622     3R Regions_of_sig_enrichment binding_site 19131366 19132765
#> 623     3R Regions_of_sig_enrichment binding_site 19133154 19134157
#> 624     3R Regions_of_sig_enrichment binding_site 19139158 19140313
#> 625     3R Regions_of_sig_enrichment binding_site 19140451 19143816
#> 626     3R Regions_of_sig_enrichment binding_site 19151483 19152908
#> 627     3R Regions_of_sig_enrichment binding_site 19156504 19159271
#> 628     3R Regions_of_sig_enrichment binding_site 19159928 19160990
#> 629     3R Regions_of_sig_enrichment binding_site 19161533 19162553
#> 630     3R Regions_of_sig_enrichment binding_site 19162663 19164527
#> 631     3R Regions_of_sig_enrichment binding_site 19165241 19167721
#> 632     3R Regions_of_sig_enrichment binding_site 19170966 19174345
#> 633     3R Regions_of_sig_enrichment binding_site 19346669 19349295
#> 634     3R Regions_of_sig_enrichment binding_site 19495006 19496176
#> 635     3R Regions_of_sig_enrichment binding_site 19547472 19549759
#> 636     3R Regions_of_sig_enrichment binding_site 19552141 19553422
#> 637     3R Regions_of_sig_enrichment binding_site 19554462 19557518
#> 638     3R Regions_of_sig_enrichment binding_site 19592587 19594238
#> 639     3R Regions_of_sig_enrichment binding_site 19599753 19601879
#> 640     3R Regions_of_sig_enrichment binding_site 19604512 19605667
#> 641     3R Regions_of_sig_enrichment binding_site 19606292 19608362
#> 642     3R Regions_of_sig_enrichment binding_site 19612716 19614495
#> 643     3R Regions_of_sig_enrichment binding_site 19614652 19616919
#> 644     3R Regions_of_sig_enrichment binding_site 19670465 19676807
#> 645     3R Regions_of_sig_enrichment binding_site 19684443 19685857
#> 646     3R Regions_of_sig_enrichment binding_site 19685980 19687032
#> 647     3R Regions_of_sig_enrichment binding_site 19696592 19697907
#> 648     3R Regions_of_sig_enrichment binding_site 19711256 19713522
#> 649     3R Regions_of_sig_enrichment binding_site 19713942 19715271
#> 650     3R Regions_of_sig_enrichment binding_site 19747122 19748710
#> 651     3R Regions_of_sig_enrichment binding_site 19760379 19761913
#> 652     3R Regions_of_sig_enrichment binding_site 19767246 19768444
#> 653     3R Regions_of_sig_enrichment binding_site 19817604 19819530
#> 654     3R Regions_of_sig_enrichment binding_site 19821325 19824790
#> 655     3R Regions_of_sig_enrichment binding_site 19840726 19843266
#> 656     3R Regions_of_sig_enrichment binding_site 19851994 19853377
#> 657     3R Regions_of_sig_enrichment binding_site 19856430 19858181
#> 658     3R Regions_of_sig_enrichment binding_site 19871152 19874138
#> 659     3R Regions_of_sig_enrichment binding_site 19875800 19876985
#> 660     3R Regions_of_sig_enrichment binding_site 19924691 19927853
#> 661     3R Regions_of_sig_enrichment binding_site 19930155 19932559
#> 662     3R Regions_of_sig_enrichment binding_site 19966416 19967679
#> 663     3R Regions_of_sig_enrichment binding_site 19968157 19969250
#> 664     3R Regions_of_sig_enrichment binding_site 19969411 19970519
#> 665     3R Regions_of_sig_enrichment binding_site 20022051 20023956
#> 666     3R Regions_of_sig_enrichment binding_site 20059310 20060884
#> 667     3R Regions_of_sig_enrichment binding_site 20074588 20075688
#> 668     3R Regions_of_sig_enrichment binding_site 20085060 20086852
#> 669     3R Regions_of_sig_enrichment binding_site 20096708 20097853
#> 670     3R Regions_of_sig_enrichment binding_site 20098210 20099386
#> 671     3R Regions_of_sig_enrichment binding_site 20100850 20102408
#> 672     3R Regions_of_sig_enrichment binding_site 20145245 20146777
#> 673     3R Regions_of_sig_enrichment binding_site 20149331 20150758
#> 674     3R Regions_of_sig_enrichment binding_site 20174254 20175670
#> 675     3R Regions_of_sig_enrichment binding_site 20368814 20370661
#> 676     3R Regions_of_sig_enrichment binding_site 20372245 20374442
#> 677     3R Regions_of_sig_enrichment binding_site 20374798 20376281
#> 678     3R Regions_of_sig_enrichment binding_site 20377498 20379885
#> 679     3R Regions_of_sig_enrichment binding_site 20380135 20381784
#> 680     3R Regions_of_sig_enrichment binding_site 20389688 20393072
#> 681     3R Regions_of_sig_enrichment binding_site 20393391 20395099
#> 682     3R Regions_of_sig_enrichment binding_site 20395412 20396743
#> 683     3R Regions_of_sig_enrichment binding_site 20397066 20399217
#> 684     3R Regions_of_sig_enrichment binding_site 20400926 20402021
#> 685     3R Regions_of_sig_enrichment binding_site 20406819 20408917
#> 686     3R Regions_of_sig_enrichment binding_site 20412008 20413511
#> 687     3R Regions_of_sig_enrichment binding_site 20413912 20415305
#> 688     3R Regions_of_sig_enrichment binding_site 20426466 20427496
#> 689     3R Regions_of_sig_enrichment binding_site 20427620 20431250
#> 690     3R Regions_of_sig_enrichment binding_site 20431370 20433126
#> 691     3R Regions_of_sig_enrichment binding_site 20433236 20435887
#> 692     3R Regions_of_sig_enrichment binding_site 20451980 20453315
#> 693     3R Regions_of_sig_enrichment binding_site 20542694 20543738
#> 694     3R Regions_of_sig_enrichment binding_site 20593812 20595299
#> 695     3R Regions_of_sig_enrichment binding_site 20595468 20597518
#> 696     3R Regions_of_sig_enrichment binding_site 20630967 20632276
#> 697     3R Regions_of_sig_enrichment binding_site 20638723 20639822
#> 698     3R Regions_of_sig_enrichment binding_site 20697852 20699491
#> 699     3R Regions_of_sig_enrichment binding_site 20854325 20855715
#> 700     3R Regions_of_sig_enrichment binding_site 20858891 20860246
#> 701     3R Regions_of_sig_enrichment binding_site 20874776 20877595
#> 702     3R Regions_of_sig_enrichment binding_site 20891835 20893176
#> 703     3R Regions_of_sig_enrichment binding_site 20947537 20948783
#> 704     3R Regions_of_sig_enrichment binding_site 21036170 21037718
#> 705     3R Regions_of_sig_enrichment binding_site 21070704 21071899
#> 706     3R Regions_of_sig_enrichment binding_site 21082151 21084186
#> 707     3R Regions_of_sig_enrichment binding_site 21128570 21129744
#> 708     3R Regions_of_sig_enrichment binding_site 21154656 21156338
#> 709     3R Regions_of_sig_enrichment binding_site 21298328 21299412
#> 710     3R Regions_of_sig_enrichment binding_site 21307827 21309129
#> 711     3R Regions_of_sig_enrichment binding_site 21315393 21316622
#> 712     3R Regions_of_sig_enrichment binding_site 21319042 21320216
#> 713     3R Regions_of_sig_enrichment binding_site 21341627 21345280
#> 714     3R Regions_of_sig_enrichment binding_site 21472601 21474161
#> 715     3R Regions_of_sig_enrichment binding_site 21483927 21484947
#> 716     3R Regions_of_sig_enrichment binding_site 21533413 21535110
#> 717     3R Regions_of_sig_enrichment binding_site 21579667 21580670
#> 718     3R Regions_of_sig_enrichment binding_site 21704634 21708139
#> 719     3R Regions_of_sig_enrichment binding_site 21708264 21709314
#> 720     3R Regions_of_sig_enrichment binding_site 21712661 21715625
#> 721     3R Regions_of_sig_enrichment binding_site 21774391 21780269
#> 722     3R Regions_of_sig_enrichment binding_site 21819578 21820823
#> 723     3R Regions_of_sig_enrichment binding_site 21829762 21836470
#> 724     3R Regions_of_sig_enrichment binding_site 21845248 21848317
#> 725     3R Regions_of_sig_enrichment binding_site 21867294 21869291
#> 726     3R Regions_of_sig_enrichment binding_site 21876653 21877898
#> 727     3R Regions_of_sig_enrichment binding_site 21879998 21881449
#> 728     3R Regions_of_sig_enrichment binding_site 21930965 21934566
#> 729     3R Regions_of_sig_enrichment binding_site 21946017 21948104
#> 730     3R Regions_of_sig_enrichment binding_site 21948986 21950374
#> 731     3R Regions_of_sig_enrichment binding_site 21954644 21957498
#> 732     3R Regions_of_sig_enrichment binding_site 22053577 22056634
#> 733     3R Regions_of_sig_enrichment binding_site 22059790 22063985
#> 734     3R Regions_of_sig_enrichment binding_site 22079049 22080476
#> 735     3R Regions_of_sig_enrichment binding_site 22084087 22086078
#> 736     3R Regions_of_sig_enrichment binding_site 22086280 22087639
#> 737     3R Regions_of_sig_enrichment binding_site 22286838 22288383
#> 738     3R Regions_of_sig_enrichment binding_site 22296723 22299210
#> 739     3R Regions_of_sig_enrichment binding_site 22329462 22330910
#> 740     3R Regions_of_sig_enrichment binding_site 22359126 22361456
#> 741     3R Regions_of_sig_enrichment binding_site 22391953 22393393
#> 742     3R Regions_of_sig_enrichment binding_site 22624612 22625899
#> 743     3R Regions_of_sig_enrichment binding_site 22636745 22638305
#> 744     3R Regions_of_sig_enrichment binding_site 22638512 22641026
#> 745     3R Regions_of_sig_enrichment binding_site 22688140 22689148
#> 746     3R Regions_of_sig_enrichment binding_site 22692989 22694356
#> 747     3R Regions_of_sig_enrichment binding_site 22700745 22701900
#> 748     3R Regions_of_sig_enrichment binding_site 22706973 22708006
#> 749     3R Regions_of_sig_enrichment binding_site 22780261 22783387
#> 750     3R Regions_of_sig_enrichment binding_site 22806061 22807113
#> 751     3R Regions_of_sig_enrichment binding_site 22809957 22810976
#> 752     3R Regions_of_sig_enrichment binding_site 22811368 22812498
#> 753     3R Regions_of_sig_enrichment binding_site 22852511 22853606
#> 754     3R Regions_of_sig_enrichment binding_site 22880785 22884438
#> 755     3R Regions_of_sig_enrichment binding_site 22894800 22897663
#> 756     3R Regions_of_sig_enrichment binding_site 22907757 22909107
#> 757     3R Regions_of_sig_enrichment binding_site 22923738 22925663
#> 758     3R Regions_of_sig_enrichment binding_site 22935012 22936746
#> 759     3R Regions_of_sig_enrichment binding_site 22936869 22938192
#> 760     3R Regions_of_sig_enrichment binding_site 22954594 22955848
#> 761     3R Regions_of_sig_enrichment binding_site 22975124 22976146
#> 762     3R Regions_of_sig_enrichment binding_site 22978238 22980052
#> 763     3R Regions_of_sig_enrichment binding_site 23012533 23013777
#> 764     3R Regions_of_sig_enrichment binding_site 23013967 23015314
#> 765     3R Regions_of_sig_enrichment binding_site 23016993 23018379
#> 766     3R Regions_of_sig_enrichment binding_site 23019022 23020587
#> 767     3R Regions_of_sig_enrichment binding_site 23069609 23071691
#> 768     3R Regions_of_sig_enrichment binding_site 23081637 23082891
#> 769     3R Regions_of_sig_enrichment binding_site 23089324 23090433
#> 770     3R Regions_of_sig_enrichment binding_site 23096158 23100030
#> 771     3R Regions_of_sig_enrichment binding_site 23100538 23101590
#> 772     3R Regions_of_sig_enrichment binding_site 23106204 23107980
#> 773     3R Regions_of_sig_enrichment binding_site 23108630 23109917
#> 774     3R Regions_of_sig_enrichment binding_site 23116710 23118328
#> 775     3R Regions_of_sig_enrichment binding_site 23124936 23127641
#> 776     3R Regions_of_sig_enrichment binding_site 23372485 23374490
#> 777     3R Regions_of_sig_enrichment binding_site 23374809 23376698
#> 778     3R Regions_of_sig_enrichment binding_site 23383165 23385352
#> 779     3R Regions_of_sig_enrichment binding_site 23386194 23387315
#> 780     3R Regions_of_sig_enrichment binding_site 23389779 23391045
#> 781     3R Regions_of_sig_enrichment binding_site 23395833 23396997
#> 782     3R Regions_of_sig_enrichment binding_site 23429289 23432506
#> 783     3R Regions_of_sig_enrichment binding_site 23433616 23435631
#> 784     3R Regions_of_sig_enrichment binding_site 23461643 23462646
#> 785     3R Regions_of_sig_enrichment binding_site 23469480 23473261
#> 786     3R Regions_of_sig_enrichment binding_site 23750711 23752637
#> 787     3R Regions_of_sig_enrichment binding_site 23761825 23763275
#> 788     3R Regions_of_sig_enrichment binding_site 23772551 23773820
#> 789     3R Regions_of_sig_enrichment binding_site 23774077 23775273
#> 790     3R Regions_of_sig_enrichment binding_site 23777463 23778503
#> 791     3R Regions_of_sig_enrichment binding_site 23783192 23784489
#> 792     3R Regions_of_sig_enrichment binding_site 23812102 23813961
#> 793     3R Regions_of_sig_enrichment binding_site 23814367 23816231
#> 794     3R Regions_of_sig_enrichment binding_site 24090021 24091123
#> 795     3R Regions_of_sig_enrichment binding_site 24126576 24127831
#> 796     3R Regions_of_sig_enrichment binding_site 24147537 24149336
#> 797     3R Regions_of_sig_enrichment binding_site 24151417 24155332
#> 798     3R Regions_of_sig_enrichment binding_site 24157977 24159093
#> 799     3R Regions_of_sig_enrichment binding_site 24160835 24162436
#> 800     3R Regions_of_sig_enrichment binding_site 24164597 24166705
#> 801     3R Regions_of_sig_enrichment binding_site 24367374 24368900
#> 802     3R Regions_of_sig_enrichment binding_site 24370283 24371755
#> 803     3R Regions_of_sig_enrichment binding_site 24425907 24431259
#> 804     3R Regions_of_sig_enrichment binding_site 24460317 24461755
#> 805     3R Regions_of_sig_enrichment binding_site 24636566 24638247
#> 806     3R Regions_of_sig_enrichment binding_site 24647593 24649958
#> 807     3R Regions_of_sig_enrichment binding_site 24654563 24655696
#> 808     3R Regions_of_sig_enrichment binding_site 24655856 24657812
#> 809     3R Regions_of_sig_enrichment binding_site 24662219 24664137
#> 810     3R Regions_of_sig_enrichment binding_site 24669397 24670578
#> 811     3R Regions_of_sig_enrichment binding_site 24705418 24707390
#> 812     3R Regions_of_sig_enrichment binding_site 24710069 24711253
#> 813     3R Regions_of_sig_enrichment binding_site 24715033 24716138
#> 814     3R Regions_of_sig_enrichment binding_site 24716418 24719173
#> 815     3R Regions_of_sig_enrichment binding_site 24747215 24748968
#> 816     3R Regions_of_sig_enrichment binding_site 24846486 24847535
#> 817     3R Regions_of_sig_enrichment binding_site 24852143 24853634
#> 818     3R Regions_of_sig_enrichment binding_site 24864690 24866268
#> 819     3R Regions_of_sig_enrichment binding_site 24889553 24891735
#> 820     3R Regions_of_sig_enrichment binding_site 24947151 24951291
#> 821     3R Regions_of_sig_enrichment binding_site 24977725 24979366
#> 822     3R Regions_of_sig_enrichment binding_site 24982701 24984478
#> 823     3R Regions_of_sig_enrichment binding_site 25038897 25043629
#> 824     3R Regions_of_sig_enrichment binding_site 25077160 25078405
#> 825     3R Regions_of_sig_enrichment binding_site 25079419 25081136
#> 826     3R Regions_of_sig_enrichment binding_site 25081253 25083477
#> 827     3R Regions_of_sig_enrichment binding_site 25084941 25087141
#> 828     3R Regions_of_sig_enrichment binding_site 25099628 25101398
#> 829     3R Regions_of_sig_enrichment binding_site 25107839 25109913
#> 830     3R Regions_of_sig_enrichment binding_site 25112228 25113522
#> 831     3R Regions_of_sig_enrichment binding_site 25115984 25118464
#> 832     3R Regions_of_sig_enrichment binding_site 25137857 25138906
#> 833     3R Regions_of_sig_enrichment binding_site 25140120 25141734
#> 834     3R Regions_of_sig_enrichment binding_site 25142373 25143797
#> 835     3R Regions_of_sig_enrichment binding_site 25318580 25319700
#> 836     3R Regions_of_sig_enrichment binding_site 25328874 25330609
#> 837     3R Regions_of_sig_enrichment binding_site 25417115 25418168
#> 838     3R Regions_of_sig_enrichment binding_site 25443849 25445381
#> 839     3R Regions_of_sig_enrichment binding_site 25548312 25550688
#> 840     3R Regions_of_sig_enrichment binding_site 25561762 25564030
#> 841     3R Regions_of_sig_enrichment binding_site 25571586 25572702
#> 842     3R Regions_of_sig_enrichment binding_site 25582939 25584108
#> 843     3R Regions_of_sig_enrichment binding_site 25589989 25592725
#> 844     3R Regions_of_sig_enrichment binding_site 25596820 25598705
#> 845     3R Regions_of_sig_enrichment binding_site 25598823 25602155
#> 846     3R Regions_of_sig_enrichment binding_site 25602497 25605420
#> 847     3R Regions_of_sig_enrichment binding_site 25606121 25615899
#> 848     3R Regions_of_sig_enrichment binding_site 25616333 25617613
#> 849     3R Regions_of_sig_enrichment binding_site 25619674 25620715
#> 850     3R Regions_of_sig_enrichment binding_site 25620898 25622182
#> 851     3R Regions_of_sig_enrichment binding_site 25630062 25631202
#> 852     3R Regions_of_sig_enrichment binding_site 25632118 25633622
#> 853     3R Regions_of_sig_enrichment binding_site 25641139 25642344
#> 854     3R Regions_of_sig_enrichment binding_site 25682841 25683844
#> 855     3R Regions_of_sig_enrichment binding_site 25690909 25693842
#> 856     3R Regions_of_sig_enrichment binding_site 25693997 25695490
#> 857     3R Regions_of_sig_enrichment binding_site 25729112 25730784
#> 858     3R Regions_of_sig_enrichment binding_site 25758836 25760611
#> 859     3R Regions_of_sig_enrichment binding_site 25818381 25820006
#> 860     3R Regions_of_sig_enrichment binding_site 25829961 25831106
#> 861     3R Regions_of_sig_enrichment binding_site 25838472 25841067
#> 862     3R Regions_of_sig_enrichment binding_site 25847086 25848263
#> 863     3R Regions_of_sig_enrichment binding_site 25871179 25872820
#> 864     3R Regions_of_sig_enrichment binding_site 25883708 25885236
#> 865     3R Regions_of_sig_enrichment binding_site 25924609 25926545
#> 866     3R Regions_of_sig_enrichment binding_site 25947304 25949151
#> 867     3R Regions_of_sig_enrichment binding_site 26021930 26023840
#> 868     3R Regions_of_sig_enrichment binding_site 26024157 26025181
#> 869     3R Regions_of_sig_enrichment binding_site 26025808 26027213
#> 870     3R Regions_of_sig_enrichment binding_site 26027450 26029104
#> 871     3R Regions_of_sig_enrichment binding_site 26029345 26032513
#> 872     3R Regions_of_sig_enrichment binding_site 26039834 26040962
#> 873     3R Regions_of_sig_enrichment binding_site 26041334 26042811
#> 874     3R Regions_of_sig_enrichment binding_site 26106251 26109622
#> 875     3R Regions_of_sig_enrichment binding_site 26120921 26121940
#> 876     3R Regions_of_sig_enrichment binding_site 26123370 26124478
#> 877     3R Regions_of_sig_enrichment binding_site 26161537 26163096
#> 878     3R Regions_of_sig_enrichment binding_site 26213090 26214561
#> 879     3R Regions_of_sig_enrichment binding_site 26215276 26216735
#> 880     3R Regions_of_sig_enrichment binding_site 26249141 26251301
#> 881     3R Regions_of_sig_enrichment binding_site 26275135 26276614
#> 882     3R Regions_of_sig_enrichment binding_site 26291534 26292592
#> 883     3R Regions_of_sig_enrichment binding_site 26352265 26354307
#> 884     3R Regions_of_sig_enrichment binding_site 26388771 26389791
#> 885     3R Regions_of_sig_enrichment binding_site 26558950 26560195
#> 886     3R Regions_of_sig_enrichment binding_site 26566208 26568548
#> 887     3R Regions_of_sig_enrichment binding_site 26568711 26570440
#> 888     3R Regions_of_sig_enrichment binding_site 26571860 26573242
#> 889     3R Regions_of_sig_enrichment binding_site 26574733 26576769
#> 890     3R Regions_of_sig_enrichment binding_site 26589802 26592481
#> 891     3R Regions_of_sig_enrichment binding_site 26596457 26597576
#> 892     3R Regions_of_sig_enrichment binding_site 26597852 26599410
#> 893     3R Regions_of_sig_enrichment binding_site 26600533 26602593
#> 894     3R Regions_of_sig_enrichment binding_site 26604111 26605251
#> 895     3R Regions_of_sig_enrichment binding_site 26605368 26606770
#> 896     3R Regions_of_sig_enrichment binding_site 26607151 26608524
#> 897     3R Regions_of_sig_enrichment binding_site 26616791 26617903
#> 898     3R Regions_of_sig_enrichment binding_site 26624913 26627216
#> 899     3R Regions_of_sig_enrichment binding_site 26627442 26630905
#> 900     3R Regions_of_sig_enrichment binding_site 26631941 26633120
#> 901     3R Regions_of_sig_enrichment binding_site 26633687 26637268
#> 902     3R Regions_of_sig_enrichment binding_site 26637377 26639825
#> 903     3R Regions_of_sig_enrichment binding_site 26641280 26643583
#> 904     3R Regions_of_sig_enrichment binding_site 26651609 26655816
#> 905     3R Regions_of_sig_enrichment binding_site 26669299 26671325
#> 906     3R Regions_of_sig_enrichment binding_site 26713638 26715306
#> 907     3R Regions_of_sig_enrichment binding_site 26771236 26772611
#> 908     3R Regions_of_sig_enrichment binding_site 26835192 26836333
#> 909     3R Regions_of_sig_enrichment binding_site 26883675 26886795
#> 910     3R Regions_of_sig_enrichment binding_site 26896970 26898031
#> 911     3R Regions_of_sig_enrichment binding_site 26952701 26954541
#> 912     3R Regions_of_sig_enrichment binding_site 27038209 27039452
#> 913     3R Regions_of_sig_enrichment binding_site 27042425 27045906
#> 914     3R Regions_of_sig_enrichment binding_site 27046370 27049158
#> 915     3R Regions_of_sig_enrichment binding_site 27049469 27051862
#> 916     3R Regions_of_sig_enrichment binding_site 27205813 27208081
#> 917     3R Regions_of_sig_enrichment binding_site 27231289 27233320
#> 918     3R Regions_of_sig_enrichment binding_site 27244816 27246275
#> 919     3R Regions_of_sig_enrichment binding_site 27246394 27248266
#> 920     3R Regions_of_sig_enrichment binding_site 27248806 27250588
#> 921     3R Regions_of_sig_enrichment binding_site 27263613 27264645
#> 922     3R Regions_of_sig_enrichment binding_site 27282803 27284890
#> 923     3R Regions_of_sig_enrichment binding_site 27286531 27287587
#> 924     3R Regions_of_sig_enrichment binding_site 27405363 27406870
#> 925     3R Regions_of_sig_enrichment binding_site 27411039 27413487
#> 926     3R Regions_of_sig_enrichment binding_site 27424719 27426174
#> 927     3R Regions_of_sig_enrichment binding_site 27427868 27430856
#> 928     3R Regions_of_sig_enrichment binding_site 27431054 27435817
#> 929     3R Regions_of_sig_enrichment binding_site 27436095 27437334
#> 930     3R Regions_of_sig_enrichment binding_site 27514124 27516109
#> 931     3R Regions_of_sig_enrichment binding_site 27538352 27540058
#> 932     3R Regions_of_sig_enrichment binding_site 27540303 27541391
#> 933     3R Regions_of_sig_enrichment binding_site 27549158 27553092
#> 934     3R Regions_of_sig_enrichment binding_site 27568851 27570299
#> 935     3R Regions_of_sig_enrichment binding_site 27573607 27574985
#> 936     3R Regions_of_sig_enrichment binding_site 27599546 27602211
#> 937     3R Regions_of_sig_enrichment binding_site 27602558 27604331
#> 938     3R Regions_of_sig_enrichment binding_site 27613726 27616055
#> 939     3R Regions_of_sig_enrichment binding_site 27619492 27621203
#> 940     3R Regions_of_sig_enrichment binding_site 27635229 27636946
#> 941     3R Regions_of_sig_enrichment binding_site 27637657 27638700
#> 942     3R Regions_of_sig_enrichment binding_site 27674054 27676593
#> 943     3R Regions_of_sig_enrichment binding_site 27753330 27755055
#> 944     3R Regions_of_sig_enrichment binding_site 27803534 27804853
#> 945     3R Regions_of_sig_enrichment binding_site 27810154 27812099
#> 946     3R Regions_of_sig_enrichment binding_site 27812300 27813544
#> 947     3R Regions_of_sig_enrichment binding_site 27879846 27880888
#> 948     3R Regions_of_sig_enrichment binding_site 27886758 27887997
#> 949     3R  Regions_of_sig_depletion binding_site  2097538  2098661
#> 950     3R  Regions_of_sig_depletion binding_site  2622706  2623733
#> 951     3R  Regions_of_sig_depletion binding_site  4597796  4598981
#> 952     3R  Regions_of_sig_depletion binding_site  5473126  5474268
#> 953     3R  Regions_of_sig_depletion binding_site  7350329  7351547
#> 954     3R  Regions_of_sig_depletion binding_site  8974319  8975463
#> 955     3R  Regions_of_sig_depletion binding_site 11752969 11754164
#> 956     3R  Regions_of_sig_depletion binding_site 12790281 12791486
#> 957     3R  Regions_of_sig_depletion binding_site 14511021 14512196
#> 958     3R  Regions_of_sig_depletion binding_site 15259894 15261116
#> 959     3R  Regions_of_sig_depletion binding_site 16036152 16037378
#> 960     3R  Regions_of_sig_depletion binding_site 16266987 16268608
#> 961     3R  Regions_of_sig_depletion binding_site 18832183 18833394
#> 962     3R  Regions_of_sig_depletion binding_site 20688204 20689494
#> 963     3R  Regions_of_sig_depletion binding_site 20719707 20721208
#> 964     3R  Regions_of_sig_depletion binding_site 20803246 20804398
#> 965     3R  Regions_of_sig_depletion binding_site 20837546 20838852
#> 966     3R  Regions_of_sig_depletion binding_site 22452054 22453184
#> 967     3R  Regions_of_sig_depletion binding_site 23360200 23361518
#> 968     3R  Regions_of_sig_depletion binding_site 23660082 23661094
#> 969     3R  Regions_of_sig_depletion binding_site 25749486 25750502
#> 970     3R  Regions_of_sig_depletion binding_site 25781304 25782695
#> 971     3R  Regions_of_sig_depletion binding_site 25993169 25994944
#> 972     3R  Regions_of_sig_depletion binding_site 26727481 26728716
#> 973     3R  Regions_of_sig_depletion binding_site 26826667 26827698
#> 974     3R  Regions_of_sig_depletion binding_site 26931526 26932798
#> 975     3R  Regions_of_sig_depletion binding_site 27345327 27346386
#> 976     3R  Regions_of_sig_depletion binding_site 27353479 27354617
#> 977     3R  Regions_of_sig_depletion binding_site 27481759 27482808
#> 978     3R  Regions_of_sig_depletion binding_site 27658261 27659522
#> 979     3L Regions_of_sig_enrichment binding_site   104792   106025
#> 980     3L Regions_of_sig_enrichment binding_site   127883   129159
#> 981     3L Regions_of_sig_enrichment binding_site   130858   133045
#> 982     3L Regions_of_sig_enrichment binding_site   133206   136109
#> 983     3L Regions_of_sig_enrichment binding_site   139489   140919
#> 984     3L Regions_of_sig_enrichment binding_site   160045   161639
#> 985     3L Regions_of_sig_enrichment binding_site   166043   167821
#> 986     3L Regions_of_sig_enrichment binding_site   173253   174569
#> 987     3L Regions_of_sig_enrichment binding_site   187786   188831
#> 988     3L Regions_of_sig_enrichment binding_site   198689   199901
#> 989     3L Regions_of_sig_enrichment binding_site   224743   226884
#> 990     3L Regions_of_sig_enrichment binding_site   227153   228544
#> 991     3L Regions_of_sig_enrichment binding_site   229649   230784
#> 992     3L Regions_of_sig_enrichment binding_site   231069   232441
#> 993     3L Regions_of_sig_enrichment binding_site   235415   236849
#> 994     3L Regions_of_sig_enrichment binding_site   239471   241567
#> 995     3L Regions_of_sig_enrichment binding_site   243043   244259
#> 996     3L Regions_of_sig_enrichment binding_site   245850   247132
#> 997     3L Regions_of_sig_enrichment binding_site   252800   254305
#> 998     3L Regions_of_sig_enrichment binding_site   256280   257868
#> 999     3L Regions_of_sig_enrichment binding_site   262561   264920
#> 1000    3L Regions_of_sig_enrichment binding_site   291622   295033
#> 1001    3L Regions_of_sig_enrichment binding_site   299742   302194
#> 1002    3L Regions_of_sig_enrichment binding_site   309377   310952
#> 1003    3L Regions_of_sig_enrichment binding_site   311146   312241
#> 1004    3L Regions_of_sig_enrichment binding_site   318870   320378
#> 1005    3L Regions_of_sig_enrichment binding_site   321386   322877
#> 1006    3L Regions_of_sig_enrichment binding_site   331629   333119
#> 1007    3L Regions_of_sig_enrichment binding_site   338222   339315
#> 1008    3L Regions_of_sig_enrichment binding_site   341488   342505
#> 1009    3L Regions_of_sig_enrichment binding_site   347535   348677
#> 1010    3L Regions_of_sig_enrichment binding_site   439857   442872
#> 1011    3L Regions_of_sig_enrichment binding_site   491200   493239
#> 1012    3L Regions_of_sig_enrichment binding_site   505415   506752
#> 1013    3L Regions_of_sig_enrichment binding_site   526210   527450
#> 1014    3L Regions_of_sig_enrichment binding_site   530550   532003
#> 1015    3L Regions_of_sig_enrichment binding_site   532267   533630
#> 1016    3L Regions_of_sig_enrichment binding_site   534039   535190
#> 1017    3L Regions_of_sig_enrichment binding_site   539490   540507
#> 1018    3L Regions_of_sig_enrichment binding_site   542873   547917
#> 1019    3L Regions_of_sig_enrichment binding_site   548120   550067
#> 1020    3L Regions_of_sig_enrichment binding_site   558593   561487
#> 1021    3L Regions_of_sig_enrichment binding_site   567290   568442
#> 1022    3L Regions_of_sig_enrichment binding_site   588732   590563
#> 1023    3L Regions_of_sig_enrichment binding_site   591718   593506
#> 1024    3L Regions_of_sig_enrichment binding_site   601169   603142
#> 1025    3L Regions_of_sig_enrichment binding_site   606005   607389
#> 1026    3L Regions_of_sig_enrichment binding_site   616115   617271
#> 1027    3L Regions_of_sig_enrichment binding_site   627492   628888
#> 1028    3L Regions_of_sig_enrichment binding_site   633365   634725
#> 1029    3L Regions_of_sig_enrichment binding_site   638689   641793
#> 1030    3L Regions_of_sig_enrichment binding_site   646389   650716
#> 1031    3L Regions_of_sig_enrichment binding_site   650830   654981
#> 1032    3L Regions_of_sig_enrichment binding_site   681811   683115
#> 1033    3L Regions_of_sig_enrichment binding_site   684560   686031
#> 1034    3L Regions_of_sig_enrichment binding_site   763829   767041
#> 1035    3L Regions_of_sig_enrichment binding_site   767156   769073
#> 1036    3L Regions_of_sig_enrichment binding_site   769390   771508
#> 1037    3L Regions_of_sig_enrichment binding_site   773702   776806
#> 1038    3L Regions_of_sig_enrichment binding_site   780880   781958
#> 1039    3L Regions_of_sig_enrichment binding_site   802411   803542
#> 1040    3L Regions_of_sig_enrichment binding_site   818855   821831
#> 1041    3L Regions_of_sig_enrichment binding_site   822211   823247
#> 1042    3L Regions_of_sig_enrichment binding_site   836655   838258
#> 1043    3L Regions_of_sig_enrichment binding_site   875525   877116
#> 1044    3L Regions_of_sig_enrichment binding_site   880918   882447
#> 1045    3L Regions_of_sig_enrichment binding_site   995960   996993
#> 1046    3L Regions_of_sig_enrichment binding_site  1005050  1009097
#> 1047    3L Regions_of_sig_enrichment binding_site  1031362  1032702
#> 1048    3L Regions_of_sig_enrichment binding_site  1099603  1100780
#> 1049    3L Regions_of_sig_enrichment binding_site  1177555  1178756
#> 1050    3L Regions_of_sig_enrichment binding_site  1191271  1192971
#> 1051    3L Regions_of_sig_enrichment binding_site  1298038  1301978
#> 1052    3L Regions_of_sig_enrichment binding_site  1318209  1319421
#> 1053    3L Regions_of_sig_enrichment binding_site  1320748  1322250
#> 1054    3L Regions_of_sig_enrichment binding_site  1322586  1324308
#> 1055    3L Regions_of_sig_enrichment binding_site  1334687  1336868
#> 1056    3L Regions_of_sig_enrichment binding_site  1339369  1341204
#> 1057    3L Regions_of_sig_enrichment binding_site  1342738  1345322
#> 1058    3L Regions_of_sig_enrichment binding_site  1349331  1350941
#> 1059    3L Regions_of_sig_enrichment binding_site  1366542  1368576
#> 1060    3L Regions_of_sig_enrichment binding_site  1377981  1379988
#> 1061    3L Regions_of_sig_enrichment binding_site  1463237  1464544
#> 1062    3L Regions_of_sig_enrichment binding_site  1488725  1490291
#> 1063    3L Regions_of_sig_enrichment binding_site  1495978  1497462
#> 1064    3L Regions_of_sig_enrichment binding_site  1502556  1503841
#> 1065    3L Regions_of_sig_enrichment binding_site  1516269  1518677
#> 1066    3L Regions_of_sig_enrichment binding_site  1537212  1538822
#> 1067    3L Regions_of_sig_enrichment binding_site  1545633  1550655
#> 1068    3L Regions_of_sig_enrichment binding_site  1557356  1558858
#> 1069    3L Regions_of_sig_enrichment binding_site  1585157  1587226
#> 1070    3L Regions_of_sig_enrichment binding_site  1601321  1602760
#> 1071    3L Regions_of_sig_enrichment binding_site  1729965  1732114
#> 1072    3L Regions_of_sig_enrichment binding_site  1794125  1796183
#> 1073    3L Regions_of_sig_enrichment binding_site  1869427  1870480
#> 1074    3L Regions_of_sig_enrichment binding_site  1882206  1884743
#> 1075    3L Regions_of_sig_enrichment binding_site  1890465  1891863
#> 1076    3L Regions_of_sig_enrichment binding_site  1949774  1950788
#> 1077    3L Regions_of_sig_enrichment binding_site  1966514  1968198
#> 1078    3L Regions_of_sig_enrichment binding_site  1969311  1970512
#> 1079    3L Regions_of_sig_enrichment binding_site  1970628  1972088
#> 1080    3L Regions_of_sig_enrichment binding_site  2149860  2152564
#> 1081    3L Regions_of_sig_enrichment binding_site  2191642  2192695
#> 1082    3L Regions_of_sig_enrichment binding_site  2256029  2257678
#> 1083    3L Regions_of_sig_enrichment binding_site  2373264  2374375
#> 1084    3L Regions_of_sig_enrichment binding_site  2395167  2397618
#> 1085    3L Regions_of_sig_enrichment binding_site  2417890  2419161
#> 1086    3L Regions_of_sig_enrichment binding_site  2466773  2467884
#> 1087    3L Regions_of_sig_enrichment binding_site  2484404  2487754
#> 1088    3L Regions_of_sig_enrichment binding_site  2487993  2491156
#> 1089    3L Regions_of_sig_enrichment binding_site  2492837  2494977
#> 1090    3L Regions_of_sig_enrichment binding_site  2502326  2504337
#> 1091    3L Regions_of_sig_enrichment binding_site  2552162  2555814
#> 1092    3L Regions_of_sig_enrichment binding_site  2556229  2557257
#> 1093    3L Regions_of_sig_enrichment binding_site  2569838  2571756
#> 1094    3L Regions_of_sig_enrichment binding_site  2572100  2575165
#> 1095    3L Regions_of_sig_enrichment binding_site  2581174  2582430
#> 1096    3L Regions_of_sig_enrichment binding_site  2582913  2584504
#> 1097    3L Regions_of_sig_enrichment binding_site  2590615  2591627
#> 1098    3L Regions_of_sig_enrichment binding_site  2593279  2594456
#> 1099    3L Regions_of_sig_enrichment binding_site  2595184  2596870
#> 1100    3L Regions_of_sig_enrichment binding_site  2608375  2610315
#> 1101    3L Regions_of_sig_enrichment binding_site  2612574  2614863
#> 1102    3L Regions_of_sig_enrichment binding_site  2630012  2631277
#> 1103    3L Regions_of_sig_enrichment binding_site  2651528  2653750
#> 1104    3L Regions_of_sig_enrichment binding_site  2767113  2768170
#> 1105    3L Regions_of_sig_enrichment binding_site  2817173  2819319
#> 1106    3L Regions_of_sig_enrichment binding_site  2819437  2823065
#> 1107    3L Regions_of_sig_enrichment binding_site  2851452  2852678
#> 1108    3L Regions_of_sig_enrichment binding_site  2884544  2886607
#> 1109    3L Regions_of_sig_enrichment binding_site  3036348  3037782
#> 1110    3L Regions_of_sig_enrichment binding_site  3042129  3043202
#> 1111    3L Regions_of_sig_enrichment binding_site  3045517  3046728
#> 1112    3L Regions_of_sig_enrichment binding_site  3058715  3061308
#> 1113    3L Regions_of_sig_enrichment binding_site  3069859  3071111
#> 1114    3L Regions_of_sig_enrichment binding_site  3076072  3077179
#> 1115    3L Regions_of_sig_enrichment binding_site  3080342  3082638
#> 1116    3L Regions_of_sig_enrichment binding_site  3089277  3090944
#> 1117    3L Regions_of_sig_enrichment binding_site  3122286  3123339
#> 1118    3L Regions_of_sig_enrichment binding_site  3125323  3127883
#> 1119    3L Regions_of_sig_enrichment binding_site  3148680  3149817
#> 1120    3L Regions_of_sig_enrichment binding_site  3164999  3166280
#> 1121    3L Regions_of_sig_enrichment binding_site  3196775  3199133
#> 1122    3L Regions_of_sig_enrichment binding_site  3220010  3221367
#> 1123    3L Regions_of_sig_enrichment binding_site  3224663  3225899
#> 1124    3L Regions_of_sig_enrichment binding_site  3238889  3240649
#> 1125    3L Regions_of_sig_enrichment binding_site  3245317  3246456
#> 1126    3L Regions_of_sig_enrichment binding_site  3247816  3251174
#> 1127    3L Regions_of_sig_enrichment binding_site  3251290  3252375
#> 1128    3L Regions_of_sig_enrichment binding_site  3304415  3305457
#> 1129    3L Regions_of_sig_enrichment binding_site  3308279  3309746
#> 1130    3L Regions_of_sig_enrichment binding_site  3319517  3320577
#> 1131    3L Regions_of_sig_enrichment binding_site  3325647  3327363
#> 1132    3L Regions_of_sig_enrichment binding_site  3336181  3337386
#> 1133    3L Regions_of_sig_enrichment binding_site  3345421  3347018
#> 1134    3L Regions_of_sig_enrichment binding_site  3349005  3350258
#> 1135    3L Regions_of_sig_enrichment binding_site  3365672  3366839
#> 1136    3L Regions_of_sig_enrichment binding_site  3367432  3371324
#> 1137    3L Regions_of_sig_enrichment binding_site  3380414  3381450
#> 1138    3L Regions_of_sig_enrichment binding_site  3388813  3390617
#> 1139    3L Regions_of_sig_enrichment binding_site  3394502  3395602
#> 1140    3L Regions_of_sig_enrichment binding_site  3398693  3399868
#> 1141    3L Regions_of_sig_enrichment binding_site  3400357  3401548
#> 1142    3L Regions_of_sig_enrichment binding_site  3404013  3407389
#> 1143    3L Regions_of_sig_enrichment binding_site  3407704  3409777
#> 1144    3L Regions_of_sig_enrichment binding_site  3410324  3411570
#> 1145    3L Regions_of_sig_enrichment binding_site  3417443  3420870
#> 1146    3L Regions_of_sig_enrichment binding_site  3429381  3430427
#> 1147    3L Regions_of_sig_enrichment binding_site  3431018  3432245
#> 1148    3L Regions_of_sig_enrichment binding_site  3432358  3433606
#> 1149    3L Regions_of_sig_enrichment binding_site  3433804  3435496
#> 1150    3L Regions_of_sig_enrichment binding_site  3436404  3437744
#> 1151    3L Regions_of_sig_enrichment binding_site  3444793  3445867
#> 1152    3L Regions_of_sig_enrichment binding_site  3445982  3447792
#> 1153    3L Regions_of_sig_enrichment binding_site  3447919  3449012
#> 1154    3L Regions_of_sig_enrichment binding_site  3450062  3451191
#> 1155    3L Regions_of_sig_enrichment binding_site  3455797  3458391
#> 1156    3L Regions_of_sig_enrichment binding_site  3459978  3461200
#> 1157    3L Regions_of_sig_enrichment binding_site  3470978  3472144
#> 1158    3L Regions_of_sig_enrichment binding_site  3541202  3542971
#> 1159    3L Regions_of_sig_enrichment binding_site  3543583  3545068
#> 1160    3L Regions_of_sig_enrichment binding_site  3765568  3767199
#> 1161    3L Regions_of_sig_enrichment binding_site  3899492  3902074
#> 1162    3L Regions_of_sig_enrichment binding_site  3902394  3903943
#> 1163    3L Regions_of_sig_enrichment binding_site  3904428  3905487
#> 1164    3L Regions_of_sig_enrichment binding_site  3930334  3932206
#> 1165    3L Regions_of_sig_enrichment binding_site  3942336  3943420
#> 1166    3L Regions_of_sig_enrichment binding_site  3950604  3951631
#> 1167    3L Regions_of_sig_enrichment binding_site  3954244  3957531
#> 1168    3L Regions_of_sig_enrichment binding_site  4101050  4103092
#> 1169    3L Regions_of_sig_enrichment binding_site  4108195  4109557
#> 1170    3L Regions_of_sig_enrichment binding_site  4110496  4111507
#> 1171    3L Regions_of_sig_enrichment binding_site  4111821  4113229
#> 1172    3L Regions_of_sig_enrichment binding_site  4115023  4117502
#> 1173    3L Regions_of_sig_enrichment binding_site  4119031  4120775
#> 1174    3L Regions_of_sig_enrichment binding_site  4121882  4123884
#> 1175    3L Regions_of_sig_enrichment binding_site  4219040  4220337
#> 1176    3L Regions_of_sig_enrichment binding_site  4220733  4222571
#> 1177    3L Regions_of_sig_enrichment binding_site  4222761  4223816
#> 1178    3L Regions_of_sig_enrichment binding_site  4225120  4228361
#> 1179    3L Regions_of_sig_enrichment binding_site  4229300  4230400
#> 1180    3L Regions_of_sig_enrichment binding_site  4231286  4234618
#> 1181    3L Regions_of_sig_enrichment binding_site  4239376  4240897
#> 1182    3L Regions_of_sig_enrichment binding_site  4246537  4248726
#> 1183    3L Regions_of_sig_enrichment binding_site  4252699  4254493
#> 1184    3L Regions_of_sig_enrichment binding_site  4285365  4286636
#> 1185    3L Regions_of_sig_enrichment binding_site  4291785  4292815
#> 1186    3L Regions_of_sig_enrichment binding_site  4356029  4358267
#> 1187    3L Regions_of_sig_enrichment binding_site  4413797  4415828
#> 1188    3L Regions_of_sig_enrichment binding_site  4425787  4427704
#> 1189    3L Regions_of_sig_enrichment binding_site  4541895  4546470
#> 1190    3L Regions_of_sig_enrichment binding_site  4624209  4626127
#> 1191    3L Regions_of_sig_enrichment binding_site  4805861  4806925
#> 1192    3L Regions_of_sig_enrichment binding_site  5126108  5127579
#> 1193    3L Regions_of_sig_enrichment binding_site  5164142  5165396
#> 1194    3L Regions_of_sig_enrichment binding_site  5165675  5166707
#> 1195    3L Regions_of_sig_enrichment binding_site  5175625  5179044
#> 1196    3L Regions_of_sig_enrichment binding_site  5179211  5181251
#> 1197    3L Regions_of_sig_enrichment binding_site  5240545  5241934
#> 1198    3L Regions_of_sig_enrichment binding_site  5269795  5271407
#> 1199    3L Regions_of_sig_enrichment binding_site  5346531  5349123
#> 1200    3L Regions_of_sig_enrichment binding_site  5358414  5361935
#> 1201    3L Regions_of_sig_enrichment binding_site  5557462  5558765
#> 1202    3L Regions_of_sig_enrichment binding_site  5632376  5633704
#> 1203    3L Regions_of_sig_enrichment binding_site  5645325  5646485
#> 1204    3L Regions_of_sig_enrichment binding_site  5647417  5649597
#> 1205    3L Regions_of_sig_enrichment binding_site  5742344  5744264
#> 1206    3L Regions_of_sig_enrichment binding_site  5745075  5747439
#> 1207    3L Regions_of_sig_enrichment binding_site  5761652  5762737
#> 1208    3L Regions_of_sig_enrichment binding_site  5763044  5764898
#> 1209    3L Regions_of_sig_enrichment binding_site  5774580  5775859
#> 1210    3L Regions_of_sig_enrichment binding_site  5799732  5801775
#> 1211    3L Regions_of_sig_enrichment binding_site  5802462  5803747
#> 1212    3L Regions_of_sig_enrichment binding_site  5863277  5864467
#> 1213    3L Regions_of_sig_enrichment binding_site  5893198  5894234
#> 1214    3L Regions_of_sig_enrichment binding_site  5920709  5921820
#> 1215    3L Regions_of_sig_enrichment binding_site  5959090  5961061
#> 1216    3L Regions_of_sig_enrichment binding_site  6067211  6068485
#> 1217    3L Regions_of_sig_enrichment binding_site  6085559  6087082
#> 1218    3L Regions_of_sig_enrichment binding_site  6209105  6210388
#> 1219    3L Regions_of_sig_enrichment binding_site  6210566  6212239
#> 1220    3L Regions_of_sig_enrichment binding_site  6257052  6259228
#> 1221    3L Regions_of_sig_enrichment binding_site  6478104  6479132
#> 1222    3L Regions_of_sig_enrichment binding_site  6488660  6489684
#> 1223    3L Regions_of_sig_enrichment binding_site  6543011  6545583
#> 1224    3L Regions_of_sig_enrichment binding_site  6553523  6555042
#> 1225    3L Regions_of_sig_enrichment binding_site  6605324  6607878
#> 1226    3L Regions_of_sig_enrichment binding_site  6611862  6613004
#> 1227    3L Regions_of_sig_enrichment binding_site  6745388  6746433
#> 1228    3L Regions_of_sig_enrichment binding_site  6935375  6937072
#> 1229    3L Regions_of_sig_enrichment binding_site  6954656  6958480
#> 1230    3L Regions_of_sig_enrichment binding_site  6964557  6965615
#> 1231    3L Regions_of_sig_enrichment binding_site  6968598  6971553
#> 1232    3L Regions_of_sig_enrichment binding_site  6971830  6973420
#> 1233    3L Regions_of_sig_enrichment binding_site  7087412  7088573
#> 1234    3L Regions_of_sig_enrichment binding_site  7126477  7128004
#> 1235    3L Regions_of_sig_enrichment binding_site  7149186  7150287
#> 1236    3L Regions_of_sig_enrichment binding_site  7314381  7315395
#> 1237    3L Regions_of_sig_enrichment binding_site  7334474  7336087
#> 1238    3L Regions_of_sig_enrichment binding_site  7336797  7338404
#> 1239    3L Regions_of_sig_enrichment binding_site  7360421  7361979
#> 1240    3L Regions_of_sig_enrichment binding_site  7374389  7375908
#> 1241    3L Regions_of_sig_enrichment binding_site  7426070  7429489
#> 1242    3L Regions_of_sig_enrichment binding_site  7643317  7644473
#> 1243    3L Regions_of_sig_enrichment binding_site  7712159  7713220
#> 1244    3L Regions_of_sig_enrichment binding_site  7749679  7753969
#> 1245    3L Regions_of_sig_enrichment binding_site  7795075  7796255
#> 1246    3L Regions_of_sig_enrichment binding_site  7797508  7799173
#> 1247    3L Regions_of_sig_enrichment binding_site  7804351  7805524
#> 1248    3L Regions_of_sig_enrichment binding_site  7822969  7824002
#> 1249    3L Regions_of_sig_enrichment binding_site  7827778  7829282
#> 1250    3L Regions_of_sig_enrichment binding_site  7829555  7831124
#> 1251    3L Regions_of_sig_enrichment binding_site  7845359  7846697
#> 1252    3L Regions_of_sig_enrichment binding_site  7847344  7848960
#> 1253    3L Regions_of_sig_enrichment binding_site  7856961  7860903
#> 1254    3L Regions_of_sig_enrichment binding_site  7903817  7904894
#> 1255    3L Regions_of_sig_enrichment binding_site  7972181  7973285
#> 1256    3L Regions_of_sig_enrichment binding_site  8021347  8022436
#> 1257    3L Regions_of_sig_enrichment binding_site  8047236  8048426
#> 1258    3L Regions_of_sig_enrichment binding_site  8048828  8051492
#> 1259    3L Regions_of_sig_enrichment binding_site  8056393  8057758
#> 1260    3L Regions_of_sig_enrichment binding_site  8078239  8079505
#> 1261    3L Regions_of_sig_enrichment binding_site  8083432  8084594
#> 1262    3L Regions_of_sig_enrichment binding_site  8085984  8087190
#> 1263    3L Regions_of_sig_enrichment binding_site  8087304  8090192
#> 1264    3L Regions_of_sig_enrichment binding_site  8104889  8106406
#> 1265    3L Regions_of_sig_enrichment binding_site  8151285  8152703
#> 1266    3L Regions_of_sig_enrichment binding_site  8278233  8281665
#> 1267    3L Regions_of_sig_enrichment binding_site  8281823  8282841
#> 1268    3L Regions_of_sig_enrichment binding_site  8296810  8298240
#> 1269    3L Regions_of_sig_enrichment binding_site  8298552  8299673
#> 1270    3L Regions_of_sig_enrichment binding_site  8302293  8303296
#> 1271    3L Regions_of_sig_enrichment binding_site  8339153  8340209
#> 1272    3L Regions_of_sig_enrichment binding_site  8353432  8354629
#> 1273    3L Regions_of_sig_enrichment binding_site  8435736  8437487
#> 1274    3L Regions_of_sig_enrichment binding_site  8441495  8442787
#> 1275    3L Regions_of_sig_enrichment binding_site  8516085  8517286
#> 1276    3L Regions_of_sig_enrichment binding_site  8518132  8521309
#> 1277    3L Regions_of_sig_enrichment binding_site  8537537  8541325
#> 1278    3L Regions_of_sig_enrichment binding_site  8541714  8543008
#> 1279    3L Regions_of_sig_enrichment binding_site  8543158  8544584
#> 1280    3L Regions_of_sig_enrichment binding_site  8565822  8566906
#> 1281    3L Regions_of_sig_enrichment binding_site  8620521  8622241
#> 1282    3L Regions_of_sig_enrichment binding_site  8645079  8646411
#> 1283    3L Regions_of_sig_enrichment binding_site  8654187  8655403
#> 1284    3L Regions_of_sig_enrichment binding_site  8661186  8662202
#> 1285    3L Regions_of_sig_enrichment binding_site  8668152  8670091
#> 1286    3L Regions_of_sig_enrichment binding_site  8671747  8674913
#> 1287    3L Regions_of_sig_enrichment binding_site  8675710  8677432
#> 1288    3L Regions_of_sig_enrichment binding_site  8680382  8682670
#> 1289    3L Regions_of_sig_enrichment binding_site  8683016  8684042
#> 1290    3L Regions_of_sig_enrichment binding_site  8686058  8687276
#> 1291    3L Regions_of_sig_enrichment binding_site  8691331  8694128
#> 1292    3L Regions_of_sig_enrichment binding_site  8697082  8698750
#> 1293    3L Regions_of_sig_enrichment binding_site  8701034  8702458
#> 1294    3L Regions_of_sig_enrichment binding_site  8710770  8713269
#> 1295    3L Regions_of_sig_enrichment binding_site  8714005  8715102
#> 1296    3L Regions_of_sig_enrichment binding_site  8741492  8742687
#> 1297    3L Regions_of_sig_enrichment binding_site  8755910  8758625
#> 1298    3L Regions_of_sig_enrichment binding_site  8818448  8821043
#> 1299    3L Regions_of_sig_enrichment binding_site  8944407  8946414
#> 1300    3L Regions_of_sig_enrichment binding_site  8946540  8947906
#> 1301    3L Regions_of_sig_enrichment binding_site  8989300  8991428
#> 1302    3L Regions_of_sig_enrichment binding_site  9046057  9049891
#> 1303    3L Regions_of_sig_enrichment binding_site  9050669  9052924
#> 1304    3L Regions_of_sig_enrichment binding_site  9065981  9067046
#> 1305    3L Regions_of_sig_enrichment binding_site  9085610  9086804
#> 1306    3L Regions_of_sig_enrichment binding_site  9087551  9090127
#> 1307    3L Regions_of_sig_enrichment binding_site  9091072  9092096
#> 1308    3L Regions_of_sig_enrichment binding_site  9094277  9096091
#> 1309    3L Regions_of_sig_enrichment binding_site  9102929  9104025
#> 1310    3L Regions_of_sig_enrichment binding_site  9129278  9131096
#> 1311    3L Regions_of_sig_enrichment binding_site  9328301  9329347
#> 1312    3L Regions_of_sig_enrichment binding_site  9349361  9351936
#> 1313    3L Regions_of_sig_enrichment binding_site  9360017  9361091
#> 1314    3L Regions_of_sig_enrichment binding_site  9366116  9367157
#> 1315    3L Regions_of_sig_enrichment binding_site  9370621  9371747
#> 1316    3L Regions_of_sig_enrichment binding_site  9402919  9404095
#> 1317    3L Regions_of_sig_enrichment binding_site  9412321  9414768
#> 1318    3L Regions_of_sig_enrichment binding_site  9415049  9417239
#> 1319    3L Regions_of_sig_enrichment binding_site  9448565  9450097
#> 1320    3L Regions_of_sig_enrichment binding_site  9480508  9481892
#> 1321    3L Regions_of_sig_enrichment binding_site  9497478  9498504
#> 1322    3L Regions_of_sig_enrichment binding_site  9503936  9505948
#> 1323    3L Regions_of_sig_enrichment binding_site  9537785  9539377
#> 1324    3L Regions_of_sig_enrichment binding_site  9565351  9566371
#> 1325    3L Regions_of_sig_enrichment binding_site  9606996  9610272
#> 1326    3L Regions_of_sig_enrichment binding_site  9616251  9617743
#> 1327    3L Regions_of_sig_enrichment binding_site  9653202  9655357
#> 1328    3L Regions_of_sig_enrichment binding_site  9664363  9665483
#> 1329    3L Regions_of_sig_enrichment binding_site  9665678  9666694
#> 1330    3L Regions_of_sig_enrichment binding_site  9667773  9668858
#> 1331    3L Regions_of_sig_enrichment binding_site  9670988  9672256
#> 1332    3L Regions_of_sig_enrichment binding_site  9684469  9685738
#> 1333    3L Regions_of_sig_enrichment binding_site  9686423  9690354
#> 1334    3L Regions_of_sig_enrichment binding_site  9691099  9692184
#> 1335    3L Regions_of_sig_enrichment binding_site  9744251  9745754
#> 1336    3L Regions_of_sig_enrichment binding_site  9756788  9758348
#> 1337    3L Regions_of_sig_enrichment binding_site  9758459  9759962
#> 1338    3L Regions_of_sig_enrichment binding_site  9832495  9833719
#> 1339    3L Regions_of_sig_enrichment binding_site  9846906  9848483
#> 1340    3L Regions_of_sig_enrichment binding_site  9850796  9852272
#> 1341    3L Regions_of_sig_enrichment binding_site  9891310  9892546
#> 1342    3L Regions_of_sig_enrichment binding_site 10216371 10217498
#> 1343    3L Regions_of_sig_enrichment binding_site 10316919 10318120
#> 1344    3L Regions_of_sig_enrichment binding_site 10357635 10359860
#> 1345    3L Regions_of_sig_enrichment binding_site 10366055 10368345
#> 1346    3L Regions_of_sig_enrichment binding_site 10370554 10371936
#> 1347    3L Regions_of_sig_enrichment binding_site 10501628 10502794
#> 1348    3L Regions_of_sig_enrichment binding_site 10509048 10510966
#> 1349    3L Regions_of_sig_enrichment binding_site 10629941 10631033
#> 1350    3L Regions_of_sig_enrichment binding_site 10646862 10647976
#> 1351    3L Regions_of_sig_enrichment binding_site 10648199 10650950
#> 1352    3L Regions_of_sig_enrichment binding_site 10652766 10654489
#> 1353    3L Regions_of_sig_enrichment binding_site 10657595 10659996
#> 1354    3L Regions_of_sig_enrichment binding_site 10669147 10670673
#> 1355    3L Regions_of_sig_enrichment binding_site 10670908 10672292
#> 1356    3L Regions_of_sig_enrichment binding_site 10672718 10677346
#> 1357    3L Regions_of_sig_enrichment binding_site 10729380 10730676
#> 1358    3L Regions_of_sig_enrichment binding_site 10731986 10733582
#> 1359    3L Regions_of_sig_enrichment binding_site 10765196 10767720
#> 1360    3L Regions_of_sig_enrichment binding_site 10768494 10769921
#> 1361    3L Regions_of_sig_enrichment binding_site 10773581 10774672
#> 1362    3L Regions_of_sig_enrichment binding_site 10830723 10832098
#> 1363    3L Regions_of_sig_enrichment binding_site 10848900 10851376
#> 1364    3L Regions_of_sig_enrichment binding_site 10886128 10887300
#> 1365    3L Regions_of_sig_enrichment binding_site 10891113 10892451
#> 1366    3L Regions_of_sig_enrichment binding_site 11001762 11003138
#> 1367    3L Regions_of_sig_enrichment binding_site 11033927 11035243
#> 1368    3L Regions_of_sig_enrichment binding_site 11062123 11063930
#> 1369    3L Regions_of_sig_enrichment binding_site 11089165 11090514
#> 1370    3L Regions_of_sig_enrichment binding_site 11116260 11117303
#> 1371    3L Regions_of_sig_enrichment binding_site 11217345 11219083
#> 1372    3L Regions_of_sig_enrichment binding_site 11244839 11245934
#> 1373    3L Regions_of_sig_enrichment binding_site 11267063 11268748
#> 1374    3L Regions_of_sig_enrichment binding_site 11269265 11270592
#> 1375    3L Regions_of_sig_enrichment binding_site 11278488 11280441
#> 1376    3L Regions_of_sig_enrichment binding_site 11285211 11286717
#> 1377    3L Regions_of_sig_enrichment binding_site 11342022 11343815
#> 1378    3L Regions_of_sig_enrichment binding_site 11346039 11347561
#> 1379    3L Regions_of_sig_enrichment binding_site 11357723 11358809
#> 1380    3L Regions_of_sig_enrichment binding_site 11480426 11481612
#> 1381    3L Regions_of_sig_enrichment binding_site 11516051 11519138
#> 1382    3L Regions_of_sig_enrichment binding_site 11519413 11521684
#> 1383    3L Regions_of_sig_enrichment binding_site 11526024 11527609
#> 1384    3L Regions_of_sig_enrichment binding_site 11535727 11537464
#> 1385    3L Regions_of_sig_enrichment binding_site 11545609 11546846
#> 1386    3L Regions_of_sig_enrichment binding_site 11571682 11572725
#> 1387    3L Regions_of_sig_enrichment binding_site 11713159 11714333
#> 1388    3L Regions_of_sig_enrichment binding_site 11781278 11782904
#> 1389    3L Regions_of_sig_enrichment binding_site 11787837 11789162
#> 1390    3L Regions_of_sig_enrichment binding_site 11814761 11815987
#> 1391    3L Regions_of_sig_enrichment binding_site 11825499 11826809
#> 1392    3L Regions_of_sig_enrichment binding_site 11994727 11996522
#> 1393    3L Regions_of_sig_enrichment binding_site 12117031 12118518
#> 1394    3L Regions_of_sig_enrichment binding_site 12127156 12128394
#> 1395    3L Regions_of_sig_enrichment binding_site 12130802 12132119
#> 1396    3L Regions_of_sig_enrichment binding_site 12177900 12178982
#> 1397    3L Regions_of_sig_enrichment binding_site 12258327 12259559
#> 1398    3L Regions_of_sig_enrichment binding_site 12270674 12271677
#> 1399    3L Regions_of_sig_enrichment binding_site 12383306 12385689
#> 1400    3L Regions_of_sig_enrichment binding_site 12400254 12402021
#> 1401    3L Regions_of_sig_enrichment binding_site 12402423 12404103
#> 1402    3L Regions_of_sig_enrichment binding_site 12482158 12484252
#> 1403    3L Regions_of_sig_enrichment binding_site 12507889 12509507
#> 1404    3L Regions_of_sig_enrichment binding_site 12511614 12513390
#> 1405    3L Regions_of_sig_enrichment binding_site 12522255 12524182
#> 1406    3L Regions_of_sig_enrichment binding_site 12529949 12531066
#> 1407    3L Regions_of_sig_enrichment binding_site 12550326 12551349
#> 1408    3L Regions_of_sig_enrichment binding_site 12728500 12729548
#> 1409    3L Regions_of_sig_enrichment binding_site 12731526 12732664
#> 1410    3L Regions_of_sig_enrichment binding_site 12742586 12745600
#> 1411    3L Regions_of_sig_enrichment binding_site 12782380 12785000
#> 1412    3L Regions_of_sig_enrichment binding_site 12827088 12828248
#> 1413    3L Regions_of_sig_enrichment binding_site 12835534 12836794
#> 1414    3L Regions_of_sig_enrichment binding_site 12847569 12850555
#> 1415    3L Regions_of_sig_enrichment binding_site 12850665 12852848
#> 1416    3L Regions_of_sig_enrichment binding_site 13003454 13004471
#> 1417    3L Regions_of_sig_enrichment binding_site 13033828 13035869
#> 1418    3L Regions_of_sig_enrichment binding_site 13219982 13222307
#> 1419    3L Regions_of_sig_enrichment binding_site 13293965 13295883
#> 1420    3L Regions_of_sig_enrichment binding_site 13347750 13349003
#> 1421    3L Regions_of_sig_enrichment binding_site 13349316 13350390
#> 1422    3L Regions_of_sig_enrichment binding_site 13472603 13474061
#> 1423    3L Regions_of_sig_enrichment binding_site 13479018 13480822
#> 1424    3L Regions_of_sig_enrichment binding_site 13480979 13482584
#> 1425    3L Regions_of_sig_enrichment binding_site 13486768 13488417
#> 1426    3L Regions_of_sig_enrichment binding_site 13577901 13578945
#> 1427    3L Regions_of_sig_enrichment binding_site 13635582 13636796
#> 1428    3L Regions_of_sig_enrichment binding_site 13852657 13854912
#> 1429    3L Regions_of_sig_enrichment binding_site 13855224 13856445
#> 1430    3L Regions_of_sig_enrichment binding_site 13878125 13879144
#> 1431    3L Regions_of_sig_enrichment binding_site 13910928 13911984
#> 1432    3L Regions_of_sig_enrichment binding_site 13912213 13913551
#> 1433    3L Regions_of_sig_enrichment binding_site 13994351 13997612
#> 1434    3L Regions_of_sig_enrichment binding_site 13997879 14000690
#> 1435    3L Regions_of_sig_enrichment binding_site 14013829 14015662
#> 1436    3L Regions_of_sig_enrichment binding_site 14023861 14025034
#> 1437    3L Regions_of_sig_enrichment binding_site 14030035 14031559
#> 1438    3L Regions_of_sig_enrichment binding_site 14035964 14037107
#> 1439    3L Regions_of_sig_enrichment binding_site 14047957 14049129
#> 1440    3L Regions_of_sig_enrichment binding_site 14104379 14105657
#> 1441    3L Regions_of_sig_enrichment binding_site 14182149 14183673
#> 1442    3L Regions_of_sig_enrichment binding_site 14204693 14206469
#> 1443    3L Regions_of_sig_enrichment binding_site 14265177 14266446
#> 1444    3L Regions_of_sig_enrichment binding_site 14266987 14268139
#> 1445    3L Regions_of_sig_enrichment binding_site 14339829 14341063
#> 1446    3L Regions_of_sig_enrichment binding_site 14401871 14403919
#> 1447    3L Regions_of_sig_enrichment binding_site 14505700 14507170
#> 1448    3L Regions_of_sig_enrichment binding_site 14540997 14542897
#> 1449    3L Regions_of_sig_enrichment binding_site 14543092 14544686
#> 1450    3L Regions_of_sig_enrichment binding_site 14597183 14598508
#> 1451    3L Regions_of_sig_enrichment binding_site 14600184 14601212
#> 1452    3L Regions_of_sig_enrichment binding_site 14746503 14747517
#> 1453    3L Regions_of_sig_enrichment binding_site 14747869 14749583
#> 1454    3L Regions_of_sig_enrichment binding_site 14749704 14754452
#> 1455    3L Regions_of_sig_enrichment binding_site 14764503 14765882
#> 1456    3L Regions_of_sig_enrichment binding_site 14771328 14772725
#> 1457    3L Regions_of_sig_enrichment binding_site 14773305 14775171
#> 1458    3L Regions_of_sig_enrichment binding_site 14777514 14779858
#> 1459    3L Regions_of_sig_enrichment binding_site 14812266 14813322
#> 1460    3L Regions_of_sig_enrichment binding_site 14979964 14981061
#> 1461    3L Regions_of_sig_enrichment binding_site 14985012 14986839
#> 1462    3L Regions_of_sig_enrichment binding_site 15004308 15005666
#> 1463    3L Regions_of_sig_enrichment binding_site 15040272 15042813
#> 1464    3L Regions_of_sig_enrichment binding_site 15063797 15065106
#> 1465    3L Regions_of_sig_enrichment binding_site 15087355 15088491
#> 1466    3L Regions_of_sig_enrichment binding_site 15094114 15095134
#> 1467    3L Regions_of_sig_enrichment binding_site 15096948 15098282
#> 1468    3L Regions_of_sig_enrichment binding_site 15222739 15224578
#> 1469    3L Regions_of_sig_enrichment binding_site 15224739 15226324
#> 1470    3L Regions_of_sig_enrichment binding_site 15227524 15229192
#> 1471    3L Regions_of_sig_enrichment binding_site 15493552 15494736
#> 1472    3L Regions_of_sig_enrichment binding_site 15499980 15501562
#> 1473    3L Regions_of_sig_enrichment binding_site 15504477 15505581
#> 1474    3L Regions_of_sig_enrichment binding_site 15507906 15508925
#> 1475    3L Regions_of_sig_enrichment binding_site 15524588 15526123
#> 1476    3L Regions_of_sig_enrichment binding_site 15526394 15529148
#> 1477    3L Regions_of_sig_enrichment binding_site 15530065 15532819
#> 1478    3L Regions_of_sig_enrichment binding_site 15533336 15534647
#> 1479    3L Regions_of_sig_enrichment binding_site 15549896 15550910
#> 1480    3L Regions_of_sig_enrichment binding_site 15552331 15554826
#> 1481    3L Regions_of_sig_enrichment binding_site 15558883 15559920
#> 1482    3L Regions_of_sig_enrichment binding_site 15587577 15591778
#> 1483    3L Regions_of_sig_enrichment binding_site 15598734 15599833
#> 1484    3L Regions_of_sig_enrichment binding_site 15612663 15613796
#> 1485    3L Regions_of_sig_enrichment binding_site 15801279 15803140
#> 1486    3L Regions_of_sig_enrichment binding_site 15808125 15809457
#> 1487    3L Regions_of_sig_enrichment binding_site 15811789 15812957
#> 1488    3L Regions_of_sig_enrichment binding_site 15827161 15828704
#> 1489    3L Regions_of_sig_enrichment binding_site 15949153 15950198
#> 1490    3L Regions_of_sig_enrichment binding_site 16004125 16005559
#> 1491    3L Regions_of_sig_enrichment binding_site 16036072 16040738
#> 1492    3L Regions_of_sig_enrichment binding_site 16044735 16046441
#> 1493    3L Regions_of_sig_enrichment binding_site 16052697 16054685
#> 1494    3L Regions_of_sig_enrichment binding_site 16081633 16082750
#> 1495    3L Regions_of_sig_enrichment binding_site 16106135 16107198
#> 1496    3L Regions_of_sig_enrichment binding_site 16129678 16130773
#> 1497    3L Regions_of_sig_enrichment binding_site 16142489 16144618
#> 1498    3L Regions_of_sig_enrichment binding_site 16146311 16148456
#> 1499    3L Regions_of_sig_enrichment binding_site 16149825 16151613
#> 1500    3L Regions_of_sig_enrichment binding_site 16153335 16155250
#> 1501    3L Regions_of_sig_enrichment binding_site 16156416 16158172
#> 1502    3L Regions_of_sig_enrichment binding_site 16186903 16188382
#> 1503    3L Regions_of_sig_enrichment binding_site 16195849 16197206
#> 1504    3L Regions_of_sig_enrichment binding_site 16204925 16206112
#> 1505    3L Regions_of_sig_enrichment binding_site 16372885 16376183
#> 1506    3L Regions_of_sig_enrichment binding_site 16378620 16380154
#> 1507    3L Regions_of_sig_enrichment binding_site 16402907 16404459
#> 1508    3L Regions_of_sig_enrichment binding_site 16406842 16408283
#> 1509    3L Regions_of_sig_enrichment binding_site 16462153 16463590
#> 1510    3L Regions_of_sig_enrichment binding_site 16556165 16557323
#> 1511    3L Regions_of_sig_enrichment binding_site 16570791 16571802
#> 1512    3L Regions_of_sig_enrichment binding_site 16574227 16576265
#> 1513    3L Regions_of_sig_enrichment binding_site 16585837 16587116
#> 1514    3L Regions_of_sig_enrichment binding_site 16587381 16588899
#> 1515    3L Regions_of_sig_enrichment binding_site 16594974 16596544
#> 1516    3L Regions_of_sig_enrichment binding_site 16602057 16603063
#> 1517    3L Regions_of_sig_enrichment binding_site 16623426 16625604
#> 1518    3L Regions_of_sig_enrichment binding_site 16638431 16639814
#> 1519    3L Regions_of_sig_enrichment binding_site 16649025 16650521
#> 1520    3L Regions_of_sig_enrichment binding_site 16652929 16655050
#> 1521    3L Regions_of_sig_enrichment binding_site 16691536 16692949
#> 1522    3L Regions_of_sig_enrichment binding_site 16701995 16703472
#> 1523    3L Regions_of_sig_enrichment binding_site 16703623 16704783
#> 1524    3L Regions_of_sig_enrichment binding_site 16705153 16706473
#> 1525    3L Regions_of_sig_enrichment binding_site 16790045 16791149
#> 1526    3L Regions_of_sig_enrichment binding_site 16798582 16801650
#> 1527    3L Regions_of_sig_enrichment binding_site 16861074 16862871
#> 1528    3L Regions_of_sig_enrichment binding_site 16865179 16866288
#> 1529    3L Regions_of_sig_enrichment binding_site 16866644 16868261
#> 1530    3L Regions_of_sig_enrichment binding_site 16948004 16951667
#> 1531    3L Regions_of_sig_enrichment binding_site 16961119 16964006
#> 1532    3L Regions_of_sig_enrichment binding_site 16993198 16994771
#> 1533    3L Regions_of_sig_enrichment binding_site 16996407 16999209
#> 1534    3L Regions_of_sig_enrichment binding_site 17000200 17005890
#> 1535    3L Regions_of_sig_enrichment binding_site 17024843 17025865
#> 1536    3L Regions_of_sig_enrichment binding_site 17026575 17027984
#> 1537    3L Regions_of_sig_enrichment binding_site 17030285 17031781
#> 1538    3L Regions_of_sig_enrichment binding_site 17034737 17035826
#> 1539    3L Regions_of_sig_enrichment binding_site 17043514 17045373
#> 1540    3L Regions_of_sig_enrichment binding_site 17399559 17401315
#> 1541    3L Regions_of_sig_enrichment binding_site 17423477 17425588
#> 1542    3L Regions_of_sig_enrichment binding_site 17426042 17427170
#> 1543    3L Regions_of_sig_enrichment binding_site 17477955 17479431
#> 1544    3L Regions_of_sig_enrichment binding_site 17480160 17481498
#> 1545    3L Regions_of_sig_enrichment binding_site 17498415 17500320
#> 1546    3L Regions_of_sig_enrichment binding_site 17522412 17523915
#> 1547    3L Regions_of_sig_enrichment binding_site 17525375 17527440
#> 1548    3L Regions_of_sig_enrichment binding_site 17550382 17551750
#> 1549    3L Regions_of_sig_enrichment binding_site 17556188 17557650
#> 1550    3L Regions_of_sig_enrichment binding_site 17559021 17560384
#> 1551    3L Regions_of_sig_enrichment binding_site 17569022 17570811
#> 1552    3L Regions_of_sig_enrichment binding_site 17571319 17572814
#> 1553    3L Regions_of_sig_enrichment binding_site 17589127 17590636
#> 1554    3L Regions_of_sig_enrichment binding_site 17596592 17597814
#> 1555    3L Regions_of_sig_enrichment binding_site 17611675 17612924
#> 1556    3L Regions_of_sig_enrichment binding_site 17646223 17647774
#> 1557    3L Regions_of_sig_enrichment binding_site 17650656 17652644
#> 1558    3L Regions_of_sig_enrichment binding_site 17660774 17662858
#> 1559    3L Regions_of_sig_enrichment binding_site 17756009 17757555
#> 1560    3L Regions_of_sig_enrichment binding_site 17833419 17834627
#> 1561    3L Regions_of_sig_enrichment binding_site 17835990 17837360
#> 1562    3L Regions_of_sig_enrichment binding_site 17842776 17844009
#> 1563    3L Regions_of_sig_enrichment binding_site 17849101 17851493
#> 1564    3L Regions_of_sig_enrichment binding_site 17899860 17901078
#> 1565    3L Regions_of_sig_enrichment binding_site 17905170 17906801
#> 1566    3L Regions_of_sig_enrichment binding_site 17914285 17915834
#> 1567    3L Regions_of_sig_enrichment binding_site 17939494 17941830
#> 1568    3L Regions_of_sig_enrichment binding_site 17942296 17944007
#> 1569    3L Regions_of_sig_enrichment binding_site 17949397 17951874
#> 1570    3L Regions_of_sig_enrichment binding_site 17953810 17955454
#> 1571    3L Regions_of_sig_enrichment binding_site 17959500 17961699
#> 1572    3L Regions_of_sig_enrichment binding_site 17963978 17966782
#> 1573    3L Regions_of_sig_enrichment binding_site 17980973 17982280
#> 1574    3L Regions_of_sig_enrichment binding_site 17982822 17983955
#> 1575    3L Regions_of_sig_enrichment binding_site 17987071 17989298
#> 1576    3L Regions_of_sig_enrichment binding_site 17992341 17993500
#> 1577    3L Regions_of_sig_enrichment binding_site 17993836 17998027
#> 1578    3L Regions_of_sig_enrichment binding_site 18018149 18019498
#> 1579    3L Regions_of_sig_enrichment binding_site 18021150 18023075
#> 1580    3L Regions_of_sig_enrichment binding_site 18026592 18027956
#> 1581    3L Regions_of_sig_enrichment binding_site 18037154 18038504
#> 1582    3L Regions_of_sig_enrichment binding_site 18039347 18040845
#> 1583    3L Regions_of_sig_enrichment binding_site 18054334 18056001
#> 1584    3L Regions_of_sig_enrichment binding_site 18102357 18103380
#> 1585    3L Regions_of_sig_enrichment binding_site 18106495 18108060
#> 1586    3L Regions_of_sig_enrichment binding_site 18159755 18161158
#> 1587    3L Regions_of_sig_enrichment binding_site 18163559 18165449
#> 1588    3L Regions_of_sig_enrichment binding_site 18181106 18182143
#> 1589    3L Regions_of_sig_enrichment binding_site 18227316 18229319
#> 1590    3L Regions_of_sig_enrichment binding_site 18664883 18666317
#> 1591    3L Regions_of_sig_enrichment binding_site 18676730 18678377
#> 1592    3L Regions_of_sig_enrichment binding_site 18736553 18739394
#> 1593    3L Regions_of_sig_enrichment binding_site 18747132 18748345
#> 1594    3L Regions_of_sig_enrichment binding_site 18758205 18759253
#> 1595    3L Regions_of_sig_enrichment binding_site 18783956 18785179
#> 1596    3L Regions_of_sig_enrichment binding_site 18793508 18794651
#> 1597    3L Regions_of_sig_enrichment binding_site 18806422 18808339
#> 1598    3L Regions_of_sig_enrichment binding_site 18812250 18813392
#> 1599    3L Regions_of_sig_enrichment binding_site 18828983 18830278
#> 1600    3L Regions_of_sig_enrichment binding_site 18832620 18833962
#> 1601    3L Regions_of_sig_enrichment binding_site 18834275 18835437
#> 1602    3L Regions_of_sig_enrichment binding_site 18837918 18840522
#> 1603    3L Regions_of_sig_enrichment binding_site 18884805 18886164
#> 1604    3L Regions_of_sig_enrichment binding_site 18890515 18891608
#> 1605    3L Regions_of_sig_enrichment binding_site 18986087 18988434
#> 1606    3L Regions_of_sig_enrichment binding_site 18988582 18990775
#> 1607    3L Regions_of_sig_enrichment binding_site 19055168 19056902
#> 1608    3L Regions_of_sig_enrichment binding_site 19063463 19064950
#> 1609    3L Regions_of_sig_enrichment binding_site 19071140 19074961
#> 1610    3L Regions_of_sig_enrichment binding_site 19075277 19078154
#> 1611    3L Regions_of_sig_enrichment binding_site 19078864 19079911
#> 1612    3L Regions_of_sig_enrichment binding_site 19083807 19084934
#> 1613    3L Regions_of_sig_enrichment binding_site 19251425 19252574
#> 1614    3L Regions_of_sig_enrichment binding_site 19287412 19288548
#> 1615    3L Regions_of_sig_enrichment binding_site 19489893 19490896
#> 1616    3L Regions_of_sig_enrichment binding_site 19509096 19510523
#> 1617    3L Regions_of_sig_enrichment binding_site 19560622 19562737
#> 1618    3L Regions_of_sig_enrichment binding_site 19584109 19585268
#> 1619    3L Regions_of_sig_enrichment binding_site 19624887 19628330
#> 1620    3L Regions_of_sig_enrichment binding_site 19642377 19644616
#> 1621    3L Regions_of_sig_enrichment binding_site 19711198 19712785
#> 1622    3L Regions_of_sig_enrichment binding_site 19731222 19732986
#> 1623    3L Regions_of_sig_enrichment binding_site 19742614 19744201
#> 1624    3L Regions_of_sig_enrichment binding_site 19762636 19764400
#> 1625    3L Regions_of_sig_enrichment binding_site 19783087 19784600
#> 1626    3L Regions_of_sig_enrichment binding_site 19785564 19787829
#> 1627    3L Regions_of_sig_enrichment binding_site 19837807 19839059
#> 1628    3L Regions_of_sig_enrichment binding_site 19862672 19863820
#> 1629    3L Regions_of_sig_enrichment binding_site 19885520 19886563
#> 1630    3L Regions_of_sig_enrichment binding_site 19887916 19892911
#> 1631    3L Regions_of_sig_enrichment binding_site 19893174 19895902
#> 1632    3L Regions_of_sig_enrichment binding_site 19896021 19898007
#> 1633    3L Regions_of_sig_enrichment binding_site 19898123 19903616
#> 1634    3L Regions_of_sig_enrichment binding_site 20041698 20046281
#> 1635    3L Regions_of_sig_enrichment binding_site 20090212 20091943
#> 1636    3L Regions_of_sig_enrichment binding_site 20096391 20097832
#> 1637    3L Regions_of_sig_enrichment binding_site 20178790 20180067
#> 1638    3L Regions_of_sig_enrichment binding_site 20180466 20183062
#> 1639    3L Regions_of_sig_enrichment binding_site 20189257 20190266
#> 1640    3L Regions_of_sig_enrichment binding_site 20190540 20191998
#> 1641    3L Regions_of_sig_enrichment binding_site 20234077 20235461
#> 1642    3L Regions_of_sig_enrichment binding_site 20302834 20304687
#> 1643    3L Regions_of_sig_enrichment binding_site 20305867 20307267
#> 1644    3L Regions_of_sig_enrichment binding_site 20310274 20314401
#> 1645    3L Regions_of_sig_enrichment binding_site 20378049 20379643
#> 1646    3L Regions_of_sig_enrichment binding_site 20380558 20381941
#> 1647    3L Regions_of_sig_enrichment binding_site 20391571 20393243
#> 1648    3L Regions_of_sig_enrichment binding_site 20393358 20395359
#> 1649    3L Regions_of_sig_enrichment binding_site 20396262 20398284
#> 1650    3L Regions_of_sig_enrichment binding_site 20486362 20487726
#> 1651    3L Regions_of_sig_enrichment binding_site 20500687 20503251
#> 1652    3L Regions_of_sig_enrichment binding_site 20509200 20510597
#> 1653    3L Regions_of_sig_enrichment binding_site 20510713 20512790
#> 1654    3L Regions_of_sig_enrichment binding_site 20516869 20517915
#> 1655    3L Regions_of_sig_enrichment binding_site 20525696 20526766
#> 1656    3L Regions_of_sig_enrichment binding_site 20722891 20725439
#> 1657    3L Regions_of_sig_enrichment binding_site 20770340 20771540
#> 1658    3L Regions_of_sig_enrichment binding_site 20771861 20772903
#> 1659    3L Regions_of_sig_enrichment binding_site 20777455 20779220
#> 1660    3L Regions_of_sig_enrichment binding_site 20808516 20809573
#> 1661    3L Regions_of_sig_enrichment binding_site 20942259 20943291
#> 1662    3L Regions_of_sig_enrichment binding_site 21000958 21003423
#> 1663    3L Regions_of_sig_enrichment binding_site 21003983 21005547
#> 1664    3L Regions_of_sig_enrichment binding_site 21006423 21008026
#> 1665    3L Regions_of_sig_enrichment binding_site 21016491 21017498
#> 1666    3L Regions_of_sig_enrichment binding_site 21017646 21020537
#> 1667    3L Regions_of_sig_enrichment binding_site 21026956 21028052
#> 1668    3L Regions_of_sig_enrichment binding_site 21058240 21059433
#> 1669    3L Regions_of_sig_enrichment binding_site 21159543 21161181
#> 1670    3L Regions_of_sig_enrichment binding_site 21165300 21166980
#> 1671    3L Regions_of_sig_enrichment binding_site 21169542 21170714
#> 1672    3L Regions_of_sig_enrichment binding_site 21193848 21196180
#> 1673    3L Regions_of_sig_enrichment binding_site 21197145 21198772
#> 1674    3L Regions_of_sig_enrichment binding_site 21248177 21251573
#> 1675    3L Regions_of_sig_enrichment binding_site 21268748 21271978
#> 1676    3L Regions_of_sig_enrichment binding_site 21272899 21274542
#> 1677    3L Regions_of_sig_enrichment binding_site 21277866 21280215
#> 1678    3L Regions_of_sig_enrichment binding_site 21308894 21311357
#> 1679    3L Regions_of_sig_enrichment binding_site 21330468 21332824
#> 1680    3L Regions_of_sig_enrichment binding_site 21335922 21337858
#> 1681    3L Regions_of_sig_enrichment binding_site 21339415 21341239
#> 1682    3L Regions_of_sig_enrichment binding_site 21374164 21376307
#> 1683    3L Regions_of_sig_enrichment binding_site 21426336 21427365
#> 1684    3L Regions_of_sig_enrichment binding_site 21500130 21501861
#> 1685    3L Regions_of_sig_enrichment binding_site 21509130 21510412
#> 1686    3L Regions_of_sig_enrichment binding_site 21516226 21518211
#> 1687    3L Regions_of_sig_enrichment binding_site 21529301 21530694
#> 1688    3L Regions_of_sig_enrichment binding_site 21532648 21533898
#> 1689    3L Regions_of_sig_enrichment binding_site 21537922 21538992
#> 1690    3L Regions_of_sig_enrichment binding_site 21762328 21763996
#> 1691    3L Regions_of_sig_enrichment binding_site 21832566 21834821
#> 1692    3L Regions_of_sig_enrichment binding_site 21872368 21874202
#> 1693    3L Regions_of_sig_enrichment binding_site 21879405 21880718
#> 1694    3L Regions_of_sig_enrichment binding_site 21883955 21885054
#> 1695    3L Regions_of_sig_enrichment binding_site 21921370 21922682
#> 1696    3L Regions_of_sig_enrichment binding_site 21946299 21947588
#> 1697    3L Regions_of_sig_enrichment binding_site 21952967 21953971
#> 1698    3L Regions_of_sig_enrichment binding_site 22124480 22125500
#> 1699    3L Regions_of_sig_enrichment binding_site 22126715 22128131
#> 1700    3L Regions_of_sig_enrichment binding_site 22255872 22257354
#> 1701    3L Regions_of_sig_enrichment binding_site 22264906 22266213
#> 1702    3L Regions_of_sig_enrichment binding_site 22717503 22719117
#> 1703    3L Regions_of_sig_enrichment binding_site 22725161 22727924
#> 1704    3L Regions_of_sig_enrichment binding_site 22734364 22735732
#> 1705    3L Regions_of_sig_enrichment binding_site 22766218 22767233
#> 1706    3L Regions_of_sig_enrichment binding_site 22815393 22818575
#> 1707    3L Regions_of_sig_enrichment binding_site 22826482 22828788
#> 1708    3L Regions_of_sig_enrichment binding_site 22829002 22833632
#> 1709    3L Regions_of_sig_enrichment binding_site 22861744 22863020
#> 1710    3L Regions_of_sig_enrichment binding_site 22863210 22865271
#> 1711    3L Regions_of_sig_enrichment binding_site 22871133 22872662
#> 1712    3L Regions_of_sig_enrichment binding_site 22901932 22903108
#> 1713    3L Regions_of_sig_enrichment binding_site 22903215 22904855
#> 1714    3L Regions_of_sig_enrichment binding_site 22940351 22943346
#> 1715    3L  Regions_of_sig_depletion binding_site  2339839  2341245
#> 1716    3L  Regions_of_sig_depletion binding_site  3010859  3012143
#> 1717    3L  Regions_of_sig_depletion binding_site  3651352  3652602
#> 1718    3L  Regions_of_sig_depletion binding_site  5663003  5664175
#> 1719    3L  Regions_of_sig_depletion binding_site 14580528 14581551
#> 1720    3L  Regions_of_sig_depletion binding_site 15722554 15723761
#> 1721    3L  Regions_of_sig_depletion binding_site 16423009 16424011
#> 1722    3L  Regions_of_sig_depletion binding_site 17775386 17776420
#> 1723    3L  Regions_of_sig_depletion binding_site 20952419 20953556
#> 1724    3L  Regions_of_sig_depletion binding_site 21695533 21696600
#> 1725    3L  Regions_of_sig_depletion binding_site 22239423 22240740
#> 1726    3L  Regions_of_sig_depletion binding_site 23224623 23226216
#> 1727    2L Regions_of_sig_enrichment binding_site    35076    36319
#> 1728    2L Regions_of_sig_enrichment binding_site    41748    43055
#> 1729    2L Regions_of_sig_enrichment binding_site    64960    68698
#> 1730    2L Regions_of_sig_enrichment binding_site    71669    75564
#> 1731    2L Regions_of_sig_enrichment binding_site    86309    87580
#> 1732    2L Regions_of_sig_enrichment binding_site   106355   107375
#> 1733    2L Regions_of_sig_enrichment binding_site   107804   109990
#> 1734    2L Regions_of_sig_enrichment binding_site   119498   121861
#> 1735    2L Regions_of_sig_enrichment binding_site   122327   123502
#> 1736    2L Regions_of_sig_enrichment binding_site   124725   126596
#> 1737    2L Regions_of_sig_enrichment binding_site   127354   130155
#> 1738    2L Regions_of_sig_enrichment binding_site   130774   132417
#> 1739    2L Regions_of_sig_enrichment binding_site   135691   137727
#> 1740    2L Regions_of_sig_enrichment binding_site   158810   159885
#> 1741    2L Regions_of_sig_enrichment binding_site   213918   215105
#> 1742    2L Regions_of_sig_enrichment binding_site   221487   225467
#> 1743    2L Regions_of_sig_enrichment binding_site   247452   250495
#> 1744    2L Regions_of_sig_enrichment binding_site   297767   298786
#> 1745    2L Regions_of_sig_enrichment binding_site   304289   306450
#> 1746    2L Regions_of_sig_enrichment binding_site   412569   413732
#> 1747    2L Regions_of_sig_enrichment binding_site   414314   415706
#> 1748    2L Regions_of_sig_enrichment binding_site   425557   426690
#> 1749    2L Regions_of_sig_enrichment binding_site   430923   433221
#> 1750    2L Regions_of_sig_enrichment binding_site   447351   448389
#> 1751    2L Regions_of_sig_enrichment binding_site   470330   471497
#> 1752    2L Regions_of_sig_enrichment binding_site   471607   472637
#> 1753    2L Regions_of_sig_enrichment binding_site   474072   475914
#> 1754    2L Regions_of_sig_enrichment binding_site   477244   478333
#> 1755    2L Regions_of_sig_enrichment binding_site   478683   481959
#> 1756    2L Regions_of_sig_enrichment binding_site   484028   487017
#> 1757    2L Regions_of_sig_enrichment binding_site   487128   489879
#> 1758    2L Regions_of_sig_enrichment binding_site   490035   492656
#> 1759    2L Regions_of_sig_enrichment binding_site   493649   494768
#> 1760    2L Regions_of_sig_enrichment binding_site   497576   499542
#> 1761    2L Regions_of_sig_enrichment binding_site   502295   503416
#> 1762    2L Regions_of_sig_enrichment binding_site   505029   507639
#> 1763    2L Regions_of_sig_enrichment binding_site   514952   516210
#> 1764    2L Regions_of_sig_enrichment binding_site   518550   519978
#> 1765    2L Regions_of_sig_enrichment binding_site   520301   523993
#> 1766    2L Regions_of_sig_enrichment binding_site   524193   525285
#> 1767    2L Regions_of_sig_enrichment binding_site   542123   543288
#> 1768    2L Regions_of_sig_enrichment binding_site   544422   545996
#> 1769    2L Regions_of_sig_enrichment binding_site   549950   550954
#> 1770    2L Regions_of_sig_enrichment binding_site   571039   572086
#> 1771    2L Regions_of_sig_enrichment binding_site   576173   577796
#> 1772    2L Regions_of_sig_enrichment binding_site   820954   822831
#> 1773    2L Regions_of_sig_enrichment binding_site   823617   825101
#> 1774    2L Regions_of_sig_enrichment binding_site   825444   828140
#> 1775    2L Regions_of_sig_enrichment binding_site   832881   833896
#> 1776    2L Regions_of_sig_enrichment binding_site   834006   835604
#> 1777    2L Regions_of_sig_enrichment binding_site   840379   842419
#> 1778    2L Regions_of_sig_enrichment binding_site   842577   843619
#> 1779    2L Regions_of_sig_enrichment binding_site   845015   846182
#> 1780    2L Regions_of_sig_enrichment binding_site   846899   848198
#> 1781    2L Regions_of_sig_enrichment binding_site   864817   868824
#> 1782    2L Regions_of_sig_enrichment binding_site   870596   872382
#> 1783    2L Regions_of_sig_enrichment binding_site   873552   875118
#> 1784    2L Regions_of_sig_enrichment binding_site   875504   876649
#> 1785    2L Regions_of_sig_enrichment binding_site  1107192  1108700
#> 1786    2L Regions_of_sig_enrichment binding_site  1113613  1114691
#> 1787    2L Regions_of_sig_enrichment binding_site  1116790  1120778
#> 1788    2L Regions_of_sig_enrichment binding_site  1126809  1128212
#> 1789    2L Regions_of_sig_enrichment binding_site  1142571  1143824
#> 1790    2L Regions_of_sig_enrichment binding_site  1156800  1158538
#> 1791    2L Regions_of_sig_enrichment binding_site  1162949  1164491
#> 1792    2L Regions_of_sig_enrichment binding_site  1184652  1186727
#> 1793    2L Regions_of_sig_enrichment binding_site  1228352  1229841
#> 1794    2L Regions_of_sig_enrichment binding_site  1432444  1435399
#> 1795    2L Regions_of_sig_enrichment binding_site  1461466  1462601
#> 1796    2L Regions_of_sig_enrichment binding_site  1491483  1492934
#> 1797    2L Regions_of_sig_enrichment binding_site  1649149  1650971
#> 1798    2L Regions_of_sig_enrichment binding_site  1651541  1652541
#> 1799    2L Regions_of_sig_enrichment binding_site  1654048  1655555
#> 1800    2L Regions_of_sig_enrichment binding_site  1655856  1657855
#> 1801    2L Regions_of_sig_enrichment binding_site  1663431  1664529
#> 1802    2L Regions_of_sig_enrichment binding_site  1665677  1666697
#> 1803    2L Regions_of_sig_enrichment binding_site  1666898  1669005
#> 1804    2L Regions_of_sig_enrichment binding_site  1691248  1694161
#> 1805    2L Regions_of_sig_enrichment binding_site  1707299  1709141
#> 1806    2L Regions_of_sig_enrichment binding_site  1738429  1739721
#> 1807    2L Regions_of_sig_enrichment binding_site  1911026  1912430
#> 1808    2L Regions_of_sig_enrichment binding_site  1930590  1932614
#> 1809    2L Regions_of_sig_enrichment binding_site  2009634  2011222
#> 1810    2L Regions_of_sig_enrichment binding_site  2128248  2129390
#> 1811    2L Regions_of_sig_enrichment binding_site  2156850  2158291
#> 1812    2L Regions_of_sig_enrichment binding_site  2160418  2162075
#> 1813    2L Regions_of_sig_enrichment binding_site  2162225  2163890
#> 1814    2L Regions_of_sig_enrichment binding_site  2165229  2166253
#> 1815    2L Regions_of_sig_enrichment binding_site  2168265  2169287
#> 1816    2L Regions_of_sig_enrichment binding_site  2172476  2173605
#> 1817    2L Regions_of_sig_enrichment binding_site  2173726  2176885
#> 1818    2L Regions_of_sig_enrichment binding_site  2177705  2179626
#> 1819    2L Regions_of_sig_enrichment binding_site  2191701  2193235
#> 1820    2L Regions_of_sig_enrichment binding_site  2195178  2197788
#> 1821    2L Regions_of_sig_enrichment binding_site  2197907  2202151
#> 1822    2L Regions_of_sig_enrichment binding_site  2202434  2203645
#> 1823    2L Regions_of_sig_enrichment binding_site  2220407  2222597
#> 1824    2L Regions_of_sig_enrichment binding_site  2225745  2226798
#> 1825    2L Regions_of_sig_enrichment binding_site  2226915  2230112
#> 1826    2L Regions_of_sig_enrichment binding_site  2362940  2366371
#> 1827    2L Regions_of_sig_enrichment binding_site  2380376  2381409
#> 1828    2L Regions_of_sig_enrichment binding_site  2574954  2576089
#> 1829    2L Regions_of_sig_enrichment binding_site  2724148  2725444
#> 1830    2L Regions_of_sig_enrichment binding_site  2729419  2732273
#> 1831    2L Regions_of_sig_enrichment binding_site  2734479  2736253
#> 1832    2L Regions_of_sig_enrichment binding_site  2738501  2740172
#> 1833    2L Regions_of_sig_enrichment binding_site  2751417  2753510
#> 1834    2L Regions_of_sig_enrichment binding_site  2753629  2756274
#> 1835    2L Regions_of_sig_enrichment binding_site  2757202  2758353
#> 1836    2L Regions_of_sig_enrichment binding_site  2806102  2807203
#> 1837    2L Regions_of_sig_enrichment binding_site  2807432  2808707
#> 1838    2L Regions_of_sig_enrichment binding_site  2861904  2863061
#> 1839    2L Regions_of_sig_enrichment binding_site  2873167  2874551
#> 1840    2L Regions_of_sig_enrichment binding_site  2884175  2886155
#> 1841    2L Regions_of_sig_enrichment binding_site  2886268  2887451
#> 1842    2L Regions_of_sig_enrichment binding_site  2904438  2906401
#> 1843    2L Regions_of_sig_enrichment binding_site  2906845  2909175
#> 1844    2L Regions_of_sig_enrichment binding_site  2922730  2924103
#> 1845    2L Regions_of_sig_enrichment binding_site  2924224  2926483
#> 1846    2L Regions_of_sig_enrichment binding_site  2955620  2956738
#> 1847    2L Regions_of_sig_enrichment binding_site  2970682  2972509
#> 1848    2L Regions_of_sig_enrichment binding_site  3041631  3042949
#> 1849    2L Regions_of_sig_enrichment binding_site  3056459  3059849
#> 1850    2L Regions_of_sig_enrichment binding_site  3152884  3154552
#> 1851    2L Regions_of_sig_enrichment binding_site  3289647  3292954
#> 1852    2L Regions_of_sig_enrichment binding_site  3345530  3347183
#> 1853    2L Regions_of_sig_enrichment binding_site  3356004  3358243
#> 1854    2L Regions_of_sig_enrichment binding_site  3365711  3366964
#> 1855    2L Regions_of_sig_enrichment binding_site  3370443  3373649
#> 1856    2L Regions_of_sig_enrichment binding_site  3475317  3477133
#> 1857    2L Regions_of_sig_enrichment binding_site  3477673  3480341
#> 1858    2L Regions_of_sig_enrichment binding_site  3631228  3632675
#> 1859    2L Regions_of_sig_enrichment binding_site  3632987  3634402
#> 1860    2L Regions_of_sig_enrichment binding_site  3656006  3657668
#> 1861    2L Regions_of_sig_enrichment binding_site  3706417  3707719
#> 1862    2L Regions_of_sig_enrichment binding_site  3712980  3714061
#> 1863    2L Regions_of_sig_enrichment binding_site  3770681  3772710
#> 1864    2L Regions_of_sig_enrichment binding_site  3803146  3804412
#> 1865    2L Regions_of_sig_enrichment binding_site  3889447  3891246
#> 1866    2L Regions_of_sig_enrichment binding_site  3895342  3896480
#> 1867    2L Regions_of_sig_enrichment binding_site  3896636  3898924
#> 1868    2L Regions_of_sig_enrichment binding_site  4109314  4110833
#> 1869    2L Regions_of_sig_enrichment binding_site  4118560  4120081
#> 1870    2L Regions_of_sig_enrichment binding_site  4196639  4198143
#> 1871    2L Regions_of_sig_enrichment binding_site  4331633  4333508
#> 1872    2L Regions_of_sig_enrichment binding_site  4333999  4336058
#> 1873    2L Regions_of_sig_enrichment binding_site  4344568  4346026
#> 1874    2L Regions_of_sig_enrichment binding_site  4371687  4373087
#> 1875    2L Regions_of_sig_enrichment binding_site  4382360  4383904
#> 1876    2L Regions_of_sig_enrichment binding_site  4444240  4445427
#> 1877    2L Regions_of_sig_enrichment binding_site  4446490  4447723
#> 1878    2L Regions_of_sig_enrichment binding_site  4447922  4449441
#> 1879    2L Regions_of_sig_enrichment binding_site  4810899  4813219
#> 1880    2L Regions_of_sig_enrichment binding_site  4850288  4851358
#> 1881    2L Regions_of_sig_enrichment binding_site  4886758  4889354
#> 1882    2L Regions_of_sig_enrichment binding_site  4901914  4905723
#> 1883    2L Regions_of_sig_enrichment binding_site  4907314  4909662
#> 1884    2L Regions_of_sig_enrichment binding_site  4929700  4931214
#> 1885    2L Regions_of_sig_enrichment binding_site  4948451  4950940
#> 1886    2L Regions_of_sig_enrichment binding_site  4954551  4956165
#> 1887    2L Regions_of_sig_enrichment binding_site  4967067  4968674
#> 1888    2L Regions_of_sig_enrichment binding_site  4974418  4975728
#> 1889    2L Regions_of_sig_enrichment binding_site  4977724  4980079
#> 1890    2L Regions_of_sig_enrichment binding_site  4981122  4982385
#> 1891    2L Regions_of_sig_enrichment binding_site  4996631  4999084
#> 1892    2L Regions_of_sig_enrichment binding_site  5002909  5004983
#> 1893    2L Regions_of_sig_enrichment binding_site  5006300  5009083
#> 1894    2L Regions_of_sig_enrichment binding_site  5020684  5023275
#> 1895    2L Regions_of_sig_enrichment binding_site  5023473  5024946
#> 1896    2L Regions_of_sig_enrichment binding_site  5025219  5028664
#> 1897    2L Regions_of_sig_enrichment binding_site  5029055  5030290
#> 1898    2L Regions_of_sig_enrichment binding_site  5043195  5044881
#> 1899    2L Regions_of_sig_enrichment binding_site  5059818  5061687
#> 1900    2L Regions_of_sig_enrichment binding_site  5074046  5075065
#> 1901    2L Regions_of_sig_enrichment binding_site  5086683  5087833
#> 1902    2L Regions_of_sig_enrichment binding_site  5092572  5094046
#> 1903    2L Regions_of_sig_enrichment binding_site  5108030  5109111
#> 1904    2L Regions_of_sig_enrichment binding_site  5145086  5149001
#> 1905    2L Regions_of_sig_enrichment binding_site  5150818  5152028
#> 1906    2L Regions_of_sig_enrichment binding_site  5196577  5198844
#> 1907    2L Regions_of_sig_enrichment binding_site  5269636  5271433
#> 1908    2L Regions_of_sig_enrichment binding_site  5290157  5295613
#> 1909    2L Regions_of_sig_enrichment binding_site  5297731  5298891
#> 1910    2L Regions_of_sig_enrichment binding_site  5299020  5300725
#> 1911    2L Regions_of_sig_enrichment binding_site  5303282  5307120
#> 1912    2L Regions_of_sig_enrichment binding_site  5325324  5326423
#> 1913    2L Regions_of_sig_enrichment binding_site  5340487  5342780
#> 1914    2L Regions_of_sig_enrichment binding_site  5532961  5534081
#> 1915    2L Regions_of_sig_enrichment binding_site  5623884  5625079
#> 1916    2L Regions_of_sig_enrichment binding_site  5723633  5725289
#> 1917    2L Regions_of_sig_enrichment binding_site  5798905  5800170
#> 1918    2L Regions_of_sig_enrichment binding_site  5803127  5804578
#> 1919    2L Regions_of_sig_enrichment binding_site  5943218  5946255
#> 1920    2L Regions_of_sig_enrichment binding_site  5947966  5949731
#> 1921    2L Regions_of_sig_enrichment binding_site  5971052  5972445
#> 1922    2L Regions_of_sig_enrichment binding_site  5976550  5980636
#> 1923    2L Regions_of_sig_enrichment binding_site  5981475  5983585
#> 1924    2L Regions_of_sig_enrichment binding_site  5985043  5988496
#> 1925    2L Regions_of_sig_enrichment binding_site  5997987  6000335
#> 1926    2L Regions_of_sig_enrichment binding_site  6011273  6013949
#> 1927    2L Regions_of_sig_enrichment binding_site  6014063  6015704
#> 1928    2L Regions_of_sig_enrichment binding_site  6073627  6074933
#> 1929    2L Regions_of_sig_enrichment binding_site  6082488  6084101
#> 1930    2L Regions_of_sig_enrichment binding_site  6084978  6086467
#> 1931    2L Regions_of_sig_enrichment binding_site  6086778  6089337
#> 1932    2L Regions_of_sig_enrichment binding_site  6099773  6101101
#> 1933    2L Regions_of_sig_enrichment binding_site  6290984  6292506
#> 1934    2L Regions_of_sig_enrichment binding_site  6323612  6324865
#> 1935    2L Regions_of_sig_enrichment binding_site  6355791  6358225
#> 1936    2L Regions_of_sig_enrichment binding_site  6366066  6367068
#> 1937    2L Regions_of_sig_enrichment binding_site  6367334  6368367
#> 1938    2L Regions_of_sig_enrichment binding_site  6410895  6412042
#> 1939    2L Regions_of_sig_enrichment binding_site  6422414  6423991
#> 1940    2L Regions_of_sig_enrichment binding_site  6454318  6456652
#> 1941    2L Regions_of_sig_enrichment binding_site  6479300  6480948
#> 1942    2L Regions_of_sig_enrichment binding_site  6525878  6528115
#> 1943    2L Regions_of_sig_enrichment binding_site  6561603  6563569
#> 1944    2L Regions_of_sig_enrichment binding_site  6612100  6613102
#> 1945    2L Regions_of_sig_enrichment binding_site  6621914  6622985
#> 1946    2L Regions_of_sig_enrichment binding_site  6646811  6648648
#> 1947    2L Regions_of_sig_enrichment binding_site  6648807  6649872
#> 1948    2L Regions_of_sig_enrichment binding_site  6666555  6669130
#> 1949    2L Regions_of_sig_enrichment binding_site  6676630  6678168
#> 1950    2L Regions_of_sig_enrichment binding_site  6678710  6679753
#> 1951    2L Regions_of_sig_enrichment binding_site  6785661  6786985
#> 1952    2L Regions_of_sig_enrichment binding_site  6787221  6788383
#> 1953    2L Regions_of_sig_enrichment binding_site  6794227  6795538
#> 1954    2L Regions_of_sig_enrichment binding_site  6920665  6922597
#> 1955    2L Regions_of_sig_enrichment binding_site  6944295  6945348
#> 1956    2L Regions_of_sig_enrichment binding_site  6966385  6967483
#> 1957    2L Regions_of_sig_enrichment binding_site  7022840  7024928
#> 1958    2L Regions_of_sig_enrichment binding_site  7026331  7027622
#> 1959    2L Regions_of_sig_enrichment binding_site  7028477  7031543
#> 1960    2L Regions_of_sig_enrichment binding_site  7037675  7039494
#> 1961    2L Regions_of_sig_enrichment binding_site  7041726  7043323
#> 1962    2L Regions_of_sig_enrichment binding_site  7055123  7056892
#> 1963    2L Regions_of_sig_enrichment binding_site  7063263  7064332
#> 1964    2L Regions_of_sig_enrichment binding_site  7203470  7204723
#> 1965    2L Regions_of_sig_enrichment binding_site  7239176  7240619
#> 1966    2L Regions_of_sig_enrichment binding_site  7253536  7257307
#> 1967    2L Regions_of_sig_enrichment binding_site  7281423  7282486
#> 1968    2L Regions_of_sig_enrichment binding_site  7422127  7425963
#> 1969    2L Regions_of_sig_enrichment binding_site  7426865  7427985
#> 1970    2L Regions_of_sig_enrichment binding_site  7432933  7434435
#> 1971    2L Regions_of_sig_enrichment binding_site  7437188  7438494
#> 1972    2L Regions_of_sig_enrichment binding_site  7447318  7448994
#> 1973    2L Regions_of_sig_enrichment binding_site  7495161  7496367
#> 1974    2L Regions_of_sig_enrichment binding_site  7533921  7535846
#> 1975    2L Regions_of_sig_enrichment binding_site  7575645  7577372
#> 1976    2L Regions_of_sig_enrichment binding_site  7700156  7701511
#> 1977    2L Regions_of_sig_enrichment binding_site  7795208  7796209
#> 1978    2L Regions_of_sig_enrichment binding_site  7796960  7798096
#> 1979    2L Regions_of_sig_enrichment binding_site  7808882  7810775
#> 1980    2L Regions_of_sig_enrichment binding_site  7811164  7812219
#> 1981    2L Regions_of_sig_enrichment binding_site  7812507  7815087
#> 1982    2L Regions_of_sig_enrichment binding_site  7821641  7822655
#> 1983    2L Regions_of_sig_enrichment binding_site  7826263  7828113
#> 1984    2L Regions_of_sig_enrichment binding_site  7828464  7829498
#> 1985    2L Regions_of_sig_enrichment binding_site  7885302  7886709
#> 1986    2L Regions_of_sig_enrichment binding_site  7889967  7891647
#> 1987    2L Regions_of_sig_enrichment binding_site  7961987  7963086
#> 1988    2L Regions_of_sig_enrichment binding_site  7976008  7977106
#> 1989    2L Regions_of_sig_enrichment binding_site  7990133  7992046
#> 1990    2L Regions_of_sig_enrichment binding_site  7992243  7994797
#> 1991    2L Regions_of_sig_enrichment binding_site  8028546  8031747
#> 1992    2L Regions_of_sig_enrichment binding_site  8070706  8071808
#> 1993    2L Regions_of_sig_enrichment binding_site  8074424  8075565
#> 1994    2L Regions_of_sig_enrichment binding_site  8076023  8077942
#> 1995    2L Regions_of_sig_enrichment binding_site  8080840  8082120
#> 1996    2L Regions_of_sig_enrichment binding_site  8083258  8088505
#> 1997    2L Regions_of_sig_enrichment binding_site  8091453  8093023
#> 1998    2L Regions_of_sig_enrichment binding_site  8093142  8094410
#> 1999    2L Regions_of_sig_enrichment binding_site  8094524  8095840
#> 2000    2L Regions_of_sig_enrichment binding_site  8099011  8101343
#> 2001    2L Regions_of_sig_enrichment binding_site  8123274  8124286
#> 2002    2L Regions_of_sig_enrichment binding_site  8126281  8127954
#> 2003    2L Regions_of_sig_enrichment binding_site  8132513  8133603
#> 2004    2L Regions_of_sig_enrichment binding_site  8162969  8164156
#> 2005    2L Regions_of_sig_enrichment binding_site  8169517  8170787
#> 2006    2L Regions_of_sig_enrichment binding_site  8184565  8185615
#> 2007    2L Regions_of_sig_enrichment binding_site  8190593  8191818
#> 2008    2L Regions_of_sig_enrichment binding_site  8196990  8198047
#> 2009    2L Regions_of_sig_enrichment binding_site  8204512  8206364
#> 2010    2L Regions_of_sig_enrichment binding_site  8211812  8213156
#> 2011    2L Regions_of_sig_enrichment binding_site  8217489  8219266
#> 2012    2L Regions_of_sig_enrichment binding_site  8220394  8221607
#> 2013    2L Regions_of_sig_enrichment binding_site  8229881  8231191
#> 2014    2L Regions_of_sig_enrichment binding_site  8238842  8240296
#> 2015    2L Regions_of_sig_enrichment binding_site  8277366  8278669
#> 2016    2L Regions_of_sig_enrichment binding_site  8291603  8292707
#> 2017    2L Regions_of_sig_enrichment binding_site  8300222  8301778
#> 2018    2L Regions_of_sig_enrichment binding_site  8342128  8343243
#> 2019    2L Regions_of_sig_enrichment binding_site  8361362  8364578
#> 2020    2L Regions_of_sig_enrichment binding_site  8370228  8371282
#> 2021    2L Regions_of_sig_enrichment binding_site  8383807  8385154
#> 2022    2L Regions_of_sig_enrichment binding_site  8385789  8387262
#> 2023    2L Regions_of_sig_enrichment binding_site  8398430  8400165
#> 2024    2L Regions_of_sig_enrichment binding_site  8405165  8406437
#> 2025    2L Regions_of_sig_enrichment binding_site  8414911  8416448
#> 2026    2L Regions_of_sig_enrichment binding_site  8417360  8420303
#> 2027    2L Regions_of_sig_enrichment binding_site  8420421  8422533
#> 2028    2L Regions_of_sig_enrichment binding_site  8423101  8424925
#> 2029    2L Regions_of_sig_enrichment binding_site  8425045  8426442
#> 2030    2L Regions_of_sig_enrichment binding_site  8431218  8432227
#> 2031    2L Regions_of_sig_enrichment binding_site  8432871  8433935
#> 2032    2L Regions_of_sig_enrichment binding_site  8437016  8438635
#> 2033    2L Regions_of_sig_enrichment binding_site  8449261  8450280
#> 2034    2L Regions_of_sig_enrichment binding_site  8461612  8463224
#> 2035    2L Regions_of_sig_enrichment binding_site  8516718  8518532
#> 2036    2L Regions_of_sig_enrichment binding_site  8534941  8536546
#> 2037    2L Regions_of_sig_enrichment binding_site  8553246  8554546
#> 2038    2L Regions_of_sig_enrichment binding_site  8690319  8692999
#> 2039    2L Regions_of_sig_enrichment binding_site  8693810  8695456
#> 2040    2L Regions_of_sig_enrichment binding_site  8699254  8702831
#> 2041    2L Regions_of_sig_enrichment binding_site  8708316  8709928
#> 2042    2L Regions_of_sig_enrichment binding_site  8733430  8736082
#> 2043    2L Regions_of_sig_enrichment binding_site  8944601  8946462
#> 2044    2L Regions_of_sig_enrichment binding_site  8949736  8951950
#> 2045    2L Regions_of_sig_enrichment binding_site  8953097  8955977
#> 2046    2L Regions_of_sig_enrichment binding_site  8957254  8958508
#> 2047    2L Regions_of_sig_enrichment binding_site  8987561  8989758
#> 2048    2L Regions_of_sig_enrichment binding_site  9119890  9121284
#> 2049    2L Regions_of_sig_enrichment binding_site  9129231  9131095
#> 2050    2L Regions_of_sig_enrichment binding_site  9142450  9144227
#> 2051    2L Regions_of_sig_enrichment binding_site  9175743  9177313
#> 2052    2L Regions_of_sig_enrichment binding_site  9178222  9179647
#> 2053    2L Regions_of_sig_enrichment binding_site  9180819  9184655
#> 2054    2L Regions_of_sig_enrichment binding_site  9186144  9187476
#> 2055    2L Regions_of_sig_enrichment binding_site  9187598  9188747
#> 2056    2L Regions_of_sig_enrichment binding_site  9189017  9190414
#> 2057    2L Regions_of_sig_enrichment binding_site  9203187  9204811
#> 2058    2L Regions_of_sig_enrichment binding_site  9204970  9206041
#> 2059    2L Regions_of_sig_enrichment binding_site  9229892  9231002
#> 2060    2L Regions_of_sig_enrichment binding_site  9237228  9238528
#> 2061    2L Regions_of_sig_enrichment binding_site  9386051  9387389
#> 2062    2L Regions_of_sig_enrichment binding_site  9387496  9388694
#> 2063    2L Regions_of_sig_enrichment binding_site  9391242  9393529
#> 2064    2L Regions_of_sig_enrichment binding_site  9458960  9460157
#> 2065    2L Regions_of_sig_enrichment binding_site  9463125  9466315
#> 2066    2L Regions_of_sig_enrichment binding_site  9495428  9496520
#> 2067    2L Regions_of_sig_enrichment binding_site  9520185  9521749
#> 2068    2L Regions_of_sig_enrichment binding_site  9567204  9570567
#> 2069    2L Regions_of_sig_enrichment binding_site  9612485  9613662
#> 2070    2L Regions_of_sig_enrichment binding_site  9613924  9615916
#> 2071    2L Regions_of_sig_enrichment binding_site  9616832  9617963
#> 2072    2L Regions_of_sig_enrichment binding_site  9685745  9687099
#> 2073    2L Regions_of_sig_enrichment binding_site  9697970  9699251
#> 2074    2L Regions_of_sig_enrichment binding_site  9702512  9704783
#> 2075    2L Regions_of_sig_enrichment binding_site  9705047  9706840
#> 2076    2L Regions_of_sig_enrichment binding_site  9735472  9736693
#> 2077    2L Regions_of_sig_enrichment binding_site  9776394  9777956
#> 2078    2L Regions_of_sig_enrichment binding_site  9781905  9783190
#> 2079    2L Regions_of_sig_enrichment binding_site  9907044  9908053
#> 2080    2L Regions_of_sig_enrichment binding_site  9908548  9910442
#> 2081    2L Regions_of_sig_enrichment binding_site  9912526  9913816
#> 2082    2L Regions_of_sig_enrichment binding_site  9917662  9918967
#> 2083    2L Regions_of_sig_enrichment binding_site  9937848  9939155
#> 2084    2L Regions_of_sig_enrichment binding_site  9959955  9961359
#> 2085    2L Regions_of_sig_enrichment binding_site 10005856 10007818
#> 2086    2L Regions_of_sig_enrichment binding_site 10009478 10010610
#> 2087    2L Regions_of_sig_enrichment binding_site 10056410 10057886
#> 2088    2L Regions_of_sig_enrichment binding_site 10058554 10060432
#> 2089    2L Regions_of_sig_enrichment binding_site 10244413 10245703
#> 2090    2L Regions_of_sig_enrichment binding_site 10283166 10284419
#> 2091    2L Regions_of_sig_enrichment binding_site 10284613 10286179
#> 2092    2L Regions_of_sig_enrichment binding_site 10311337 10312505
#> 2093    2L Regions_of_sig_enrichment binding_site 10318657 10319758
#> 2094    2L Regions_of_sig_enrichment binding_site 10333991 10335383
#> 2095    2L Regions_of_sig_enrichment binding_site 10376989 10378418
#> 2096    2L Regions_of_sig_enrichment binding_site 10388083 10389978
#> 2097    2L Regions_of_sig_enrichment binding_site 10390408 10391740
#> 2098    2L Regions_of_sig_enrichment binding_site 10392511 10395692
#> 2099    2L Regions_of_sig_enrichment binding_site 10401259 10402434
#> 2100    2L Regions_of_sig_enrichment binding_site 10420909 10422016
#> 2101    2L Regions_of_sig_enrichment binding_site 10515995 10517403
#> 2102    2L Regions_of_sig_enrichment binding_site 10528644 10529755
#> 2103    2L Regions_of_sig_enrichment binding_site 10670736 10672184
#> 2104    2L Regions_of_sig_enrichment binding_site 10743818 10745165
#> 2105    2L Regions_of_sig_enrichment binding_site 10766858 10768053
#> 2106    2L Regions_of_sig_enrichment binding_site 10849522 10851213
#> 2107    2L Regions_of_sig_enrichment binding_site 10858118 10859567
#> 2108    2L Regions_of_sig_enrichment binding_site 10864452 10866447
#> 2109    2L Regions_of_sig_enrichment binding_site 10866737 10868555
#> 2110    2L Regions_of_sig_enrichment binding_site 10964117 10965242
#> 2111    2L Regions_of_sig_enrichment binding_site 10970803 10971822
#> 2112    2L Regions_of_sig_enrichment binding_site 10978154 10979584
#> 2113    2L Regions_of_sig_enrichment binding_site 10985288 10986311
#> 2114    2L Regions_of_sig_enrichment binding_site 10989047 10990138
#> 2115    2L Regions_of_sig_enrichment binding_site 11009032 11010706
#> 2116    2L Regions_of_sig_enrichment binding_site 11038441 11040029
#> 2117    2L Regions_of_sig_enrichment binding_site 11044225 11045240
#> 2118    2L Regions_of_sig_enrichment binding_site 11052554 11053769
#> 2119    2L Regions_of_sig_enrichment binding_site 11056727 11058757
#> 2120    2L Regions_of_sig_enrichment binding_site 11064454 11065528
#> 2121    2L Regions_of_sig_enrichment binding_site 11065689 11067878
#> 2122    2L Regions_of_sig_enrichment binding_site 11106382 11107527
#> 2123    2L Regions_of_sig_enrichment binding_site 11277898 11278943
#> 2124    2L Regions_of_sig_enrichment binding_site 11474068 11475572
#> 2125    2L Regions_of_sig_enrichment binding_site 11516307 11517599
#> 2126    2L Regions_of_sig_enrichment binding_site 11527469 11529166
#> 2127    2L Regions_of_sig_enrichment binding_site 11804387 11805509
#> 2128    2L Regions_of_sig_enrichment binding_site 11805819 11809195
#> 2129    2L Regions_of_sig_enrichment binding_site 11994908 11996206
#> 2130    2L Regions_of_sig_enrichment binding_site 11998819 11999993
#> 2131    2L Regions_of_sig_enrichment binding_site 12002999 12006293
#> 2132    2L Regions_of_sig_enrichment binding_site 12006841 12007883
#> 2133    2L Regions_of_sig_enrichment binding_site 12007984 12012713
#> 2134    2L Regions_of_sig_enrichment binding_site 12013063 12014087
#> 2135    2L Regions_of_sig_enrichment binding_site 12027376 12028418
#> 2136    2L Regions_of_sig_enrichment binding_site 12044447 12046614
#> 2137    2L Regions_of_sig_enrichment binding_site 12133103 12134375
#> 2138    2L Regions_of_sig_enrichment binding_site 12404373 12405436
#> 2139    2L Regions_of_sig_enrichment binding_site 12422255 12425176
#> 2140    2L Regions_of_sig_enrichment binding_site 12433276 12434993
#> 2141    2L Regions_of_sig_enrichment binding_site 12454346 12457283
#> 2142    2L Regions_of_sig_enrichment binding_site 12460098 12465795
#> 2143    2L Regions_of_sig_enrichment binding_site 12468505 12469575
#> 2144    2L Regions_of_sig_enrichment binding_site 12482860 12484374
#> 2145    2L Regions_of_sig_enrichment binding_site 12491668 12492727
#> 2146    2L Regions_of_sig_enrichment binding_site 12492880 12495893
#> 2147    2L Regions_of_sig_enrichment binding_site 12503890 12505089
#> 2148    2L Regions_of_sig_enrichment binding_site 12514770 12516053
#> 2149    2L Regions_of_sig_enrichment binding_site 12529331 12530913
#> 2150    2L Regions_of_sig_enrichment binding_site 12531234 12532844
#> 2151    2L Regions_of_sig_enrichment binding_site 12533678 12536417
#> 2152    2L Regions_of_sig_enrichment binding_site 12541968 12546269
#> 2153    2L Regions_of_sig_enrichment binding_site 12567818 12568980
#> 2154    2L Regions_of_sig_enrichment binding_site 12692306 12693364
#> 2155    2L Regions_of_sig_enrichment binding_site 12708842 12710118
#> 2156    2L Regions_of_sig_enrichment binding_site 12718657 12720389
#> 2157    2L Regions_of_sig_enrichment binding_site 12821808 12823698
#> 2158    2L Regions_of_sig_enrichment binding_site 12836737 12838366
#> 2159    2L Regions_of_sig_enrichment binding_site 13057047 13060962
#> 2160    2L Regions_of_sig_enrichment binding_site 13070979 13074900
#> 2161    2L Regions_of_sig_enrichment binding_site 13081968 13084505
#> 2162    2L Regions_of_sig_enrichment binding_site 13084964 13086157
#> 2163    2L Regions_of_sig_enrichment binding_site 13165167 13166840
#> 2164    2L Regions_of_sig_enrichment binding_site 13190195 13191340
#> 2165    2L Regions_of_sig_enrichment binding_site 13203537 13208646
#> 2166    2L Regions_of_sig_enrichment binding_site 13216015 13217178
#> 2167    2L Regions_of_sig_enrichment binding_site 13218771 13220015
#> 2168    2L Regions_of_sig_enrichment binding_site 13249373 13251327
#> 2169    2L Regions_of_sig_enrichment binding_site 13332791 13334077
#> 2170    2L Regions_of_sig_enrichment binding_site 13370253 13371375
#> 2171    2L Regions_of_sig_enrichment binding_site 13499503 13502380
#> 2172    2L Regions_of_sig_enrichment binding_site 13507238 13508273
#> 2173    2L Regions_of_sig_enrichment binding_site 13509825 13511983
#> 2174    2L Regions_of_sig_enrichment binding_site 13513046 13515149
#> 2175    2L Regions_of_sig_enrichment binding_site 13515462 13516745
#> 2176    2L Regions_of_sig_enrichment binding_site 13568512 13570334
#> 2177    2L Regions_of_sig_enrichment binding_site 13570573 13572133
#> 2178    2L Regions_of_sig_enrichment binding_site 13572284 13574072
#> 2179    2L Regions_of_sig_enrichment binding_site 13576212 13577596
#> 2180    2L Regions_of_sig_enrichment binding_site 13614790 13616572
#> 2181    2L Regions_of_sig_enrichment binding_site 13639794 13641826
#> 2182    2L Regions_of_sig_enrichment binding_site 13812313 13813939
#> 2183    2L Regions_of_sig_enrichment binding_site 13832337 13833423
#> 2184    2L Regions_of_sig_enrichment binding_site 13835227 13836440
#> 2185    2L Regions_of_sig_enrichment binding_site 13837217 13838386
#> 2186    2L Regions_of_sig_enrichment binding_site 13838736 13839911
#> 2187    2L Regions_of_sig_enrichment binding_site 13840688 13842479
#> 2188    2L Regions_of_sig_enrichment binding_site 13877378 13878509
#> 2189    2L Regions_of_sig_enrichment binding_site 13898001 13901094
#> 2190    2L Regions_of_sig_enrichment binding_site 13903358 13906295
#> 2191    2L Regions_of_sig_enrichment binding_site 13911291 13913297
#> 2192    2L Regions_of_sig_enrichment binding_site 14021645 14023218
#> 2193    2L Regions_of_sig_enrichment binding_site 14023855 14025907
#> 2194    2L Regions_of_sig_enrichment binding_site 14160206 14161915
#> 2195    2L Regions_of_sig_enrichment binding_site 14196975 14198026
#> 2196    2L Regions_of_sig_enrichment binding_site 14219134 14222287
#> 2197    2L Regions_of_sig_enrichment binding_site 14233282 14234345
#> 2198    2L Regions_of_sig_enrichment binding_site 14262963 14264427
#> 2199    2L Regions_of_sig_enrichment binding_site 14408883 14410719
#> 2200    2L Regions_of_sig_enrichment binding_site 14490055 14491265
#> 2201    2L Regions_of_sig_enrichment binding_site 14841522 14844437
#> 2202    2L Regions_of_sig_enrichment binding_site 14844586 14845838
#> 2203    2L Regions_of_sig_enrichment binding_site 14850704 14852001
#> 2204    2L Regions_of_sig_enrichment binding_site 14971684 14974420
#> 2205    2L Regions_of_sig_enrichment binding_site 14977396 14980896
#> 2206    2L Regions_of_sig_enrichment binding_site 14995442 14996725
#> 2207    2L Regions_of_sig_enrichment binding_site 15038626 15040088
#> 2208    2L Regions_of_sig_enrichment binding_site 15060153 15061365
#> 2209    2L Regions_of_sig_enrichment binding_site 15256561 15257663
#> 2210    2L Regions_of_sig_enrichment binding_site 15263786 15265699
#> 2211    2L Regions_of_sig_enrichment binding_site 15266000 15267550
#> 2212    2L Regions_of_sig_enrichment binding_site 15498815 15501304
#> 2213    2L Regions_of_sig_enrichment binding_site 15502611 15505862
#> 2214    2L Regions_of_sig_enrichment binding_site 15655320 15656657
#> 2215    2L Regions_of_sig_enrichment binding_site 15688917 15690254
#> 2216    2L Regions_of_sig_enrichment binding_site 15744104 15747022
#> 2217    2L Regions_of_sig_enrichment binding_site 15747367 15749482
#> 2218    2L Regions_of_sig_enrichment binding_site 15760998 15762875
#> 2219    2L Regions_of_sig_enrichment binding_site 15767544 15768737
#> 2220    2L Regions_of_sig_enrichment binding_site 15910539 15914869
#> 2221    2L Regions_of_sig_enrichment binding_site 16246143 16247912
#> 2222    2L Regions_of_sig_enrichment binding_site 16256929 16258033
#> 2223    2L Regions_of_sig_enrichment binding_site 16260154 16261717
#> 2224    2L Regions_of_sig_enrichment binding_site 16267170 16270494
#> 2225    2L Regions_of_sig_enrichment binding_site 16270792 16272638
#> 2226    2L Regions_of_sig_enrichment binding_site 16275663 16276859
#> 2227    2L Regions_of_sig_enrichment binding_site 16281458 16283287
#> 2228    2L Regions_of_sig_enrichment binding_site 16284112 16285160
#> 2229    2L Regions_of_sig_enrichment binding_site 16286888 16288646
#> 2230    2L Regions_of_sig_enrichment binding_site 16324488 16326364
#> 2231    2L Regions_of_sig_enrichment binding_site 16326872 16328073
#> 2232    2L Regions_of_sig_enrichment binding_site 16349945 16354375
#> 2233    2L Regions_of_sig_enrichment binding_site 16446477 16448659
#> 2234    2L Regions_of_sig_enrichment binding_site 16448853 16452294
#> 2235    2L Regions_of_sig_enrichment binding_site 16486686 16487894
#> 2236    2L Regions_of_sig_enrichment binding_site 16491555 16494357
#> 2237    2L Regions_of_sig_enrichment binding_site 16505892 16506982
#> 2238    2L Regions_of_sig_enrichment binding_site 16507256 16508844
#> 2239    2L Regions_of_sig_enrichment binding_site 16508964 16510060
#> 2240    2L Regions_of_sig_enrichment binding_site 16519714 16521811
#> 2241    2L Regions_of_sig_enrichment binding_site 16525383 16527174
#> 2242    2L Regions_of_sig_enrichment binding_site 16527331 16529197
#> 2243    2L Regions_of_sig_enrichment binding_site 16531090 16532149
#> 2244    2L Regions_of_sig_enrichment binding_site 16532645 16533822
#> 2245    2L Regions_of_sig_enrichment binding_site 16535730 16537132
#> 2246    2L Regions_of_sig_enrichment binding_site 16542476 16543753
#> 2247    2L Regions_of_sig_enrichment binding_site 16587600 16588997
#> 2248    2L Regions_of_sig_enrichment binding_site 16594979 16596892
#> 2249    2L Regions_of_sig_enrichment binding_site 16599926 16602134
#> 2250    2L Regions_of_sig_enrichment binding_site 16611393 16613651
#> 2251    2L Regions_of_sig_enrichment binding_site 16620670 16621935
#> 2252    2L Regions_of_sig_enrichment binding_site 16623288 16624663
#> 2253    2L Regions_of_sig_enrichment binding_site 16637161 16639184
#> 2254    2L Regions_of_sig_enrichment binding_site 16639950 16641710
#> 2255    2L Regions_of_sig_enrichment binding_site 16643451 16644465
#> 2256    2L Regions_of_sig_enrichment binding_site 16645417 16646598
#> 2257    2L Regions_of_sig_enrichment binding_site 16661172 16663155
#> 2258    2L Regions_of_sig_enrichment binding_site 16676626 16677632
#> 2259    2L Regions_of_sig_enrichment binding_site 16680402 16681492
#> 2260    2L Regions_of_sig_enrichment binding_site 16702688 16704123
#> 2261    2L Regions_of_sig_enrichment binding_site 16719381 16722565
#> 2262    2L Regions_of_sig_enrichment binding_site 16722873 16724337
#> 2263    2L Regions_of_sig_enrichment binding_site 16791028 16792227
#> 2264    2L Regions_of_sig_enrichment binding_site 16815689 16818349
#> 2265    2L Regions_of_sig_enrichment binding_site 16819919 16820994
#> 2266    2L Regions_of_sig_enrichment binding_site 16837591 16838668
#> 2267    2L Regions_of_sig_enrichment binding_site 16841035 16842509
#> 2268    2L Regions_of_sig_enrichment binding_site 16847853 16849810
#> 2269    2L Regions_of_sig_enrichment binding_site 16852628 16854465
#> 2270    2L Regions_of_sig_enrichment binding_site 16886269 16887526
#> 2271    2L Regions_of_sig_enrichment binding_site 16887767 16889468
#> 2272    2L Regions_of_sig_enrichment binding_site 17377607 17380339
#> 2273    2L Regions_of_sig_enrichment binding_site 17383688 17385449
#> 2274    2L Regions_of_sig_enrichment binding_site 17388628 17389657
#> 2275    2L Regions_of_sig_enrichment binding_site 17426115 17428529
#> 2276    2L Regions_of_sig_enrichment binding_site 17429467 17431233
#> 2277    2L Regions_of_sig_enrichment binding_site 17449661 17451156
#> 2278    2L Regions_of_sig_enrichment binding_site 17474906 17477458
#> 2279    2L Regions_of_sig_enrichment binding_site 17603107 17604145
#> 2280    2L Regions_of_sig_enrichment binding_site 17962853 17964211
#> 2281    2L Regions_of_sig_enrichment binding_site 18143485 18144541
#> 2282    2L Regions_of_sig_enrichment binding_site 18149202 18150722
#> 2283    2L Regions_of_sig_enrichment binding_site 18151234 18152364
#> 2284    2L Regions_of_sig_enrichment binding_site 18292910 18294059
#> 2285    2L Regions_of_sig_enrichment binding_site 18294180 18295593
#> 2286    2L Regions_of_sig_enrichment binding_site 18297985 18299336
#> 2287    2L Regions_of_sig_enrichment binding_site 18440503 18442744
#> 2288    2L Regions_of_sig_enrichment binding_site 18449427 18450430
#> 2289    2L Regions_of_sig_enrichment binding_site 18454232 18455282
#> 2290    2L Regions_of_sig_enrichment binding_site 18512713 18513746
#> 2291    2L Regions_of_sig_enrichment binding_site 18557840 18559297
#> 2292    2L Regions_of_sig_enrichment binding_site 18561125 18564260
#> 2293    2L Regions_of_sig_enrichment binding_site 18565547 18566750
#> 2294    2L Regions_of_sig_enrichment binding_site 18569300 18570321
#> 2295    2L Regions_of_sig_enrichment binding_site 18570733 18572220
#> 2296    2L Regions_of_sig_enrichment binding_site 18602184 18603301
#> 2297    2L Regions_of_sig_enrichment binding_site 18626010 18627240
#> 2298    2L Regions_of_sig_enrichment binding_site 18630503 18631830
#> 2299    2L Regions_of_sig_enrichment binding_site 18665150 18666881
#> 2300    2L Regions_of_sig_enrichment binding_site 18677979 18679549
#> 2301    2L Regions_of_sig_enrichment binding_site 18690899 18693029
#> 2302    2L Regions_of_sig_enrichment binding_site 18693610 18696636
#> 2303    2L Regions_of_sig_enrichment binding_site 18701927 18703244
#> 2304    2L Regions_of_sig_enrichment binding_site 18712801 18715339
#> 2305    2L Regions_of_sig_enrichment binding_site 18776209 18777864
#> 2306    2L Regions_of_sig_enrichment binding_site 18782417 18783757
#> 2307    2L Regions_of_sig_enrichment binding_site 18786688 18788057
#> 2308    2L Regions_of_sig_enrichment binding_site 18795505 18796934
#> 2309    2L Regions_of_sig_enrichment binding_site 18817767 18819566
#> 2310    2L Regions_of_sig_enrichment binding_site 18830323 18831584
#> 2311    2L Regions_of_sig_enrichment binding_site 18837130 18838579
#> 2312    2L Regions_of_sig_enrichment binding_site 18844899 18846005
#> 2313    2L Regions_of_sig_enrichment binding_site 18943425 18944827
#> 2314    2L Regions_of_sig_enrichment binding_site 18951173 18952596
#> 2315    2L Regions_of_sig_enrichment binding_site 18974444 18976989
#> 2316    2L Regions_of_sig_enrichment binding_site 18981617 18985585
#> 2317    2L Regions_of_sig_enrichment binding_site 19034736 19035943
#> 2318    2L Regions_of_sig_enrichment binding_site 19036492 19037843
#> 2319    2L Regions_of_sig_enrichment binding_site 19133668 19138409
#> 2320    2L Regions_of_sig_enrichment binding_site 19140025 19145173
#> 2321    2L Regions_of_sig_enrichment binding_site 19156687 19162221
#> 2322    2L Regions_of_sig_enrichment binding_site 19162567 19166738
#> 2323    2L Regions_of_sig_enrichment binding_site 19361458 19364298
#> 2324    2L Regions_of_sig_enrichment binding_site 19396691 19398571
#> 2325    2L Regions_of_sig_enrichment binding_site 19411087 19412339
#> 2326    2L Regions_of_sig_enrichment binding_site 19413531 19414677
#> 2327    2L Regions_of_sig_enrichment binding_site 19414789 19416055
#> 2328    2L Regions_of_sig_enrichment binding_site 19423962 19426803
#> 2329    2L Regions_of_sig_enrichment binding_site 19431622 19433313
#> 2330    2L Regions_of_sig_enrichment binding_site 19444048 19445425
#> 2331    2L Regions_of_sig_enrichment binding_site 19454621 19456520
#> 2332    2L Regions_of_sig_enrichment binding_site 19492495 19494179
#> 2333    2L Regions_of_sig_enrichment binding_site 19526372 19529216
#> 2334    2L Regions_of_sig_enrichment binding_site 19532269 19534243
#> 2335    2L Regions_of_sig_enrichment binding_site 19546670 19548646
#> 2336    2L Regions_of_sig_enrichment binding_site 19548876 19550191
#> 2337    2L Regions_of_sig_enrichment binding_site 19570105 19571155
#> 2338    2L Regions_of_sig_enrichment binding_site 19571556 19578056
#> 2339    2L Regions_of_sig_enrichment binding_site 19586399 19587425
#> 2340    2L Regions_of_sig_enrichment binding_site 19790136 19791602
#> 2341    2L Regions_of_sig_enrichment binding_site 19865167 19866854
#> 2342    2L Regions_of_sig_enrichment binding_site 19886991 19888019
#> 2343    2L Regions_of_sig_enrichment binding_site 19914237 19915738
#> 2344    2L Regions_of_sig_enrichment binding_site 19934322 19936016
#> 2345    2L Regions_of_sig_enrichment binding_site 19941139 19943068
#> 2346    2L Regions_of_sig_enrichment binding_site 20024769 20025881
#> 2347    2L Regions_of_sig_enrichment binding_site 20060744 20062747
#> 2348    2L Regions_of_sig_enrichment binding_site 20065960 20066971
#> 2349    2L Regions_of_sig_enrichment binding_site 20083543 20085564
#> 2350    2L Regions_of_sig_enrichment binding_site 20090949 20092712
#> 2351    2L Regions_of_sig_enrichment binding_site 20287216 20288669
#> 2352    2L Regions_of_sig_enrichment binding_site 20290357 20291416
#> 2353    2L Regions_of_sig_enrichment binding_site 20333823 20335349
#> 2354    2L Regions_of_sig_enrichment binding_site 20339738 20342064
#> 2355    2L Regions_of_sig_enrichment binding_site 20383923 20386304
#> 2356    2L Regions_of_sig_enrichment binding_site 20416879 20418338
#> 2357    2L Regions_of_sig_enrichment binding_site 20428969 20430666
#> 2358    2L Regions_of_sig_enrichment binding_site 20448931 20450193
#> 2359    2L Regions_of_sig_enrichment binding_site 20458048 20459310
#> 2360    2L Regions_of_sig_enrichment binding_site 20459896 20461056
#> 2361    2L Regions_of_sig_enrichment binding_site 20464536 20465596
#> 2362    2L Regions_of_sig_enrichment binding_site 20649542 20650805
#> 2363    2L Regions_of_sig_enrichment binding_site 20652185 20653919
#> 2364    2L Regions_of_sig_enrichment binding_site 20678079 20679967
#> 2365    2L Regions_of_sig_enrichment binding_site 20714647 20717304
#> 2366    2L Regions_of_sig_enrichment binding_site 20734116 20735379
#> 2367    2L Regions_of_sig_enrichment binding_site 20748990 20750592
#> 2368    2L Regions_of_sig_enrichment binding_site 20751846 20752868
#> 2369    2L Regions_of_sig_enrichment binding_site 20757485 20760306
#> 2370    2L Regions_of_sig_enrichment binding_site 20792566 20794338
#> 2371    2L Regions_of_sig_enrichment binding_site 20796656 20798150
#> 2372    2L Regions_of_sig_enrichment binding_site 20799565 20801548
#> 2373    2L Regions_of_sig_enrichment binding_site 20803461 20808270
#> 2374    2L Regions_of_sig_enrichment binding_site 20821653 20823218
#> 2375    2L Regions_of_sig_enrichment binding_site 20823404 20826895
#> 2376    2L Regions_of_sig_enrichment binding_site 20829898 20832000
#> 2377    2L Regions_of_sig_enrichment binding_site 20868624 20870100
#> 2378    2L Regions_of_sig_enrichment binding_site 20873498 20875620
#> 2379    2L Regions_of_sig_enrichment binding_site 20878158 20879373
#> 2380    2L Regions_of_sig_enrichment binding_site 20912255 20914748
#> 2381    2L Regions_of_sig_enrichment binding_site 20917096 20919962
#> 2382    2L Regions_of_sig_enrichment binding_site 20926899 20928072
#> 2383    2L Regions_of_sig_enrichment binding_site 21038590 21040724
#> 2384    2L Regions_of_sig_enrichment binding_site 21051544 21052770
#> 2385    2L Regions_of_sig_enrichment binding_site 21053288 21054641
#> 2386    2L Regions_of_sig_enrichment binding_site 21084946 21087534
#> 2387    2L Regions_of_sig_enrichment binding_site 21096480 21097721
#> 2388    2L Regions_of_sig_enrichment binding_site 21102188 21104239
#> 2389    2L Regions_of_sig_enrichment binding_site 21107494 21108719
#> 2390    2L Regions_of_sig_enrichment binding_site 21141340 21142592
#> 2391    2L Regions_of_sig_enrichment binding_site 21162406 21163942
#> 2392    2L Regions_of_sig_enrichment binding_site 21164065 21166312
#> 2393    2L Regions_of_sig_enrichment binding_site 21167958 21170146
#> 2394    2L Regions_of_sig_enrichment binding_site 21178485 21179542
#> 2395    2L Regions_of_sig_enrichment binding_site 21216216 21218104
#> 2396    2L Regions_of_sig_enrichment binding_site 21218536 21221340
#> 2397    2L Regions_of_sig_enrichment binding_site 21250188 21252234
#> 2398    2L Regions_of_sig_enrichment binding_site 21262808 21263942
#> 2399    2L Regions_of_sig_enrichment binding_site 21307849 21310190
#> 2400    2L Regions_of_sig_enrichment binding_site 21311345 21312466
#> 2401    2L Regions_of_sig_enrichment binding_site 21312904 21314466
#> 2402    2L Regions_of_sig_enrichment binding_site 21344106 21345217
#> 2403    2L Regions_of_sig_enrichment binding_site 21573275 21574487
#> 2404    2L Regions_of_sig_enrichment binding_site 21623230 21625066
#> 2405    2L Regions_of_sig_enrichment binding_site 21628432 21630309
#> 2406    2L Regions_of_sig_enrichment binding_site 21657019 21659254
#> 2407    2L Regions_of_sig_enrichment binding_site 21659746 21660837
#> 2408    2L Regions_of_sig_enrichment binding_site 21676482 21678806
#> 2409    2L Regions_of_sig_enrichment binding_site 21752883 21753901
#> 2410    2L Regions_of_sig_enrichment binding_site 21794583 21795599
#> 2411    2L Regions_of_sig_enrichment binding_site 21827531 21830235
#> 2412    2L Regions_of_sig_enrichment binding_site 21899029 21900239
#> 2413    2L Regions_of_sig_enrichment binding_site 21929894 21931466
#> 2414    2L Regions_of_sig_enrichment binding_site 22121746 22123879
#> 2415    2L Regions_of_sig_enrichment binding_site 22128177 22130382
#> 2416    2L Regions_of_sig_enrichment binding_site 22133864 22135202
#> 2417    2L Regions_of_sig_enrichment binding_site 22167454 22169847
#> 2418    2L Regions_of_sig_enrichment binding_site 22181020 22182107
#> 2419    2L Regions_of_sig_enrichment binding_site 22240145 22241184
#> 2420    2L  Regions_of_sig_depletion binding_site   377121   378552
#> 2421    2L  Regions_of_sig_depletion binding_site   710271   711342
#> 2422    2L  Regions_of_sig_depletion binding_site   756595   757951
#> 2423    2L  Regions_of_sig_depletion binding_site  1824912  1826161
#> 2424    2L  Regions_of_sig_depletion binding_site  4262644  4263769
#> 2425    2L  Regions_of_sig_depletion binding_site  4302571  4303708
#> 2426    2L  Regions_of_sig_depletion binding_site  4565706  4567192
#> 2427    2L  Regions_of_sig_depletion binding_site  5590071  5591136
#> 2428    2L  Regions_of_sig_depletion binding_site  7006141  7007406
#> 2429    2L  Regions_of_sig_depletion binding_site  8769382  8770396
#> 2430    2L  Regions_of_sig_depletion binding_site  8876943  8877995
#> 2431    2L  Regions_of_sig_depletion binding_site  8879944  8881361
#> 2432    2L  Regions_of_sig_depletion binding_site  9315508  9316542
#> 2433    2L  Regions_of_sig_depletion binding_site  9822010  9823083
#> 2434    2L  Regions_of_sig_depletion binding_site 10136285 10137451
#> 2435    2L  Regions_of_sig_depletion binding_site 10695589 10696722
#> 2436    2L  Regions_of_sig_depletion binding_site 15843180 15844428
#> 2437    2L  Regions_of_sig_depletion binding_site 16106955 16108053
#> 2438    2L  Regions_of_sig_depletion binding_site 20035693 20036897
#> 2439    2L  Regions_of_sig_depletion binding_site 20377301 20378511
#> 2440     X Regions_of_sig_enrichment binding_site   146115   147220
#> 2441     X Regions_of_sig_enrichment binding_site   171743   173895
#> 2442     X Regions_of_sig_enrichment binding_site   230217   231316
#> 2443     X Regions_of_sig_enrichment binding_site   255257   256422
#> 2444     X Regions_of_sig_enrichment binding_site   386987   388110
#> 2445     X Regions_of_sig_enrichment binding_site   392105   393663
#> 2446     X Regions_of_sig_enrichment binding_site   394635   395912
#> 2447     X Regions_of_sig_enrichment binding_site   415466   417899
#> 2448     X Regions_of_sig_enrichment binding_site   513139   514319
#> 2449     X Regions_of_sig_enrichment binding_site   530417   531842
#> 2450     X Regions_of_sig_enrichment binding_site   650231   651283
#> 2451     X Regions_of_sig_enrichment binding_site   677623   679162
#> 2452     X Regions_of_sig_enrichment binding_site  1175977  1177135
#> 2453     X Regions_of_sig_enrichment binding_site  1179514  1181458
#> 2454     X Regions_of_sig_enrichment binding_site  1355759  1357363
#> 2455     X Regions_of_sig_enrichment binding_site  1360577  1361740
#> 2456     X Regions_of_sig_enrichment binding_site  1374199  1375450
#> 2457     X Regions_of_sig_enrichment binding_site  1377150  1378239
#> 2458     X Regions_of_sig_enrichment binding_site  1408499  1409611
#> 2459     X Regions_of_sig_enrichment binding_site  1409775  1412092
#> 2460     X Regions_of_sig_enrichment binding_site  1503685  1504779
#> 2461     X Regions_of_sig_enrichment binding_site  1510507  1517331
#> 2462     X Regions_of_sig_enrichment binding_site  1517446  1518464
#> 2463     X Regions_of_sig_enrichment binding_site  1563108  1567761
#> 2464     X Regions_of_sig_enrichment binding_site  1567903  1570000
#> 2465     X Regions_of_sig_enrichment binding_site  1572393  1573625
#> 2466     X Regions_of_sig_enrichment binding_site  1578070  1579126
#> 2467     X Regions_of_sig_enrichment binding_site  1584836  1586622
#> 2468     X Regions_of_sig_enrichment binding_site  1673144  1675475
#> 2469     X Regions_of_sig_enrichment binding_site  1676273  1677787
#> 2470     X Regions_of_sig_enrichment binding_site  1724893  1726090
#> 2471     X Regions_of_sig_enrichment binding_site  1727977  1729078
#> 2472     X Regions_of_sig_enrichment binding_site  1732711  1735431
#> 2473     X Regions_of_sig_enrichment binding_site  1735862  1737692
#> 2474     X Regions_of_sig_enrichment binding_site  1751749  1753196
#> 2475     X Regions_of_sig_enrichment binding_site  1755296  1756383
#> 2476     X Regions_of_sig_enrichment binding_site  1756786  1759129
#> 2477     X Regions_of_sig_enrichment binding_site  1773744  1775193
#> 2478     X Regions_of_sig_enrichment binding_site  1775378  1776718
#> 2479     X Regions_of_sig_enrichment binding_site  1777460  1779741
#> 2480     X Regions_of_sig_enrichment binding_site  1780982  1782420
#> 2481     X Regions_of_sig_enrichment binding_site  1786693  1788463
#> 2482     X Regions_of_sig_enrichment binding_site  1790511  1791580
#> 2483     X Regions_of_sig_enrichment binding_site  1791964  1795167
#> 2484     X Regions_of_sig_enrichment binding_site  1796870  1799097
#> 2485     X Regions_of_sig_enrichment binding_site  1800689  1802458
#> 2486     X Regions_of_sig_enrichment binding_site  1802577  1804057
#> 2487     X Regions_of_sig_enrichment binding_site  1806448  1807450
#> 2488     X Regions_of_sig_enrichment binding_site  1816491  1818519
#> 2489     X Regions_of_sig_enrichment binding_site  1821900  1822968
#> 2490     X Regions_of_sig_enrichment binding_site  1823399  1824598
#> 2491     X Regions_of_sig_enrichment binding_site  1856853  1858700
#> 2492     X Regions_of_sig_enrichment binding_site  1898625  1901137
#> 2493     X Regions_of_sig_enrichment binding_site  1902875  1904110
#> 2494     X Regions_of_sig_enrichment binding_site  1904266  1906418
#> 2495     X Regions_of_sig_enrichment binding_site  1907601  1908790
#> 2496     X Regions_of_sig_enrichment binding_site  1910939  1912683
#> 2497     X Regions_of_sig_enrichment binding_site  1914317  1915373
#> 2498     X Regions_of_sig_enrichment binding_site  1916041  1918111
#> 2499     X Regions_of_sig_enrichment binding_site  1934981  1936353
#> 2500     X Regions_of_sig_enrichment binding_site  1954972  1956801
#> 2501     X Regions_of_sig_enrichment binding_site  1959830  1960893
#> 2502     X Regions_of_sig_enrichment binding_site  1963401  1966718
#> 2503     X Regions_of_sig_enrichment binding_site  1980289  1982589
#> 2504     X Regions_of_sig_enrichment binding_site  1982870  1984123
#> 2505     X Regions_of_sig_enrichment binding_site  1985857  1987325
#> 2506     X Regions_of_sig_enrichment binding_site  2007729  2008864
#> 2507     X Regions_of_sig_enrichment binding_site  2010128  2011390
#> 2508     X Regions_of_sig_enrichment binding_site  2011741  2012929
#> 2509     X Regions_of_sig_enrichment binding_site  2014603  2016396
#> 2510     X Regions_of_sig_enrichment binding_site  2016625  2017867
#> 2511     X Regions_of_sig_enrichment binding_site  2021784  2022866
#> 2512     X Regions_of_sig_enrichment binding_site  2030314  2032728
#> 2513     X Regions_of_sig_enrichment binding_site  2039719  2041023
#> 2514     X Regions_of_sig_enrichment binding_site  2044521  2045631
#> 2515     X Regions_of_sig_enrichment binding_site  2048068  2049120
#> 2516     X Regions_of_sig_enrichment binding_site  2051521  2052774
#> 2517     X Regions_of_sig_enrichment binding_site  2068769  2069878
#> 2518     X Regions_of_sig_enrichment binding_site  2088032  2089087
#> 2519     X Regions_of_sig_enrichment binding_site  2111871  2113167
#> 2520     X Regions_of_sig_enrichment binding_site  2113703  2114948
#> 2521     X Regions_of_sig_enrichment binding_site  2115142  2116728
#> 2522     X Regions_of_sig_enrichment binding_site  2120659  2122671
#> 2523     X Regions_of_sig_enrichment binding_site  2124076  2125228
#> 2524     X Regions_of_sig_enrichment binding_site  2125645  2126674
#> 2525     X Regions_of_sig_enrichment binding_site  2128846  2129975
#> 2526     X Regions_of_sig_enrichment binding_site  2130254  2131856
#> 2527     X Regions_of_sig_enrichment binding_site  2132125  2133243
#> 2528     X Regions_of_sig_enrichment binding_site  2159385  2160604
#> 2529     X Regions_of_sig_enrichment binding_site  2161343  2162385
#> 2530     X Regions_of_sig_enrichment binding_site  2163063  2165515
#> 2531     X Regions_of_sig_enrichment binding_site  2180138  2181234
#> 2532     X Regions_of_sig_enrichment binding_site  2188078  2189186
#> 2533     X Regions_of_sig_enrichment binding_site  2190247  2192871
#> 2534     X Regions_of_sig_enrichment binding_site  2198142  2199200
#> 2535     X Regions_of_sig_enrichment binding_site  2199532  2200806
#> 2536     X Regions_of_sig_enrichment binding_site  2227954  2229932
#> 2537     X Regions_of_sig_enrichment binding_site  2230245  2231541
#> 2538     X Regions_of_sig_enrichment binding_site  2236636  2237663
#> 2539     X Regions_of_sig_enrichment binding_site  2363590  2364597
#> 2540     X Regions_of_sig_enrichment binding_site  2368656  2370157
#> 2541     X Regions_of_sig_enrichment binding_site  2382098  2383153
#> 2542     X Regions_of_sig_enrichment binding_site  2424785  2426008
#> 2543     X Regions_of_sig_enrichment binding_site  2436843  2438345
#> 2544     X Regions_of_sig_enrichment binding_site  2438671  2440524
#> 2545     X Regions_of_sig_enrichment binding_site  2483038  2484594
#> 2546     X Regions_of_sig_enrichment binding_site  2484813  2486652
#> 2547     X Regions_of_sig_enrichment binding_site  2487464  2490413
#> 2548     X Regions_of_sig_enrichment binding_site  2491689  2493194
#> 2549     X Regions_of_sig_enrichment binding_site  2498742  2499860
#> 2550     X Regions_of_sig_enrichment binding_site  2502177  2503425
#> 2551     X Regions_of_sig_enrichment binding_site  2514838  2516097
#> 2552     X Regions_of_sig_enrichment binding_site  2520804  2522048
#> 2553     X Regions_of_sig_enrichment binding_site  2524926  2525998
#> 2554     X Regions_of_sig_enrichment binding_site  2539568  2540738
#> 2555     X Regions_of_sig_enrichment binding_site  2540882  2542916
#> 2556     X Regions_of_sig_enrichment binding_site  2544395  2545487
#> 2557     X Regions_of_sig_enrichment binding_site  2545607  2547955
#> 2558     X Regions_of_sig_enrichment binding_site  2557169  2558425
#> 2559     X Regions_of_sig_enrichment binding_site  2592120  2593938
#> 2560     X Regions_of_sig_enrichment binding_site  2628134  2629867
#> 2561     X Regions_of_sig_enrichment binding_site  2630108  2631725
#> 2562     X Regions_of_sig_enrichment binding_site  2636590  2638176
#> 2563     X Regions_of_sig_enrichment binding_site  2681508  2682713
#> 2564     X Regions_of_sig_enrichment binding_site  3028010  3029838
#> 2565     X Regions_of_sig_enrichment binding_site  3055383  3057464
#> 2566     X Regions_of_sig_enrichment binding_site  3069958  3071909
#> 2567     X Regions_of_sig_enrichment binding_site  3181904  3183202
#> 2568     X Regions_of_sig_enrichment binding_site  3237162  3238272
#> 2569     X Regions_of_sig_enrichment binding_site  3283301  3284529
#> 2570     X Regions_of_sig_enrichment binding_site  3298966  3300303
#> 2571     X Regions_of_sig_enrichment binding_site  3327643  3328786
#> 2572     X Regions_of_sig_enrichment binding_site  3338032  3339159
#> 2573     X Regions_of_sig_enrichment binding_site  3566958  3568272
#> 2574     X Regions_of_sig_enrichment binding_site  3570440  3572592
#> 2575     X Regions_of_sig_enrichment binding_site  3581298  3583443
#> 2576     X Regions_of_sig_enrichment binding_site  3593029  3595365
#> 2577     X Regions_of_sig_enrichment binding_site  3598234  3599313
#> 2578     X Regions_of_sig_enrichment binding_site  3612773  3614902
#> 2579     X Regions_of_sig_enrichment binding_site  3633292  3634839
#> 2580     X Regions_of_sig_enrichment binding_site  3636265  3637350
#> 2581     X Regions_of_sig_enrichment binding_site  3637512  3638714
#> 2582     X Regions_of_sig_enrichment binding_site  3638830  3640094
#> 2583     X Regions_of_sig_enrichment binding_site  3667249  3668953
#> 2584     X Regions_of_sig_enrichment binding_site  3669690  3671134
#> 2585     X Regions_of_sig_enrichment binding_site  3673175  3675785
#> 2586     X Regions_of_sig_enrichment binding_site  3676816  3677825
#> 2587     X Regions_of_sig_enrichment binding_site  3685197  3686683
#> 2588     X Regions_of_sig_enrichment binding_site  3694280  3695482
#> 2589     X Regions_of_sig_enrichment binding_site  3705226  3706402
#> 2590     X Regions_of_sig_enrichment binding_site  3755036  3756935
#> 2591     X Regions_of_sig_enrichment binding_site  3762024  3763377
#> 2592     X Regions_of_sig_enrichment binding_site  3773171  3774311
#> 2593     X Regions_of_sig_enrichment binding_site  3843694  3844806
#> 2594     X Regions_of_sig_enrichment binding_site  3847445  3848923
#> 2595     X Regions_of_sig_enrichment binding_site  3851084  3852096
#> 2596     X Regions_of_sig_enrichment binding_site  3858913  3859929
#> 2597     X Regions_of_sig_enrichment binding_site  4000454  4003691
#> 2598     X Regions_of_sig_enrichment binding_site  4007771  4011268
#> 2599     X Regions_of_sig_enrichment binding_site  4017956  4020046
#> 2600     X Regions_of_sig_enrichment binding_site  4020439  4022167
#> 2601     X Regions_of_sig_enrichment binding_site  4212186  4213961
#> 2602     X Regions_of_sig_enrichment binding_site  4216406  4219610
#> 2603     X Regions_of_sig_enrichment binding_site  4282877  4284027
#> 2604     X Regions_of_sig_enrichment binding_site  4522994  4524998
#> 2605     X Regions_of_sig_enrichment binding_site  4526271  4528069
#> 2606     X Regions_of_sig_enrichment binding_site  4545875  4547377
#> 2607     X Regions_of_sig_enrichment binding_site  4560910  4562205
#> 2608     X Regions_of_sig_enrichment binding_site  4564208  4565336
#> 2609     X Regions_of_sig_enrichment binding_site  4579545  4580831
#> 2610     X Regions_of_sig_enrichment binding_site  4583643  4584644
#> 2611     X Regions_of_sig_enrichment binding_site  4585988  4587088
#> 2612     X Regions_of_sig_enrichment binding_site  4598642  4600085
#> 2613     X Regions_of_sig_enrichment binding_site  4802846  4804953
#> 2614     X Regions_of_sig_enrichment binding_site  4805993  4807037
#> 2615     X Regions_of_sig_enrichment binding_site  4846326  4848248
#> 2616     X Regions_of_sig_enrichment binding_site  4975497  4977325
#> 2617     X Regions_of_sig_enrichment binding_site  5046417  5048021
#> 2618     X Regions_of_sig_enrichment binding_site  5309247  5310598
#> 2619     X Regions_of_sig_enrichment binding_site  5312004  5313122
#> 2620     X Regions_of_sig_enrichment binding_site  5313508  5315241
#> 2621     X Regions_of_sig_enrichment binding_site  5315707  5317007
#> 2622     X Regions_of_sig_enrichment binding_site  5323483  5324565
#> 2623     X Regions_of_sig_enrichment binding_site  5330105  5331213
#> 2624     X Regions_of_sig_enrichment binding_site  5412339  5413419
#> 2625     X Regions_of_sig_enrichment binding_site  5506410  5507457
#> 2626     X Regions_of_sig_enrichment binding_site  5514236  5516904
#> 2627     X Regions_of_sig_enrichment binding_site  5566271  5568268
#> 2628     X Regions_of_sig_enrichment binding_site  5629050  5630591
#> 2629     X Regions_of_sig_enrichment binding_site  5632562  5635364
#> 2630     X Regions_of_sig_enrichment binding_site  5639624  5640964
#> 2631     X Regions_of_sig_enrichment binding_site  5648917  5650936
#> 2632     X Regions_of_sig_enrichment binding_site  5652584  5654804
#> 2633     X Regions_of_sig_enrichment binding_site  5783578  5784649
#> 2634     X Regions_of_sig_enrichment binding_site  5785557  5787738
#> 2635     X Regions_of_sig_enrichment binding_site  5793423  5796443
#> 2636     X Regions_of_sig_enrichment binding_site  5803958  5806286
#> 2637     X Regions_of_sig_enrichment binding_site  5809673  5811511
#> 2638     X Regions_of_sig_enrichment binding_site  5813352  5814635
#> 2639     X Regions_of_sig_enrichment binding_site  6117890  6118960
#> 2640     X Regions_of_sig_enrichment binding_site  6121085  6122178
#> 2641     X Regions_of_sig_enrichment binding_site  6122912  6124658
#> 2642     X Regions_of_sig_enrichment binding_site  6126067  6127245
#> 2643     X Regions_of_sig_enrichment binding_site  6133867  6134943
#> 2644     X Regions_of_sig_enrichment binding_site  6135996  6139317
#> 2645     X Regions_of_sig_enrichment binding_site  6146818  6147825
#> 2646     X Regions_of_sig_enrichment binding_site  6148538  6149556
#> 2647     X Regions_of_sig_enrichment binding_site  6154083  6155526
#> 2648     X Regions_of_sig_enrichment binding_site  6156460  6159782
#> 2649     X Regions_of_sig_enrichment binding_site  6171231  6173911
#> 2650     X Regions_of_sig_enrichment binding_site  6188564  6189736
#> 2651     X Regions_of_sig_enrichment binding_site  6231749  6233635
#> 2652     X Regions_of_sig_enrichment binding_site  6239004  6240121
#> 2653     X Regions_of_sig_enrichment binding_site  6249682  6250857
#> 2654     X Regions_of_sig_enrichment binding_site  6254876  6255972
#> 2655     X Regions_of_sig_enrichment binding_site  6259849  6262455
#> 2656     X Regions_of_sig_enrichment binding_site  6263603  6265080
#> 2657     X Regions_of_sig_enrichment binding_site  6265406  6266411
#> 2658     X Regions_of_sig_enrichment binding_site  6494672  6497415
#> 2659     X Regions_of_sig_enrichment binding_site  6541324  6542675
#> 2660     X Regions_of_sig_enrichment binding_site  6548121  6549260
#> 2661     X Regions_of_sig_enrichment binding_site  6550620  6552157
#> 2662     X Regions_of_sig_enrichment binding_site  6552321  6554191
#> 2663     X Regions_of_sig_enrichment binding_site  6557258  6559128
#> 2664     X Regions_of_sig_enrichment binding_site  6559512  6560787
#> 2665     X Regions_of_sig_enrichment binding_site  6561139  6562143
#> 2666     X Regions_of_sig_enrichment binding_site  6565349  6566357
#> 2667     X Regions_of_sig_enrichment binding_site  6652777  6654230
#> 2668     X Regions_of_sig_enrichment binding_site  6661980  6663495
#> 2669     X Regions_of_sig_enrichment binding_site  6667600  6668616
#> 2670     X Regions_of_sig_enrichment binding_site  6687662  6690166
#> 2671     X Regions_of_sig_enrichment binding_site  6697762  6699927
#> 2672     X Regions_of_sig_enrichment binding_site  6700465  6701511
#> 2673     X Regions_of_sig_enrichment binding_site  6719886  6721137
#> 2674     X Regions_of_sig_enrichment binding_site  6729364  6732026
#> 2675     X Regions_of_sig_enrichment binding_site  6753332  6754922
#> 2676     X Regions_of_sig_enrichment binding_site  6755203  6757659
#> 2677     X Regions_of_sig_enrichment binding_site  6762071  6763119
#> 2678     X Regions_of_sig_enrichment binding_site  6892090  6893263
#> 2679     X Regions_of_sig_enrichment binding_site  6899368  6900683
#> 2680     X Regions_of_sig_enrichment binding_site  6989569  6992346
#> 2681     X Regions_of_sig_enrichment binding_site  7089101  7091209
#> 2682     X Regions_of_sig_enrichment binding_site  7182765  7183785
#> 2683     X Regions_of_sig_enrichment binding_site  7184729  7185944
#> 2684     X Regions_of_sig_enrichment binding_site  7187012  7188937
#> 2685     X Regions_of_sig_enrichment binding_site  7199439  7200564
#> 2686     X Regions_of_sig_enrichment binding_site  7201191  7202522
#> 2687     X Regions_of_sig_enrichment binding_site  7215017  7216730
#> 2688     X Regions_of_sig_enrichment binding_site  7501829  7502963
#> 2689     X Regions_of_sig_enrichment binding_site  7508675  7509774
#> 2690     X Regions_of_sig_enrichment binding_site  7511163  7512421
#> 2691     X Regions_of_sig_enrichment binding_site  7528278  7529879
#> 2692     X Regions_of_sig_enrichment binding_site  7543348  7546544
#> 2693     X Regions_of_sig_enrichment binding_site  7581098  7582236
#> 2694     X Regions_of_sig_enrichment binding_site  7586375  7588446
#> 2695     X Regions_of_sig_enrichment binding_site  7589709  7590880
#> 2696     X Regions_of_sig_enrichment binding_site  7593103  7594339
#> 2697     X Regions_of_sig_enrichment binding_site  7595368  7596534
#> 2698     X Regions_of_sig_enrichment binding_site  7598318  7599583
#> 2699     X Regions_of_sig_enrichment binding_site  7599888  7601464
#> 2700     X Regions_of_sig_enrichment binding_site  7603397  7605028
#> 2701     X Regions_of_sig_enrichment binding_site  7618566  7620165
#> 2702     X Regions_of_sig_enrichment binding_site  7622773  7624120
#> 2703     X Regions_of_sig_enrichment binding_site  7625872  7626890
#> 2704     X Regions_of_sig_enrichment binding_site  7628735  7629987
#> 2705     X Regions_of_sig_enrichment binding_site  7785675  7787076
#> 2706     X Regions_of_sig_enrichment binding_site  7791250  7793845
#> 2707     X Regions_of_sig_enrichment binding_site  7804749  7807621
#> 2708     X Regions_of_sig_enrichment binding_site  7824481  7825647
#> 2709     X Regions_of_sig_enrichment binding_site  7831632  7832874
#> 2710     X Regions_of_sig_enrichment binding_site  7835276  7836488
#> 2711     X Regions_of_sig_enrichment binding_site  7838070  7841292
#> 2712     X Regions_of_sig_enrichment binding_site  7846837  7848115
#> 2713     X Regions_of_sig_enrichment binding_site  7853169  7854206
#> 2714     X Regions_of_sig_enrichment binding_site  7854321  7855569
#> 2715     X Regions_of_sig_enrichment binding_site  7861015  7862569
#> 2716     X Regions_of_sig_enrichment binding_site  7937477  7938549
#> 2717     X Regions_of_sig_enrichment binding_site  7943056  7944100
#> 2718     X Regions_of_sig_enrichment binding_site  7948856  7953302
#> 2719     X Regions_of_sig_enrichment binding_site  7956012  7957994
#> 2720     X Regions_of_sig_enrichment binding_site  7962468  7963535
#> 2721     X Regions_of_sig_enrichment binding_site  7964674  7966935
#> 2722     X Regions_of_sig_enrichment binding_site  7980889  7982011
#> 2723     X Regions_of_sig_enrichment binding_site  7985450  7988147
#> 2724     X Regions_of_sig_enrichment binding_site  7994506  7995988
#> 2725     X Regions_of_sig_enrichment binding_site  8007046  8010327
#> 2726     X Regions_of_sig_enrichment binding_site  8031113  8032593
#> 2727     X Regions_of_sig_enrichment binding_site  8034785  8035806
#> 2728     X Regions_of_sig_enrichment binding_site  8044226  8045276
#> 2729     X Regions_of_sig_enrichment binding_site  8068543  8069552
#> 2730     X Regions_of_sig_enrichment binding_site  8087142  8088382
#> 2731     X Regions_of_sig_enrichment binding_site  8136208  8137938
#> 2732     X Regions_of_sig_enrichment binding_site  8302671  8303780
#> 2733     X Regions_of_sig_enrichment binding_site  8304717  8306267
#> 2734     X Regions_of_sig_enrichment binding_site  8312930  8314113
#> 2735     X Regions_of_sig_enrichment binding_site  8314277  8316694
#> 2736     X Regions_of_sig_enrichment binding_site  8322348  8323800
#> 2737     X Regions_of_sig_enrichment binding_site  8330927  8332421
#> 2738     X Regions_of_sig_enrichment binding_site  8410574  8412649
#> 2739     X Regions_of_sig_enrichment binding_site  8447617  8449028
#> 2740     X Regions_of_sig_enrichment binding_site  8455079  8456681
#> 2741     X Regions_of_sig_enrichment binding_site  8462766  8463845
#> 2742     X Regions_of_sig_enrichment binding_site  8468676  8470411
#> 2743     X Regions_of_sig_enrichment binding_site  8472693  8474264
#> 2744     X Regions_of_sig_enrichment binding_site  8492189  8493432
#> 2745     X Regions_of_sig_enrichment binding_site  8574953  8576314
#> 2746     X Regions_of_sig_enrichment binding_site  8590031  8592967
#> 2747     X Regions_of_sig_enrichment binding_site  8601678  8604345
#> 2748     X Regions_of_sig_enrichment binding_site  8607879  8609356
#> 2749     X Regions_of_sig_enrichment binding_site  8765653  8768072
#> 2750     X Regions_of_sig_enrichment binding_site  8783493  8785398
#> 2751     X Regions_of_sig_enrichment binding_site  8785978  8788579
#> 2752     X Regions_of_sig_enrichment binding_site  8788695  8792802
#> 2753     X Regions_of_sig_enrichment binding_site  8859839  8861307
#> 2754     X Regions_of_sig_enrichment binding_site  8868261  8869602
#> 2755     X Regions_of_sig_enrichment binding_site  8989813  8991540
#> 2756     X Regions_of_sig_enrichment binding_site  8992448  8993480
#> 2757     X Regions_of_sig_enrichment binding_site  9049096  9051487
#> 2758     X Regions_of_sig_enrichment binding_site  9057332  9059146
#> 2759     X Regions_of_sig_enrichment binding_site  9067134  9068403
#> 2760     X Regions_of_sig_enrichment binding_site  9070353  9071724
#> 2761     X Regions_of_sig_enrichment binding_site  9072692  9076397
#> 2762     X Regions_of_sig_enrichment binding_site  9131089  9132298
#> 2763     X Regions_of_sig_enrichment binding_site  9140697  9141937
#> 2764     X Regions_of_sig_enrichment binding_site  9145087  9146382
#> 2765     X Regions_of_sig_enrichment binding_site  9176199  9177367
#> 2766     X Regions_of_sig_enrichment binding_site  9236908  9239380
#> 2767     X Regions_of_sig_enrichment binding_site  9245955  9247051
#> 2768     X Regions_of_sig_enrichment binding_site  9360433  9361643
#> 2769     X Regions_of_sig_enrichment binding_site  9363286  9364579
#> 2770     X Regions_of_sig_enrichment binding_site  9393468  9394899
#> 2771     X Regions_of_sig_enrichment binding_site  9472587  9474106
#> 2772     X Regions_of_sig_enrichment binding_site  9477393  9480332
#> 2773     X Regions_of_sig_enrichment binding_site  9493108  9494528
#> 2774     X Regions_of_sig_enrichment binding_site  9516139  9517273
#> 2775     X Regions_of_sig_enrichment binding_site  9570354  9571800
#> 2776     X Regions_of_sig_enrichment binding_site  9577673  9581702
#> 2777     X Regions_of_sig_enrichment binding_site  9762215  9764004
#> 2778     X Regions_of_sig_enrichment binding_site  9767689  9769108
#> 2779     X Regions_of_sig_enrichment binding_site  9784055  9785921
#> 2780     X Regions_of_sig_enrichment binding_site  9965743  9968017
#> 2781     X Regions_of_sig_enrichment binding_site  9968290  9969443
#> 2782     X Regions_of_sig_enrichment binding_site 10145535 10146600
#> 2783     X Regions_of_sig_enrichment binding_site 10146714 10148085
#> 2784     X Regions_of_sig_enrichment binding_site 10149414 10150749
#> 2785     X Regions_of_sig_enrichment binding_site 10153365 10155259
#> 2786     X Regions_of_sig_enrichment binding_site 10157342 10158595
#> 2787     X Regions_of_sig_enrichment binding_site 10159028 10160197
#> 2788     X Regions_of_sig_enrichment binding_site 10216562 10217701
#> 2789     X Regions_of_sig_enrichment binding_site 10218324 10220029
#> 2790     X Regions_of_sig_enrichment binding_site 10224013 10226654
#> 2791     X Regions_of_sig_enrichment binding_site 10251113 10252445
#> 2792     X Regions_of_sig_enrichment binding_site 10257457 10258519
#> 2793     X Regions_of_sig_enrichment binding_site 10267691 10268873
#> 2794     X Regions_of_sig_enrichment binding_site 10271086 10272521
#> 2795     X Regions_of_sig_enrichment binding_site 10272938 10274261
#> 2796     X Regions_of_sig_enrichment binding_site 10299261 10300442
#> 2797     X Regions_of_sig_enrichment binding_site 10367203 10368914
#> 2798     X Regions_of_sig_enrichment binding_site 10373562 10375291
#> 2799     X Regions_of_sig_enrichment binding_site 10379888 10381642
#> 2800     X Regions_of_sig_enrichment binding_site 10386777 10388151
#> 2801     X Regions_of_sig_enrichment binding_site 10388747 10390537
#> 2802     X Regions_of_sig_enrichment binding_site 10439714 10441160
#> 2803     X Regions_of_sig_enrichment binding_site 10441400 10442413
#> 2804     X Regions_of_sig_enrichment binding_site 10455133 10456181
#> 2805     X Regions_of_sig_enrichment binding_site 10475317 10476702
#> 2806     X Regions_of_sig_enrichment binding_site 10487314 10488627
#> 2807     X Regions_of_sig_enrichment binding_site 10611829 10613096
#> 2808     X Regions_of_sig_enrichment binding_site 10635675 10637463
#> 2809     X Regions_of_sig_enrichment binding_site 10638168 10640087
#> 2810     X Regions_of_sig_enrichment binding_site 10652831 10653923
#> 2811     X Regions_of_sig_enrichment binding_site 10654070 10655217
#> 2812     X Regions_of_sig_enrichment binding_site 10658093 10659201
#> 2813     X Regions_of_sig_enrichment binding_site 10664953 10666127
#> 2814     X Regions_of_sig_enrichment binding_site 10666319 10668178
#> 2815     X Regions_of_sig_enrichment binding_site 10668296 10670032
#> 2816     X Regions_of_sig_enrichment binding_site 10677806 10680988
#> 2817     X Regions_of_sig_enrichment binding_site 10681815 10683341
#> 2818     X Regions_of_sig_enrichment binding_site 10683483 10684544
#> 2819     X Regions_of_sig_enrichment binding_site 10685079 10686381
#> 2820     X Regions_of_sig_enrichment binding_site 10687947 10689515
#> 2821     X Regions_of_sig_enrichment binding_site 10695401 10696978
#> 2822     X Regions_of_sig_enrichment binding_site 10697794 10698899
#> 2823     X Regions_of_sig_enrichment binding_site 10699079 10700972
#> 2824     X Regions_of_sig_enrichment binding_site 10735224 10736518
#> 2825     X Regions_of_sig_enrichment binding_site 10788774 10789837
#> 2826     X Regions_of_sig_enrichment binding_site 11002760 11003765
#> 2827     X Regions_of_sig_enrichment binding_site 11024178 11025516
#> 2828     X Regions_of_sig_enrichment binding_site 11029568 11031045
#> 2829     X Regions_of_sig_enrichment binding_site 11049095 11050178
#> 2830     X Regions_of_sig_enrichment binding_site 11219424 11221020
#> 2831     X Regions_of_sig_enrichment binding_site 11232055 11234725
#> 2832     X Regions_of_sig_enrichment binding_site 11244638 11245726
#> 2833     X Regions_of_sig_enrichment binding_site 11297347 11298450
#> 2834     X Regions_of_sig_enrichment binding_site 11300977 11302021
#> 2835     X Regions_of_sig_enrichment binding_site 11316596 11318312
#> 2836     X Regions_of_sig_enrichment binding_site 11340704 11342209
#> 2837     X Regions_of_sig_enrichment binding_site 11346945 11348329
#> 2838     X Regions_of_sig_enrichment binding_site 11349646 11351541
#> 2839     X Regions_of_sig_enrichment binding_site 11387465 11389071
#> 2840     X Regions_of_sig_enrichment binding_site 11415670 11416695
#> 2841     X Regions_of_sig_enrichment binding_site 11447268 11448959
#> 2842     X Regions_of_sig_enrichment binding_site 11449775 11452831
#> 2843     X Regions_of_sig_enrichment binding_site 11455810 11457310
#> 2844     X Regions_of_sig_enrichment binding_site 11457713 11458904
#> 2845     X Regions_of_sig_enrichment binding_site 11459097 11462704
#> 2846     X Regions_of_sig_enrichment binding_site 11463585 11464801
#> 2847     X Regions_of_sig_enrichment binding_site 11465730 11466798
#> 2848     X Regions_of_sig_enrichment binding_site 11472906 11473920
#> 2849     X Regions_of_sig_enrichment binding_site 11477154 11478561
#> 2850     X Regions_of_sig_enrichment binding_site 11478795 11494190
#> 2851     X Regions_of_sig_enrichment binding_site 11500447 11502569
#> 2852     X Regions_of_sig_enrichment binding_site 11505952 11507431
#> 2853     X Regions_of_sig_enrichment binding_site 11572345 11574054
#> 2854     X Regions_of_sig_enrichment binding_site 11575466 11576743
#> 2855     X Regions_of_sig_enrichment binding_site 11577873 11579035
#> 2856     X Regions_of_sig_enrichment binding_site 11579749 11581554
#> 2857     X Regions_of_sig_enrichment binding_site 11590077 11591435
#> 2858     X Regions_of_sig_enrichment binding_site 11592106 11593773
#> 2859     X Regions_of_sig_enrichment binding_site 11604932 11606467
#> 2860     X Regions_of_sig_enrichment binding_site 11681223 11682735
#> 2861     X Regions_of_sig_enrichment binding_site 11683009 11684588
#> 2862     X Regions_of_sig_enrichment binding_site 11708676 11710251
#> 2863     X Regions_of_sig_enrichment binding_site 11777759 11779780
#> 2864     X Regions_of_sig_enrichment binding_site 11787335 11788547
#> 2865     X Regions_of_sig_enrichment binding_site 11792592 11793968
#> 2866     X Regions_of_sig_enrichment binding_site 11795765 11796885
#> 2867     X Regions_of_sig_enrichment binding_site 11908021 11909262
#> 2868     X Regions_of_sig_enrichment binding_site 12097461 12098466
#> 2869     X Regions_of_sig_enrichment binding_site 12112959 12114469
#> 2870     X Regions_of_sig_enrichment binding_site 12120338 12121355
#> 2871     X Regions_of_sig_enrichment binding_site 12364058 12366505
#> 2872     X Regions_of_sig_enrichment binding_site 12467605 12469600
#> 2873     X Regions_of_sig_enrichment binding_site 12472954 12474930
#> 2874     X Regions_of_sig_enrichment binding_site 12480232 12481429
#> 2875     X Regions_of_sig_enrichment binding_site 12485174 12486700
#> 2876     X Regions_of_sig_enrichment binding_site 12490273 12491394
#> 2877     X Regions_of_sig_enrichment binding_site 12498975 12500037
#> 2878     X Regions_of_sig_enrichment binding_site 12525516 12528556
#> 2879     X Regions_of_sig_enrichment binding_site 12532374 12533390
#> 2880     X Regions_of_sig_enrichment binding_site 12533502 12534843
#> 2881     X Regions_of_sig_enrichment binding_site 12547448 12548778
#> 2882     X Regions_of_sig_enrichment binding_site 12553118 12554622
#> 2883     X Regions_of_sig_enrichment binding_site 12554738 12555762
#> 2884     X Regions_of_sig_enrichment binding_site 12555880 12557564
#> 2885     X Regions_of_sig_enrichment binding_site 12560333 12562496
#> 2886     X Regions_of_sig_enrichment binding_site 12603392 12604433
#> 2887     X Regions_of_sig_enrichment binding_site 12613069 12614890
#> 2888     X Regions_of_sig_enrichment binding_site 12615050 12616240
#> 2889     X Regions_of_sig_enrichment binding_site 12617985 12619933
#> 2890     X Regions_of_sig_enrichment binding_site 12621098 12623537
#> 2891     X Regions_of_sig_enrichment binding_site 12625429 12627014
#> 2892     X Regions_of_sig_enrichment binding_site 12629127 12630566
#> 2893     X Regions_of_sig_enrichment binding_site 12630951 12632709
#> 2894     X Regions_of_sig_enrichment binding_site 12635656 12637005
#> 2895     X Regions_of_sig_enrichment binding_site 12637557 12639381
#> 2896     X Regions_of_sig_enrichment binding_site 12641797 12643568
#> 2897     X Regions_of_sig_enrichment binding_site 12643964 12645675
#> 2898     X Regions_of_sig_enrichment binding_site 12645830 12648268
#> 2899     X Regions_of_sig_enrichment binding_site 12648382 12650175
#> 2900     X Regions_of_sig_enrichment binding_site 12794551 12796195
#> 2901     X Regions_of_sig_enrichment binding_site 12799711 12800803
#> 2902     X Regions_of_sig_enrichment binding_site 12860849 12862124
#> 2903     X Regions_of_sig_enrichment binding_site 12975932 12977115
#> 2904     X Regions_of_sig_enrichment binding_site 12981013 12982111
#> 2905     X Regions_of_sig_enrichment binding_site 12993336 12994606
#> 2906     X Regions_of_sig_enrichment binding_site 13021523 13023437
#> 2907     X Regions_of_sig_enrichment binding_site 13023932 13025071
#> 2908     X Regions_of_sig_enrichment binding_site 13026266 13027887
#> 2909     X Regions_of_sig_enrichment binding_site 13028123 13029729
#> 2910     X Regions_of_sig_enrichment binding_site 13089857 13092422
#> 2911     X Regions_of_sig_enrichment binding_site 13103765 13105752
#> 2912     X Regions_of_sig_enrichment binding_site 13114874 13115981
#> 2913     X Regions_of_sig_enrichment binding_site 13148836 13153023
#> 2914     X Regions_of_sig_enrichment binding_site 13171454 13173434
#> 2915     X Regions_of_sig_enrichment binding_site 13175193 13177248
#> 2916     X Regions_of_sig_enrichment binding_site 13177525 13178968
#> 2917     X Regions_of_sig_enrichment binding_site 13181296 13183017
#> 2918     X Regions_of_sig_enrichment binding_site 13184106 13189729
#> 2919     X Regions_of_sig_enrichment binding_site 13189958 13191628
#> 2920     X Regions_of_sig_enrichment binding_site 13195773 13199364
#> 2921     X Regions_of_sig_enrichment binding_site 13208567 13209775
#> 2922     X Regions_of_sig_enrichment binding_site 13225498 13226673
#> 2923     X Regions_of_sig_enrichment binding_site 13264654 13266087
#> 2924     X Regions_of_sig_enrichment binding_site 13273288 13274368
#> 2925     X Regions_of_sig_enrichment binding_site 13275654 13277406
#> 2926     X Regions_of_sig_enrichment binding_site 13284677 13286045
#> 2927     X Regions_of_sig_enrichment binding_site 13289097 13292516
#> 2928     X Regions_of_sig_enrichment binding_site 13298577 13299590
#> 2929     X Regions_of_sig_enrichment binding_site 13303568 13304895
#> 2930     X Regions_of_sig_enrichment binding_site 13305012 13306716
#> 2931     X Regions_of_sig_enrichment binding_site 13308878 13310548
#> 2932     X Regions_of_sig_enrichment binding_site 13515516 13517608
#> 2933     X Regions_of_sig_enrichment binding_site 13517966 13519313
#> 2934     X Regions_of_sig_enrichment binding_site 13527770 13529380
#> 2935     X Regions_of_sig_enrichment binding_site 13533874 13537368
#> 2936     X Regions_of_sig_enrichment binding_site 13545051 13546413
#> 2937     X Regions_of_sig_enrichment binding_site 13553991 13555066
#> 2938     X Regions_of_sig_enrichment binding_site 13557746 13560319
#> 2939     X Regions_of_sig_enrichment binding_site 13573556 13574680
#> 2940     X Regions_of_sig_enrichment binding_site 13610352 13611577
#> 2941     X Regions_of_sig_enrichment binding_site 13628211 13629275
#> 2942     X Regions_of_sig_enrichment binding_site 13633077 13635170
#> 2943     X Regions_of_sig_enrichment binding_site 13635678 13636861
#> 2944     X Regions_of_sig_enrichment binding_site 13641405 13643141
#> 2945     X Regions_of_sig_enrichment binding_site 13643260 13644385
#> 2946     X Regions_of_sig_enrichment binding_site 13645954 13646984
#> 2947     X Regions_of_sig_enrichment binding_site 13647316 13649846
#> 2948     X Regions_of_sig_enrichment binding_site 13655635 13657500
#> 2949     X Regions_of_sig_enrichment binding_site 13666208 13667213
#> 2950     X Regions_of_sig_enrichment binding_site 13677527 13678794
#> 2951     X Regions_of_sig_enrichment binding_site 13695000 13696234
#> 2952     X Regions_of_sig_enrichment binding_site 13709852 13711195
#> 2953     X Regions_of_sig_enrichment binding_site 13718984 13720512
#> 2954     X Regions_of_sig_enrichment binding_site 13720780 13722177
#> 2955     X Regions_of_sig_enrichment binding_site 13736384 13737719
#> 2956     X Regions_of_sig_enrichment binding_site 13781916 13785258
#> 2957     X Regions_of_sig_enrichment binding_site 13786272 13787486
#> 2958     X Regions_of_sig_enrichment binding_site 13787606 13788673
#> 2959     X Regions_of_sig_enrichment binding_site 13851907 13853129
#> 2960     X Regions_of_sig_enrichment binding_site 13889961 13891223
#> 2961     X Regions_of_sig_enrichment binding_site 14115409 14116409
#> 2962     X Regions_of_sig_enrichment binding_site 14144718 14147681
#> 2963     X Regions_of_sig_enrichment binding_site 14617736 14618904
#> 2964     X Regions_of_sig_enrichment binding_site 14620275 14621566
#> 2965     X Regions_of_sig_enrichment binding_site 14626902 14628091
#> 2966     X Regions_of_sig_enrichment binding_site 14630994 14632513
#> 2967     X Regions_of_sig_enrichment binding_site 14639163 14640750
#> 2968     X Regions_of_sig_enrichment binding_site 14725525 14727039
#> 2969     X Regions_of_sig_enrichment binding_site 14734129 14735134
#> 2970     X Regions_of_sig_enrichment binding_site 14756040 14757120
#> 2971     X Regions_of_sig_enrichment binding_site 14767762 14769851
#> 2972     X Regions_of_sig_enrichment binding_site 14794850 14795850
#> 2973     X Regions_of_sig_enrichment binding_site 14847893 14849341
#> 2974     X Regions_of_sig_enrichment binding_site 14914492 14915729
#> 2975     X Regions_of_sig_enrichment binding_site 14937247 14938507
#> 2976     X Regions_of_sig_enrichment binding_site 14974587 14975663
#> 2977     X Regions_of_sig_enrichment binding_site 15030366 15031676
#> 2978     X Regions_of_sig_enrichment binding_site 15186587 15187826
#> 2979     X Regions_of_sig_enrichment binding_site 15213308 15215236
#> 2980     X Regions_of_sig_enrichment binding_site 15221401 15222780
#> 2981     X Regions_of_sig_enrichment binding_site 15226889 15228218
#> 2982     X Regions_of_sig_enrichment binding_site 15344306 15345334
#> 2983     X Regions_of_sig_enrichment binding_site 15376452 15377856
#> 2984     X Regions_of_sig_enrichment binding_site 15404540 15406041
#> 2985     X Regions_of_sig_enrichment binding_site 15594507 15595603
#> 2986     X Regions_of_sig_enrichment binding_site 15606288 15607894
#> 2987     X Regions_of_sig_enrichment binding_site 15623374 15625237
#> 2988     X Regions_of_sig_enrichment binding_site 15652221 15653333
#> 2989     X Regions_of_sig_enrichment binding_site 15687917 15689517
#> 2990     X Regions_of_sig_enrichment binding_site 15691529 15692687
#> 2991     X Regions_of_sig_enrichment binding_site 15705279 15708047
#> 2992     X Regions_of_sig_enrichment binding_site 15725408 15726435
#> 2993     X Regions_of_sig_enrichment binding_site 15754308 15755322
#> 2994     X Regions_of_sig_enrichment binding_site 15768972 15770220
#> 2995     X Regions_of_sig_enrichment binding_site 15773176 15774404
#> 2996     X Regions_of_sig_enrichment binding_site 15774830 15776000
#> 2997     X Regions_of_sig_enrichment binding_site 15786515 15788228
#> 2998     X Regions_of_sig_enrichment binding_site 15788904 15790462
#> 2999     X Regions_of_sig_enrichment binding_site 15896220 15897711
#> 3000     X Regions_of_sig_enrichment binding_site 15956843 15957939
#> 3001     X Regions_of_sig_enrichment binding_site 15982985 15984417
#> 3002     X Regions_of_sig_enrichment binding_site 15984656 15985676
#> 3003     X Regions_of_sig_enrichment binding_site 16174329 16176519
#> 3004     X Regions_of_sig_enrichment binding_site 16183090 16184229
#> 3005     X Regions_of_sig_enrichment binding_site 16187935 16189402
#> 3006     X Regions_of_sig_enrichment binding_site 16189889 16191536
#> 3007     X Regions_of_sig_enrichment binding_site 16194820 16196231
#> 3008     X Regions_of_sig_enrichment binding_site 16213811 16214883
#> 3009     X Regions_of_sig_enrichment binding_site 16226849 16228006
#> 3010     X Regions_of_sig_enrichment binding_site 16228195 16230630
#> 3011     X Regions_of_sig_enrichment binding_site 16244410 16245527
#> 3012     X Regions_of_sig_enrichment binding_site 16246121 16247141
#> 3013     X Regions_of_sig_enrichment binding_site 16250327 16251759
#> 3014     X Regions_of_sig_enrichment binding_site 16266446 16267921
#> 3015     X Regions_of_sig_enrichment binding_site 16269084 16270221
#> 3016     X Regions_of_sig_enrichment binding_site 16270636 16272053
#> 3017     X Regions_of_sig_enrichment binding_site 16276010 16277699
#> 3018     X Regions_of_sig_enrichment binding_site 16278830 16280039
#> 3019     X Regions_of_sig_enrichment binding_site 16313118 16315215
#> 3020     X Regions_of_sig_enrichment binding_site 16317397 16318416
#> 3021     X Regions_of_sig_enrichment binding_site 16318531 16319907
#> 3022     X Regions_of_sig_enrichment binding_site 16320532 16322083
#> 3023     X Regions_of_sig_enrichment binding_site 16322516 16323666
#> 3024     X Regions_of_sig_enrichment binding_site 16327097 16329250
#> 3025     X Regions_of_sig_enrichment binding_site 16332048 16333795
#> 3026     X Regions_of_sig_enrichment binding_site 16442655 16445175
#> 3027     X Regions_of_sig_enrichment binding_site 16446844 16448033
#> 3028     X Regions_of_sig_enrichment binding_site 16492754 16494760
#> 3029     X Regions_of_sig_enrichment binding_site 16497282 16499473
#> 3030     X Regions_of_sig_enrichment binding_site 16501180 16502288
#> 3031     X Regions_of_sig_enrichment binding_site 16504540 16505629
#> 3032     X Regions_of_sig_enrichment binding_site 16548776 16550415
#> 3033     X Regions_of_sig_enrichment binding_site 16551786 16552996
#> 3034     X Regions_of_sig_enrichment binding_site 16645773 16646893
#> 3035     X Regions_of_sig_enrichment binding_site 16685699 16687404
#> 3036     X Regions_of_sig_enrichment binding_site 16729415 16730852
#> 3037     X Regions_of_sig_enrichment binding_site 16778625 16779676
#> 3038     X Regions_of_sig_enrichment binding_site 16834582 16835845
#> 3039     X Regions_of_sig_enrichment binding_site 16837422 16838518
#> 3040     X Regions_of_sig_enrichment binding_site 16861811 16863196
#> 3041     X Regions_of_sig_enrichment binding_site 16970001 16971015
#> 3042     X Regions_of_sig_enrichment binding_site 17031674 17032716
#> 3043     X Regions_of_sig_enrichment binding_site 17032872 17034644
#> 3044     X Regions_of_sig_enrichment binding_site 17037949 17038970
#> 3045     X Regions_of_sig_enrichment binding_site 17041207 17042275
#> 3046     X Regions_of_sig_enrichment binding_site 17045942 17047040
#> 3047     X Regions_of_sig_enrichment binding_site 17053985 17055349
#> 3048     X Regions_of_sig_enrichment binding_site 17069167 17070511
#> 3049     X Regions_of_sig_enrichment binding_site 17072378 17073378
#> 3050     X Regions_of_sig_enrichment binding_site 17187903 17189745
#> 3051     X Regions_of_sig_enrichment binding_site 17193236 17194666
#> 3052     X Regions_of_sig_enrichment binding_site 17195336 17197225
#> 3053     X Regions_of_sig_enrichment binding_site 17380932 17382540
#> 3054     X Regions_of_sig_enrichment binding_site 17388866 17390000
#> 3055     X Regions_of_sig_enrichment binding_site 17424964 17426580
#> 3056     X Regions_of_sig_enrichment binding_site 17493678 17494786
#> 3057     X Regions_of_sig_enrichment binding_site 17495150 17497376
#> 3058     X Regions_of_sig_enrichment binding_site 17498162 17499629
#> 3059     X Regions_of_sig_enrichment binding_site 17518872 17520914
#> 3060     X Regions_of_sig_enrichment binding_site 17521762 17522861
#> 3061     X Regions_of_sig_enrichment binding_site 17538063 17540026
#> 3062     X Regions_of_sig_enrichment binding_site 17542515 17546583
#> 3063     X Regions_of_sig_enrichment binding_site 17551348 17552520
#> 3064     X Regions_of_sig_enrichment binding_site 17591237 17592760
#> 3065     X Regions_of_sig_enrichment binding_site 17593070 17594258
#> 3066     X Regions_of_sig_enrichment binding_site 17596309 17598020
#> 3067     X Regions_of_sig_enrichment binding_site 17613168 17615075
#> 3068     X Regions_of_sig_enrichment binding_site 17629652 17631893
#> 3069     X Regions_of_sig_enrichment binding_site 17632004 17633623
#> 3070     X Regions_of_sig_enrichment binding_site 17739663 17740718
#> 3071     X Regions_of_sig_enrichment binding_site 17742314 17743519
#> 3072     X Regions_of_sig_enrichment binding_site 17750585 17753188
#> 3073     X Regions_of_sig_enrichment binding_site 17761888 17763123
#> 3074     X Regions_of_sig_enrichment binding_site 17763327 17764664
#> 3075     X Regions_of_sig_enrichment binding_site 17768864 17770484
#> 3076     X Regions_of_sig_enrichment binding_site 17772261 17773641
#> 3077     X Regions_of_sig_enrichment binding_site 17783529 17785469
#> 3078     X Regions_of_sig_enrichment binding_site 17785865 17787051
#> 3079     X Regions_of_sig_enrichment binding_site 17790429 17791530
#> 3080     X Regions_of_sig_enrichment binding_site 17793684 17795624
#> 3081     X Regions_of_sig_enrichment binding_site 17796020 17797206
#> 3082     X Regions_of_sig_enrichment binding_site 17797612 17798952
#> 3083     X Regions_of_sig_enrichment binding_site 18097647 18099764
#> 3084     X Regions_of_sig_enrichment binding_site 18137331 18138424
#> 3085     X Regions_of_sig_enrichment binding_site 18170439 18171774
#> 3086     X Regions_of_sig_enrichment binding_site 18251632 18252642
#> 3087     X Regions_of_sig_enrichment binding_site 18257544 18258568
#> 3088     X Regions_of_sig_enrichment binding_site 18260550 18262486
#> 3089     X Regions_of_sig_enrichment binding_site 18298109 18300526
#> 3090     X Regions_of_sig_enrichment binding_site 18399152 18400235
#> 3091     X Regions_of_sig_enrichment binding_site 18410630 18411653
#> 3092     X Regions_of_sig_enrichment binding_site 18528389 18530358
#> 3093     X Regions_of_sig_enrichment binding_site 18540471 18542012
#> 3094     X Regions_of_sig_enrichment binding_site 18547316 18548403
#> 3095     X Regions_of_sig_enrichment binding_site 18670505 18671735
#> 3096     X Regions_of_sig_enrichment binding_site 18683046 18684679
#> 3097     X Regions_of_sig_enrichment binding_site 18741600 18742880
#> 3098     X Regions_of_sig_enrichment binding_site 18781376 18782675
#> 3099     X Regions_of_sig_enrichment binding_site 19040082 19041107
#> 3100     X Regions_of_sig_enrichment binding_site 19042183 19044063
#> 3101     X Regions_of_sig_enrichment binding_site 19047369 19050255
#> 3102     X Regions_of_sig_enrichment binding_site 19051452 19052797
#> 3103     X Regions_of_sig_enrichment binding_site 19055277 19057659
#> 3104     X Regions_of_sig_enrichment binding_site 19058736 19061281
#> 3105     X Regions_of_sig_enrichment binding_site 19086821 19088060
#> 3106     X Regions_of_sig_enrichment binding_site 19089936 19091002
#> 3107     X Regions_of_sig_enrichment binding_site 19146095 19147345
#> 3108     X Regions_of_sig_enrichment binding_site 19148356 19150196
#> 3109     X Regions_of_sig_enrichment binding_site 19154923 19156266
#> 3110     X Regions_of_sig_enrichment binding_site 19159284 19161065
#> 3111     X Regions_of_sig_enrichment binding_site 19185626 19186704
#> 3112     X Regions_of_sig_enrichment binding_site 19197351 19199867
#> 3113     X Regions_of_sig_enrichment binding_site 19246860 19248278
#> 3114     X Regions_of_sig_enrichment binding_site 19389383 19391179
#> 3115     X Regions_of_sig_enrichment binding_site 19392626 19394061
#> 3116     X Regions_of_sig_enrichment binding_site 19399391 19400913
#> 3117     X Regions_of_sig_enrichment binding_site 19415983 19417003
#> 3118     X Regions_of_sig_enrichment binding_site 19461776 19462783
#> 3119     X Regions_of_sig_enrichment binding_site 19467230 19469494
#> 3120     X Regions_of_sig_enrichment binding_site 19471168 19473819
#> 3121     X Regions_of_sig_enrichment binding_site 19501399 19502790
#> 3122     X Regions_of_sig_enrichment binding_site 19525045 19526154
#> 3123     X Regions_of_sig_enrichment binding_site 19532049 19533210
#> 3124     X Regions_of_sig_enrichment binding_site 19534212 19535685
#> 3125     X Regions_of_sig_enrichment binding_site 19548772 19550236
#> 3126     X Regions_of_sig_enrichment binding_site 19555711 19557020
#> 3127     X Regions_of_sig_enrichment binding_site 19560904 19563223
#> 3128     X Regions_of_sig_enrichment binding_site 19568415 19569485
#> 3129     X Regions_of_sig_enrichment binding_site 19583611 19584770
#> 3130     X Regions_of_sig_enrichment binding_site 19627467 19628523
#> 3131     X Regions_of_sig_enrichment binding_site 19644806 19645877
#> 3132     X Regions_of_sig_enrichment binding_site 19738779 19740230
#> 3133     X Regions_of_sig_enrichment binding_site 19743580 19744759
#> 3134     X Regions_of_sig_enrichment binding_site 19745031 19746471
#> 3135     X Regions_of_sig_enrichment binding_site 19747252 19748508
#> 3136     X Regions_of_sig_enrichment binding_site 19748694 19750117
#> 3137     X Regions_of_sig_enrichment binding_site 19752483 19754224
#> 3138     X Regions_of_sig_enrichment binding_site 19770199 19771768
#> 3139     X Regions_of_sig_enrichment binding_site 19777287 19779694
#> 3140     X Regions_of_sig_enrichment binding_site 19780105 19781923
#> 3141     X Regions_of_sig_enrichment binding_site 19782885 19784272
#> 3142     X Regions_of_sig_enrichment binding_site 19784554 19786115
#> 3143     X Regions_of_sig_enrichment binding_site 20102127 20103137
#> 3144     X Regions_of_sig_enrichment binding_site 20114371 20115789
#> 3145     X Regions_of_sig_enrichment binding_site 20392860 20394255
#> 3146     X Regions_of_sig_enrichment binding_site 20527354 20529748
#> 3147     X Regions_of_sig_enrichment binding_site 20898651 20900337
#> 3148     X Regions_of_sig_enrichment binding_site 20900542 20901759
#> 3149     X Regions_of_sig_enrichment binding_site 20906251 20907686
#> 3150     X Regions_of_sig_enrichment binding_site 20908322 20911527
#> 3151     X Regions_of_sig_enrichment binding_site 20912849 20914666
#> 3152     X Regions_of_sig_enrichment binding_site 20921021 20923659
#> 3153     X Regions_of_sig_enrichment binding_site 20930450 20932924
#> 3154     X Regions_of_sig_enrichment binding_site 20935346 20937244
#> 3155     X Regions_of_sig_enrichment binding_site 20938178 20939516
#> 3156     X Regions_of_sig_enrichment binding_site 21152369 21153639
#> 3157     X Regions_of_sig_enrichment binding_site 21163566 21165506
#> 3158     X Regions_of_sig_enrichment binding_site 21194109 21195327
#> 3159     X Regions_of_sig_enrichment binding_site 21213399 21214475
#> 3160     X Regions_of_sig_enrichment binding_site 21217069 21218150
#> 3161     X Regions_of_sig_enrichment binding_site 21220365 21222251
#> 3162     X Regions_of_sig_enrichment binding_site 21227870 21229946
#> 3163     X Regions_of_sig_enrichment binding_site 21238411 21240817
#> 3164     X Regions_of_sig_enrichment binding_site 21242672 21243944
#> 3165     X Regions_of_sig_enrichment binding_site 21245613 21246740
#> 3166     X Regions_of_sig_enrichment binding_site 21248140 21249393
#> 3167     X Regions_of_sig_enrichment binding_site 21254479 21255918
#> 3168     X Regions_of_sig_enrichment binding_site 21266905 21268004
#> 3169     X Regions_of_sig_enrichment binding_site 21472077 21473179
#> 3170     X Regions_of_sig_enrichment binding_site 21478955 21480437
#> 3171     X Regions_of_sig_enrichment binding_site 21485047 21486529
#> 3172     X Regions_of_sig_enrichment binding_site 21491139 21492621
#> 3173     X Regions_of_sig_enrichment binding_site 21495656 21497148
#> 3174     X Regions_of_sig_enrichment binding_site 21857440 21859444
#> 3175     X Regions_of_sig_enrichment binding_site 21862238 21864017
#> 3176     X Regions_of_sig_enrichment binding_site 21866806 21868003
#> 3177     X Regions_of_sig_enrichment binding_site 21868279 21869504
#> 3178     X Regions_of_sig_enrichment binding_site 21882386 21883906
#> 3179     X Regions_of_sig_enrichment binding_site 21888935 21890352
#> 3180     X Regions_of_sig_enrichment binding_site 21892543 21893729
#> 3181     X Regions_of_sig_enrichment binding_site 21896847 21897908
#> 3182     X Regions_of_sig_enrichment binding_site 21902557 21903572
#> 3183     X Regions_of_sig_enrichment binding_site 22248790 22249900
#> 3184     X  Regions_of_sig_depletion binding_site  4670154  4671541
#> 3185     X  Regions_of_sig_depletion binding_site 17260346 17261549
#> 3186     X  Regions_of_sig_depletion binding_site 19226715 19227837
#> 3187    2R Regions_of_sig_enrichment binding_site  1559770  1561133
#> 3188    2R Regions_of_sig_enrichment binding_site  1561430  1562469
#> 3189    2R Regions_of_sig_enrichment binding_site  1564124  1565616
#> 3190    2R Regions_of_sig_enrichment binding_site  1567808  1570534
#> 3191    2R Regions_of_sig_enrichment binding_site  1578221  1579853
#> 3192    2R Regions_of_sig_enrichment binding_site  1639864  1641214
#> 3193    2R Regions_of_sig_enrichment binding_site  1861613  1863186
#> 3194    2R Regions_of_sig_enrichment binding_site  1902389  1903837
#> 3195    2R Regions_of_sig_enrichment binding_site  1905499  1906509
#> 3196    2R Regions_of_sig_enrichment binding_site  1909871  1910914
#> 3197    2R Regions_of_sig_enrichment binding_site  1922849  1924590
#> 3198    2R Regions_of_sig_enrichment binding_site  1968108  1969329
#> 3199    2R Regions_of_sig_enrichment binding_site  1975980  1977877
#> 3200    2R Regions_of_sig_enrichment binding_site  1997495  1998732
#> 3201    2R Regions_of_sig_enrichment binding_site  2006333  2007455
#> 3202    2R Regions_of_sig_enrichment binding_site  2007576  2009447
#> 3203    2R Regions_of_sig_enrichment binding_site  2018544  2023522
#> 3204    2R Regions_of_sig_enrichment binding_site  2025161  2027257
#> 3205    2R Regions_of_sig_enrichment binding_site  2028679  2034350
#> 3206    2R Regions_of_sig_enrichment binding_site  2102013  2103047
#> 3207    2R Regions_of_sig_enrichment binding_site  2106931  2108198
#> 3208    2R Regions_of_sig_enrichment binding_site  2108424  2110799
#> 3209    2R Regions_of_sig_enrichment binding_site  2119793  2121967
#> 3210    2R Regions_of_sig_enrichment binding_site  2128972  2130184
#> 3211    2R Regions_of_sig_enrichment binding_site  2240873  2241936
#> 3212    2R Regions_of_sig_enrichment binding_site  2497986  2500915
#> 3213    2R Regions_of_sig_enrichment binding_site  2514155  2518013
#> 3214    2R Regions_of_sig_enrichment binding_site  2518171  2520877
#> 3215    2R Regions_of_sig_enrichment binding_site  2531840  2532929
#> 3216    2R Regions_of_sig_enrichment binding_site  2537110  2538169
#> 3217    2R Regions_of_sig_enrichment binding_site  2543663  2545284
#> 3218    2R Regions_of_sig_enrichment binding_site  2550672  2551692
#> 3219    2R Regions_of_sig_enrichment binding_site  2553464  2555890
#> 3220    2R Regions_of_sig_enrichment binding_site  2598922  2600064
#> 3221    2R Regions_of_sig_enrichment binding_site  2602620  2603692
#> 3222    2R Regions_of_sig_enrichment binding_site  2636550  2638133
#> 3223    2R Regions_of_sig_enrichment binding_site  2643341  2644980
#> 3224    2R Regions_of_sig_enrichment binding_site  2646729  2647907
#> 3225    2R Regions_of_sig_enrichment binding_site  2648057  2649122
#> 3226    2R Regions_of_sig_enrichment binding_site  2698379  2699533
#> 3227    2R Regions_of_sig_enrichment binding_site  2758656  2759671
#> 3228    2R Regions_of_sig_enrichment binding_site  2899624  2901150
#> 3229    2R Regions_of_sig_enrichment binding_site  2901345  2903173
#> 3230    2R Regions_of_sig_enrichment binding_site  2912434  2913553
#> 3231    2R Regions_of_sig_enrichment binding_site  2936220  2938007
#> 3232    2R Regions_of_sig_enrichment binding_site  3073113  3074814
#> 3233    2R Regions_of_sig_enrichment binding_site  3135863  3136929
#> 3234    2R Regions_of_sig_enrichment binding_site  3137430  3138652
#> 3235    2R Regions_of_sig_enrichment binding_site  3140050  3141397
#> 3236    2R Regions_of_sig_enrichment binding_site  3142530  3143831
#> 3237    2R Regions_of_sig_enrichment binding_site  3203882  3205426
#> 3238    2R Regions_of_sig_enrichment binding_site  3257236  3259333
#> 3239    2R Regions_of_sig_enrichment binding_site  3260619  3261955
#> 3240    2R Regions_of_sig_enrichment binding_site  3274013  3275368
#> 3241    2R Regions_of_sig_enrichment binding_site  3294227  3295429
#> 3242    2R Regions_of_sig_enrichment binding_site  3344799  3346574
#> 3243    2R Regions_of_sig_enrichment binding_site  3351392  3352597
#> 3244    2R Regions_of_sig_enrichment binding_site  3354187  3355430
#> 3245    2R Regions_of_sig_enrichment binding_site  3359422  3362569
#> 3246    2R Regions_of_sig_enrichment binding_site  3368576  3369974
#> 3247    2R Regions_of_sig_enrichment binding_site  3375795  3378848
#> 3248    2R Regions_of_sig_enrichment binding_site  3379667  3380952
#> 3249    2R Regions_of_sig_enrichment binding_site  3387310  3388347
#> 3250    2R Regions_of_sig_enrichment binding_site  3415858  3419275
#> 3251    2R Regions_of_sig_enrichment binding_site  3494420  3495948
#> 3252    2R Regions_of_sig_enrichment binding_site  3501481  3502653
#> 3253    2R Regions_of_sig_enrichment binding_site  3503037  3504383
#> 3254    2R Regions_of_sig_enrichment binding_site  3504976  3506085
#> 3255    2R Regions_of_sig_enrichment binding_site  3510183  3511621
#> 3256    2R Regions_of_sig_enrichment binding_site  3514988  3516791
#> 3257    2R Regions_of_sig_enrichment binding_site  3584897  3586024
#> 3258    2R Regions_of_sig_enrichment binding_site  3609515  3611115
#> 3259    2R Regions_of_sig_enrichment binding_site  3613706  3615193
#> 3260    2R Regions_of_sig_enrichment binding_site  3623056  3624181
#> 3261    2R Regions_of_sig_enrichment binding_site  3630514  3631559
#> 3262    2R Regions_of_sig_enrichment binding_site  3632419  3633874
#> 3263    2R Regions_of_sig_enrichment binding_site  3668659  3670106
#> 3264    2R Regions_of_sig_enrichment binding_site  3692409  3693756
#> 3265    2R Regions_of_sig_enrichment binding_site  3715121  3716139
#> 3266    2R Regions_of_sig_enrichment binding_site  3718231  3719249
#> 3267    2R Regions_of_sig_enrichment binding_site  3803602  3805608
#> 3268    2R Regions_of_sig_enrichment binding_site  3827757  3828896
#> 3269    2R Regions_of_sig_enrichment binding_site  3874891  3876729
#> 3270    2R Regions_of_sig_enrichment binding_site  3955507  3957021
#> 3271    2R Regions_of_sig_enrichment binding_site  3963611  3964866
#> 3272    2R Regions_of_sig_enrichment binding_site  3969815  3971225
#> 3273    2R Regions_of_sig_enrichment binding_site  3976752  3977953
#> 3274    2R Regions_of_sig_enrichment binding_site  3986227  3987434
#> 3275    2R Regions_of_sig_enrichment binding_site  3993488  3994498
#> 3276    2R Regions_of_sig_enrichment binding_site  4009644  4010817
#> 3277    2R Regions_of_sig_enrichment binding_site  4018649  4020075
#> 3278    2R Regions_of_sig_enrichment binding_site  4029084  4031663
#> 3279    2R Regions_of_sig_enrichment binding_site  4032163  4034269
#> 3280    2R Regions_of_sig_enrichment binding_site  4036643  4038091
#> 3281    2R Regions_of_sig_enrichment binding_site  4042228  4043862
#> 3282    2R Regions_of_sig_enrichment binding_site  4124251  4125710
#> 3283    2R Regions_of_sig_enrichment binding_site  4126975  4128940
#> 3284    2R Regions_of_sig_enrichment binding_site  4129045  4130354
#> 3285    2R Regions_of_sig_enrichment binding_site  4138396  4139442
#> 3286    2R Regions_of_sig_enrichment binding_site  4280660  4283820
#> 3287    2R Regions_of_sig_enrichment binding_site  4331444  4333964
#> 3288    2R Regions_of_sig_enrichment binding_site  4484511  4485683
#> 3289    2R Regions_of_sig_enrichment binding_site  4487953  4489573
#> 3290    2R Regions_of_sig_enrichment binding_site  4494150  4495973
#> 3291    2R Regions_of_sig_enrichment binding_site  4501960  4503508
#> 3292    2R Regions_of_sig_enrichment binding_site  4522452  4524011
#> 3293    2R Regions_of_sig_enrichment binding_site  4534674  4535851
#> 3294    2R Regions_of_sig_enrichment binding_site  4535961  4537967
#> 3295    2R Regions_of_sig_enrichment binding_site  4538208  4540765
#> 3296    2R Regions_of_sig_enrichment binding_site  4552856  4554810
#> 3297    2R Regions_of_sig_enrichment binding_site  4555156  4556565
#> 3298    2R Regions_of_sig_enrichment binding_site  4556950  4558395
#> 3299    2R Regions_of_sig_enrichment binding_site  4559143  4561666
#> 3300    2R Regions_of_sig_enrichment binding_site  4565169  4566217
#> 3301    2R Regions_of_sig_enrichment binding_site  4568239  4569245
#> 3302    2R Regions_of_sig_enrichment binding_site  4602624  4603761
#> 3303    2R Regions_of_sig_enrichment binding_site  4610533  4613606
#> 3304    2R Regions_of_sig_enrichment binding_site  4787232  4788516
#> 3305    2R Regions_of_sig_enrichment binding_site  4788800  4791386
#> 3306    2R Regions_of_sig_enrichment binding_site  4800619  4802471
#> 3307    2R Regions_of_sig_enrichment binding_site  4830396  4831452
#> 3308    2R Regions_of_sig_enrichment binding_site  4839228  4840605
#> 3309    2R Regions_of_sig_enrichment binding_site  4879410  4880464
#> 3310    2R Regions_of_sig_enrichment binding_site  4894081  4895196
#> 3311    2R Regions_of_sig_enrichment binding_site  4948832  4950243
#> 3312    2R Regions_of_sig_enrichment binding_site  4955286  4956670
#> 3313    2R Regions_of_sig_enrichment binding_site  4979560  4980784
#> 3314    2R Regions_of_sig_enrichment binding_site  4990154  4991249
#> 3315    2R Regions_of_sig_enrichment binding_site  5003256  5004271
#> 3316    2R Regions_of_sig_enrichment binding_site  5009457  5011203
#> 3317    2R Regions_of_sig_enrichment binding_site  5014064  5015355
#> 3318    2R Regions_of_sig_enrichment binding_site  5015798  5018690
#> 3319    2R Regions_of_sig_enrichment binding_site  5025755  5027240
#> 3320    2R Regions_of_sig_enrichment binding_site  5034606  5035624
#> 3321    2R Regions_of_sig_enrichment binding_site  5054858  5056129
#> 3322    2R Regions_of_sig_enrichment binding_site  5069992  5072137
#> 3323    2R Regions_of_sig_enrichment binding_site  5073211  5074485
#> 3324    2R Regions_of_sig_enrichment binding_site  5076920  5079748
#> 3325    2R Regions_of_sig_enrichment binding_site  5147912  5148928
#> 3326    2R Regions_of_sig_enrichment binding_site  5160073  5161765
#> 3327    2R Regions_of_sig_enrichment binding_site  5162119  5163407
#> 3328    2R Regions_of_sig_enrichment binding_site  5171350  5173988
#> 3329    2R Regions_of_sig_enrichment binding_site  5190181  5191949
#> 3330    2R Regions_of_sig_enrichment binding_site  5195276  5196625
#> 3331    2R Regions_of_sig_enrichment binding_site  5295948  5297567
#> 3332    2R Regions_of_sig_enrichment binding_site  5305735  5306738
#> 3333    2R Regions_of_sig_enrichment binding_site  5311363  5313372
#> 3334    2R Regions_of_sig_enrichment binding_site  5313762  5315392
#> 3335    2R Regions_of_sig_enrichment binding_site  5316889  5318811
#> 3336    2R Regions_of_sig_enrichment binding_site  5318971  5320290
#> 3337    2R Regions_of_sig_enrichment binding_site  5322959  5324242
#> 3338    2R Regions_of_sig_enrichment binding_site  5325256  5332183
#> 3339    2R Regions_of_sig_enrichment binding_site  5333446  5334718
#> 3340    2R Regions_of_sig_enrichment binding_site  5431095  5432620
#> 3341    2R Regions_of_sig_enrichment binding_site  5439390  5444721
#> 3342    2R Regions_of_sig_enrichment binding_site  5451954  5453596
#> 3343    2R Regions_of_sig_enrichment binding_site  5464745  5466685
#> 3344    2R Regions_of_sig_enrichment binding_site  5475672  5477429
#> 3345    2R Regions_of_sig_enrichment binding_site  5491690  5492726
#> 3346    2R Regions_of_sig_enrichment binding_site  5493742  5495287
#> 3347    2R Regions_of_sig_enrichment binding_site  5497808  5499803
#> 3348    2R Regions_of_sig_enrichment binding_site  5562377  5563694
#> 3349    2R Regions_of_sig_enrichment binding_site  5570195  5571652
#> 3350    2R Regions_of_sig_enrichment binding_site  5598587  5600850
#> 3351    2R Regions_of_sig_enrichment binding_site  5747700  5750140
#> 3352    2R Regions_of_sig_enrichment binding_site  5762410  5763419
#> 3353    2R Regions_of_sig_enrichment binding_site  5836591  5837768
#> 3354    2R Regions_of_sig_enrichment binding_site  5841912  5844074
#> 3355    2R Regions_of_sig_enrichment binding_site  5844950  5847610
#> 3356    2R Regions_of_sig_enrichment binding_site  5859310  5861471
#> 3357    2R Regions_of_sig_enrichment binding_site  5875725  5876741
#> 3358    2R Regions_of_sig_enrichment binding_site  5882144  5883575
#> 3359    2R Regions_of_sig_enrichment binding_site  5894524  5895753
#> 3360    2R Regions_of_sig_enrichment binding_site  5912517  5914535
#> 3361    2R Regions_of_sig_enrichment binding_site  5915054  5916574
#> 3362    2R Regions_of_sig_enrichment binding_site  5932122  5935300
#> 3363    2R Regions_of_sig_enrichment binding_site  5959894  5960979
#> 3364    2R Regions_of_sig_enrichment binding_site  5964765  5965920
#> 3365    2R Regions_of_sig_enrichment binding_site  5967538  5969408
#> 3366    2R Regions_of_sig_enrichment binding_site  5988293  5991128
#> 3367    2R Regions_of_sig_enrichment binding_site  5993242  5994302
#> 3368    2R Regions_of_sig_enrichment binding_site  5994611  5995699
#> 3369    2R Regions_of_sig_enrichment binding_site  5998085  5999446
#> 3370    2R Regions_of_sig_enrichment binding_site  6012426  6014749
#> 3371    2R Regions_of_sig_enrichment binding_site  6015582  6016646
#> 3372    2R Regions_of_sig_enrichment binding_site  6098689  6099888
#> 3373    2R Regions_of_sig_enrichment binding_site  6114756  6115968
#> 3374    2R Regions_of_sig_enrichment binding_site  6139288  6141037
#> 3375    2R Regions_of_sig_enrichment binding_site  6156468  6157810
#> 3376    2R Regions_of_sig_enrichment binding_site  6158161  6161092
#> 3377    2R Regions_of_sig_enrichment binding_site  6164856  6166881
#> 3378    2R Regions_of_sig_enrichment binding_site  6190197  6191255
#> 3379    2R Regions_of_sig_enrichment binding_site  6309447  6310594
#> 3380    2R Regions_of_sig_enrichment binding_site  6310855  6312418
#> 3381    2R Regions_of_sig_enrichment binding_site  6315044  6316681
#> 3382    2R Regions_of_sig_enrichment binding_site  6317527  6322192
#> 3383    2R Regions_of_sig_enrichment binding_site  6323817  6324910
#> 3384    2R Regions_of_sig_enrichment binding_site  6353780  6354807
#> 3385    2R Regions_of_sig_enrichment binding_site  6365173  6366729
#> 3386    2R Regions_of_sig_enrichment binding_site  6415430  6420626
#> 3387    2R Regions_of_sig_enrichment binding_site  6420928  6423834
#> 3388    2R Regions_of_sig_enrichment binding_site  6425493  6431411
#> 3389    2R Regions_of_sig_enrichment binding_site  6431922  6433809
#> 3390    2R Regions_of_sig_enrichment binding_site  6441226  6442441
#> 3391    2R Regions_of_sig_enrichment binding_site  6443820  6445722
#> 3392    2R Regions_of_sig_enrichment binding_site  6446508  6447541
#> 3393    2R Regions_of_sig_enrichment binding_site  6452521  6453798
#> 3394    2R Regions_of_sig_enrichment binding_site  6456401  6458058
#> 3395    2R Regions_of_sig_enrichment binding_site  6485614  6486686
#> 3396    2R Regions_of_sig_enrichment binding_site  6487995  6489326
#> 3397    2R Regions_of_sig_enrichment binding_site  6489448  6492036
#> 3398    2R Regions_of_sig_enrichment binding_site  6504940  6506876
#> 3399    2R Regions_of_sig_enrichment binding_site  6622569  6623858
#> 3400    2R Regions_of_sig_enrichment binding_site  6661151  6662769
#> 3401    2R Regions_of_sig_enrichment binding_site  6669185  6670349
#> 3402    2R Regions_of_sig_enrichment binding_site  6695998  6697448
#> 3403    2R Regions_of_sig_enrichment binding_site  6708628  6709924
#> 3404    2R Regions_of_sig_enrichment binding_site  6726039  6728251
#> 3405    2R Regions_of_sig_enrichment binding_site  6757532  6758966
#> 3406    2R Regions_of_sig_enrichment binding_site  6761314  6762411
#> 3407    2R Regions_of_sig_enrichment binding_site  6781192  6782192
#> 3408    2R Regions_of_sig_enrichment binding_site  6958496  6960893
#> 3409    2R Regions_of_sig_enrichment binding_site  6975369  6980109
#> 3410    2R Regions_of_sig_enrichment binding_site  6980210  6981862
#> 3411    2R Regions_of_sig_enrichment binding_site  6982429  6986352
#> 3412    2R Regions_of_sig_enrichment binding_site  6993138  6994520
#> 3413    2R Regions_of_sig_enrichment binding_site  7020126  7021133
#> 3414    2R Regions_of_sig_enrichment binding_site  7060654  7062195
#> 3415    2R Regions_of_sig_enrichment binding_site  7071079  7072467
#> 3416    2R Regions_of_sig_enrichment binding_site  7073517  7074764
#> 3417    2R Regions_of_sig_enrichment binding_site  7076364  7077601
#> 3418    2R Regions_of_sig_enrichment binding_site  7079938  7081319
#> 3419    2R Regions_of_sig_enrichment binding_site  7083501  7085220
#> 3420    2R Regions_of_sig_enrichment binding_site  7085450  7086681
#> 3421    2R Regions_of_sig_enrichment binding_site  7088670  7092535
#> 3422    2R Regions_of_sig_enrichment binding_site  7092650  7095343
#> 3423    2R Regions_of_sig_enrichment binding_site  7110009  7111400
#> 3424    2R Regions_of_sig_enrichment binding_site  7168757  7170335
#> 3425    2R Regions_of_sig_enrichment binding_site  7170969  7172831
#> 3426    2R Regions_of_sig_enrichment binding_site  7181141  7182492
#> 3427    2R Regions_of_sig_enrichment binding_site  7245552  7247096
#> 3428    2R Regions_of_sig_enrichment binding_site  7254154  7255258
#> 3429    2R Regions_of_sig_enrichment binding_site  7479090  7482118
#> 3430    2R Regions_of_sig_enrichment binding_site  7487510  7490943
#> 3431    2R Regions_of_sig_enrichment binding_site  7491090  7493133
#> 3432    2R Regions_of_sig_enrichment binding_site  7502973  7504018
#> 3433    2R Regions_of_sig_enrichment binding_site  7519305  7521002
#> 3434    2R Regions_of_sig_enrichment binding_site  7524459  7526304
#> 3435    2R Regions_of_sig_enrichment binding_site  7526660  7528518
#> 3436    2R Regions_of_sig_enrichment binding_site  7548973  7550718
#> 3437    2R Regions_of_sig_enrichment binding_site  7550952  7555570
#> 3438    2R Regions_of_sig_enrichment binding_site  7598634  7601594
#> 3439    2R Regions_of_sig_enrichment binding_site  7601701  7603176
#> 3440    2R Regions_of_sig_enrichment binding_site  7773948  7774969
#> 3441    2R Regions_of_sig_enrichment binding_site  7777437  7778717
#> 3442    2R Regions_of_sig_enrichment binding_site  7779671  7781135
#> 3443    2R Regions_of_sig_enrichment binding_site  7785559  7786666
#> 3444    2R Regions_of_sig_enrichment binding_site  7871421  7872617
#> 3445    2R Regions_of_sig_enrichment binding_site  7914555  7915569
#> 3446    2R Regions_of_sig_enrichment binding_site  7917122  7918572
#> 3447    2R Regions_of_sig_enrichment binding_site  8037689  8039042
#> 3448    2R Regions_of_sig_enrichment binding_site  8052672  8053971
#> 3449    2R Regions_of_sig_enrichment binding_site  8058099  8061884
#> 3450    2R Regions_of_sig_enrichment binding_site  8066301  8068192
#> 3451    2R Regions_of_sig_enrichment binding_site  8125346  8128186
#> 3452    2R Regions_of_sig_enrichment binding_site  8146659  8150198
#> 3453    2R Regions_of_sig_enrichment binding_site  8201433  8205389
#> 3454    2R Regions_of_sig_enrichment binding_site  8219467  8221161
#> 3455    2R Regions_of_sig_enrichment binding_site  8222491  8224542
#> 3456    2R Regions_of_sig_enrichment binding_site  8229760  8231147
#> 3457    2R Regions_of_sig_enrichment binding_site  8231534  8232668
#> 3458    2R Regions_of_sig_enrichment binding_site  8271145  8272418
#> 3459    2R Regions_of_sig_enrichment binding_site  8296032  8297657
#> 3460    2R Regions_of_sig_enrichment binding_site  8323979  8325495
#> 3461    2R Regions_of_sig_enrichment binding_site  8340532  8341975
#> 3462    2R Regions_of_sig_enrichment binding_site  8355127  8356224
#> 3463    2R Regions_of_sig_enrichment binding_site  8370898  8372274
#> 3464    2R Regions_of_sig_enrichment binding_site  8394070  8395273
#> 3465    2R Regions_of_sig_enrichment binding_site  8402127  8403491
#> 3466    2R Regions_of_sig_enrichment binding_site  8416077  8417308
#> 3467    2R Regions_of_sig_enrichment binding_site  8451925  8453144
#> 3468    2R Regions_of_sig_enrichment binding_site  8459436  8460481
#> 3469    2R Regions_of_sig_enrichment binding_site  8463959  8464974
#> 3470    2R Regions_of_sig_enrichment binding_site  8466321  8467893
#> 3471    2R Regions_of_sig_enrichment binding_site  8473837  8475962
#> 3472    2R Regions_of_sig_enrichment binding_site  8476077  8478094
#> 3473    2R Regions_of_sig_enrichment binding_site  8478729  8481803
#> 3474    2R Regions_of_sig_enrichment binding_site  8487462  8488642
#> 3475    2R Regions_of_sig_enrichment binding_site  8489198  8490253
#> 3476    2R Regions_of_sig_enrichment binding_site  8500222  8501224
#> 3477    2R Regions_of_sig_enrichment binding_site  8522516  8523713
#> 3478    2R Regions_of_sig_enrichment binding_site  8544159  8545199
#> 3479    2R Regions_of_sig_enrichment binding_site  8555742  8558928
#> 3480    2R Regions_of_sig_enrichment binding_site  8562909  8564153
#> 3481    2R Regions_of_sig_enrichment binding_site  8565120  8567383
#> 3482    2R Regions_of_sig_enrichment binding_site  8592267  8593321
#> 3483    2R Regions_of_sig_enrichment binding_site  8620038  8621132
#> 3484    2R Regions_of_sig_enrichment binding_site  8629861  8631270
#> 3485    2R Regions_of_sig_enrichment binding_site  8643257  8645297
#> 3486    2R Regions_of_sig_enrichment binding_site  8737212  8738572
#> 3487    2R Regions_of_sig_enrichment binding_site  8758402  8760546
#> 3488    2R Regions_of_sig_enrichment binding_site  8763823  8767772
#> 3489    2R Regions_of_sig_enrichment binding_site  8803584  8805902
#> 3490    2R Regions_of_sig_enrichment binding_site  8808722  8809953
#> 3491    2R Regions_of_sig_enrichment binding_site  8810955  8812054
#> 3492    2R Regions_of_sig_enrichment binding_site  8812202  8814333
#> 3493    2R Regions_of_sig_enrichment binding_site  8814450  8817469
#> 3494    2R Regions_of_sig_enrichment binding_site  8818056  8819086
#> 3495    2R Regions_of_sig_enrichment binding_site  8822940  8824038
#> 3496    2R Regions_of_sig_enrichment binding_site  8867786  8869113
#> 3497    2R Regions_of_sig_enrichment binding_site  8871702  8873433
#> 3498    2R Regions_of_sig_enrichment binding_site  8883409  8885602
#> 3499    2R Regions_of_sig_enrichment binding_site  8892180  8894338
#> 3500    2R Regions_of_sig_enrichment binding_site  8901950  8903827
#> 3501    2R Regions_of_sig_enrichment binding_site  8919454  8920576
#> 3502    2R Regions_of_sig_enrichment binding_site  8922418  8923429
#> 3503    2R Regions_of_sig_enrichment binding_site  9019520  9020998
#> 3504    2R Regions_of_sig_enrichment binding_site  9092446  9093496
#> 3505    2R Regions_of_sig_enrichment binding_site  9109288  9113880
#> 3506    2R Regions_of_sig_enrichment binding_site  9214646  9216012
#> 3507    2R Regions_of_sig_enrichment binding_site  9216856  9222616
#> 3508    2R Regions_of_sig_enrichment binding_site  9222724  9227073
#> 3509    2R Regions_of_sig_enrichment binding_site  9228536  9229951
#> 3510    2R Regions_of_sig_enrichment binding_site  9230375  9231388
#> 3511    2R Regions_of_sig_enrichment binding_site  9231588  9233071
#> 3512    2R Regions_of_sig_enrichment binding_site  9319207  9320367
#> 3513    2R Regions_of_sig_enrichment binding_site  9324759  9325810
#> 3514    2R Regions_of_sig_enrichment binding_site  9334117  9336721
#> 3515    2R Regions_of_sig_enrichment binding_site  9337472  9338602
#> 3516    2R Regions_of_sig_enrichment binding_site  9338922  9341817
#> 3517    2R Regions_of_sig_enrichment binding_site  9369787  9370865
#> 3518    2R Regions_of_sig_enrichment binding_site  9375715  9377306
#> 3519    2R Regions_of_sig_enrichment binding_site  9377579  9378799
#> 3520    2R Regions_of_sig_enrichment binding_site  9380255  9382001
#> 3521    2R Regions_of_sig_enrichment binding_site  9386508  9391286
#> 3522    2R Regions_of_sig_enrichment binding_site  9426643  9428190
#> 3523    2R Regions_of_sig_enrichment binding_site  9439614  9442050
#> 3524    2R Regions_of_sig_enrichment binding_site  9465072  9466686
#> 3525    2R Regions_of_sig_enrichment binding_site  9466996  9468029
#> 3526    2R Regions_of_sig_enrichment binding_site  9471263  9472906
#> 3527    2R Regions_of_sig_enrichment binding_site  9479892  9481127
#> 3528    2R Regions_of_sig_enrichment binding_site  9648061  9650277
#> 3529    2R Regions_of_sig_enrichment binding_site  9692614  9694977
#> 3530    2R Regions_of_sig_enrichment binding_site  9706021  9707023
#> 3531    2R Regions_of_sig_enrichment binding_site  9716573  9717744
#> 3532    2R Regions_of_sig_enrichment binding_site  9783288  9786171
#> 3533    2R Regions_of_sig_enrichment binding_site  9807493  9808573
#> 3534    2R Regions_of_sig_enrichment binding_site  9815376  9818543
#> 3535    2R Regions_of_sig_enrichment binding_site  9821752  9823203
#> 3536    2R Regions_of_sig_enrichment binding_site  9828838  9829844
#> 3537    2R Regions_of_sig_enrichment binding_site  9844249  9846071
#> 3538    2R Regions_of_sig_enrichment binding_site  9847659  9849036
#> 3539    2R Regions_of_sig_enrichment binding_site  9849536  9854486
#> 3540    2R Regions_of_sig_enrichment binding_site  9854680  9855854
#> 3541    2R Regions_of_sig_enrichment binding_site  9856844  9859010
#> 3542    2R Regions_of_sig_enrichment binding_site  9863052  9864600
#> 3543    2R Regions_of_sig_enrichment binding_site  9874864  9877009
#> 3544    2R Regions_of_sig_enrichment binding_site  9877320  9879027
#> 3545    2R Regions_of_sig_enrichment binding_site  9879128  9881036
#> 3546    2R Regions_of_sig_enrichment binding_site  9882511  9884043
#> 3547    2R Regions_of_sig_enrichment binding_site  9895123  9897675
#> 3548    2R Regions_of_sig_enrichment binding_site  9898979  9899996
#> 3549    2R Regions_of_sig_enrichment binding_site  9912348  9913606
#> 3550    2R Regions_of_sig_enrichment binding_site  9918008  9919168
#> 3551    2R Regions_of_sig_enrichment binding_site  9921493  9922791
#> 3552    2R Regions_of_sig_enrichment binding_site  9924700  9925789
#> 3553    2R Regions_of_sig_enrichment binding_site  9970017  9971753
#> 3554    2R Regions_of_sig_enrichment binding_site  9973395  9974537
#> 3555    2R Regions_of_sig_enrichment binding_site 10026851 10029012
#> 3556    2R Regions_of_sig_enrichment binding_site 10035178 10038000
#> 3557    2R Regions_of_sig_enrichment binding_site 10044501 10045518
#> 3558    2R Regions_of_sig_enrichment binding_site 10051220 10052496
#> 3559    2R Regions_of_sig_enrichment binding_site 10060804 10063630
#> 3560    2R Regions_of_sig_enrichment binding_site 10071434 10072523
#> 3561    2R Regions_of_sig_enrichment binding_site 10104353 10105447
#> 3562    2R Regions_of_sig_enrichment binding_site 10106216 10107274
#> 3563    2R Regions_of_sig_enrichment binding_site 10107381 10108625
#> 3564    2R Regions_of_sig_enrichment binding_site 10123791 10124883
#> 3565    2R Regions_of_sig_enrichment binding_site 10145624 10146748
#> 3566    2R Regions_of_sig_enrichment binding_site 10154519 10156868
#> 3567    2R Regions_of_sig_enrichment binding_site 10157847 10158849
#> 3568    2R Regions_of_sig_enrichment binding_site 10175373 10177074
#> 3569    2R Regions_of_sig_enrichment binding_site 10248562 10249598
#> 3570    2R Regions_of_sig_enrichment binding_site 10369440 10370445
#> 3571    2R Regions_of_sig_enrichment binding_site 10371099 10376729
#> 3572    2R Regions_of_sig_enrichment binding_site 10420466 10421473
#> 3573    2R Regions_of_sig_enrichment binding_site 10491119 10492179
#> 3574    2R Regions_of_sig_enrichment binding_site 10652864 10654965
#> 3575    2R Regions_of_sig_enrichment binding_site 10655332 10656895
#> 3576    2R Regions_of_sig_enrichment binding_site 10657575 10659233
#> 3577    2R Regions_of_sig_enrichment binding_site 10749054 10750386
#> 3578    2R Regions_of_sig_enrichment binding_site 10790303 10791400
#> 3579    2R Regions_of_sig_enrichment binding_site 10794278 10795641
#> 3580    2R Regions_of_sig_enrichment binding_site 10849514 10850629
#> 3581    2R Regions_of_sig_enrichment binding_site 11001838 11003466
#> 3582    2R Regions_of_sig_enrichment binding_site 11015297 11017687
#> 3583    2R Regions_of_sig_enrichment binding_site 11022469 11025472
#> 3584    2R Regions_of_sig_enrichment binding_site 11034407 11035441
#> 3585    2R Regions_of_sig_enrichment binding_site 11100719 11101791
#> 3586    2R Regions_of_sig_enrichment binding_site 11131739 11133373
#> 3587    2R Regions_of_sig_enrichment binding_site 11134625 11135785
#> 3588    2R Regions_of_sig_enrichment binding_site 11178670 11179780
#> 3589    2R Regions_of_sig_enrichment binding_site 11195349 11197060
#> 3590    2R Regions_of_sig_enrichment binding_site 11209923 11211123
#> 3591    2R Regions_of_sig_enrichment binding_site 11215810 11217184
#> 3592    2R Regions_of_sig_enrichment binding_site 11226915 11228234
#> 3593    2R Regions_of_sig_enrichment binding_site 11236770 11239772
#> 3594    2R Regions_of_sig_enrichment binding_site 11264227 11265393
#> 3595    2R Regions_of_sig_enrichment binding_site 11371325 11374435
#> 3596    2R Regions_of_sig_enrichment binding_site 11398276 11399723
#> 3597    2R Regions_of_sig_enrichment binding_site 11415323 11416615
#> 3598    2R Regions_of_sig_enrichment binding_site 11500265 11503058
#> 3599    2R Regions_of_sig_enrichment binding_site 11545040 11546188
#> 3600    2R Regions_of_sig_enrichment binding_site 11566744 11567804
#> 3601    2R Regions_of_sig_enrichment binding_site 11581809 11583212
#> 3602    2R Regions_of_sig_enrichment binding_site 11631442 11632717
#> 3603    2R Regions_of_sig_enrichment binding_site 11673703 11674926
#> 3604    2R Regions_of_sig_enrichment binding_site 11700305 11701527
#> 3605    2R Regions_of_sig_enrichment binding_site 11702746 11706442
#> 3606    2R Regions_of_sig_enrichment binding_site 11747508 11749034
#> 3607    2R Regions_of_sig_enrichment binding_site 11749156 11751462
#> 3608    2R Regions_of_sig_enrichment binding_site 11752211 11753631
#> 3609    2R Regions_of_sig_enrichment binding_site 11782699 11785444
#> 3610    2R Regions_of_sig_enrichment binding_site 11808745 11809771
#> 3611    2R Regions_of_sig_enrichment binding_site 11816993 11820887
#> 3612    2R Regions_of_sig_enrichment binding_site 11823331 11825178
#> 3613    2R Regions_of_sig_enrichment binding_site 11826704 11827802
#> 3614    2R Regions_of_sig_enrichment binding_site 11838981 11840329
#> 3615    2R Regions_of_sig_enrichment binding_site 11881107 11882672
#> 3616    2R Regions_of_sig_enrichment binding_site 11886513 11888379
#> 3617    2R Regions_of_sig_enrichment binding_site 11896685 11897783
#> 3618    2R Regions_of_sig_enrichment binding_site 11985438 11986480
#> 3619    2R Regions_of_sig_enrichment binding_site 11989462 11991454
#> 3620    2R Regions_of_sig_enrichment binding_site 11991564 11992654
#> 3621    2R Regions_of_sig_enrichment binding_site 11993707 11994740
#> 3622    2R Regions_of_sig_enrichment binding_site 11994949 11997128
#> 3623    2R Regions_of_sig_enrichment binding_site 12012738 12014007
#> 3624    2R Regions_of_sig_enrichment binding_site 12016787 12018936
#> 3625    2R Regions_of_sig_enrichment binding_site 12022768 12023840
#> 3626    2R Regions_of_sig_enrichment binding_site 12025420 12027148
#> 3627    2R Regions_of_sig_enrichment binding_site 12046163 12047462
#> 3628    2R Regions_of_sig_enrichment binding_site 12047578 12050221
#> 3629    2R Regions_of_sig_enrichment binding_site 12050535 12051785
#> 3630    2R Regions_of_sig_enrichment binding_site 12055346 12056445
#> 3631    2R Regions_of_sig_enrichment binding_site 12065822 12068908
#> 3632    2R Regions_of_sig_enrichment binding_site 12074094 12075241
#> 3633    2R Regions_of_sig_enrichment binding_site 12082221 12083614
#> 3634    2R Regions_of_sig_enrichment binding_site 12092476 12094873
#> 3635    2R Regions_of_sig_enrichment binding_site 12095376 12099029
#> 3636    2R Regions_of_sig_enrichment binding_site 12107786 12110142
#> 3637    2R Regions_of_sig_enrichment binding_site 12170143 12172110
#> 3638    2R Regions_of_sig_enrichment binding_site 12228096 12229266
#> 3639    2R Regions_of_sig_enrichment binding_site 12319333 12321098
#> 3640    2R Regions_of_sig_enrichment binding_site 12458348 12459425
#> 3641    2R Regions_of_sig_enrichment binding_site 12466708 12469187
#> 3642    2R Regions_of_sig_enrichment binding_site 12481268 12483016
#> 3643    2R Regions_of_sig_enrichment binding_site 12496576 12498023
#> 3644    2R Regions_of_sig_enrichment binding_site 12546621 12549095
#> 3645    2R Regions_of_sig_enrichment binding_site 12560018 12561185
#> 3646    2R Regions_of_sig_enrichment binding_site 12577253 12578825
#> 3647    2R Regions_of_sig_enrichment binding_site 12579035 12580148
#> 3648    2R Regions_of_sig_enrichment binding_site 12671020 12672529
#> 3649    2R Regions_of_sig_enrichment binding_site 12673841 12675574
#> 3650    2R Regions_of_sig_enrichment binding_site 12677544 12678908
#> 3651    2R Regions_of_sig_enrichment binding_site 12687299 12688667
#> 3652    2R Regions_of_sig_enrichment binding_site 12705140 12707057
#> 3653    2R Regions_of_sig_enrichment binding_site 12716714 12718031
#> 3654    2R Regions_of_sig_enrichment binding_site 12718216 12719285
#> 3655    2R Regions_of_sig_enrichment binding_site 12735597 12737275
#> 3656    2R Regions_of_sig_enrichment binding_site 12746094 12747185
#> 3657    2R Regions_of_sig_enrichment binding_site 12768715 12769878
#> 3658    2R Regions_of_sig_enrichment binding_site 12807199 12808983
#> 3659    2R Regions_of_sig_enrichment binding_site 12809313 12811287
#> 3660    2R Regions_of_sig_enrichment binding_site 12895409 12896895
#> 3661    2R Regions_of_sig_enrichment binding_site 12897259 12898666
#> 3662    2R Regions_of_sig_enrichment binding_site 12902881 12904484
#> 3663    2R Regions_of_sig_enrichment binding_site 12914230 12916508
#> 3664    2R Regions_of_sig_enrichment binding_site 12923659 12924669
#> 3665    2R Regions_of_sig_enrichment binding_site 12935950 12937667
#> 3666    2R Regions_of_sig_enrichment binding_site 12939681 12941144
#> 3667    2R Regions_of_sig_enrichment binding_site 12943882 12944966
#> 3668    2R Regions_of_sig_enrichment binding_site 13028426 13029501
#> 3669    2R Regions_of_sig_enrichment binding_site 13030975 13032134
#> 3670    2R Regions_of_sig_enrichment binding_site 13148989 13150235
#> 3671    2R Regions_of_sig_enrichment binding_site 13152393 13153568
#> 3672    2R Regions_of_sig_enrichment binding_site 13156916 13158221
#> 3673    2R Regions_of_sig_enrichment binding_site 13264315 13266456
#> 3674    2R Regions_of_sig_enrichment binding_site 13279692 13282473
#> 3675    2R Regions_of_sig_enrichment binding_site 13293630 13294932
#> 3676    2R Regions_of_sig_enrichment binding_site 13307586 13309135
#> 3677    2R Regions_of_sig_enrichment binding_site 13309443 13310600
#> 3678    2R Regions_of_sig_enrichment binding_site 13331540 13332711
#> 3679    2R Regions_of_sig_enrichment binding_site 13332836 13334356
#> 3680    2R Regions_of_sig_enrichment binding_site 13344864 13348190
#> 3681    2R Regions_of_sig_enrichment binding_site 13348385 13349975
#> 3682    2R Regions_of_sig_enrichment binding_site 13379793 13381605
#> 3683    2R Regions_of_sig_enrichment binding_site 13403014 13404076
#> 3684    2R Regions_of_sig_enrichment binding_site 13404513 13406250
#> 3685    2R Regions_of_sig_enrichment binding_site 13421562 13422995
#> 3686    2R Regions_of_sig_enrichment binding_site 13455456 13456944
#> 3687    2R Regions_of_sig_enrichment binding_site 13459663 13461483
#> 3688    2R Regions_of_sig_enrichment binding_site 13503253 13505301
#> 3689    2R Regions_of_sig_enrichment binding_site 13527381 13528499
#> 3690    2R Regions_of_sig_enrichment binding_site 13565259 13567005
#> 3691    2R Regions_of_sig_enrichment binding_site 13569534 13571232
#> 3692    2R Regions_of_sig_enrichment binding_site 13604880 13607294
#> 3693    2R Regions_of_sig_enrichment binding_site 13648071 13649336
#> 3694    2R Regions_of_sig_enrichment binding_site 13665512 13666648
#> 3695    2R Regions_of_sig_enrichment binding_site 13668602 13669886
#> 3696    2R Regions_of_sig_enrichment binding_site 13676517 13677523
#> 3697    2R Regions_of_sig_enrichment binding_site 13679271 13681985
#> 3698    2R Regions_of_sig_enrichment binding_site 13683395 13684730
#> 3699    2R Regions_of_sig_enrichment binding_site 13686396 13690012
#> 3700    2R Regions_of_sig_enrichment binding_site 13728797 13729874
#> 3701    2R Regions_of_sig_enrichment binding_site 13729982 13732783
#> 3702    2R Regions_of_sig_enrichment binding_site 13733173 13734956
#> 3703    2R Regions_of_sig_enrichment binding_site 13736303 13738721
#> 3704    2R Regions_of_sig_enrichment binding_site 13741879 13743870
#> 3705    2R Regions_of_sig_enrichment binding_site 13750918 13751960
#> 3706    2R Regions_of_sig_enrichment binding_site 13756340 13758263
#> 3707    2R Regions_of_sig_enrichment binding_site 13758386 13759430
#> 3708    2R Regions_of_sig_enrichment binding_site 13770091 13774299
#> 3709    2R Regions_of_sig_enrichment binding_site 13813354 13814932
#> 3710    2R Regions_of_sig_enrichment binding_site 14028461 14029515
#> 3711    2R Regions_of_sig_enrichment binding_site 14029664 14030898
#> 3712    2R Regions_of_sig_enrichment binding_site 14043503 14044791
#> 3713    2R Regions_of_sig_enrichment binding_site 14056968 14059146
#> 3714    2R Regions_of_sig_enrichment binding_site 14062346 14064050
#> 3715    2R Regions_of_sig_enrichment binding_site 14066731 14068440
#> 3716    2R Regions_of_sig_enrichment binding_site 14079797 14082240
#> 3717    2R Regions_of_sig_enrichment binding_site 14117190 14120284
#> 3718    2R Regions_of_sig_enrichment binding_site 14175480 14176951
#> 3719    2R Regions_of_sig_enrichment binding_site 14179209 14180498
#> 3720    2R Regions_of_sig_enrichment binding_site 14226472 14227574
#> 3721    2R Regions_of_sig_enrichment binding_site 14229034 14230960
#> 3722    2R Regions_of_sig_enrichment binding_site 14238555 14239664
#> 3723    2R Regions_of_sig_enrichment binding_site 14243092 14245928
#> 3724    2R Regions_of_sig_enrichment binding_site 14285591 14286681
#> 3725    2R Regions_of_sig_enrichment binding_site 14293401 14294437
#> 3726    2R Regions_of_sig_enrichment binding_site 14298018 14299141
#> 3727    2R Regions_of_sig_enrichment binding_site 14299391 14302899
#> 3728    2R Regions_of_sig_enrichment binding_site 14318235 14319273
#> 3729    2R Regions_of_sig_enrichment binding_site 14329712 14330759
#> 3730    2R Regions_of_sig_enrichment binding_site 14410042 14412539
#> 3731    2R Regions_of_sig_enrichment binding_site 14416196 14417325
#> 3732    2R Regions_of_sig_enrichment binding_site 14417673 14419485
#> 3733    2R Regions_of_sig_enrichment binding_site 14422922 14424059
#> 3734    2R Regions_of_sig_enrichment binding_site 14497831 14499347
#> 3735    2R Regions_of_sig_enrichment binding_site 14555824 14556947
#> 3736    2R Regions_of_sig_enrichment binding_site 14560501 14561615
#> 3737    2R Regions_of_sig_enrichment binding_site 14575536 14577604
#> 3738    2R Regions_of_sig_enrichment binding_site 14577757 14579711
#> 3739    2R Regions_of_sig_enrichment binding_site 14593029 14594532
#> 3740    2R Regions_of_sig_enrichment binding_site 14638567 14640700
#> 3741    2R Regions_of_sig_enrichment binding_site 14640821 14643463
#> 3742    2R Regions_of_sig_enrichment binding_site 14687612 14692186
#> 3743    2R Regions_of_sig_enrichment binding_site 14693709 14695658
#> 3744    2R Regions_of_sig_enrichment binding_site 14720933 14722281
#> 3745    2R Regions_of_sig_enrichment binding_site 14728619 14729642
#> 3746    2R Regions_of_sig_enrichment binding_site 14732667 14734769
#> 3747    2R Regions_of_sig_enrichment binding_site 15028939 15030066
#> 3748    2R Regions_of_sig_enrichment binding_site 15031245 15032843
#> 3749    2R Regions_of_sig_enrichment binding_site 15034951 15036057
#> 3750    2R Regions_of_sig_enrichment binding_site 15040125 15041793
#> 3751    2R Regions_of_sig_enrichment binding_site 15051403 15052712
#> 3752    2R Regions_of_sig_enrichment binding_site 15054766 15055966
#> 3753    2R Regions_of_sig_enrichment binding_site 15056351 15058372
#> 3754    2R Regions_of_sig_enrichment binding_site 15116389 15117804
#> 3755    2R Regions_of_sig_enrichment binding_site 15120492 15122123
#> 3756    2R Regions_of_sig_enrichment binding_site 15179515 15181547
#> 3757    2R Regions_of_sig_enrichment binding_site 15184228 15185749
#> 3758    2R Regions_of_sig_enrichment binding_site 15243842 15245169
#> 3759    2R Regions_of_sig_enrichment binding_site 15245625 15246636
#> 3760    2R Regions_of_sig_enrichment binding_site 15248057 15251191
#> 3761    2R Regions_of_sig_enrichment binding_site 15282370 15283833
#> 3762    2R Regions_of_sig_enrichment binding_site 15301934 15303043
#> 3763    2R Regions_of_sig_enrichment binding_site 15308359 15310153
#> 3764    2R Regions_of_sig_enrichment binding_site 15311133 15312325
#> 3765    2R Regions_of_sig_enrichment binding_site 15337238 15339180
#> 3766    2R Regions_of_sig_enrichment binding_site 15342990 15345399
#> 3767    2R Regions_of_sig_enrichment binding_site 15349559 15351425
#> 3768    2R Regions_of_sig_enrichment binding_site 15354218 15357098
#> 3769    2R Regions_of_sig_enrichment binding_site 15371256 15373048
#> 3770    2R Regions_of_sig_enrichment binding_site 15452266 15453891
#> 3771    2R Regions_of_sig_enrichment binding_site 15519378 15520756
#> 3772    2R Regions_of_sig_enrichment binding_site 15744581 15745709
#> 3773    2R Regions_of_sig_enrichment binding_site 15970969 15972095
#> 3774    2R Regions_of_sig_enrichment binding_site 16157857 16159056
#> 3775    2R Regions_of_sig_enrichment binding_site 16165739 16166807
#> 3776    2R Regions_of_sig_enrichment binding_site 16192461 16194199
#> 3777    2R Regions_of_sig_enrichment binding_site 16199679 16201729
#> 3778    2R Regions_of_sig_enrichment binding_site 16217658 16220284
#> 3779    2R Regions_of_sig_enrichment binding_site 16558050 16559066
#> 3780    2R Regions_of_sig_enrichment binding_site 16719139 16720434
#> 3781    2R Regions_of_sig_enrichment binding_site 16826985 16828022
#> 3782    2R Regions_of_sig_enrichment binding_site 16883339 16884646
#> 3783    2R Regions_of_sig_enrichment binding_site 16885671 16886820
#> 3784    2R Regions_of_sig_enrichment binding_site 16887327 16888634
#> 3785    2R Regions_of_sig_enrichment binding_site 16959579 16961795
#> 3786    2R Regions_of_sig_enrichment binding_site 16962623 16963745
#> 3787    2R Regions_of_sig_enrichment binding_site 16965502 16967252
#> 3788    2R Regions_of_sig_enrichment binding_site 17021580 17022744
#> 3789    2R Regions_of_sig_enrichment binding_site 17030377 17031890
#> 3790    2R Regions_of_sig_enrichment binding_site 17042842 17044023
#> 3791    2R Regions_of_sig_enrichment binding_site 17045449 17048148
#> 3792    2R Regions_of_sig_enrichment binding_site 17087803 17090367
#> 3793    2R Regions_of_sig_enrichment binding_site 17180499 17181615
#> 3794    2R Regions_of_sig_enrichment binding_site 17185049 17186437
#> 3795    2R Regions_of_sig_enrichment binding_site 17198957 17199982
#> 3796    2R Regions_of_sig_enrichment binding_site 17200112 17201711
#> 3797    2R Regions_of_sig_enrichment binding_site 17255057 17257347
#> 3798    2R Regions_of_sig_enrichment binding_site 17266059 17267413
#> 3799    2R Regions_of_sig_enrichment binding_site 17268476 17269712
#> 3800    2R Regions_of_sig_enrichment binding_site 17273843 17274966
#> 3801    2R Regions_of_sig_enrichment binding_site 17384105 17385300
#> 3802    2R Regions_of_sig_enrichment binding_site 17386617 17387647
#> 3803    2R Regions_of_sig_enrichment binding_site 17389087 17390825
#> 3804    2R Regions_of_sig_enrichment binding_site 17393253 17395109
#> 3805    2R Regions_of_sig_enrichment binding_site 17395229 17397069
#> 3806    2R Regions_of_sig_enrichment binding_site 17401381 17403289
#> 3807    2R Regions_of_sig_enrichment binding_site 17403652 17404735
#> 3808    2R Regions_of_sig_enrichment binding_site 17405859 17407893
#> 3809    2R Regions_of_sig_enrichment binding_site 17421665 17423903
#> 3810    2R Regions_of_sig_enrichment binding_site 17445523 17448650
#> 3811    2R Regions_of_sig_enrichment binding_site 17491675 17496498
#> 3812    2R Regions_of_sig_enrichment binding_site 17532514 17535857
#> 3813    2R Regions_of_sig_enrichment binding_site 17575703 17577154
#> 3814    2R Regions_of_sig_enrichment binding_site 17587748 17590905
#> 3815    2R Regions_of_sig_enrichment binding_site 17591025 17592664
#> 3816    2R Regions_of_sig_enrichment binding_site 17596008 17597767
#> 3817    2R Regions_of_sig_enrichment binding_site 17600364 17602477
#> 3818    2R Regions_of_sig_enrichment binding_site 17603050 17605505
#> 3819    2R Regions_of_sig_enrichment binding_site 17771378 17772419
#> 3820    2R Regions_of_sig_enrichment binding_site 17947937 17949277
#> 3821    2R Regions_of_sig_enrichment binding_site 17955792 17956826
#> 3822    2R Regions_of_sig_enrichment binding_site 17962559 17963722
#> 3823    2R Regions_of_sig_enrichment binding_site 17965190 17966259
#> 3824    2R Regions_of_sig_enrichment binding_site 17994070 17995121
#> 3825    2R Regions_of_sig_enrichment binding_site 18001022 18002039
#> 3826    2R Regions_of_sig_enrichment binding_site 18002911 18004263
#> 3827    2R Regions_of_sig_enrichment binding_site 18008062 18009229
#> 3828    2R Regions_of_sig_enrichment binding_site 18021072 18022317
#> 3829    2R Regions_of_sig_enrichment binding_site 18084324 18085416
#> 3830    2R Regions_of_sig_enrichment binding_site 18099855 18101071
#> 3831    2R Regions_of_sig_enrichment binding_site 18204205 18206467
#> 3832    2R Regions_of_sig_enrichment binding_site 18260323 18261671
#> 3833    2R Regions_of_sig_enrichment binding_site 18383118 18384333
#> 3834    2R Regions_of_sig_enrichment binding_site 18425514 18427486
#> 3835    2R Regions_of_sig_enrichment binding_site 18427943 18430616
#> 3836    2R Regions_of_sig_enrichment binding_site 18433204 18434319
#> 3837    2R Regions_of_sig_enrichment binding_site 18435245 18436425
#> 3838    2R Regions_of_sig_enrichment binding_site 18440494 18442638
#> 3839    2R Regions_of_sig_enrichment binding_site 18456964 18458131
#> 3840    2R Regions_of_sig_enrichment binding_site 18483404 18485029
#> 3841    2R Regions_of_sig_enrichment binding_site 18489047 18490067
#> 3842    2R Regions_of_sig_enrichment binding_site 18493185 18494693
#> 3843    2R Regions_of_sig_enrichment binding_site 18494817 18495891
#> 3844    2R Regions_of_sig_enrichment binding_site 18549412 18551921
#> 3845    2R Regions_of_sig_enrichment binding_site 18553718 18555582
#> 3846    2R Regions_of_sig_enrichment binding_site 18563808 18564822
#> 3847    2R Regions_of_sig_enrichment binding_site 18565413 18566615
#> 3848    2R Regions_of_sig_enrichment binding_site 18568080 18569157
#> 3849    2R Regions_of_sig_enrichment binding_site 18573124 18574492
#> 3850    2R Regions_of_sig_enrichment binding_site 18576187 18577439
#> 3851    2R Regions_of_sig_enrichment binding_site 18587220 18588716
#> 3852    2R Regions_of_sig_enrichment binding_site 18684871 18686101
#> 3853    2R Regions_of_sig_enrichment binding_site 18773194 18774296
#> 3854    2R Regions_of_sig_enrichment binding_site 18783006 18784282
#> 3855    2R Regions_of_sig_enrichment binding_site 18812656 18813671
#> 3856    2R Regions_of_sig_enrichment binding_site 18956322 18957475
#> 3857    2R Regions_of_sig_enrichment binding_site 19244261 19245395
#> 3858    2R Regions_of_sig_enrichment binding_site 19389244 19390724
#> 3859    2R Regions_of_sig_enrichment binding_site 19438546 19439921
#> 3860    2R Regions_of_sig_enrichment binding_site 19467697 19469030
#> 3861    2R Regions_of_sig_enrichment binding_site 19469635 19470647
#> 3862    2R Regions_of_sig_enrichment binding_site 19482841 19483930
#> 3863    2R Regions_of_sig_enrichment binding_site 19488904 19490081
#> 3864    2R Regions_of_sig_enrichment binding_site 19500776 19502149
#> 3865    2R Regions_of_sig_enrichment binding_site 19544983 19548382
#> 3866    2R Regions_of_sig_enrichment binding_site 19554126 19555299
#> 3867    2R Regions_of_sig_enrichment binding_site 19558928 19560039
#> 3868    2R Regions_of_sig_enrichment binding_site 19587391 19590400
#> 3869    2R Regions_of_sig_enrichment binding_site 19600581 19602352
#> 3870    2R Regions_of_sig_enrichment binding_site 19602866 19604015
#> 3871    2R Regions_of_sig_enrichment binding_site 19705728 19707566
#> 3872    2R Regions_of_sig_enrichment binding_site 19729813 19730934
#> 3873    2R Regions_of_sig_enrichment binding_site 19737552 19739152
#> 3874    2R Regions_of_sig_enrichment binding_site 19751923 19753312
#> 3875    2R Regions_of_sig_enrichment binding_site 19756920 19762616
#> 3876    2R Regions_of_sig_enrichment binding_site 19765766 19768202
#> 3877    2R Regions_of_sig_enrichment binding_site 19780101 19781276
#> 3878    2R Regions_of_sig_enrichment binding_site 19827792 19828937
#> 3879    2R Regions_of_sig_enrichment binding_site 19829371 19830595
#> 3880    2R Regions_of_sig_enrichment binding_site 19865718 19867476
#> 3881    2R Regions_of_sig_enrichment binding_site 19875029 19876123
#> 3882    2R Regions_of_sig_enrichment binding_site 19932119 19933930
#> 3883    2R Regions_of_sig_enrichment binding_site 19953402 19954751
#> 3884    2R Regions_of_sig_enrichment binding_site 20000637 20001988
#> 3885    2R Regions_of_sig_enrichment binding_site 20063692 20064765
#> 3886    2R Regions_of_sig_enrichment binding_site 20072748 20075296
#> 3887    2R Regions_of_sig_enrichment binding_site 20145441 20146567
#> 3888    2R Regions_of_sig_enrichment binding_site 20187277 20188752
#> 3889    2R Regions_of_sig_enrichment binding_site 20193215 20194755
#> 3890    2R Regions_of_sig_enrichment binding_site 20276323 20277592
#> 3891    2R Regions_of_sig_enrichment binding_site 20286405 20287660
#> 3892    2R Regions_of_sig_enrichment binding_site 20288089 20290212
#> 3893    2R Regions_of_sig_enrichment binding_site 20402158 20403456
#> 3894    2R Regions_of_sig_enrichment binding_site 20418715 20420002
#> 3895    2R Regions_of_sig_enrichment binding_site 20426382 20427947
#> 3896    2R Regions_of_sig_enrichment binding_site 20430834 20432085
#> 3897    2R Regions_of_sig_enrichment binding_site 20439896 20440954
#> 3898    2R Regions_of_sig_enrichment binding_site 20442732 20444586
#> 3899    2R Regions_of_sig_enrichment binding_site 20444703 20446200
#> 3900    2R Regions_of_sig_enrichment binding_site 20446844 20448014
#> 3901    2R Regions_of_sig_enrichment binding_site 20451957 20453241
#> 3902    2R Regions_of_sig_enrichment binding_site 20571972 20573312
#> 3903    2R Regions_of_sig_enrichment binding_site 20632278 20633618
#> 3904    2R Regions_of_sig_enrichment binding_site 20643626 20645843
#> 3905    2R Regions_of_sig_enrichment binding_site 20654536 20656368
#> 3906    2R Regions_of_sig_enrichment binding_site 20657613 20659115
#> 3907    2R Regions_of_sig_enrichment binding_site 20680192 20681866
#> 3908    2R Regions_of_sig_enrichment binding_site 20756720 20757866
#> 3909    2R Regions_of_sig_enrichment binding_site 20758872 20759943
#> 3910    2R Regions_of_sig_enrichment binding_site 20769074 20770629
#> 3911    2R Regions_of_sig_enrichment binding_site 20829775 20830898
#> 3912    2R Regions_of_sig_enrichment binding_site 20831217 20833343
#> 3913    2R Regions_of_sig_enrichment binding_site 20848950 20852825
#> 3914    2R Regions_of_sig_enrichment binding_site 20872280 20876408
#> 3915    2R Regions_of_sig_enrichment binding_site 20888594 20889634
#> 3916    2R Regions_of_sig_enrichment binding_site 20898097 20899892
#> 3917    2R Regions_of_sig_enrichment binding_site 20925284 20926836
#> 3918    2R Regions_of_sig_enrichment binding_site 20963465 20965128
#> 3919    2R Regions_of_sig_enrichment binding_site 20971639 20972700
#> 3920    2R Regions_of_sig_enrichment binding_site 21077099 21078700
#> 3921    2R Regions_of_sig_enrichment binding_site 21140656 21141897
#> 3922    2R  Regions_of_sig_depletion binding_site  1716489  1717508
#> 3923    2R  Regions_of_sig_depletion binding_site  3011580  3012667
#> 3924    2R  Regions_of_sig_depletion binding_site  3182964  3184153
#> 3925    2R  Regions_of_sig_depletion binding_site  4769353  4770725
#> 3926    2R  Regions_of_sig_depletion binding_site  5663172  5664252
#> 3927    2R  Regions_of_sig_depletion binding_site  8001898  8002926
#> 3928    2R  Regions_of_sig_depletion binding_site  9002871  9004107
#> 3929    2R  Regions_of_sig_depletion binding_site 11386584 11388113
#> 3930    2R  Regions_of_sig_depletion binding_site 16604304 16605533
#> 3931    2R  Regions_of_sig_depletion binding_site 18188123 18189312
#> 3932    2R  Regions_of_sig_depletion binding_site 18609680 18610781
#> 3933    2R  Regions_of_sig_depletion binding_site 19658655 19659921
#> 3934    2R  Regions_of_sig_depletion binding_site 19683813 19685011
#> 3935    2R  Regions_of_sig_depletion binding_site 19885953 19887574
#> 3936    2R  Regions_of_sig_depletion binding_site 20377654 20378806
#> 3937    2R  Regions_of_sig_depletion binding_site 20594905 20595919
#> 3938     U  Regions_of_sig_depletion binding_site  5289803  5292429
#> 3939     U  Regions_of_sig_depletion binding_site  5292536  5294026
#> 3940     U  Regions_of_sig_depletion binding_site  5295264  5296684
#> 3941     U  Regions_of_sig_depletion binding_site  5299026  5300172
#> 3942     4 Regions_of_sig_enrichment binding_site    90087    91777
#> 3943     4 Regions_of_sig_enrichment binding_site   110343   111940
#> 3944     4 Regions_of_sig_enrichment binding_site   436180   437534
#> 3945     4 Regions_of_sig_enrichment binding_site   509739   511293
#> 3946     4 Regions_of_sig_enrichment binding_site   576975   579591
#> 3947     4 Regions_of_sig_enrichment binding_site   645587   646866
#> 3948     4 Regions_of_sig_enrichment binding_site   677960   679249
#> 3949     4 Regions_of_sig_enrichment binding_site   679448   681223
#> 3950     4 Regions_of_sig_enrichment binding_site  1133021  1134727
#> 3951     4 Regions_of_sig_enrichment binding_site  1158155  1159395
#> 3952     4 Regions_of_sig_enrichment binding_site  1229825  1231108
#> 3953     4 Regions_of_sig_enrichment binding_site  1254155  1255361
#> 3954 3LHet Regions_of_sig_enrichment binding_site  2545026  2546077
#> 3955  XHet Regions_of_sig_enrichment binding_site    76623    77627
#> 3956  XHet Regions_of_sig_enrichment binding_site    79902    81339
#>           score strand phase              attributes
#> 1     0.4996189      .     .    ID=enriched_region_1
#> 2     1.0976743      .     .    ID=enriched_region_2
#> 3     0.9144886      .     .    ID=enriched_region_3
#> 4     0.7766093      .     .    ID=enriched_region_4
#> 5     0.4774212      .     .    ID=enriched_region_5
#> 6     0.3644389      .     .    ID=enriched_region_6
#> 7     0.9413324      .     .    ID=enriched_region_7
#> 8     0.9109565      .     .    ID=enriched_region_8
#> 9     0.5903201      .     .    ID=enriched_region_9
#> 10    0.8156522      .     .   ID=enriched_region_10
#> 11    0.7921646      .     .   ID=enriched_region_11
#> 12    0.7700146      .     .   ID=enriched_region_12
#> 13    1.1959006      .     .   ID=enriched_region_13
#> 14    0.6450992      .     .   ID=enriched_region_14
#> 15    0.6632106      .     .   ID=enriched_region_15
#> 16    0.9368193      .     .   ID=enriched_region_16
#> 17    0.6898205      .     .   ID=enriched_region_17
#> 18    0.4939484      .     .   ID=enriched_region_18
#> 19    0.6839720      .     .   ID=enriched_region_19
#> 20    0.4851852      .     .   ID=enriched_region_20
#> 21    1.9351490      .     .   ID=enriched_region_21
#> 22    0.6220778      .     .   ID=enriched_region_22
#> 23    1.2454539      .     .   ID=enriched_region_23
#> 24    1.0872036      .     .   ID=enriched_region_24
#> 25    0.6793022      .     .   ID=enriched_region_25
#> 26    0.6413091      .     .   ID=enriched_region_26
#> 27    0.5550084      .     .   ID=enriched_region_27
#> 28    0.4096478      .     .   ID=enriched_region_28
#> 29    1.4508501      .     .   ID=enriched_region_29
#> 30    0.6463829      .     .   ID=enriched_region_30
#> 31    0.7499913      .     .   ID=enriched_region_31
#> 32    1.7704823      .     .   ID=enriched_region_32
#> 33    0.6050775      .     .   ID=enriched_region_33
#> 34    0.7231893      .     .   ID=enriched_region_34
#> 35    0.5884103      .     .   ID=enriched_region_35
#> 36    0.7323347      .     .   ID=enriched_region_36
#> 37    0.5903490      .     .   ID=enriched_region_37
#> 38    0.4575459      .     .   ID=enriched_region_38
#> 39    0.6081743      .     .   ID=enriched_region_39
#> 40    1.1890578      .     .   ID=enriched_region_40
#> 41    0.4213875      .     .   ID=enriched_region_41
#> 42    1.5670366      .     .   ID=enriched_region_42
#> 43    0.4688243      .     .   ID=enriched_region_43
#> 44    0.4644083      .     .   ID=enriched_region_44
#> 45    0.6718774      .     .   ID=enriched_region_45
#> 46    0.7848162      .     .   ID=enriched_region_46
#> 47    0.4876223      .     .   ID=enriched_region_47
#> 48    0.7347092      .     .   ID=enriched_region_48
#> 49    1.0123095      .     .   ID=enriched_region_49
#> 50    0.4582007      .     .   ID=enriched_region_50
#> 51    0.8203365      .     .   ID=enriched_region_51
#> 52    0.3981518      .     .   ID=enriched_region_52
#> 53    0.9596505      .     .   ID=enriched_region_53
#> 54    0.7632604      .     .   ID=enriched_region_54
#> 55    0.8729742      .     .   ID=enriched_region_55
#> 56    0.6098426      .     .   ID=enriched_region_56
#> 57    0.5698864      .     .   ID=enriched_region_57
#> 58    0.5053139      .     .   ID=enriched_region_58
#> 59    0.5846284      .     .   ID=enriched_region_59
#> 60    0.4117954      .     .   ID=enriched_region_60
#> 61    0.6542684      .     .   ID=enriched_region_61
#> 62    0.4744985      .     .   ID=enriched_region_62
#> 63    0.7990789      .     .   ID=enriched_region_63
#> 64    1.1367241      .     .   ID=enriched_region_64
#> 65    0.5896557      .     .   ID=enriched_region_65
#> 66    1.4575199      .     .   ID=enriched_region_66
#> 67    0.3612779      .     .   ID=enriched_region_67
#> 68    0.7746966      .     .   ID=enriched_region_68
#> 69    0.8326676      .     .   ID=enriched_region_69
#> 70    0.4866224      .     .   ID=enriched_region_70
#> 71    0.8904143      .     .   ID=enriched_region_71
#> 72    0.3630614      .     .   ID=enriched_region_72
#> 73    0.7421229      .     .   ID=enriched_region_73
#> 74    1.0299396      .     .   ID=enriched_region_74
#> 75    1.0898629      .     .   ID=enriched_region_75
#> 76    0.3828920      .     .   ID=enriched_region_76
#> 77    1.8932705      .     .   ID=enriched_region_77
#> 78    0.6987177      .     .   ID=enriched_region_78
#> 79    1.4676071      .     .   ID=enriched_region_79
#> 80    1.7525830      .     .   ID=enriched_region_80
#> 81    0.4912408      .     .   ID=enriched_region_81
#> 82    1.0908275      .     .   ID=enriched_region_82
#> 83    0.7238790      .     .   ID=enriched_region_83
#> 84    0.7281844      .     .   ID=enriched_region_84
#> 85    0.5586960      .     .   ID=enriched_region_85
#> 86    0.7252225      .     .   ID=enriched_region_86
#> 87    0.7752233      .     .   ID=enriched_region_87
#> 88    0.5386020      .     .   ID=enriched_region_88
#> 89    0.7463304      .     .   ID=enriched_region_89
#> 90    1.4808044      .     .   ID=enriched_region_90
#> 91    0.4678189      .     .   ID=enriched_region_91
#> 92    0.8586959      .     .   ID=enriched_region_92
#> 93    0.6901630      .     .   ID=enriched_region_93
#> 94    0.9285847      .     .   ID=enriched_region_94
#> 95    0.7429992      .     .   ID=enriched_region_95
#> 96    1.0165818      .     .   ID=enriched_region_96
#> 97    0.8420589      .     .   ID=enriched_region_97
#> 98    0.6823725      .     .   ID=enriched_region_98
#> 99    0.8033036      .     .   ID=enriched_region_99
#> 100   1.2459352      .     .  ID=enriched_region_100
#> 101   0.7388673      .     .  ID=enriched_region_101
#> 102   0.3898796      .     .  ID=enriched_region_102
#> 103   0.5553101      .     .  ID=enriched_region_103
#> 104   1.8033908      .     .  ID=enriched_region_104
#> 105   0.6743240      .     .  ID=enriched_region_105
#> 106   0.6963769      .     .  ID=enriched_region_106
#> 107   0.8032645      .     .  ID=enriched_region_107
#> 108   0.7664308      .     .  ID=enriched_region_108
#> 109   0.6132466      .     .  ID=enriched_region_109
#> 110   0.7666977      .     .  ID=enriched_region_110
#> 111   0.6200789      .     .  ID=enriched_region_111
#> 112   1.8649442      .     .  ID=enriched_region_112
#> 113   0.5573009      .     .  ID=enriched_region_113
#> 114   0.5271630      .     .  ID=enriched_region_114
#> 115   0.7344193      .     .  ID=enriched_region_115
#> 116   0.5532549      .     .  ID=enriched_region_116
#> 117   1.8180837      .     .  ID=enriched_region_117
#> 118   0.6165676      .     .  ID=enriched_region_118
#> 119   0.7547071      .     .  ID=enriched_region_119
#> 120   0.4723727      .     .  ID=enriched_region_120
#> 121   0.6185738      .     .  ID=enriched_region_121
#> 122   0.9154002      .     .  ID=enriched_region_122
#> 123   0.4341215      .     .  ID=enriched_region_123
#> 124   0.8486552      .     .  ID=enriched_region_124
#> 125   0.5237707      .     .  ID=enriched_region_125
#> 126   0.4084968      .     .  ID=enriched_region_126
#> 127   0.8152117      .     .  ID=enriched_region_127
#> 128   1.1280756      .     .  ID=enriched_region_128
#> 129   0.8246537      .     .  ID=enriched_region_129
#> 130   0.6390917      .     .  ID=enriched_region_130
#> 131   0.3010534      .     .  ID=enriched_region_131
#> 132   1.1775798      .     .  ID=enriched_region_132
#> 133   0.5360797      .     .  ID=enriched_region_133
#> 134   0.5501770      .     .  ID=enriched_region_134
#> 135   0.4522520      .     .  ID=enriched_region_135
#> 136   1.6812132      .     .  ID=enriched_region_136
#> 137   0.4159384      .     .  ID=enriched_region_137
#> 138   0.8253785      .     .  ID=enriched_region_138
#> 139   0.6328061      .     .  ID=enriched_region_139
#> 140   0.6768851      .     .  ID=enriched_region_140
#> 141   0.7932443      .     .  ID=enriched_region_141
#> 142   0.5690495      .     .  ID=enriched_region_142
#> 143   0.9894181      .     .  ID=enriched_region_143
#> 144   0.9640939      .     .  ID=enriched_region_144
#> 145   0.4418644      .     .  ID=enriched_region_145
#> 146   0.5767258      .     .  ID=enriched_region_146
#> 147   3.2774024      .     .  ID=enriched_region_147
#> 148   2.8957548      .     .  ID=enriched_region_148
#> 149   0.3531039      .     .  ID=enriched_region_149
#> 150   1.0003308      .     .  ID=enriched_region_150
#> 151   0.6065746      .     .  ID=enriched_region_151
#> 152   0.7535261      .     .  ID=enriched_region_152
#> 153   1.1338933      .     .  ID=enriched_region_153
#> 154   1.1539606      .     .  ID=enriched_region_154
#> 155   0.5057670      .     .  ID=enriched_region_155
#> 156   2.2179324      .     .  ID=enriched_region_156
#> 157   0.5892391      .     .  ID=enriched_region_157
#> 158   0.5501205      .     .  ID=enriched_region_158
#> 159   1.2353025      .     .  ID=enriched_region_159
#> 160   0.6707651      .     .  ID=enriched_region_160
#> 161   0.8897120      .     .  ID=enriched_region_161
#> 162   0.5155859      .     .  ID=enriched_region_162
#> 163   1.2339398      .     .  ID=enriched_region_163
#> 164   0.3949024      .     .  ID=enriched_region_164
#> 165   0.6802882      .     .  ID=enriched_region_165
#> 166   1.0296347      .     .  ID=enriched_region_166
#> 167   0.8447018      .     .  ID=enriched_region_167
#> 168   1.0756717      .     .  ID=enriched_region_168
#> 169   0.7511733      .     .  ID=enriched_region_169
#> 170   0.9130992      .     .  ID=enriched_region_170
#> 171   0.9379084      .     .  ID=enriched_region_171
#> 172   0.5290289      .     .  ID=enriched_region_172
#> 173   0.3588683      .     .  ID=enriched_region_173
#> 174   0.8341314      .     .  ID=enriched_region_174
#> 175   0.7763044      .     .  ID=enriched_region_175
#> 176   1.0250386      .     .  ID=enriched_region_176
#> 177   1.0248238      .     .  ID=enriched_region_177
#> 178   0.5537798      .     .  ID=enriched_region_178
#> 179   0.4882776      .     .  ID=enriched_region_179
#> 180   1.7356351      .     .  ID=enriched_region_180
#> 181   0.5289944      .     .  ID=enriched_region_181
#> 182   0.7654736      .     .  ID=enriched_region_182
#> 183   1.5078582      .     .  ID=enriched_region_183
#> 184   0.6301803      .     .  ID=enriched_region_184
#> 185   0.4535775      .     .  ID=enriched_region_185
#> 186   0.4986544      .     .  ID=enriched_region_186
#> 187   0.8831676      .     .  ID=enriched_region_187
#> 188   0.4364310      .     .  ID=enriched_region_188
#> 189   0.4591371      .     .  ID=enriched_region_189
#> 190   0.8560237      .     .  ID=enriched_region_190
#> 191   0.4869072      .     .  ID=enriched_region_191
#> 192   0.7182126      .     .  ID=enriched_region_192
#> 193   0.6969050      .     .  ID=enriched_region_193
#> 194   0.8102007      .     .  ID=enriched_region_194
#> 195   0.8629696      .     .  ID=enriched_region_195
#> 196   0.9766779      .     .  ID=enriched_region_196
#> 197   0.9837249      .     .  ID=enriched_region_197
#> 198   0.8051983      .     .  ID=enriched_region_198
#> 199   0.7403281      .     .  ID=enriched_region_199
#> 200   0.8381192      .     .  ID=enriched_region_200
#> 201   0.3834874      .     .  ID=enriched_region_201
#> 202   1.0938945      .     .  ID=enriched_region_202
#> 203   0.7647655      .     .  ID=enriched_region_203
#> 204   0.7778005      .     .  ID=enriched_region_204
#> 205   0.7000845      .     .  ID=enriched_region_205
#> 206   0.4618470      .     .  ID=enriched_region_206
#> 207   0.9561684      .     .  ID=enriched_region_207
#> 208   0.4624318      .     .  ID=enriched_region_208
#> 209   0.8733181      .     .  ID=enriched_region_209
#> 210   0.5339300      .     .  ID=enriched_region_210
#> 211   1.0656532      .     .  ID=enriched_region_211
#> 212   0.7172304      .     .  ID=enriched_region_212
#> 213   0.3518261      .     .  ID=enriched_region_213
#> 214   0.4765751      .     .  ID=enriched_region_214
#> 215   1.5694098      .     .  ID=enriched_region_215
#> 216   0.8749723      .     .  ID=enriched_region_216
#> 217   0.4335269      .     .  ID=enriched_region_217
#> 218   0.6399199      .     .  ID=enriched_region_218
#> 219   0.7099767      .     .  ID=enriched_region_219
#> 220   1.1362767      .     .  ID=enriched_region_220
#> 221   1.1027662      .     .  ID=enriched_region_221
#> 222   1.3541197      .     .  ID=enriched_region_222
#> 223   0.5420631      .     .  ID=enriched_region_223
#> 224   0.4263289      .     .  ID=enriched_region_224
#> 225   0.3414345      .     .  ID=enriched_region_225
#> 226   0.6928864      .     .  ID=enriched_region_226
#> 227   1.9164114      .     .  ID=enriched_region_227
#> 228   0.6773503      .     .  ID=enriched_region_228
#> 229   0.7885936      .     .  ID=enriched_region_229
#> 230   1.0278740      .     .  ID=enriched_region_230
#> 231   0.5612148      .     .  ID=enriched_region_231
#> 232   0.5909989      .     .  ID=enriched_region_232
#> 233   1.2590912      .     .  ID=enriched_region_233
#> 234   0.6768072      .     .  ID=enriched_region_234
#> 235   0.9654533      .     .  ID=enriched_region_235
#> 236   0.5154355      .     .  ID=enriched_region_236
#> 237   0.5258720      .     .  ID=enriched_region_237
#> 238   0.5724546      .     .  ID=enriched_region_238
#> 239   0.5673261      .     .  ID=enriched_region_239
#> 240   0.5865013      .     .  ID=enriched_region_240
#> 241   0.3695122      .     .  ID=enriched_region_241
#> 242   1.0852384      .     .  ID=enriched_region_242
#> 243   0.4126420      .     .  ID=enriched_region_243
#> 244   0.4235768      .     .  ID=enriched_region_244
#> 245   1.1866189      .     .  ID=enriched_region_245
#> 246   0.6252718      .     .  ID=enriched_region_246
#> 247   0.9213147      .     .  ID=enriched_region_247
#> 248   0.6433586      .     .  ID=enriched_region_248
#> 249   0.9899617      .     .  ID=enriched_region_249
#> 250   1.2015012      .     .  ID=enriched_region_250
#> 251   0.5764085      .     .  ID=enriched_region_251
#> 252   0.6740654      .     .  ID=enriched_region_252
#> 253   0.5596848      .     .  ID=enriched_region_253
#> 254   0.6637298      .     .  ID=enriched_region_254
#> 255   0.3475580      .     .  ID=enriched_region_255
#> 256   0.5520015      .     .  ID=enriched_region_256
#> 257   0.6565421      .     .  ID=enriched_region_257
#> 258   1.4954862      .     .  ID=enriched_region_258
#> 259   0.5793306      .     .  ID=enriched_region_259
#> 260   0.9597771      .     .  ID=enriched_region_260
#> 261   1.2173086      .     .  ID=enriched_region_261
#> 262   0.5572202      .     .  ID=enriched_region_262
#> 263   0.6449336      .     .  ID=enriched_region_263
#> 264   0.3965608      .     .  ID=enriched_region_264
#> 265   0.6139958      .     .  ID=enriched_region_265
#> 266   0.6806537      .     .  ID=enriched_region_266
#> 267   0.6075963      .     .  ID=enriched_region_267
#> 268   1.1203392      .     .  ID=enriched_region_268
#> 269   0.6888736      .     .  ID=enriched_region_269
#> 270   1.9205343      .     .  ID=enriched_region_270
#> 271   2.0290381      .     .  ID=enriched_region_271
#> 272   1.3937118      .     .  ID=enriched_region_272
#> 273   0.9211413      .     .  ID=enriched_region_273
#> 274   0.8131113      .     .  ID=enriched_region_274
#> 275   0.6988669      .     .  ID=enriched_region_275
#> 276   1.3205645      .     .  ID=enriched_region_276
#> 277   0.5726871      .     .  ID=enriched_region_277
#> 278   0.6583540      .     .  ID=enriched_region_278
#> 279   1.1639453      .     .  ID=enriched_region_279
#> 280   0.8549868      .     .  ID=enriched_region_280
#> 281   0.4650750      .     .  ID=enriched_region_281
#> 282   0.4211058      .     .  ID=enriched_region_282
#> 283   0.9753951      .     .  ID=enriched_region_283
#> 284   0.5148998      .     .  ID=enriched_region_284
#> 285   0.9817956      .     .  ID=enriched_region_285
#> 286   0.6979907      .     .  ID=enriched_region_286
#> 287   1.0104950      .     .  ID=enriched_region_287
#> 288   0.4779880      .     .  ID=enriched_region_288
#> 289   0.4648093      .     .  ID=enriched_region_289
#> 290   0.5933168      .     .  ID=enriched_region_290
#> 291   0.4019485      .     .  ID=enriched_region_291
#> 292   1.0622959      .     .  ID=enriched_region_292
#> 293   0.5803440      .     .  ID=enriched_region_293
#> 294   0.7627801      .     .  ID=enriched_region_294
#> 295   0.9717066      .     .  ID=enriched_region_295
#> 296   0.9592742      .     .  ID=enriched_region_296
#> 297   0.6015979      .     .  ID=enriched_region_297
#> 298   0.9383985      .     .  ID=enriched_region_298
#> 299   0.8648521      .     .  ID=enriched_region_299
#> 300   0.9621981      .     .  ID=enriched_region_300
#> 301   0.4428959      .     .  ID=enriched_region_301
#> 302   0.5458950      .     .  ID=enriched_region_302
#> 303   0.3902749      .     .  ID=enriched_region_303
#> 304   0.9061386      .     .  ID=enriched_region_304
#> 305   0.4300871      .     .  ID=enriched_region_305
#> 306   1.5381462      .     .  ID=enriched_region_306
#> 307   0.6257890      .     .  ID=enriched_region_307
#> 308   0.8093166      .     .  ID=enriched_region_308
#> 309   0.7209081      .     .  ID=enriched_region_309
#> 310   0.7788285      .     .  ID=enriched_region_310
#> 311   0.7685020      .     .  ID=enriched_region_311
#> 312   0.8362284      .     .  ID=enriched_region_312
#> 313   0.5453076      .     .  ID=enriched_region_313
#> 314   0.5012098      .     .  ID=enriched_region_314
#> 315   0.9183907      .     .  ID=enriched_region_315
#> 316   0.5869426      .     .  ID=enriched_region_316
#> 317   1.0625541      .     .  ID=enriched_region_317
#> 318   0.6270153      .     .  ID=enriched_region_318
#> 319   1.8143710      .     .  ID=enriched_region_319
#> 320   0.7638829      .     .  ID=enriched_region_320
#> 321   0.4237322      .     .  ID=enriched_region_321
#> 322   0.8114830      .     .  ID=enriched_region_322
#> 323   0.5307186      .     .  ID=enriched_region_323
#> 324   0.7803263      .     .  ID=enriched_region_324
#> 325   0.6993867      .     .  ID=enriched_region_325
#> 326   0.5041261      .     .  ID=enriched_region_326
#> 327   0.4835357      .     .  ID=enriched_region_327
#> 328   0.5680184      .     .  ID=enriched_region_328
#> 329   0.5182273      .     .  ID=enriched_region_329
#> 330   0.7963966      .     .  ID=enriched_region_330
#> 331   0.9258671      .     .  ID=enriched_region_331
#> 332   0.5850993      .     .  ID=enriched_region_332
#> 333   0.7875808      .     .  ID=enriched_region_333
#> 334   0.7120396      .     .  ID=enriched_region_334
#> 335   0.6069476      .     .  ID=enriched_region_335
#> 336   0.7061982      .     .  ID=enriched_region_336
#> 337   0.9291161      .     .  ID=enriched_region_337
#> 338   0.7995365      .     .  ID=enriched_region_338
#> 339   0.4443459      .     .  ID=enriched_region_339
#> 340   0.7688435      .     .  ID=enriched_region_340
#> 341   0.7605865      .     .  ID=enriched_region_341
#> 342   0.5805785      .     .  ID=enriched_region_342
#> 343   0.5880928      .     .  ID=enriched_region_343
#> 344   0.6132728      .     .  ID=enriched_region_344
#> 345   0.7808103      .     .  ID=enriched_region_345
#> 346   1.2205325      .     .  ID=enriched_region_346
#> 347   0.9674775      .     .  ID=enriched_region_347
#> 348   1.0497780      .     .  ID=enriched_region_348
#> 349   0.5583594      .     .  ID=enriched_region_349
#> 350   0.6564851      .     .  ID=enriched_region_350
#> 351   0.6448149      .     .  ID=enriched_region_351
#> 352   0.7294510      .     .  ID=enriched_region_352
#> 353   0.6412117      .     .  ID=enriched_region_353
#> 354   0.5073028      .     .  ID=enriched_region_354
#> 355   0.7268181      .     .  ID=enriched_region_355
#> 356   0.5473776      .     .  ID=enriched_region_356
#> 357   0.5787951      .     .  ID=enriched_region_357
#> 358   0.6484378      .     .  ID=enriched_region_358
#> 359   0.5470323      .     .  ID=enriched_region_359
#> 360   0.3991347      .     .  ID=enriched_region_360
#> 361   1.0148853      .     .  ID=enriched_region_361
#> 362   0.8967624      .     .  ID=enriched_region_362
#> 363   0.9976890      .     .  ID=enriched_region_363
#> 364   0.4242297      .     .  ID=enriched_region_364
#> 365   0.3913435      .     .  ID=enriched_region_365
#> 366   0.4114140      .     .  ID=enriched_region_366
#> 367   0.8023840      .     .  ID=enriched_region_367
#> 368   0.9132791      .     .  ID=enriched_region_368
#> 369   1.8940193      .     .  ID=enriched_region_369
#> 370   0.9833265      .     .  ID=enriched_region_370
#> 371   0.4909714      .     .  ID=enriched_region_371
#> 372   0.8938043      .     .  ID=enriched_region_372
#> 373   0.6614088      .     .  ID=enriched_region_373
#> 374   0.4146942      .     .  ID=enriched_region_374
#> 375   0.5124856      .     .  ID=enriched_region_375
#> 376   0.5652147      .     .  ID=enriched_region_376
#> 377   0.5619110      .     .  ID=enriched_region_377
#> 378   0.4509261      .     .  ID=enriched_region_378
#> 379   0.7319849      .     .  ID=enriched_region_379
#> 380   1.0088805      .     .  ID=enriched_region_380
#> 381   0.9427475      .     .  ID=enriched_region_381
#> 382   0.6006756      .     .  ID=enriched_region_382
#> 383   0.5301631      .     .  ID=enriched_region_383
#> 384   0.4327469      .     .  ID=enriched_region_384
#> 385   1.1690544      .     .  ID=enriched_region_385
#> 386   0.4490523      .     .  ID=enriched_region_386
#> 387   0.7671794      .     .  ID=enriched_region_387
#> 388   0.7541960      .     .  ID=enriched_region_388
#> 389   1.1825391      .     .  ID=enriched_region_389
#> 390   0.4208507      .     .  ID=enriched_region_390
#> 391   0.9036849      .     .  ID=enriched_region_391
#> 392   0.7976490      .     .  ID=enriched_region_392
#> 393   0.5883545      .     .  ID=enriched_region_393
#> 394   1.6816915      .     .  ID=enriched_region_394
#> 395   0.5395218      .     .  ID=enriched_region_395
#> 396   0.9003524      .     .  ID=enriched_region_396
#> 397   0.5300289      .     .  ID=enriched_region_397
#> 398   0.7032918      .     .  ID=enriched_region_398
#> 399   0.5873897      .     .  ID=enriched_region_399
#> 400   1.1853703      .     .  ID=enriched_region_400
#> 401   0.6394919      .     .  ID=enriched_region_401
#> 402   0.7644280      .     .  ID=enriched_region_402
#> 403   0.3785602      .     .  ID=enriched_region_403
#> 404   1.0253457      .     .  ID=enriched_region_404
#> 405   0.9046941      .     .  ID=enriched_region_405
#> 406   0.9841853      .     .  ID=enriched_region_406
#> 407   0.9974016      .     .  ID=enriched_region_407
#> 408   0.9683873      .     .  ID=enriched_region_408
#> 409   0.9554131      .     .  ID=enriched_region_409
#> 410   1.1619728      .     .  ID=enriched_region_410
#> 411   0.6146002      .     .  ID=enriched_region_411
#> 412   0.7745624      .     .  ID=enriched_region_412
#> 413   0.5463165      .     .  ID=enriched_region_413
#> 414   0.9402106      .     .  ID=enriched_region_414
#> 415   0.4628954      .     .  ID=enriched_region_415
#> 416   2.4043205      .     .  ID=enriched_region_416
#> 417   0.3441406      .     .  ID=enriched_region_417
#> 418   0.3979339      .     .  ID=enriched_region_418
#> 419   0.8823812      .     .  ID=enriched_region_419
#> 420   0.5847080      .     .  ID=enriched_region_420
#> 421   0.6492630      .     .  ID=enriched_region_421
#> 422   0.7735687      .     .  ID=enriched_region_422
#> 423   1.2750687      .     .  ID=enriched_region_423
#> 424   0.4612528      .     .  ID=enriched_region_424
#> 425   1.4490973      .     .  ID=enriched_region_425
#> 426   0.4421575      .     .  ID=enriched_region_426
#> 427   0.6395670      .     .  ID=enriched_region_427
#> 428   1.7555365      .     .  ID=enriched_region_428
#> 429   0.6621009      .     .  ID=enriched_region_429
#> 430   0.9081341      .     .  ID=enriched_region_430
#> 431   0.5975392      .     .  ID=enriched_region_431
#> 432   0.5425968      .     .  ID=enriched_region_432
#> 433   2.1187774      .     .  ID=enriched_region_433
#> 434   0.7497283      .     .  ID=enriched_region_434
#> 435   0.9297702      .     .  ID=enriched_region_435
#> 436   1.4561252      .     .  ID=enriched_region_436
#> 437   0.6289631      .     .  ID=enriched_region_437
#> 438   0.5166871      .     .  ID=enriched_region_438
#> 439   0.4873562      .     .  ID=enriched_region_439
#> 440   0.8570672      .     .  ID=enriched_region_440
#> 441   1.0806492      .     .  ID=enriched_region_441
#> 442   0.5666170      .     .  ID=enriched_region_442
#> 443   0.6000703      .     .  ID=enriched_region_443
#> 444   0.5125669      .     .  ID=enriched_region_444
#> 445   0.6798998      .     .  ID=enriched_region_445
#> 446   0.4792745      .     .  ID=enriched_region_446
#> 447   0.4875504      .     .  ID=enriched_region_447
#> 448   0.7491481      .     .  ID=enriched_region_448
#> 449   0.6356455      .     .  ID=enriched_region_449
#> 450   0.8221577      .     .  ID=enriched_region_450
#> 451   0.5582202      .     .  ID=enriched_region_451
#> 452   0.5323696      .     .  ID=enriched_region_452
#> 453   0.7851019      .     .  ID=enriched_region_453
#> 454   0.7567804      .     .  ID=enriched_region_454
#> 455   2.4707941      .     .  ID=enriched_region_455
#> 456   0.7178479      .     .  ID=enriched_region_456
#> 457   0.4003035      .     .  ID=enriched_region_457
#> 458   0.9434552      .     .  ID=enriched_region_458
#> 459   1.3157469      .     .  ID=enriched_region_459
#> 460   0.9645245      .     .  ID=enriched_region_460
#> 461   0.5156563      .     .  ID=enriched_region_461
#> 462   1.1351529      .     .  ID=enriched_region_462
#> 463   0.4361252      .     .  ID=enriched_region_463
#> 464   1.0960550      .     .  ID=enriched_region_464
#> 465   0.6480380      .     .  ID=enriched_region_465
#> 466   0.7349215      .     .  ID=enriched_region_466
#> 467   0.6103505      .     .  ID=enriched_region_467
#> 468   1.1031410      .     .  ID=enriched_region_468
#> 469   0.6046008      .     .  ID=enriched_region_469
#> 470   0.8054513      .     .  ID=enriched_region_470
#> 471   0.7364640      .     .  ID=enriched_region_471
#> 472   0.8159115      .     .  ID=enriched_region_472
#> 473   1.0885780      .     .  ID=enriched_region_473
#> 474   0.6279982      .     .  ID=enriched_region_474
#> 475   0.6772908      .     .  ID=enriched_region_475
#> 476   0.7969561      .     .  ID=enriched_region_476
#> 477   0.6061658      .     .  ID=enriched_region_477
#> 478   0.8369175      .     .  ID=enriched_region_478
#> 479   0.5262151      .     .  ID=enriched_region_479
#> 480   0.7901111      .     .  ID=enriched_region_480
#> 481   0.6865677      .     .  ID=enriched_region_481
#> 482   0.8911200      .     .  ID=enriched_region_482
#> 483   0.5998857      .     .  ID=enriched_region_483
#> 484   0.8520644      .     .  ID=enriched_region_484
#> 485   0.4540648      .     .  ID=enriched_region_485
#> 486   1.1296947      .     .  ID=enriched_region_486
#> 487   0.9025566      .     .  ID=enriched_region_487
#> 488   0.4137898      .     .  ID=enriched_region_488
#> 489   0.9740291      .     .  ID=enriched_region_489
#> 490   1.0215806      .     .  ID=enriched_region_490
#> 491   1.2293481      .     .  ID=enriched_region_491
#> 492   0.7246853      .     .  ID=enriched_region_492
#> 493   0.4607212      .     .  ID=enriched_region_493
#> 494   0.7681009      .     .  ID=enriched_region_494
#> 495   0.7450137      .     .  ID=enriched_region_495
#> 496   0.4614825      .     .  ID=enriched_region_496
#> 497   0.7668631      .     .  ID=enriched_region_497
#> 498   0.9511299      .     .  ID=enriched_region_498
#> 499   1.1167828      .     .  ID=enriched_region_499
#> 500   0.8093101      .     .  ID=enriched_region_500
#> 501   0.3373236      .     .  ID=enriched_region_501
#> 502   0.7528913      .     .  ID=enriched_region_502
#> 503   3.2957354      .     .  ID=enriched_region_503
#> 504   1.0881191      .     .  ID=enriched_region_504
#> 505   0.5096198      .     .  ID=enriched_region_505
#> 506   0.6212517      .     .  ID=enriched_region_506
#> 507   0.8957377      .     .  ID=enriched_region_507
#> 508   0.6134564      .     .  ID=enriched_region_508
#> 509   0.5547414      .     .  ID=enriched_region_509
#> 510   0.5243040      .     .  ID=enriched_region_510
#> 511   2.6278015      .     .  ID=enriched_region_511
#> 512   0.6041161      .     .  ID=enriched_region_512
#> 513   0.6535381      .     .  ID=enriched_region_513
#> 514   0.7346002      .     .  ID=enriched_region_514
#> 515   0.6641344      .     .  ID=enriched_region_515
#> 516   0.3571840      .     .  ID=enriched_region_516
#> 517   0.4055627      .     .  ID=enriched_region_517
#> 518   0.6042490      .     .  ID=enriched_region_518
#> 519   0.8017093      .     .  ID=enriched_region_519
#> 520   1.0365504      .     .  ID=enriched_region_520
#> 521   0.8474800      .     .  ID=enriched_region_521
#> 522   1.8699945      .     .  ID=enriched_region_522
#> 523   1.0874242      .     .  ID=enriched_region_523
#> 524   1.2828017      .     .  ID=enriched_region_524
#> 525   1.0823812      .     .  ID=enriched_region_525
#> 526   0.7756004      .     .  ID=enriched_region_526
#> 527   1.0078453      .     .  ID=enriched_region_527
#> 528   0.8083205      .     .  ID=enriched_region_528
#> 529   0.7261455      .     .  ID=enriched_region_529
#> 530   0.7540813      .     .  ID=enriched_region_530
#> 531   1.1840639      .     .  ID=enriched_region_531
#> 532   0.4293650      .     .  ID=enriched_region_532
#> 533   0.6235674      .     .  ID=enriched_region_533
#> 534   0.5137798      .     .  ID=enriched_region_534
#> 535   0.4879805      .     .  ID=enriched_region_535
#> 536   0.6108203      .     .  ID=enriched_region_536
#> 537   0.4912914      .     .  ID=enriched_region_537
#> 538   0.4526299      .     .  ID=enriched_region_538
#> 539   0.8233637      .     .  ID=enriched_region_539
#> 540   0.7119402      .     .  ID=enriched_region_540
#> 541   0.5970506      .     .  ID=enriched_region_541
#> 542   0.6103045      .     .  ID=enriched_region_542
#> 543   0.3426452      .     .  ID=enriched_region_543
#> 544   1.0255659      .     .  ID=enriched_region_544
#> 545   0.7477101      .     .  ID=enriched_region_545
#> 546   1.0175450      .     .  ID=enriched_region_546
#> 547   0.5569046      .     .  ID=enriched_region_547
#> 548   0.8734135      .     .  ID=enriched_region_548
#> 549   0.4253686      .     .  ID=enriched_region_549
#> 550   0.6848671      .     .  ID=enriched_region_550
#> 551   0.7573824      .     .  ID=enriched_region_551
#> 552   0.5468970      .     .  ID=enriched_region_552
#> 553   1.6225863      .     .  ID=enriched_region_553
#> 554   0.9580088      .     .  ID=enriched_region_554
#> 555   1.0517754      .     .  ID=enriched_region_555
#> 556   0.9047682      .     .  ID=enriched_region_556
#> 557   0.6450339      .     .  ID=enriched_region_557
#> 558   1.6256998      .     .  ID=enriched_region_558
#> 559   0.5044027      .     .  ID=enriched_region_559
#> 560   0.6645608      .     .  ID=enriched_region_560
#> 561   0.8525069      .     .  ID=enriched_region_561
#> 562   0.5181171      .     .  ID=enriched_region_562
#> 563   0.5761939      .     .  ID=enriched_region_563
#> 564   0.5110653      .     .  ID=enriched_region_564
#> 565   0.9846566      .     .  ID=enriched_region_565
#> 566   0.5319086      .     .  ID=enriched_region_566
#> 567   0.7474034      .     .  ID=enriched_region_567
#> 568   0.8654748      .     .  ID=enriched_region_568
#> 569   0.7467576      .     .  ID=enriched_region_569
#> 570   1.4643793      .     .  ID=enriched_region_570
#> 571   0.4708990      .     .  ID=enriched_region_571
#> 572   0.6160071      .     .  ID=enriched_region_572
#> 573   0.6142129      .     .  ID=enriched_region_573
#> 574   0.8115861      .     .  ID=enriched_region_574
#> 575   0.6779439      .     .  ID=enriched_region_575
#> 576   0.4447158      .     .  ID=enriched_region_576
#> 577   0.9437118      .     .  ID=enriched_region_577
#> 578   0.9251313      .     .  ID=enriched_region_578
#> 579   0.4258699      .     .  ID=enriched_region_579
#> 580   0.8285732      .     .  ID=enriched_region_580
#> 581   0.8257901      .     .  ID=enriched_region_581
#> 582   1.0524052      .     .  ID=enriched_region_582
#> 583   0.7500448      .     .  ID=enriched_region_583
#> 584   0.8760987      .     .  ID=enriched_region_584
#> 585   1.0117945      .     .  ID=enriched_region_585
#> 586   0.9372262      .     .  ID=enriched_region_586
#> 587   0.6585841      .     .  ID=enriched_region_587
#> 588   0.8779391      .     .  ID=enriched_region_588
#> 589   0.8543465      .     .  ID=enriched_region_589
#> 590   0.5204673      .     .  ID=enriched_region_590
#> 591   0.5859217      .     .  ID=enriched_region_591
#> 592   0.8408300      .     .  ID=enriched_region_592
#> 593   0.5546863      .     .  ID=enriched_region_593
#> 594   1.8371515      .     .  ID=enriched_region_594
#> 595   0.9609875      .     .  ID=enriched_region_595
#> 596   0.8599931      .     .  ID=enriched_region_596
#> 597   1.8909309      .     .  ID=enriched_region_597
#> 598   0.5822670      .     .  ID=enriched_region_598
#> 599   0.7184462      .     .  ID=enriched_region_599
#> 600   0.5165197      .     .  ID=enriched_region_600
#> 601   0.7645526      .     .  ID=enriched_region_601
#> 602   0.9450863      .     .  ID=enriched_region_602
#> 603   0.6919020      .     .  ID=enriched_region_603
#> 604   0.8247383      .     .  ID=enriched_region_604
#> 605   1.4179605      .     .  ID=enriched_region_605
#> 606   0.8469892      .     .  ID=enriched_region_606
#> 607   0.8226458      .     .  ID=enriched_region_607
#> 608   0.5012385      .     .  ID=enriched_region_608
#> 609   0.6763056      .     .  ID=enriched_region_609
#> 610   0.4789592      .     .  ID=enriched_region_610
#> 611   0.7443167      .     .  ID=enriched_region_611
#> 612   0.7948725      .     .  ID=enriched_region_612
#> 613   0.4194041      .     .  ID=enriched_region_613
#> 614   0.6683764      .     .  ID=enriched_region_614
#> 615   0.7952721      .     .  ID=enriched_region_615
#> 616   0.4866731      .     .  ID=enriched_region_616
#> 617   0.7220909      .     .  ID=enriched_region_617
#> 618   0.6691651      .     .  ID=enriched_region_618
#> 619   0.9993650      .     .  ID=enriched_region_619
#> 620   0.8446760      .     .  ID=enriched_region_620
#> 621   0.8308348      .     .  ID=enriched_region_621
#> 622   0.3755250      .     .  ID=enriched_region_622
#> 623   0.4011554      .     .  ID=enriched_region_623
#> 624   1.1595007      .     .  ID=enriched_region_624
#> 625   0.6964247      .     .  ID=enriched_region_625
#> 626   0.9701568      .     .  ID=enriched_region_626
#> 627   1.4303238      .     .  ID=enriched_region_627
#> 628   1.1474250      .     .  ID=enriched_region_628
#> 629   0.7540210      .     .  ID=enriched_region_629
#> 630   0.7739453      .     .  ID=enriched_region_630
#> 631   0.5646897      .     .  ID=enriched_region_631
#> 632   0.8726964      .     .  ID=enriched_region_632
#> 633   1.6809815      .     .  ID=enriched_region_633
#> 634   0.7858844      .     .  ID=enriched_region_634
#> 635   1.1289417      .     .  ID=enriched_region_635
#> 636   0.6635124      .     .  ID=enriched_region_636
#> 637   0.6698662      .     .  ID=enriched_region_637
#> 638   0.7878610      .     .  ID=enriched_region_638
#> 639   0.5328485      .     .  ID=enriched_region_639
#> 640   0.4888999      .     .  ID=enriched_region_640
#> 641   0.8145441      .     .  ID=enriched_region_641
#> 642   0.6904458      .     .  ID=enriched_region_642
#> 643   0.7398214      .     .  ID=enriched_region_643
#> 644   2.1484806      .     .  ID=enriched_region_644
#> 645   1.0383679      .     .  ID=enriched_region_645
#> 646   0.5323826      .     .  ID=enriched_region_646
#> 647   0.4975453      .     .  ID=enriched_region_647
#> 648   0.8376800      .     .  ID=enriched_region_648
#> 649   0.7659254      .     .  ID=enriched_region_649
#> 650   1.1033863      .     .  ID=enriched_region_650
#> 651   0.4423043      .     .  ID=enriched_region_651
#> 652   0.6432383      .     .  ID=enriched_region_652
#> 653   0.6570200      .     .  ID=enriched_region_653
#> 654   0.6139721      .     .  ID=enriched_region_654
#> 655   0.8655224      .     .  ID=enriched_region_655
#> 656   0.3964919      .     .  ID=enriched_region_656
#> 657   1.0797701      .     .  ID=enriched_region_657
#> 658   0.8499605      .     .  ID=enriched_region_658
#> 659   0.4522398      .     .  ID=enriched_region_659
#> 660   0.6648128      .     .  ID=enriched_region_660
#> 661   0.5880548      .     .  ID=enriched_region_661
#> 662   0.6292089      .     .  ID=enriched_region_662
#> 663   0.5164927      .     .  ID=enriched_region_663
#> 664   0.5043531      .     .  ID=enriched_region_664
#> 665   0.5634034      .     .  ID=enriched_region_665
#> 666   0.7235351      .     .  ID=enriched_region_666
#> 667   0.3646251      .     .  ID=enriched_region_667
#> 668   0.7153264      .     .  ID=enriched_region_668
#> 669   0.6428064      .     .  ID=enriched_region_669
#> 670   0.9272967      .     .  ID=enriched_region_670
#> 671   0.4870597      .     .  ID=enriched_region_671
#> 672   0.5483982      .     .  ID=enriched_region_672
#> 673   0.5195341      .     .  ID=enriched_region_673
#> 674   0.5509024      .     .  ID=enriched_region_674
#> 675   0.9040380      .     .  ID=enriched_region_675
#> 676   0.4869297      .     .  ID=enriched_region_676
#> 677   0.6181281      .     .  ID=enriched_region_677
#> 678   0.4458701      .     .  ID=enriched_region_678
#> 679   0.4056806      .     .  ID=enriched_region_679
#> 680   0.6158157      .     .  ID=enriched_region_680
#> 681   0.6716803      .     .  ID=enriched_region_681
#> 682   0.4660792      .     .  ID=enriched_region_682
#> 683   0.9687581      .     .  ID=enriched_region_683
#> 684   0.4105065      .     .  ID=enriched_region_684
#> 685   1.1037870      .     .  ID=enriched_region_685
#> 686   0.8562496      .     .  ID=enriched_region_686
#> 687   0.5841933      .     .  ID=enriched_region_687
#> 688   0.5553632      .     .  ID=enriched_region_688
#> 689   0.7102669      .     .  ID=enriched_region_689
#> 690   0.8003541      .     .  ID=enriched_region_690
#> 691   0.8658670      .     .  ID=enriched_region_691
#> 692   0.6467828      .     .  ID=enriched_region_692
#> 693   0.3707816      .     .  ID=enriched_region_693
#> 694   0.7368708      .     .  ID=enriched_region_694
#> 695   0.9010717      .     .  ID=enriched_region_695
#> 696   0.4842300      .     .  ID=enriched_region_696
#> 697   0.8306220      .     .  ID=enriched_region_697
#> 698   0.5248195      .     .  ID=enriched_region_698
#> 699   0.6261270      .     .  ID=enriched_region_699
#> 700   0.5507923      .     .  ID=enriched_region_700
#> 701   0.7447986      .     .  ID=enriched_region_701
#> 702   0.5970806      .     .  ID=enriched_region_702
#> 703   0.4705150      .     .  ID=enriched_region_703
#> 704   0.3316019      .     .  ID=enriched_region_704
#> 705   0.8690025      .     .  ID=enriched_region_705
#> 706   0.5379092      .     .  ID=enriched_region_706
#> 707   0.4158079      .     .  ID=enriched_region_707
#> 708   0.9675141      .     .  ID=enriched_region_708
#> 709   0.6264746      .     .  ID=enriched_region_709
#> 710   0.7639983      .     .  ID=enriched_region_710
#> 711   0.5084193      .     .  ID=enriched_region_711
#> 712   0.5163123      .     .  ID=enriched_region_712
#> 713   0.9087968      .     .  ID=enriched_region_713
#> 714   0.7561585      .     .  ID=enriched_region_714
#> 715   0.5124120      .     .  ID=enriched_region_715
#> 716   0.7884849      .     .  ID=enriched_region_716
#> 717   0.5249923      .     .  ID=enriched_region_717
#> 718   0.9900700      .     .  ID=enriched_region_718
#> 719   0.6106970      .     .  ID=enriched_region_719
#> 720   0.8960594      .     .  ID=enriched_region_720
#> 721   1.2597486      .     .  ID=enriched_region_721
#> 722   0.6949892      .     .  ID=enriched_region_722
#> 723   1.2016908      .     .  ID=enriched_region_723
#> 724   0.9393770      .     .  ID=enriched_region_724
#> 725   1.0209099      .     .  ID=enriched_region_725
#> 726   0.3750807      .     .  ID=enriched_region_726
#> 727   0.4612145      .     .  ID=enriched_region_727
#> 728   0.9220048      .     .  ID=enriched_region_728
#> 729   0.6293795      .     .  ID=enriched_region_729
#> 730   0.5521016      .     .  ID=enriched_region_730
#> 731   1.3666974      .     .  ID=enriched_region_731
#> 732   1.1096940      .     .  ID=enriched_region_732
#> 733   1.2291796      .     .  ID=enriched_region_733
#> 734   0.6234535      .     .  ID=enriched_region_734
#> 735   0.7033550      .     .  ID=enriched_region_735
#> 736   0.7471594      .     .  ID=enriched_region_736
#> 737   0.9054533      .     .  ID=enriched_region_737
#> 738   0.7793761      .     .  ID=enriched_region_738
#> 739   0.3809583      .     .  ID=enriched_region_739
#> 740   1.1210027      .     .  ID=enriched_region_740
#> 741   1.9883721      .     .  ID=enriched_region_741
#> 742   0.9531728      .     .  ID=enriched_region_742
#> 743   0.6895419      .     .  ID=enriched_region_743
#> 744   0.9687533      .     .  ID=enriched_region_744
#> 745   0.5714484      .     .  ID=enriched_region_745
#> 746   0.7201049      .     .  ID=enriched_region_746
#> 747   0.5691319      .     .  ID=enriched_region_747
#> 748   0.7563946      .     .  ID=enriched_region_748
#> 749   1.2008271      .     .  ID=enriched_region_749
#> 750   1.0035648      .     .  ID=enriched_region_750
#> 751   0.4964648      .     .  ID=enriched_region_751
#> 752   0.5173205      .     .  ID=enriched_region_752
#> 753   0.5313172      .     .  ID=enriched_region_753
#> 754   1.8804192      .     .  ID=enriched_region_754
#> 755   0.9119023      .     .  ID=enriched_region_755
#> 756   1.1884338      .     .  ID=enriched_region_756
#> 757   0.8765110      .     .  ID=enriched_region_757
#> 758   0.7273450      .     .  ID=enriched_region_758
#> 759   0.7863288      .     .  ID=enriched_region_759
#> 760   0.5733376      .     .  ID=enriched_region_760
#> 761   0.5500290      .     .  ID=enriched_region_761
#> 762   0.9151678      .     .  ID=enriched_region_762
#> 763   1.0111791      .     .  ID=enriched_region_763
#> 764   0.5724447      .     .  ID=enriched_region_764
#> 765   0.6182758      .     .  ID=enriched_region_765
#> 766   0.6802770      .     .  ID=enriched_region_766
#> 767   0.6793002      .     .  ID=enriched_region_767
#> 768   0.3736736      .     .  ID=enriched_region_768
#> 769   0.5765480      .     .  ID=enriched_region_769
#> 770   0.6854009      .     .  ID=enriched_region_770
#> 771   0.7226015      .     .  ID=enriched_region_771
#> 772   1.0969816      .     .  ID=enriched_region_772
#> 773   0.5272031      .     .  ID=enriched_region_773
#> 774   0.4076129      .     .  ID=enriched_region_774
#> 775   2.3611492      .     .  ID=enriched_region_775
#> 776   1.8700956      .     .  ID=enriched_region_776
#> 777   0.4618145      .     .  ID=enriched_region_777
#> 778   0.4726387      .     .  ID=enriched_region_778
#> 779   0.5088895      .     .  ID=enriched_region_779
#> 780   0.4164117      .     .  ID=enriched_region_780
#> 781   0.5618590      .     .  ID=enriched_region_781
#> 782   1.1260310      .     .  ID=enriched_region_782
#> 783   0.5573780      .     .  ID=enriched_region_783
#> 784   0.7500838      .     .  ID=enriched_region_784
#> 785   1.0754953      .     .  ID=enriched_region_785
#> 786   0.6734359      .     .  ID=enriched_region_786
#> 787   0.5757206      .     .  ID=enriched_region_787
#> 788   0.4768285      .     .  ID=enriched_region_788
#> 789   0.4874390      .     .  ID=enriched_region_789
#> 790   0.4970490      .     .  ID=enriched_region_790
#> 791   0.6596034      .     .  ID=enriched_region_791
#> 792   0.8152807      .     .  ID=enriched_region_792
#> 793   0.5369027      .     .  ID=enriched_region_793
#> 794   0.5751521      .     .  ID=enriched_region_794
#> 795   1.3716231      .     .  ID=enriched_region_795
#> 796   0.4803381      .     .  ID=enriched_region_796
#> 797   1.1343858      .     .  ID=enriched_region_797
#> 798   0.4851976      .     .  ID=enriched_region_798
#> 799   0.6139712      .     .  ID=enriched_region_799
#> 800   0.5249503      .     .  ID=enriched_region_800
#> 801   0.4122230      .     .  ID=enriched_region_801
#> 802   0.5912279      .     .  ID=enriched_region_802
#> 803   0.6093811      .     .  ID=enriched_region_803
#> 804   1.3481043      .     .  ID=enriched_region_804
#> 805   0.4442024      .     .  ID=enriched_region_805
#> 806   0.4211869      .     .  ID=enriched_region_806
#> 807   0.4661227      .     .  ID=enriched_region_807
#> 808   0.6341398      .     .  ID=enriched_region_808
#> 809   0.3806718      .     .  ID=enriched_region_809
#> 810   0.7563416      .     .  ID=enriched_region_810
#> 811   0.6646646      .     .  ID=enriched_region_811
#> 812   0.4465203      .     .  ID=enriched_region_812
#> 813   0.6548925      .     .  ID=enriched_region_813
#> 814   0.6762715      .     .  ID=enriched_region_814
#> 815   1.2877283      .     .  ID=enriched_region_815
#> 816   0.3978005      .     .  ID=enriched_region_816
#> 817   1.0294946      .     .  ID=enriched_region_817
#> 818   0.6075416      .     .  ID=enriched_region_818
#> 819   1.1043733      .     .  ID=enriched_region_819
#> 820   0.7584561      .     .  ID=enriched_region_820
#> 821   0.6137632      .     .  ID=enriched_region_821
#> 822   0.6210931      .     .  ID=enriched_region_822
#> 823   1.0702510      .     .  ID=enriched_region_823
#> 824   0.6978934      .     .  ID=enriched_region_824
#> 825   1.2683194      .     .  ID=enriched_region_825
#> 826   1.0234995      .     .  ID=enriched_region_826
#> 827   0.6828278      .     .  ID=enriched_region_827
#> 828   0.4237051      .     .  ID=enriched_region_828
#> 829   0.7292182      .     .  ID=enriched_region_829
#> 830   0.7212118      .     .  ID=enriched_region_830
#> 831   0.6560384      .     .  ID=enriched_region_831
#> 832   0.5755788      .     .  ID=enriched_region_832
#> 833   0.5187445      .     .  ID=enriched_region_833
#> 834   0.4007523      .     .  ID=enriched_region_834
#> 835   0.5583966      .     .  ID=enriched_region_835
#> 836   0.5406262      .     .  ID=enriched_region_836
#> 837   0.9288995      .     .  ID=enriched_region_837
#> 838   0.5793792      .     .  ID=enriched_region_838
#> 839   0.7479041      .     .  ID=enriched_region_839
#> 840   0.5855061      .     .  ID=enriched_region_840
#> 841   0.4986799      .     .  ID=enriched_region_841
#> 842   0.5353246      .     .  ID=enriched_region_842
#> 843   1.1158718      .     .  ID=enriched_region_843
#> 844   0.9461950      .     .  ID=enriched_region_844
#> 845   1.0903610      .     .  ID=enriched_region_845
#> 846   0.7634676      .     .  ID=enriched_region_846
#> 847   1.0445802      .     .  ID=enriched_region_847
#> 848   0.5763335      .     .  ID=enriched_region_848
#> 849   0.3690227      .     .  ID=enriched_region_849
#> 850   0.4605038      .     .  ID=enriched_region_850
#> 851   0.5035318      .     .  ID=enriched_region_851
#> 852   0.6620497      .     .  ID=enriched_region_852
#> 853   0.4885160      .     .  ID=enriched_region_853
#> 854   0.4557222      .     .  ID=enriched_region_854
#> 855   0.6032614      .     .  ID=enriched_region_855
#> 856   0.9467995      .     .  ID=enriched_region_856
#> 857   1.2889011      .     .  ID=enriched_region_857
#> 858   0.6146514      .     .  ID=enriched_region_858
#> 859   0.6540054      .     .  ID=enriched_region_859
#> 860   0.6021514      .     .  ID=enriched_region_860
#> 861   0.9308746      .     .  ID=enriched_region_861
#> 862   0.7301761      .     .  ID=enriched_region_862
#> 863   0.6690279      .     .  ID=enriched_region_863
#> 864   0.6963121      .     .  ID=enriched_region_864
#> 865   0.6000538      .     .  ID=enriched_region_865
#> 866   1.4772228      .     .  ID=enriched_region_866
#> 867   0.5786772      .     .  ID=enriched_region_867
#> 868   0.3878965      .     .  ID=enriched_region_868
#> 869   0.4995313      .     .  ID=enriched_region_869
#> 870   1.0484811      .     .  ID=enriched_region_870
#> 871   0.7889561      .     .  ID=enriched_region_871
#> 872   0.6691597      .     .  ID=enriched_region_872
#> 873   0.8055925      .     .  ID=enriched_region_873
#> 874   0.9051970      .     .  ID=enriched_region_874
#> 875   0.6478738      .     .  ID=enriched_region_875
#> 876   0.7864218      .     .  ID=enriched_region_876
#> 877   0.8275793      .     .  ID=enriched_region_877
#> 878   0.9272123      .     .  ID=enriched_region_878
#> 879   0.8285681      .     .  ID=enriched_region_879
#> 880   1.0022049      .     .  ID=enriched_region_880
#> 881   1.0398596      .     .  ID=enriched_region_881
#> 882   0.6171722      .     .  ID=enriched_region_882
#> 883   0.7793742      .     .  ID=enriched_region_883
#> 884   0.6580567      .     .  ID=enriched_region_884
#> 885   0.7658284      .     .  ID=enriched_region_885
#> 886   0.8571879      .     .  ID=enriched_region_886
#> 887   0.5796971      .     .  ID=enriched_region_887
#> 888   0.5835895      .     .  ID=enriched_region_888
#> 889   0.5552481      .     .  ID=enriched_region_889
#> 890   0.9728737      .     .  ID=enriched_region_890
#> 891   0.3943045      .     .  ID=enriched_region_891
#> 892   0.7600438      .     .  ID=enriched_region_892
#> 893   1.0826372      .     .  ID=enriched_region_893
#> 894   0.4160792      .     .  ID=enriched_region_894
#> 895   0.4196500      .     .  ID=enriched_region_895
#> 896   0.4698147      .     .  ID=enriched_region_896
#> 897   0.3057386      .     .  ID=enriched_region_897
#> 898   1.0838042      .     .  ID=enriched_region_898
#> 899   0.8122060      .     .  ID=enriched_region_899
#> 900   0.5061355      .     .  ID=enriched_region_900
#> 901   0.7983228      .     .  ID=enriched_region_901
#> 902   1.1191062      .     .  ID=enriched_region_902
#> 903   0.5754735      .     .  ID=enriched_region_903
#> 904   1.2380257      .     .  ID=enriched_region_904
#> 905   1.1668295      .     .  ID=enriched_region_905
#> 906   0.8337884      .     .  ID=enriched_region_906
#> 907   0.9774741      .     .  ID=enriched_region_907
#> 908   0.5783450      .     .  ID=enriched_region_908
#> 909   0.8359355      .     .  ID=enriched_region_909
#> 910   0.3724515      .     .  ID=enriched_region_910
#> 911   1.9473752      .     .  ID=enriched_region_911
#> 912   0.4542758      .     .  ID=enriched_region_912
#> 913   0.6911896      .     .  ID=enriched_region_913
#> 914   0.7868061      .     .  ID=enriched_region_914
#> 915   0.9751701      .     .  ID=enriched_region_915
#> 916   2.0540182      .     .  ID=enriched_region_916
#> 917   0.7162415      .     .  ID=enriched_region_917
#> 918   0.5192222      .     .  ID=enriched_region_918
#> 919   0.4803627      .     .  ID=enriched_region_919
#> 920   0.7646546      .     .  ID=enriched_region_920
#> 921   0.6497996      .     .  ID=enriched_region_921
#> 922   1.0243986      .     .  ID=enriched_region_922
#> 923   0.4233668      .     .  ID=enriched_region_923
#> 924   0.4328218      .     .  ID=enriched_region_924
#> 925   0.6229669      .     .  ID=enriched_region_925
#> 926   0.4817698      .     .  ID=enriched_region_926
#> 927   0.7935113      .     .  ID=enriched_region_927
#> 928   1.1566066      .     .  ID=enriched_region_928
#> 929   0.6259184      .     .  ID=enriched_region_929
#> 930   0.9200465      .     .  ID=enriched_region_930
#> 931   1.2479207      .     .  ID=enriched_region_931
#> 932   0.5525429      .     .  ID=enriched_region_932
#> 933   1.4831427      .     .  ID=enriched_region_933
#> 934   0.5011801      .     .  ID=enriched_region_934
#> 935   0.9012585      .     .  ID=enriched_region_935
#> 936   0.8988961      .     .  ID=enriched_region_936
#> 937   0.6969644      .     .  ID=enriched_region_937
#> 938   0.5640280      .     .  ID=enriched_region_938
#> 939   0.5305389      .     .  ID=enriched_region_939
#> 940   0.6477596      .     .  ID=enriched_region_940
#> 941   0.9282619      .     .  ID=enriched_region_941
#> 942   1.3831248      .     .  ID=enriched_region_942
#> 943   1.4207887      .     .  ID=enriched_region_943
#> 944   0.7077578      .     .  ID=enriched_region_944
#> 945   0.3906151      .     .  ID=enriched_region_945
#> 946   0.6721340      .     .  ID=enriched_region_946
#> 947   0.5402706      .     .  ID=enriched_region_947
#> 948   0.7662592      .     .  ID=enriched_region_948
#> 949  -0.6713868      .     .    ID=depleted_region_1
#> 950  -0.5085614      .     .    ID=depleted_region_2
#> 951  -0.5741062      .     .    ID=depleted_region_3
#> 952  -0.4893626      .     .    ID=depleted_region_4
#> 953  -0.5775730      .     .    ID=depleted_region_5
#> 954  -0.7276360      .     .    ID=depleted_region_6
#> 955  -0.4827218      .     .    ID=depleted_region_7
#> 956  -0.4915427      .     .    ID=depleted_region_8
#> 957  -0.4960487      .     .    ID=depleted_region_9
#> 958  -0.4613147      .     .   ID=depleted_region_10
#> 959  -0.5573105      .     .   ID=depleted_region_11
#> 960  -0.5001421      .     .   ID=depleted_region_12
#> 961  -0.5075995      .     .   ID=depleted_region_13
#> 962  -0.7156329      .     .   ID=depleted_region_14
#> 963  -0.4911665      .     .   ID=depleted_region_15
#> 964  -0.5477047      .     .   ID=depleted_region_16
#> 965  -0.4788647      .     .   ID=depleted_region_17
#> 966  -0.4659493      .     .   ID=depleted_region_18
#> 967  -0.4687415      .     .   ID=depleted_region_19
#> 968  -0.4831272      .     .   ID=depleted_region_20
#> 969  -0.6976129      .     .   ID=depleted_region_21
#> 970  -0.5516211      .     .   ID=depleted_region_22
#> 971  -0.6078848      .     .   ID=depleted_region_23
#> 972  -0.6205254      .     .   ID=depleted_region_24
#> 973  -0.5514528      .     .   ID=depleted_region_25
#> 974  -0.4546709      .     .   ID=depleted_region_26
#> 975  -0.4619335      .     .   ID=depleted_region_27
#> 976  -0.4809922      .     .   ID=depleted_region_28
#> 977  -0.4290783      .     .   ID=depleted_region_29
#> 978  -0.4241846      .     .   ID=depleted_region_30
#> 979   0.6645710      .     .  ID=enriched_region_949
#> 980   0.7566088      .     .  ID=enriched_region_950
#> 981   1.1928850      .     .  ID=enriched_region_951
#> 982   0.8086123      .     .  ID=enriched_region_952
#> 983   0.7389634      .     .  ID=enriched_region_953
#> 984   0.4825822      .     .  ID=enriched_region_954
#> 985   0.8109552      .     .  ID=enriched_region_955
#> 986   1.2288092      .     .  ID=enriched_region_956
#> 987   0.3859936      .     .  ID=enriched_region_957
#> 988   0.7249608      .     .  ID=enriched_region_958
#> 989   0.8245089      .     .  ID=enriched_region_959
#> 990   0.4593044      .     .  ID=enriched_region_960
#> 991   0.4602222      .     .  ID=enriched_region_961
#> 992   0.9864710      .     .  ID=enriched_region_962
#> 993   0.5355924      .     .  ID=enriched_region_963
#> 994   0.5811722      .     .  ID=enriched_region_964
#> 995   0.4856990      .     .  ID=enriched_region_965
#> 996   0.6309400      .     .  ID=enriched_region_966
#> 997   0.6214685      .     .  ID=enriched_region_967
#> 998   0.4811767      .     .  ID=enriched_region_968
#> 999   0.8050011      .     .  ID=enriched_region_969
#> 1000  0.7916182      .     .  ID=enriched_region_970
#> 1001  0.4859870      .     .  ID=enriched_region_971
#> 1002  0.4317146      .     .  ID=enriched_region_972
#> 1003  0.5689330      .     .  ID=enriched_region_973
#> 1004  0.4217180      .     .  ID=enriched_region_974
#> 1005  0.4018295      .     .  ID=enriched_region_975
#> 1006  0.8108249      .     .  ID=enriched_region_976
#> 1007  0.6379096      .     .  ID=enriched_region_977
#> 1008  0.5559291      .     .  ID=enriched_region_978
#> 1009  0.7072865      .     .  ID=enriched_region_979
#> 1010  0.8055865      .     .  ID=enriched_region_980
#> 1011  0.8508542      .     .  ID=enriched_region_981
#> 1012  0.7240468      .     .  ID=enriched_region_982
#> 1013  0.6510048      .     .  ID=enriched_region_983
#> 1014  0.8309223      .     .  ID=enriched_region_984
#> 1015  0.5566266      .     .  ID=enriched_region_985
#> 1016  0.3861804      .     .  ID=enriched_region_986
#> 1017  0.7022710      .     .  ID=enriched_region_987
#> 1018  0.9391343      .     .  ID=enriched_region_988
#> 1019  1.2106615      .     .  ID=enriched_region_989
#> 1020  0.7603558      .     .  ID=enriched_region_990
#> 1021  0.4280651      .     .  ID=enriched_region_991
#> 1022  0.5774407      .     .  ID=enriched_region_992
#> 1023  1.1105867      .     .  ID=enriched_region_993
#> 1024  0.4808660      .     .  ID=enriched_region_994
#> 1025  0.6337780      .     .  ID=enriched_region_995
#> 1026  0.5059539      .     .  ID=enriched_region_996
#> 1027  0.6781486      .     .  ID=enriched_region_997
#> 1028  0.5758937      .     .  ID=enriched_region_998
#> 1029  1.0668141      .     .  ID=enriched_region_999
#> 1030  1.0189257      .     . ID=enriched_region_1000
#> 1031  0.7319004      .     . ID=enriched_region_1001
#> 1032  0.6191740      .     . ID=enriched_region_1002
#> 1033  0.6391624      .     . ID=enriched_region_1003
#> 1034  0.4923374      .     . ID=enriched_region_1004
#> 1035  0.8070849      .     . ID=enriched_region_1005
#> 1036  0.5604512      .     . ID=enriched_region_1006
#> 1037  1.2393425      .     . ID=enriched_region_1007
#> 1038  0.4632290      .     . ID=enriched_region_1008
#> 1039  0.4408197      .     . ID=enriched_region_1009
#> 1040  0.5675929      .     . ID=enriched_region_1010
#> 1041  0.3847605      .     . ID=enriched_region_1011
#> 1042  0.4250004      .     . ID=enriched_region_1012
#> 1043  0.7017615      .     . ID=enriched_region_1013
#> 1044  1.0098692      .     . ID=enriched_region_1014
#> 1045  0.6909900      .     . ID=enriched_region_1015
#> 1046  0.9383951      .     . ID=enriched_region_1016
#> 1047  1.0303584      .     . ID=enriched_region_1017
#> 1048  0.4278360      .     . ID=enriched_region_1018
#> 1049  0.7597417      .     . ID=enriched_region_1019
#> 1050  0.9611129      .     . ID=enriched_region_1020
#> 1051  0.6575522      .     . ID=enriched_region_1021
#> 1052  0.5030752      .     . ID=enriched_region_1022
#> 1053  0.5179767      .     . ID=enriched_region_1023
#> 1054  0.8084730      .     . ID=enriched_region_1024
#> 1055  1.0323717      .     . ID=enriched_region_1025
#> 1056  0.5221267      .     . ID=enriched_region_1026
#> 1057  0.4908670      .     . ID=enriched_region_1027
#> 1058  0.6447517      .     . ID=enriched_region_1028
#> 1059  0.9798290      .     . ID=enriched_region_1029
#> 1060  0.7592976      .     . ID=enriched_region_1030
#> 1061  1.0049453      .     . ID=enriched_region_1031
#> 1062  0.7580498      .     . ID=enriched_region_1032
#> 1063  0.5906264      .     . ID=enriched_region_1033
#> 1064  0.3458771      .     . ID=enriched_region_1034
#> 1065  0.7497114      .     . ID=enriched_region_1035
#> 1066  0.5793190      .     . ID=enriched_region_1036
#> 1067  0.6497927      .     . ID=enriched_region_1037
#> 1068  0.5789389      .     . ID=enriched_region_1038
#> 1069  0.9354259      .     . ID=enriched_region_1039
#> 1070  0.6268844      .     . ID=enriched_region_1040
#> 1071  0.6536983      .     . ID=enriched_region_1041
#> 1072  0.8539200      .     . ID=enriched_region_1042
#> 1073  0.3403217      .     . ID=enriched_region_1043
#> 1074  0.8413609      .     . ID=enriched_region_1044
#> 1075  0.7557753      .     . ID=enriched_region_1045
#> 1076  0.4245590      .     . ID=enriched_region_1046
#> 1077  0.8939498      .     . ID=enriched_region_1047
#> 1078  0.7724061      .     . ID=enriched_region_1048
#> 1079  1.8453402      .     . ID=enriched_region_1049
#> 1080  0.7933520      .     . ID=enriched_region_1050
#> 1081  0.5975687      .     . ID=enriched_region_1051
#> 1082  0.5158658      .     . ID=enriched_region_1052
#> 1083  0.3609520      .     . ID=enriched_region_1053
#> 1084  0.8587763      .     . ID=enriched_region_1054
#> 1085  0.7657199      .     . ID=enriched_region_1055
#> 1086  0.7743573      .     . ID=enriched_region_1056
#> 1087  2.0770924      .     . ID=enriched_region_1057
#> 1088  1.2872340      .     . ID=enriched_region_1058
#> 1089  0.7077082      .     . ID=enriched_region_1059
#> 1090  0.5903000      .     . ID=enriched_region_1060
#> 1091  0.9198327      .     . ID=enriched_region_1061
#> 1092  0.5909034      .     . ID=enriched_region_1062
#> 1093  0.4806125      .     . ID=enriched_region_1063
#> 1094  0.7081538      .     . ID=enriched_region_1064
#> 1095  0.3610406      .     . ID=enriched_region_1065
#> 1096  0.4937756      .     . ID=enriched_region_1066
#> 1097  0.7245754      .     . ID=enriched_region_1067
#> 1098  0.3565237      .     . ID=enriched_region_1068
#> 1099  0.4549869      .     . ID=enriched_region_1069
#> 1100  0.7803186      .     . ID=enriched_region_1070
#> 1101  0.7844731      .     . ID=enriched_region_1071
#> 1102  0.7418161      .     . ID=enriched_region_1072
#> 1103  0.4459830      .     . ID=enriched_region_1073
#> 1104  0.4038227      .     . ID=enriched_region_1074
#> 1105  0.7245665      .     . ID=enriched_region_1075
#> 1106  0.8022344      .     . ID=enriched_region_1076
#> 1107  1.9214963      .     . ID=enriched_region_1077
#> 1108  0.8039527      .     . ID=enriched_region_1078
#> 1109  0.6352209      .     . ID=enriched_region_1079
#> 1110  0.3466886      .     . ID=enriched_region_1080
#> 1111  0.8185373      .     . ID=enriched_region_1081
#> 1112  0.8872439      .     . ID=enriched_region_1082
#> 1113  0.6037476      .     . ID=enriched_region_1083
#> 1114  0.4298831      .     . ID=enriched_region_1084
#> 1115  1.0045728      .     . ID=enriched_region_1085
#> 1116  0.5222437      .     . ID=enriched_region_1086
#> 1117  0.4709026      .     . ID=enriched_region_1087
#> 1118  0.6889461      .     . ID=enriched_region_1088
#> 1119  0.6842105      .     . ID=enriched_region_1089
#> 1120  0.7021918      .     . ID=enriched_region_1090
#> 1121  1.2515563      .     . ID=enriched_region_1091
#> 1122  0.4520880      .     . ID=enriched_region_1092
#> 1123  0.9316487      .     . ID=enriched_region_1093
#> 1124  0.5369608      .     . ID=enriched_region_1094
#> 1125  0.8433990      .     . ID=enriched_region_1095
#> 1126  0.9306643      .     . ID=enriched_region_1096
#> 1127  0.9450877      .     . ID=enriched_region_1097
#> 1128  0.6063493      .     . ID=enriched_region_1098
#> 1129  0.6658186      .     . ID=enriched_region_1099
#> 1130  0.4911740      .     . ID=enriched_region_1100
#> 1131  0.6415340      .     . ID=enriched_region_1101
#> 1132  0.7058961      .     . ID=enriched_region_1102
#> 1133  0.6440762      .     . ID=enriched_region_1103
#> 1134  0.7824302      .     . ID=enriched_region_1104
#> 1135  0.4653263      .     . ID=enriched_region_1105
#> 1136  1.1629958      .     . ID=enriched_region_1106
#> 1137  0.4118974      .     . ID=enriched_region_1107
#> 1138  0.5487534      .     . ID=enriched_region_1108
#> 1139  0.7350196      .     . ID=enriched_region_1109
#> 1140  1.1311690      .     . ID=enriched_region_1110
#> 1141  0.9001124      .     . ID=enriched_region_1111
#> 1142  0.8317750      .     . ID=enriched_region_1112
#> 1143  0.4873971      .     . ID=enriched_region_1113
#> 1144  0.4632977      .     . ID=enriched_region_1114
#> 1145  0.8455284      .     . ID=enriched_region_1115
#> 1146  0.4569379      .     . ID=enriched_region_1116
#> 1147  0.4341760      .     . ID=enriched_region_1117
#> 1148  0.8469590      .     . ID=enriched_region_1118
#> 1149  0.8608977      .     . ID=enriched_region_1119
#> 1150  0.5007245      .     . ID=enriched_region_1120
#> 1151  0.4208302      .     . ID=enriched_region_1121
#> 1152  0.8084829      .     . ID=enriched_region_1122
#> 1153  0.7712228      .     . ID=enriched_region_1123
#> 1154  0.9819911      .     . ID=enriched_region_1124
#> 1155  0.5437972      .     . ID=enriched_region_1125
#> 1156  0.4242917      .     . ID=enriched_region_1126
#> 1157  0.5924313      .     . ID=enriched_region_1127
#> 1158  0.7698226      .     . ID=enriched_region_1128
#> 1159  0.8248496      .     . ID=enriched_region_1129
#> 1160  1.0855262      .     . ID=enriched_region_1130
#> 1161  0.6266592      .     . ID=enriched_region_1131
#> 1162  0.5103900      .     . ID=enriched_region_1132
#> 1163  0.5409741      .     . ID=enriched_region_1133
#> 1164  1.0264541      .     . ID=enriched_region_1134
#> 1165  0.6889305      .     . ID=enriched_region_1135
#> 1166  0.3610241      .     . ID=enriched_region_1136
#> 1167  2.1890587      .     . ID=enriched_region_1137
#> 1168  0.7727281      .     . ID=enriched_region_1138
#> 1169  0.5339244      .     . ID=enriched_region_1139
#> 1170  0.4672619      .     . ID=enriched_region_1140
#> 1171  0.4827679      .     . ID=enriched_region_1141
#> 1172  0.5180967      .     . ID=enriched_region_1142
#> 1173  0.4942922      .     . ID=enriched_region_1143
#> 1174  0.7622690      .     . ID=enriched_region_1144
#> 1175  0.7626168      .     . ID=enriched_region_1145
#> 1176  0.7749959      .     . ID=enriched_region_1146
#> 1177  0.5323298      .     . ID=enriched_region_1147
#> 1178  0.9323600      .     . ID=enriched_region_1148
#> 1179  0.4014253      .     . ID=enriched_region_1149
#> 1180  1.0586211      .     . ID=enriched_region_1150
#> 1181  0.6382831      .     . ID=enriched_region_1151
#> 1182  0.4671286      .     . ID=enriched_region_1152
#> 1183  0.6935754      .     . ID=enriched_region_1153
#> 1184  0.4390222      .     . ID=enriched_region_1154
#> 1185  0.3348941      .     . ID=enriched_region_1155
#> 1186  0.5321648      .     . ID=enriched_region_1156
#> 1187  0.8147261      .     . ID=enriched_region_1157
#> 1188  1.0992386      .     . ID=enriched_region_1158
#> 1189  0.6903097      .     . ID=enriched_region_1159
#> 1190  0.7454997      .     . ID=enriched_region_1160
#> 1191  0.6592120      .     . ID=enriched_region_1161
#> 1192  0.7274310      .     . ID=enriched_region_1162
#> 1193  0.5789703      .     . ID=enriched_region_1163
#> 1194  0.6215039      .     . ID=enriched_region_1164
#> 1195  0.6605254      .     . ID=enriched_region_1165
#> 1196  0.8621297      .     . ID=enriched_region_1166
#> 1197  0.5566789      .     . ID=enriched_region_1167
#> 1198  0.9443020      .     . ID=enriched_region_1168
#> 1199  0.7468453      .     . ID=enriched_region_1169
#> 1200  0.9069205      .     . ID=enriched_region_1170
#> 1201  0.5403822      .     . ID=enriched_region_1171
#> 1202  0.5611905      .     . ID=enriched_region_1172
#> 1203  0.4820259      .     . ID=enriched_region_1173
#> 1204  0.6137458      .     . ID=enriched_region_1174
#> 1205  0.6821828      .     . ID=enriched_region_1175
#> 1206  0.5544811      .     . ID=enriched_region_1176
#> 1207  0.7500422      .     . ID=enriched_region_1177
#> 1208  0.7661686      .     . ID=enriched_region_1178
#> 1209  0.4550088      .     . ID=enriched_region_1179
#> 1210  0.6278493      .     . ID=enriched_region_1180
#> 1211  0.7775904      .     . ID=enriched_region_1181
#> 1212  0.5767455      .     . ID=enriched_region_1182
#> 1213  0.3809478      .     . ID=enriched_region_1183
#> 1214  0.5107820      .     . ID=enriched_region_1184
#> 1215  1.2231316      .     . ID=enriched_region_1185
#> 1216  0.4401586      .     . ID=enriched_region_1186
#> 1217  0.4527252      .     . ID=enriched_region_1187
#> 1218  0.7671720      .     . ID=enriched_region_1188
#> 1219  0.9775289      .     . ID=enriched_region_1189
#> 1220  1.0681972      .     . ID=enriched_region_1190
#> 1221  0.9836826      .     . ID=enriched_region_1191
#> 1222  0.4733820      .     . ID=enriched_region_1192
#> 1223  0.8286665      .     . ID=enriched_region_1193
#> 1224  0.5915492      .     . ID=enriched_region_1194
#> 1225  0.7753830      .     . ID=enriched_region_1195
#> 1226  0.7950545      .     . ID=enriched_region_1196
#> 1227  0.5823270      .     . ID=enriched_region_1197
#> 1228  0.7923673      .     . ID=enriched_region_1198
#> 1229  1.0245940      .     . ID=enriched_region_1199
#> 1230  0.3887862      .     . ID=enriched_region_1200
#> 1231  0.7497659      .     . ID=enriched_region_1201
#> 1232  0.6946599      .     . ID=enriched_region_1202
#> 1233  0.5227390      .     . ID=enriched_region_1203
#> 1234  0.7829053      .     . ID=enriched_region_1204
#> 1235  0.4554470      .     . ID=enriched_region_1205
#> 1236  0.3908785      .     . ID=enriched_region_1206
#> 1237  0.5537675      .     . ID=enriched_region_1207
#> 1238  0.5768893      .     . ID=enriched_region_1208
#> 1239  0.6019879      .     . ID=enriched_region_1209
#> 1240  0.6525833      .     . ID=enriched_region_1210
#> 1241  0.8844561      .     . ID=enriched_region_1211
#> 1242  0.5972135      .     . ID=enriched_region_1212
#> 1243  0.4673514      .     . ID=enriched_region_1213
#> 1244  1.8814443      .     . ID=enriched_region_1214
#> 1245  0.4458546      .     . ID=enriched_region_1215
#> 1246  1.0960438      .     . ID=enriched_region_1216
#> 1247  0.5847780      .     . ID=enriched_region_1217
#> 1248  0.3703137      .     . ID=enriched_region_1218
#> 1249  0.6584389      .     . ID=enriched_region_1219
#> 1250  0.5152275      .     . ID=enriched_region_1220
#> 1251  0.4532996      .     . ID=enriched_region_1221
#> 1252  0.8370287      .     . ID=enriched_region_1222
#> 1253  0.9130446      .     . ID=enriched_region_1223
#> 1254  0.8572831      .     . ID=enriched_region_1224
#> 1255  0.7972151      .     . ID=enriched_region_1225
#> 1256  0.6096259      .     . ID=enriched_region_1226
#> 1257  0.4859235      .     . ID=enriched_region_1227
#> 1258  0.8412285      .     . ID=enriched_region_1228
#> 1259  0.9094255      .     . ID=enriched_region_1229
#> 1260  0.5810904      .     . ID=enriched_region_1230
#> 1261  0.3664119      .     . ID=enriched_region_1231
#> 1262  0.4695389      .     . ID=enriched_region_1232
#> 1263  0.7657444      .     . ID=enriched_region_1233
#> 1264  0.4980713      .     . ID=enriched_region_1234
#> 1265  0.4330544      .     . ID=enriched_region_1235
#> 1266  0.5867323      .     . ID=enriched_region_1236
#> 1267  0.4253119      .     . ID=enriched_region_1237
#> 1268  0.9015848      .     . ID=enriched_region_1238
#> 1269  0.5656531      .     . ID=enriched_region_1239
#> 1270  0.6664597      .     . ID=enriched_region_1240
#> 1271  0.4506492      .     . ID=enriched_region_1241
#> 1272  0.5746154      .     . ID=enriched_region_1242
#> 1273  0.4299103      .     . ID=enriched_region_1243
#> 1274  0.4906465      .     . ID=enriched_region_1244
#> 1275  0.4380712      .     . ID=enriched_region_1245
#> 1276  0.6490536      .     . ID=enriched_region_1246
#> 1277  0.7736530      .     . ID=enriched_region_1247
#> 1278  0.5806083      .     . ID=enriched_region_1248
#> 1279  0.7456668      .     . ID=enriched_region_1249
#> 1280  0.3704192      .     . ID=enriched_region_1250
#> 1281  1.5606873      .     . ID=enriched_region_1251
#> 1282  0.9956827      .     . ID=enriched_region_1252
#> 1283  0.6228684      .     . ID=enriched_region_1253
#> 1284  0.4972661      .     . ID=enriched_region_1254
#> 1285  0.8471485      .     . ID=enriched_region_1255
#> 1286  0.5423269      .     . ID=enriched_region_1256
#> 1287  0.6422390      .     . ID=enriched_region_1257
#> 1288  0.8277889      .     . ID=enriched_region_1258
#> 1289  0.4655219      .     . ID=enriched_region_1259
#> 1290  0.4853022      .     . ID=enriched_region_1260
#> 1291  0.8860231      .     . ID=enriched_region_1261
#> 1292  0.4965933      .     . ID=enriched_region_1262
#> 1293  0.4418513      .     . ID=enriched_region_1263
#> 1294  1.4674889      .     . ID=enriched_region_1264
#> 1295  0.6674864      .     . ID=enriched_region_1265
#> 1296  1.0871617      .     . ID=enriched_region_1266
#> 1297  0.6675435      .     . ID=enriched_region_1267
#> 1298  0.9114851      .     . ID=enriched_region_1268
#> 1299  0.7796211      .     . ID=enriched_region_1269
#> 1300  0.4518952      .     . ID=enriched_region_1270
#> 1301  0.6145016      .     . ID=enriched_region_1271
#> 1302  1.3826540      .     . ID=enriched_region_1272
#> 1303  0.6879043      .     . ID=enriched_region_1273
#> 1304  0.5046658      .     . ID=enriched_region_1274
#> 1305  0.7800095      .     . ID=enriched_region_1275
#> 1306  1.5545714      .     . ID=enriched_region_1276
#> 1307  0.5275183      .     . ID=enriched_region_1277
#> 1308  0.6367759      .     . ID=enriched_region_1278
#> 1309  0.5823697      .     . ID=enriched_region_1279
#> 1310  0.9970008      .     . ID=enriched_region_1280
#> 1311  0.9526951      .     . ID=enriched_region_1281
#> 1312  0.9058565      .     . ID=enriched_region_1282
#> 1313  0.4834698      .     . ID=enriched_region_1283
#> 1314  1.1362543      .     . ID=enriched_region_1284
#> 1315  0.4643385      .     . ID=enriched_region_1285
#> 1316  0.5796039      .     . ID=enriched_region_1286
#> 1317  0.4102784      .     . ID=enriched_region_1287
#> 1318  0.7811496      .     . ID=enriched_region_1288
#> 1319  0.6084577      .     . ID=enriched_region_1289
#> 1320  0.7516935      .     . ID=enriched_region_1290
#> 1321  0.8585707      .     . ID=enriched_region_1291
#> 1322  1.8914192      .     . ID=enriched_region_1292
#> 1323  0.7371917      .     . ID=enriched_region_1293
#> 1324  0.7515713      .     . ID=enriched_region_1294
#> 1325  0.7971209      .     . ID=enriched_region_1295
#> 1326  0.9876566      .     . ID=enriched_region_1296
#> 1327  0.5609172      .     . ID=enriched_region_1297
#> 1328  0.5217693      .     . ID=enriched_region_1298
#> 1329  0.5405200      .     . ID=enriched_region_1299
#> 1330  0.6289978      .     . ID=enriched_region_1300
#> 1331  0.6491451      .     . ID=enriched_region_1301
#> 1332  0.7625496      .     . ID=enriched_region_1302
#> 1333  0.9701865      .     . ID=enriched_region_1303
#> 1334  0.4793734      .     . ID=enriched_region_1304
#> 1335  1.0851715      .     . ID=enriched_region_1305
#> 1336  0.7439638      .     . ID=enriched_region_1306
#> 1337  0.7234173      .     . ID=enriched_region_1307
#> 1338  0.5655972      .     . ID=enriched_region_1308
#> 1339  0.8291310      .     . ID=enriched_region_1309
#> 1340  0.5812371      .     . ID=enriched_region_1310
#> 1341  0.6864163      .     . ID=enriched_region_1311
#> 1342  0.5435618      .     . ID=enriched_region_1312
#> 1343  0.5320366      .     . ID=enriched_region_1313
#> 1344  0.7869109      .     . ID=enriched_region_1314
#> 1345  0.5913159      .     . ID=enriched_region_1315
#> 1346  0.6988410      .     . ID=enriched_region_1316
#> 1347  0.6593248      .     . ID=enriched_region_1317
#> 1348  0.5464887      .     . ID=enriched_region_1318
#> 1349  0.4803367      .     . ID=enriched_region_1319
#> 1350  0.4595181      .     . ID=enriched_region_1320
#> 1351  0.4361171      .     . ID=enriched_region_1321
#> 1352  0.6659776      .     . ID=enriched_region_1322
#> 1353  0.9009741      .     . ID=enriched_region_1323
#> 1354  0.5689000      .     . ID=enriched_region_1324
#> 1355  0.7293572      .     . ID=enriched_region_1325
#> 1356  0.9136816      .     . ID=enriched_region_1326
#> 1357  0.7659299      .     . ID=enriched_region_1327
#> 1358  0.9991464      .     . ID=enriched_region_1328
#> 1359  0.8280497      .     . ID=enriched_region_1329
#> 1360  0.6966661      .     . ID=enriched_region_1330
#> 1361  0.6221672      .     . ID=enriched_region_1331
#> 1362  1.1723877      .     . ID=enriched_region_1332
#> 1363  0.9115679      .     . ID=enriched_region_1333
#> 1364  0.4766154      .     . ID=enriched_region_1334
#> 1365  0.6259932      .     . ID=enriched_region_1335
#> 1366  0.5142265      .     . ID=enriched_region_1336
#> 1367  0.9336863      .     . ID=enriched_region_1337
#> 1368  0.4793827      .     . ID=enriched_region_1338
#> 1369  0.4825768      .     . ID=enriched_region_1339
#> 1370  0.5076101      .     . ID=enriched_region_1340
#> 1371  0.6445212      .     . ID=enriched_region_1341
#> 1372  0.8693237      .     . ID=enriched_region_1342
#> 1373  0.6050218      .     . ID=enriched_region_1343
#> 1374  0.6747776      .     . ID=enriched_region_1344
#> 1375  0.6649366      .     . ID=enriched_region_1345
#> 1376  0.6435815      .     . ID=enriched_region_1346
#> 1377  0.9391603      .     . ID=enriched_region_1347
#> 1378  0.8073962      .     . ID=enriched_region_1348
#> 1379  0.7695683      .     . ID=enriched_region_1349
#> 1380  1.1718986      .     . ID=enriched_region_1350
#> 1381  1.7329110      .     . ID=enriched_region_1351
#> 1382  0.8333734      .     . ID=enriched_region_1352
#> 1383  0.6453023      .     . ID=enriched_region_1353
#> 1384  0.5519037      .     . ID=enriched_region_1354
#> 1385  0.8073059      .     . ID=enriched_region_1355
#> 1386  1.1427220      .     . ID=enriched_region_1356
#> 1387  0.6333538      .     . ID=enriched_region_1357
#> 1388  0.4918418      .     . ID=enriched_region_1358
#> 1389  0.4936463      .     . ID=enriched_region_1359
#> 1390  0.5602202      .     . ID=enriched_region_1360
#> 1391  1.0374002      .     . ID=enriched_region_1361
#> 1392  0.6298507      .     . ID=enriched_region_1362
#> 1393  0.5776700      .     . ID=enriched_region_1363
#> 1394  0.4897269      .     . ID=enriched_region_1364
#> 1395  0.3608026      .     . ID=enriched_region_1365
#> 1396  0.6893313      .     . ID=enriched_region_1366
#> 1397  0.5833344      .     . ID=enriched_region_1367
#> 1398  0.5758202      .     . ID=enriched_region_1368
#> 1399  0.6856531      .     . ID=enriched_region_1369
#> 1400  1.0076993      .     . ID=enriched_region_1370
#> 1401  0.8539344      .     . ID=enriched_region_1371
#> 1402  0.6635259      .     . ID=enriched_region_1372
#> 1403  0.7007263      .     . ID=enriched_region_1373
#> 1404  0.6237550      .     . ID=enriched_region_1374
#> 1405  0.8728280      .     . ID=enriched_region_1375
#> 1406  0.5595450      .     . ID=enriched_region_1376
#> 1407  0.6804959      .     . ID=enriched_region_1377
#> 1408  0.4594878      .     . ID=enriched_region_1378
#> 1409  0.4237687      .     . ID=enriched_region_1379
#> 1410  1.6555198      .     . ID=enriched_region_1380
#> 1411  0.9992465      .     . ID=enriched_region_1381
#> 1412  1.0575721      .     . ID=enriched_region_1382
#> 1413  0.8200468      .     . ID=enriched_region_1383
#> 1414  1.4072426      .     . ID=enriched_region_1384
#> 1415  1.4575788      .     . ID=enriched_region_1385
#> 1416  0.2591284      .     . ID=enriched_region_1386
#> 1417  1.2481322      .     . ID=enriched_region_1387
#> 1418  1.1298668      .     . ID=enriched_region_1388
#> 1419  1.8225974      .     . ID=enriched_region_1389
#> 1420  0.6379877      .     . ID=enriched_region_1390
#> 1421  0.5361946      .     . ID=enriched_region_1391
#> 1422  0.5371092      .     . ID=enriched_region_1392
#> 1423  1.2684788      .     . ID=enriched_region_1393
#> 1424  0.8353017      .     . ID=enriched_region_1394
#> 1425  0.8329379      .     . ID=enriched_region_1395
#> 1426  0.3747902      .     . ID=enriched_region_1396
#> 1427  0.6454238      .     . ID=enriched_region_1397
#> 1428  2.0613985      .     . ID=enriched_region_1398
#> 1429  0.5164925      .     . ID=enriched_region_1399
#> 1430  0.3951470      .     . ID=enriched_region_1400
#> 1431  0.7927413      .     . ID=enriched_region_1401
#> 1432  1.0993415      .     . ID=enriched_region_1402
#> 1433  0.8001046      .     . ID=enriched_region_1403
#> 1434  0.9838514      .     . ID=enriched_region_1404
#> 1435  0.5799533      .     . ID=enriched_region_1405
#> 1436  0.6893499      .     . ID=enriched_region_1406
#> 1437  1.0312518      .     . ID=enriched_region_1407
#> 1438  0.4110658      .     . ID=enriched_region_1408
#> 1439  0.8855871      .     . ID=enriched_region_1409
#> 1440  2.0235555      .     . ID=enriched_region_1410
#> 1441  2.3617495      .     . ID=enriched_region_1411
#> 1442  0.8059449      .     . ID=enriched_region_1412
#> 1443  0.8092957      .     . ID=enriched_region_1413
#> 1444  0.6227797      .     . ID=enriched_region_1414
#> 1445  0.6341601      .     . ID=enriched_region_1415
#> 1446  0.6138934      .     . ID=enriched_region_1416
#> 1447  1.7625873      .     . ID=enriched_region_1417
#> 1448  0.7213988      .     . ID=enriched_region_1418
#> 1449  0.9705845      .     . ID=enriched_region_1419
#> 1450  0.6425905      .     . ID=enriched_region_1420
#> 1451  1.3802382      .     . ID=enriched_region_1421
#> 1452  0.3945784      .     . ID=enriched_region_1422
#> 1453  1.1531666      .     . ID=enriched_region_1423
#> 1454  1.3488920      .     . ID=enriched_region_1424
#> 1455  0.5578908      .     . ID=enriched_region_1425
#> 1456  0.4412617      .     . ID=enriched_region_1426
#> 1457  0.8663658      .     . ID=enriched_region_1427
#> 1458  1.2082487      .     . ID=enriched_region_1428
#> 1459  0.4032320      .     . ID=enriched_region_1429
#> 1460  1.0058896      .     . ID=enriched_region_1430
#> 1461  0.4783825      .     . ID=enriched_region_1431
#> 1462  0.6086074      .     . ID=enriched_region_1432
#> 1463  1.8416298      .     . ID=enriched_region_1433
#> 1464  0.7008353      .     . ID=enriched_region_1434
#> 1465  0.4493733      .     . ID=enriched_region_1435
#> 1466  0.5891677      .     . ID=enriched_region_1436
#> 1467  1.0010858      .     . ID=enriched_region_1437
#> 1468  0.9643234      .     . ID=enriched_region_1438
#> 1469  0.6698579      .     . ID=enriched_region_1439
#> 1470  0.5709248      .     . ID=enriched_region_1440
#> 1471  0.6476539      .     . ID=enriched_region_1441
#> 1472  0.6995266      .     . ID=enriched_region_1442
#> 1473  0.6139198      .     . ID=enriched_region_1443
#> 1474  0.5893767      .     . ID=enriched_region_1444
#> 1475  0.7051483      .     . ID=enriched_region_1445
#> 1476  0.9366070      .     . ID=enriched_region_1446
#> 1477  0.8035237      .     . ID=enriched_region_1447
#> 1478  0.3823835      .     . ID=enriched_region_1448
#> 1479  0.6526294      .     . ID=enriched_region_1449
#> 1480  0.4812882      .     . ID=enriched_region_1450
#> 1481  0.7495856      .     . ID=enriched_region_1451
#> 1482  0.8515885      .     . ID=enriched_region_1452
#> 1483  0.3519478      .     . ID=enriched_region_1453
#> 1484  0.9202584      .     . ID=enriched_region_1454
#> 1485  1.5022886      .     . ID=enriched_region_1455
#> 1486  0.6073782      .     . ID=enriched_region_1456
#> 1487  0.4671337      .     . ID=enriched_region_1457
#> 1488  0.5309336      .     . ID=enriched_region_1458
#> 1489  0.5509337      .     . ID=enriched_region_1459
#> 1490  0.8091028      .     . ID=enriched_region_1460
#> 1491  1.3385617      .     . ID=enriched_region_1461
#> 1492  1.8612061      .     . ID=enriched_region_1462
#> 1493  0.4767895      .     . ID=enriched_region_1463
#> 1494  0.5576760      .     . ID=enriched_region_1464
#> 1495  0.4139456      .     . ID=enriched_region_1465
#> 1496  0.4930858      .     . ID=enriched_region_1466
#> 1497  0.4896951      .     . ID=enriched_region_1467
#> 1498  0.4855557      .     . ID=enriched_region_1468
#> 1499  0.5649205      .     . ID=enriched_region_1469
#> 1500  0.7589020      .     . ID=enriched_region_1470
#> 1501  1.0807007      .     . ID=enriched_region_1471
#> 1502  0.6353200      .     . ID=enriched_region_1472
#> 1503  0.7682330      .     . ID=enriched_region_1473
#> 1504  0.5096922      .     . ID=enriched_region_1474
#> 1505  1.2491554      .     . ID=enriched_region_1475
#> 1506  0.4509269      .     . ID=enriched_region_1476
#> 1507  0.6511734      .     . ID=enriched_region_1477
#> 1508  0.4584787      .     . ID=enriched_region_1478
#> 1509  0.8954477      .     . ID=enriched_region_1479
#> 1510  1.3585476      .     . ID=enriched_region_1480
#> 1511  0.3836625      .     . ID=enriched_region_1481
#> 1512  0.5151599      .     . ID=enriched_region_1482
#> 1513  0.4665107      .     . ID=enriched_region_1483
#> 1514  2.3200481      .     . ID=enriched_region_1484
#> 1515  2.1886447      .     . ID=enriched_region_1485
#> 1516  0.7769118      .     . ID=enriched_region_1486
#> 1517  0.7464293      .     . ID=enriched_region_1487
#> 1518  0.5285019      .     . ID=enriched_region_1488
#> 1519  0.6626987      .     . ID=enriched_region_1489
#> 1520  0.9566497      .     . ID=enriched_region_1490
#> 1521  0.7600720      .     . ID=enriched_region_1491
#> 1522  0.7507245      .     . ID=enriched_region_1492
#> 1523  0.6808004      .     . ID=enriched_region_1493
#> 1524  0.4265264      .     . ID=enriched_region_1494
#> 1525  0.3627499      .     . ID=enriched_region_1495
#> 1526  1.0167996      .     . ID=enriched_region_1496
#> 1527  0.7837891      .     . ID=enriched_region_1497
#> 1528  0.4757835      .     . ID=enriched_region_1498
#> 1529  0.5577422      .     . ID=enriched_region_1499
#> 1530  2.0573309      .     . ID=enriched_region_1500
#> 1531  0.7906811      .     . ID=enriched_region_1501
#> 1532  0.4825571      .     . ID=enriched_region_1502
#> 1533  1.0025313      .     . ID=enriched_region_1503
#> 1534  1.0754614      .     . ID=enriched_region_1504
#> 1535  1.0562409      .     . ID=enriched_region_1505
#> 1536  0.5564660      .     . ID=enriched_region_1506
#> 1537  0.4985929      .     . ID=enriched_region_1507
#> 1538  0.5726779      .     . ID=enriched_region_1508
#> 1539  0.8518112      .     . ID=enriched_region_1509
#> 1540  1.6226898      .     . ID=enriched_region_1510
#> 1541  0.5139923      .     . ID=enriched_region_1511
#> 1542  0.4772900      .     . ID=enriched_region_1512
#> 1543  0.5282318      .     . ID=enriched_region_1513
#> 1544  1.1059390      .     . ID=enriched_region_1514
#> 1545  0.8228863      .     . ID=enriched_region_1515
#> 1546  0.5913662      .     . ID=enriched_region_1516
#> 1547  0.5090842      .     . ID=enriched_region_1517
#> 1548  0.9830746      .     . ID=enriched_region_1518
#> 1549  0.8908763      .     . ID=enriched_region_1519
#> 1550  0.5799856      .     . ID=enriched_region_1520
#> 1551  0.7474137      .     . ID=enriched_region_1521
#> 1552  0.9114508      .     . ID=enriched_region_1522
#> 1553  1.1325450      .     . ID=enriched_region_1523
#> 1554  0.7277828      .     . ID=enriched_region_1524
#> 1555  0.5943720      .     . ID=enriched_region_1525
#> 1556  0.6556906      .     . ID=enriched_region_1526
#> 1557  0.6855309      .     . ID=enriched_region_1527
#> 1558  0.7209490      .     . ID=enriched_region_1528
#> 1559  0.8663857      .     . ID=enriched_region_1529
#> 1560  0.7645914      .     . ID=enriched_region_1530
#> 1561  0.4413103      .     . ID=enriched_region_1531
#> 1562  0.3740485      .     . ID=enriched_region_1532
#> 1563  1.1931906      .     . ID=enriched_region_1533
#> 1564  0.6299109      .     . ID=enriched_region_1534
#> 1565  0.6843820      .     . ID=enriched_region_1535
#> 1566  0.8042494      .     . ID=enriched_region_1536
#> 1567  0.7243299      .     . ID=enriched_region_1537
#> 1568  1.0217335      .     . ID=enriched_region_1538
#> 1569  0.7513882      .     . ID=enriched_region_1539
#> 1570  0.8641292      .     . ID=enriched_region_1540
#> 1571  0.5462196      .     . ID=enriched_region_1541
#> 1572  0.7408274      .     . ID=enriched_region_1542
#> 1573  1.3859346      .     . ID=enriched_region_1543
#> 1574  0.6886428      .     . ID=enriched_region_1544
#> 1575  1.1000172      .     . ID=enriched_region_1545
#> 1576  0.7001382      .     . ID=enriched_region_1546
#> 1577  0.8208092      .     . ID=enriched_region_1547
#> 1578  0.5032890      .     . ID=enriched_region_1548
#> 1579  0.8131617      .     . ID=enriched_region_1549
#> 1580  0.9410290      .     . ID=enriched_region_1550
#> 1581  0.7436474      .     . ID=enriched_region_1551
#> 1582  0.7290145      .     . ID=enriched_region_1552
#> 1583  0.7048059      .     . ID=enriched_region_1553
#> 1584  0.5306581      .     . ID=enriched_region_1554
#> 1585  0.9662389      .     . ID=enriched_region_1555
#> 1586  1.0718208      .     . ID=enriched_region_1556
#> 1587  0.9027040      .     . ID=enriched_region_1557
#> 1588  0.5205610      .     . ID=enriched_region_1558
#> 1589  0.5918454      .     . ID=enriched_region_1559
#> 1590  0.5717218      .     . ID=enriched_region_1560
#> 1591  1.5755538      .     . ID=enriched_region_1561
#> 1592  1.6820109      .     . ID=enriched_region_1562
#> 1593  0.5296445      .     . ID=enriched_region_1563
#> 1594  0.7242101      .     . ID=enriched_region_1564
#> 1595  0.8062109      .     . ID=enriched_region_1565
#> 1596  0.7839174      .     . ID=enriched_region_1566
#> 1597  0.6809668      .     . ID=enriched_region_1567
#> 1598  0.6270488      .     . ID=enriched_region_1568
#> 1599  0.5440026      .     . ID=enriched_region_1569
#> 1600  0.6314599      .     . ID=enriched_region_1570
#> 1601  0.6778451      .     . ID=enriched_region_1571
#> 1602  2.0959563      .     . ID=enriched_region_1572
#> 1603  1.1033448      .     . ID=enriched_region_1573
#> 1604  0.7410822      .     . ID=enriched_region_1574
#> 1605  0.6155163      .     . ID=enriched_region_1575
#> 1606  1.1172011      .     . ID=enriched_region_1576
#> 1607  0.9133630      .     . ID=enriched_region_1577
#> 1608  0.4873246      .     . ID=enriched_region_1578
#> 1609  1.1806422      .     . ID=enriched_region_1579
#> 1610  0.5924081      .     . ID=enriched_region_1580
#> 1611  0.9198248      .     . ID=enriched_region_1581
#> 1612  0.7015793      .     . ID=enriched_region_1582
#> 1613  0.4420448      .     . ID=enriched_region_1583
#> 1614  0.9604847      .     . ID=enriched_region_1584
#> 1615  0.5258219      .     . ID=enriched_region_1585
#> 1616  1.0584942      .     . ID=enriched_region_1586
#> 1617  1.7679071      .     . ID=enriched_region_1587
#> 1618  0.4447582      .     . ID=enriched_region_1588
#> 1619  0.7806298      .     . ID=enriched_region_1589
#> 1620  1.1808216      .     . ID=enriched_region_1590
#> 1621  1.4115312      .     . ID=enriched_region_1591
#> 1622  0.5456133      .     . ID=enriched_region_1592
#> 1623  1.4115202      .     . ID=enriched_region_1593
#> 1624  0.5437889      .     . ID=enriched_region_1594
#> 1625  0.5446441      .     . ID=enriched_region_1595
#> 1626  0.7810294      .     . ID=enriched_region_1596
#> 1627  0.5765305      .     . ID=enriched_region_1597
#> 1628  0.5066923      .     . ID=enriched_region_1598
#> 1629  0.3892167      .     . ID=enriched_region_1599
#> 1630  0.9837626      .     . ID=enriched_region_1600
#> 1631  0.6490118      .     . ID=enriched_region_1601
#> 1632  0.8412498      .     . ID=enriched_region_1602
#> 1633  0.8882119      .     . ID=enriched_region_1603
#> 1634  1.2034787      .     . ID=enriched_region_1604
#> 1635  1.8323951      .     . ID=enriched_region_1605
#> 1636  1.4387981      .     . ID=enriched_region_1606
#> 1637  0.3993606      .     . ID=enriched_region_1607
#> 1638  0.6460193      .     . ID=enriched_region_1608
#> 1639  0.4106853      .     . ID=enriched_region_1609
#> 1640  0.7527141      .     . ID=enriched_region_1610
#> 1641  0.5850135      .     . ID=enriched_region_1611
#> 1642  0.5997871      .     . ID=enriched_region_1612
#> 1643  0.5140213      .     . ID=enriched_region_1613
#> 1644  1.7462600      .     . ID=enriched_region_1614
#> 1645  0.9597939      .     . ID=enriched_region_1615
#> 1646  0.7387436      .     . ID=enriched_region_1616
#> 1647  0.7269471      .     . ID=enriched_region_1617
#> 1648  0.7787937      .     . ID=enriched_region_1618
#> 1649  0.5561657      .     . ID=enriched_region_1619
#> 1650  0.4001750      .     . ID=enriched_region_1620
#> 1651  0.9529523      .     . ID=enriched_region_1621
#> 1652  0.8810243      .     . ID=enriched_region_1622
#> 1653  1.1155391      .     . ID=enriched_region_1623
#> 1654  0.4652511      .     . ID=enriched_region_1624
#> 1655  0.6740444      .     . ID=enriched_region_1625
#> 1656  0.9466076      .     . ID=enriched_region_1626
#> 1657  0.4274843      .     . ID=enriched_region_1627
#> 1658  0.5598266      .     . ID=enriched_region_1628
#> 1659  1.0891229      .     . ID=enriched_region_1629
#> 1660  0.6361187      .     . ID=enriched_region_1630
#> 1661  0.7153598      .     . ID=enriched_region_1631
#> 1662  0.8578837      .     . ID=enriched_region_1632
#> 1663  0.7556374      .     . ID=enriched_region_1633
#> 1664  0.8678352      .     . ID=enriched_region_1634
#> 1665  0.7957202      .     . ID=enriched_region_1635
#> 1666  1.0169805      .     . ID=enriched_region_1636
#> 1667  0.5310118      .     . ID=enriched_region_1637
#> 1668  1.0047977      .     . ID=enriched_region_1638
#> 1669  0.6943709      .     . ID=enriched_region_1639
#> 1670  0.5209700      .     . ID=enriched_region_1640
#> 1671  0.5642429      .     . ID=enriched_region_1641
#> 1672  1.4323270      .     . ID=enriched_region_1642
#> 1673  0.6835265      .     . ID=enriched_region_1643
#> 1674  0.7278089      .     . ID=enriched_region_1644
#> 1675  0.7617733      .     . ID=enriched_region_1645
#> 1676  0.5528397      .     . ID=enriched_region_1646
#> 1677  1.2051527      .     . ID=enriched_region_1647
#> 1678  0.7661056      .     . ID=enriched_region_1648
#> 1679  0.5612089      .     . ID=enriched_region_1649
#> 1680  0.7773631      .     . ID=enriched_region_1650
#> 1681  0.6756105      .     . ID=enriched_region_1651
#> 1682  0.6024827      .     . ID=enriched_region_1652
#> 1683  0.8809735      .     . ID=enriched_region_1653
#> 1684  0.6475003      .     . ID=enriched_region_1654
#> 1685  0.5345942      .     . ID=enriched_region_1655
#> 1686  0.7615522      .     . ID=enriched_region_1656
#> 1687  1.4989939      .     . ID=enriched_region_1657
#> 1688  0.6529772      .     . ID=enriched_region_1658
#> 1689  0.3812055      .     . ID=enriched_region_1659
#> 1690  0.9096593      .     . ID=enriched_region_1660
#> 1691  0.5498389      .     . ID=enriched_region_1661
#> 1692  1.0007135      .     . ID=enriched_region_1662
#> 1693  0.6425539      .     . ID=enriched_region_1663
#> 1694  0.5569451      .     . ID=enriched_region_1664
#> 1695  0.5697802      .     . ID=enriched_region_1665
#> 1696  0.5794195      .     . ID=enriched_region_1666
#> 1697  0.7015924      .     . ID=enriched_region_1667
#> 1698  0.4776552      .     . ID=enriched_region_1668
#> 1699  0.5126308      .     . ID=enriched_region_1669
#> 1700  0.4698312      .     . ID=enriched_region_1670
#> 1701  0.7634644      .     . ID=enriched_region_1671
#> 1702  0.4794648      .     . ID=enriched_region_1672
#> 1703  1.3418321      .     . ID=enriched_region_1673
#> 1704  0.7390218      .     . ID=enriched_region_1674
#> 1705  0.9069531      .     . ID=enriched_region_1675
#> 1706  1.0853729      .     . ID=enriched_region_1676
#> 1707  0.8071704      .     . ID=enriched_region_1677
#> 1708  0.7235954      .     . ID=enriched_region_1678
#> 1709  0.6636336      .     . ID=enriched_region_1679
#> 1710  0.7834492      .     . ID=enriched_region_1680
#> 1711  0.4449832      .     . ID=enriched_region_1681
#> 1712  1.1119811      .     . ID=enriched_region_1682
#> 1713  0.8113477      .     . ID=enriched_region_1683
#> 1714  1.2348256      .     . ID=enriched_region_1684
#> 1715 -0.4782711      .     .   ID=depleted_region_31
#> 1716 -0.4888425      .     .   ID=depleted_region_32
#> 1717 -0.5296976      .     .   ID=depleted_region_33
#> 1718 -0.4269021      .     .   ID=depleted_region_34
#> 1719 -0.5663608      .     .   ID=depleted_region_35
#> 1720 -0.5048719      .     .   ID=depleted_region_36
#> 1721 -0.3958949      .     .   ID=depleted_region_37
#> 1722 -0.4172695      .     .   ID=depleted_region_38
#> 1723 -0.4480536      .     .   ID=depleted_region_39
#> 1724 -0.5563245      .     .   ID=depleted_region_40
#> 1725 -0.4776110      .     .   ID=depleted_region_41
#> 1726 -0.6187360      .     .   ID=depleted_region_42
#> 1727  1.5168654      .     . ID=enriched_region_1685
#> 1728  0.5798304      .     . ID=enriched_region_1686
#> 1729  1.8874330      .     . ID=enriched_region_1687
#> 1730  0.9257945      .     . ID=enriched_region_1688
#> 1731  0.4784161      .     . ID=enriched_region_1689
#> 1732  0.5714487      .     . ID=enriched_region_1690
#> 1733  0.6543268      .     . ID=enriched_region_1691
#> 1734  0.7221028      .     . ID=enriched_region_1692
#> 1735  0.8354269      .     . ID=enriched_region_1693
#> 1736  0.7558106      .     . ID=enriched_region_1694
#> 1737  0.9846285      .     . ID=enriched_region_1695
#> 1738  0.9459866      .     . ID=enriched_region_1696
#> 1739  0.5323930      .     . ID=enriched_region_1697
#> 1740  0.6324659      .     . ID=enriched_region_1698
#> 1741  0.4463296      .     . ID=enriched_region_1699
#> 1742  0.9993103      .     . ID=enriched_region_1700
#> 1743  1.0968991      .     . ID=enriched_region_1701
#> 1744  0.7167992      .     . ID=enriched_region_1702
#> 1745  0.6608794      .     . ID=enriched_region_1703
#> 1746  0.5249244      .     . ID=enriched_region_1704
#> 1747  0.7413489      .     . ID=enriched_region_1705
#> 1748  0.5424921      .     . ID=enriched_region_1706
#> 1749  0.7982443      .     . ID=enriched_region_1707
#> 1750  0.5085721      .     . ID=enriched_region_1708
#> 1751  0.7500280      .     . ID=enriched_region_1709
#> 1752  0.5213940      .     . ID=enriched_region_1710
#> 1753  0.4673734      .     . ID=enriched_region_1711
#> 1754  0.4017870      .     . ID=enriched_region_1712
#> 1755  1.0744979      .     . ID=enriched_region_1713
#> 1756  0.8896799      .     . ID=enriched_region_1714
#> 1757  0.9282257      .     . ID=enriched_region_1715
#> 1758  0.8198671      .     . ID=enriched_region_1716
#> 1759  0.6093656      .     . ID=enriched_region_1717
#> 1760  0.6768909      .     . ID=enriched_region_1718
#> 1761  0.7193431      .     . ID=enriched_region_1719
#> 1762  0.7448894      .     . ID=enriched_region_1720
#> 1763  0.4342441      .     . ID=enriched_region_1721
#> 1764  0.6160864      .     . ID=enriched_region_1722
#> 1765  0.8961181      .     . ID=enriched_region_1723
#> 1766  0.9857315      .     . ID=enriched_region_1724
#> 1767  0.5186392      .     . ID=enriched_region_1725
#> 1768  0.6034014      .     . ID=enriched_region_1726
#> 1769  0.3083797      .     . ID=enriched_region_1727
#> 1770  0.3720544      .     . ID=enriched_region_1728
#> 1771  0.8023484      .     . ID=enriched_region_1729
#> 1772  0.7102999      .     . ID=enriched_region_1730
#> 1773  0.4559437      .     . ID=enriched_region_1731
#> 1774  0.5972190      .     . ID=enriched_region_1732
#> 1775  1.0665311      .     . ID=enriched_region_1733
#> 1776  0.6413387      .     . ID=enriched_region_1734
#> 1777  0.8002100      .     . ID=enriched_region_1735
#> 1778  0.4785884      .     . ID=enriched_region_1736
#> 1779  0.7666707      .     . ID=enriched_region_1737
#> 1780  0.8922806      .     . ID=enriched_region_1738
#> 1781  0.9922134      .     . ID=enriched_region_1739
#> 1782  0.8874383      .     . ID=enriched_region_1740
#> 1783  0.6550607      .     . ID=enriched_region_1741
#> 1784  0.3268857      .     . ID=enriched_region_1742
#> 1785  0.6373383      .     . ID=enriched_region_1743
#> 1786  0.5059964      .     . ID=enriched_region_1744
#> 1787  1.3310073      .     . ID=enriched_region_1745
#> 1788  0.5028402      .     . ID=enriched_region_1746
#> 1789  0.8873410      .     . ID=enriched_region_1747
#> 1790  0.7135525      .     . ID=enriched_region_1748
#> 1791  0.4146553      .     . ID=enriched_region_1749
#> 1792  1.5227580      .     . ID=enriched_region_1750
#> 1793  0.5080432      .     . ID=enriched_region_1751
#> 1794  0.7647761      .     . ID=enriched_region_1752
#> 1795  0.4633810      .     . ID=enriched_region_1753
#> 1796  1.0659826      .     . ID=enriched_region_1754
#> 1797  0.8972518      .     . ID=enriched_region_1755
#> 1798  0.5577011      .     . ID=enriched_region_1756
#> 1799  0.3753175      .     . ID=enriched_region_1757
#> 1800  0.5246060      .     . ID=enriched_region_1758
#> 1801  0.4505502      .     . ID=enriched_region_1759
#> 1802  0.4298341      .     . ID=enriched_region_1760
#> 1803  0.8858423      .     . ID=enriched_region_1761
#> 1804  0.7596688      .     . ID=enriched_region_1762
#> 1805  0.6165903      .     . ID=enriched_region_1763
#> 1806  0.5437390      .     . ID=enriched_region_1764
#> 1807  0.7540060      .     . ID=enriched_region_1765
#> 1808  0.5986975      .     . ID=enriched_region_1766
#> 1809  0.7452144      .     . ID=enriched_region_1767
#> 1810  0.4702258      .     . ID=enriched_region_1768
#> 1811  0.5414189      .     . ID=enriched_region_1769
#> 1812  0.9958876      .     . ID=enriched_region_1770
#> 1813  1.1446482      .     . ID=enriched_region_1771
#> 1814  0.4952711      .     . ID=enriched_region_1772
#> 1815  0.4628680      .     . ID=enriched_region_1773
#> 1816  0.3950096      .     . ID=enriched_region_1774
#> 1817  0.9935510      .     . ID=enriched_region_1775
#> 1818  1.0592179      .     . ID=enriched_region_1776
#> 1819  0.4681419      .     . ID=enriched_region_1777
#> 1820  0.7807565      .     . ID=enriched_region_1778
#> 1821  0.6728454      .     . ID=enriched_region_1779
#> 1822  0.7201254      .     . ID=enriched_region_1780
#> 1823  0.7745407      .     . ID=enriched_region_1781
#> 1824  0.9161166      .     . ID=enriched_region_1782
#> 1825  0.7557204      .     . ID=enriched_region_1783
#> 1826  0.7836280      .     . ID=enriched_region_1784
#> 1827  0.8518213      .     . ID=enriched_region_1785
#> 1828  0.4257059      .     . ID=enriched_region_1786
#> 1829  1.2525272      .     . ID=enriched_region_1787
#> 1830  0.8330203      .     . ID=enriched_region_1788
#> 1831  0.7008383      .     . ID=enriched_region_1789
#> 1832  0.5846227      .     . ID=enriched_region_1790
#> 1833  0.8967697      .     . ID=enriched_region_1791
#> 1834  1.0353668      .     . ID=enriched_region_1792
#> 1835  0.4905666      .     . ID=enriched_region_1793
#> 1836  0.5052840      .     . ID=enriched_region_1794
#> 1837  0.7933570      .     . ID=enriched_region_1795
#> 1838  0.6627038      .     . ID=enriched_region_1796
#> 1839  0.4380535      .     . ID=enriched_region_1797
#> 1840  0.5476916      .     . ID=enriched_region_1798
#> 1841  0.9187637      .     . ID=enriched_region_1799
#> 1842  0.5620408      .     . ID=enriched_region_1800
#> 1843  0.6914591      .     . ID=enriched_region_1801
#> 1844  0.6169571      .     . ID=enriched_region_1802
#> 1845  0.7373380      .     . ID=enriched_region_1803
#> 1846  0.6357950      .     . ID=enriched_region_1804
#> 1847  0.5582556      .     . ID=enriched_region_1805
#> 1848  0.5333687      .     . ID=enriched_region_1806
#> 1849  1.0345796      .     . ID=enriched_region_1807
#> 1850  0.4885722      .     . ID=enriched_region_1808
#> 1851  1.2416510      .     . ID=enriched_region_1809
#> 1852  0.6354907      .     . ID=enriched_region_1810
#> 1853  0.6551563      .     . ID=enriched_region_1811
#> 1854  0.8478692      .     . ID=enriched_region_1812
#> 1855  1.8585730      .     . ID=enriched_region_1813
#> 1856  0.7065633      .     . ID=enriched_region_1814
#> 1857  0.8896782      .     . ID=enriched_region_1815
#> 1858  0.7519324      .     . ID=enriched_region_1816
#> 1859  0.9851583      .     . ID=enriched_region_1817
#> 1860  1.3015198      .     . ID=enriched_region_1818
#> 1861  0.8100869      .     . ID=enriched_region_1819
#> 1862  0.6865069      .     . ID=enriched_region_1820
#> 1863  0.7530769      .     . ID=enriched_region_1821
#> 1864  0.8564024      .     . ID=enriched_region_1822
#> 1865  1.1106853      .     . ID=enriched_region_1823
#> 1866  0.8138644      .     . ID=enriched_region_1824
#> 1867  0.7579330      .     . ID=enriched_region_1825
#> 1868  0.9388375      .     . ID=enriched_region_1826
#> 1869  0.6748853      .     . ID=enriched_region_1827
#> 1870  0.8397775      .     . ID=enriched_region_1828
#> 1871  0.8528607      .     . ID=enriched_region_1829
#> 1872  0.7681469      .     . ID=enriched_region_1830
#> 1873  1.8418800      .     . ID=enriched_region_1831
#> 1874  0.8147212      .     . ID=enriched_region_1832
#> 1875  0.7194734      .     . ID=enriched_region_1833
#> 1876  0.3469874      .     . ID=enriched_region_1834
#> 1877  0.4220038      .     . ID=enriched_region_1835
#> 1878  0.4840638      .     . ID=enriched_region_1836
#> 1879  0.7340991      .     . ID=enriched_region_1837
#> 1880  0.4646302      .     . ID=enriched_region_1838
#> 1881  0.8317570      .     . ID=enriched_region_1839
#> 1882  1.8532439      .     . ID=enriched_region_1840
#> 1883  1.1131527      .     . ID=enriched_region_1841
#> 1884  0.9357385      .     . ID=enriched_region_1842
#> 1885  1.0121707      .     . ID=enriched_region_1843
#> 1886  1.4119096      .     . ID=enriched_region_1844
#> 1887  0.4549020      .     . ID=enriched_region_1845
#> 1888  0.5184333      .     . ID=enriched_region_1846
#> 1889  0.5231111      .     . ID=enriched_region_1847
#> 1890  0.6157866      .     . ID=enriched_region_1848
#> 1891  0.8977856      .     . ID=enriched_region_1849
#> 1892  0.7229289      .     . ID=enriched_region_1850
#> 1893  0.6632980      .     . ID=enriched_region_1851
#> 1894  0.7850056      .     . ID=enriched_region_1852
#> 1895  0.8574756      .     . ID=enriched_region_1853
#> 1896  0.9667125      .     . ID=enriched_region_1854
#> 1897  1.0739918      .     . ID=enriched_region_1855
#> 1898  0.5307888      .     . ID=enriched_region_1856
#> 1899  0.5599671      .     . ID=enriched_region_1857
#> 1900  0.4747897      .     . ID=enriched_region_1858
#> 1901  0.8115139      .     . ID=enriched_region_1859
#> 1902  0.8581206      .     . ID=enriched_region_1860
#> 1903  0.6656652      .     . ID=enriched_region_1861
#> 1904  0.9190670      .     . ID=enriched_region_1862
#> 1905  0.5258429      .     . ID=enriched_region_1863
#> 1906  0.6151556      .     . ID=enriched_region_1864
#> 1907  2.3105043      .     . ID=enriched_region_1865
#> 1908  1.0959657      .     . ID=enriched_region_1866
#> 1909  0.4295098      .     . ID=enriched_region_1867
#> 1910  1.0665121      .     . ID=enriched_region_1868
#> 1911  1.0807725      .     . ID=enriched_region_1869
#> 1912  0.6540815      .     . ID=enriched_region_1870
#> 1913  0.5397066      .     . ID=enriched_region_1871
#> 1914  0.4321604      .     . ID=enriched_region_1872
#> 1915  0.7768402      .     . ID=enriched_region_1873
#> 1916  1.2212582      .     . ID=enriched_region_1874
#> 1917  0.9853441      .     . ID=enriched_region_1875
#> 1918  0.7592577      .     . ID=enriched_region_1876
#> 1919  0.7305745      .     . ID=enriched_region_1877
#> 1920  0.8556726      .     . ID=enriched_region_1878
#> 1921  0.4637937      .     . ID=enriched_region_1879
#> 1922  1.1190800      .     . ID=enriched_region_1880
#> 1923  0.8639578      .     . ID=enriched_region_1881
#> 1924  0.5976932      .     . ID=enriched_region_1882
#> 1925  0.8041782      .     . ID=enriched_region_1883
#> 1926  1.4330098      .     . ID=enriched_region_1884
#> 1927  1.0693994      .     . ID=enriched_region_1885
#> 1928  0.5152597      .     . ID=enriched_region_1886
#> 1929  1.1482632      .     . ID=enriched_region_1887
#> 1930  0.9214679      .     . ID=enriched_region_1888
#> 1931  0.7495305      .     . ID=enriched_region_1889
#> 1932  1.3319249      .     . ID=enriched_region_1890
#> 1933  0.8926625      .     . ID=enriched_region_1891
#> 1934  0.7579139      .     . ID=enriched_region_1892
#> 1935  1.6691662      .     . ID=enriched_region_1893
#> 1936  0.5197590      .     . ID=enriched_region_1894
#> 1937  0.6508537      .     . ID=enriched_region_1895
#> 1938  0.7842411      .     . ID=enriched_region_1896
#> 1939  0.7614677      .     . ID=enriched_region_1897
#> 1940  0.7568782      .     . ID=enriched_region_1898
#> 1941  0.7587543      .     . ID=enriched_region_1899
#> 1942  1.5079580      .     . ID=enriched_region_1900
#> 1943  0.5418987      .     . ID=enriched_region_1901
#> 1944  0.7082026      .     . ID=enriched_region_1902
#> 1945  1.1123511      .     . ID=enriched_region_1903
#> 1946  0.7964092      .     . ID=enriched_region_1904
#> 1947  0.3686372      .     . ID=enriched_region_1905
#> 1948  0.7122849      .     . ID=enriched_region_1906
#> 1949  0.4500004      .     . ID=enriched_region_1907
#> 1950  0.4173923      .     . ID=enriched_region_1908
#> 1951  0.8805109      .     . ID=enriched_region_1909
#> 1952  0.7294963      .     . ID=enriched_region_1910
#> 1953  0.6347174      .     . ID=enriched_region_1911
#> 1954  0.4652241      .     . ID=enriched_region_1912
#> 1955  0.5404842      .     . ID=enriched_region_1913
#> 1956  0.8816454      .     . ID=enriched_region_1914
#> 1957  0.6310618      .     . ID=enriched_region_1915
#> 1958  0.5973984      .     . ID=enriched_region_1916
#> 1959  1.3347697      .     . ID=enriched_region_1917
#> 1960  0.7281706      .     . ID=enriched_region_1918
#> 1961  0.6892303      .     . ID=enriched_region_1919
#> 1962  0.5836386      .     . ID=enriched_region_1920
#> 1963  0.3981774      .     . ID=enriched_region_1921
#> 1964  0.9260949      .     . ID=enriched_region_1922
#> 1965  0.5021212      .     . ID=enriched_region_1923
#> 1966  1.9359984      .     . ID=enriched_region_1924
#> 1967  0.9172671      .     . ID=enriched_region_1925
#> 1968  1.0148937      .     . ID=enriched_region_1926
#> 1969  0.6092758      .     . ID=enriched_region_1927
#> 1970  0.7032049      .     . ID=enriched_region_1928
#> 1971  0.9699138      .     . ID=enriched_region_1929
#> 1972  1.1894818      .     . ID=enriched_region_1930
#> 1973  0.7916178      .     . ID=enriched_region_1931
#> 1974  0.7437044      .     . ID=enriched_region_1932
#> 1975  0.7603239      .     . ID=enriched_region_1933
#> 1976  0.4459002      .     . ID=enriched_region_1934
#> 1977  0.5574057      .     . ID=enriched_region_1935
#> 1978  0.5945735      .     . ID=enriched_region_1936
#> 1979  0.8495920      .     . ID=enriched_region_1937
#> 1980  0.5630091      .     . ID=enriched_region_1938
#> 1981  0.6890810      .     . ID=enriched_region_1939
#> 1982  0.5237034      .     . ID=enriched_region_1940
#> 1983  1.2611205      .     . ID=enriched_region_1941
#> 1984  0.8520296      .     . ID=enriched_region_1942
#> 1985  0.9270822      .     . ID=enriched_region_1943
#> 1986  1.3732131      .     . ID=enriched_region_1944
#> 1987  0.4923808      .     . ID=enriched_region_1945
#> 1988  0.9063812      .     . ID=enriched_region_1946
#> 1989  0.8324104      .     . ID=enriched_region_1947
#> 1990  0.8979593      .     . ID=enriched_region_1948
#> 1991  1.0971213      .     . ID=enriched_region_1949
#> 1992  0.4523448      .     . ID=enriched_region_1950
#> 1993  0.4713313      .     . ID=enriched_region_1951
#> 1994  0.5371210      .     . ID=enriched_region_1952
#> 1995  0.5537681      .     . ID=enriched_region_1953
#> 1996  0.9678708      .     . ID=enriched_region_1954
#> 1997  0.4529154      .     . ID=enriched_region_1955
#> 1998  0.5501990      .     . ID=enriched_region_1956
#> 1999  0.7340263      .     . ID=enriched_region_1957
#> 2000  0.6797527      .     . ID=enriched_region_1958
#> 2001  0.3819827      .     . ID=enriched_region_1959
#> 2002  0.7696040      .     . ID=enriched_region_1960
#> 2003  0.4308066      .     . ID=enriched_region_1961
#> 2004  0.7942704      .     . ID=enriched_region_1962
#> 2005  0.6887668      .     . ID=enriched_region_1963
#> 2006  0.4174009      .     . ID=enriched_region_1964
#> 2007  0.4017991      .     . ID=enriched_region_1965
#> 2008  0.6692434      .     . ID=enriched_region_1966
#> 2009  0.7866166      .     . ID=enriched_region_1967
#> 2010  0.5995324      .     . ID=enriched_region_1968
#> 2011  0.8394600      .     . ID=enriched_region_1969
#> 2012  0.3756578      .     . ID=enriched_region_1970
#> 2013  0.7310761      .     . ID=enriched_region_1971
#> 2014  0.5702629      .     . ID=enriched_region_1972
#> 2015  0.8948114      .     . ID=enriched_region_1973
#> 2016  0.3297727      .     . ID=enriched_region_1974
#> 2017  0.8436060      .     . ID=enriched_region_1975
#> 2018  0.5778317      .     . ID=enriched_region_1976
#> 2019  0.9127105      .     . ID=enriched_region_1977
#> 2020  0.6231843      .     . ID=enriched_region_1978
#> 2021  0.5109172      .     . ID=enriched_region_1979
#> 2022  0.4670717      .     . ID=enriched_region_1980
#> 2023  0.5261976      .     . ID=enriched_region_1981
#> 2024  0.4722239      .     . ID=enriched_region_1982
#> 2025  0.8272988      .     . ID=enriched_region_1983
#> 2026  1.0306571      .     . ID=enriched_region_1984
#> 2027  0.5278520      .     . ID=enriched_region_1985
#> 2028  0.8338620      .     . ID=enriched_region_1986
#> 2029  0.8587314      .     . ID=enriched_region_1987
#> 2030  0.4677663      .     . ID=enriched_region_1988
#> 2031  0.8264495      .     . ID=enriched_region_1989
#> 2032  0.5879008      .     . ID=enriched_region_1990
#> 2033  0.6251878      .     . ID=enriched_region_1991
#> 2034  0.5390339      .     . ID=enriched_region_1992
#> 2035  0.3557227      .     . ID=enriched_region_1993
#> 2036  0.9817580      .     . ID=enriched_region_1994
#> 2037  0.8473447      .     . ID=enriched_region_1995
#> 2038  1.0490512      .     . ID=enriched_region_1996
#> 2039  0.6422315      .     . ID=enriched_region_1997
#> 2040  0.6628898      .     . ID=enriched_region_1998
#> 2041  1.0708253      .     . ID=enriched_region_1999
#> 2042  1.0653997      .     . ID=enriched_region_2000
#> 2043  0.4760608      .     . ID=enriched_region_2001
#> 2044  1.0223266      .     . ID=enriched_region_2002
#> 2045  1.0700738      .     . ID=enriched_region_2003
#> 2046  0.9264217      .     . ID=enriched_region_2004
#> 2047  0.6918149      .     . ID=enriched_region_2005
#> 2048  0.6487174      .     . ID=enriched_region_2006
#> 2049  0.3878939      .     . ID=enriched_region_2007
#> 2050  0.5165688      .     . ID=enriched_region_2008
#> 2051  1.2106643      .     . ID=enriched_region_2009
#> 2052  0.8053823      .     . ID=enriched_region_2010
#> 2053  1.0468298      .     . ID=enriched_region_2011
#> 2054  0.4672452      .     . ID=enriched_region_2012
#> 2055  0.5381557      .     . ID=enriched_region_2013
#> 2056  0.6983799      .     . ID=enriched_region_2014
#> 2057  0.8845472      .     . ID=enriched_region_2015
#> 2058  0.8191257      .     . ID=enriched_region_2016
#> 2059  0.5371730      .     . ID=enriched_region_2017
#> 2060  0.9746866      .     . ID=enriched_region_2018
#> 2061  0.7042107      .     . ID=enriched_region_2019
#> 2062  0.8855753      .     . ID=enriched_region_2020
#> 2063  1.2639587      .     . ID=enriched_region_2021
#> 2064  0.5470706      .     . ID=enriched_region_2022
#> 2065  1.6844979      .     . ID=enriched_region_2023
#> 2066  0.5473526      .     . ID=enriched_region_2024
#> 2067  1.6976845      .     . ID=enriched_region_2025
#> 2068  0.7644675      .     . ID=enriched_region_2026
#> 2069  1.6880541      .     . ID=enriched_region_2027
#> 2070  0.8356345      .     . ID=enriched_region_2028
#> 2071  0.5589349      .     . ID=enriched_region_2029
#> 2072  0.5176958      .     . ID=enriched_region_2030
#> 2073  0.5983479      .     . ID=enriched_region_2031
#> 2074  0.8404664      .     . ID=enriched_region_2032
#> 2075  0.6514481      .     . ID=enriched_region_2033
#> 2076  0.4936360      .     . ID=enriched_region_2034
#> 2077  0.5279579      .     . ID=enriched_region_2035
#> 2078  0.8454948      .     . ID=enriched_region_2036
#> 2079  0.4513116      .     . ID=enriched_region_2037
#> 2080  0.6581054      .     . ID=enriched_region_2038
#> 2081  0.5334829      .     . ID=enriched_region_2039
#> 2082  0.4457530      .     . ID=enriched_region_2040
#> 2083  0.6724332      .     . ID=enriched_region_2041
#> 2084  0.4769922      .     . ID=enriched_region_2042
#> 2085  0.5049031      .     . ID=enriched_region_2043
#> 2086  0.7216891      .     . ID=enriched_region_2044
#> 2087  0.9214832      .     . ID=enriched_region_2045
#> 2088  0.7920445      .     . ID=enriched_region_2046
#> 2089  0.4462922      .     . ID=enriched_region_2047
#> 2090  0.4402783      .     . ID=enriched_region_2048
#> 2091  0.4950660      .     . ID=enriched_region_2049
#> 2092  0.6322320      .     . ID=enriched_region_2050
#> 2093  0.4565853      .     . ID=enriched_region_2051
#> 2094  0.6090357      .     . ID=enriched_region_2052
#> 2095  0.8188429      .     . ID=enriched_region_2053
#> 2096  1.0192104      .     . ID=enriched_region_2054
#> 2097  0.4786907      .     . ID=enriched_region_2055
#> 2098  2.3302024      .     . ID=enriched_region_2056
#> 2099  0.5013728      .     . ID=enriched_region_2057
#> 2100  0.5894241      .     . ID=enriched_region_2058
#> 2101  0.7879207      .     . ID=enriched_region_2059
#> 2102  0.6657699      .     . ID=enriched_region_2060
#> 2103  0.7870023      .     . ID=enriched_region_2061
#> 2104  0.3324183      .     . ID=enriched_region_2062
#> 2105  0.5885966      .     . ID=enriched_region_2063
#> 2106  0.6423401      .     . ID=enriched_region_2064
#> 2107  0.5155704      .     . ID=enriched_region_2065
#> 2108  2.6770214      .     . ID=enriched_region_2066
#> 2109  2.2829425      .     . ID=enriched_region_2067
#> 2110  0.4564513      .     . ID=enriched_region_2068
#> 2111  0.4711061      .     . ID=enriched_region_2069
#> 2112  0.4650502      .     . ID=enriched_region_2070
#> 2113  0.6190221      .     . ID=enriched_region_2071
#> 2114  0.3807223      .     . ID=enriched_region_2072
#> 2115  0.5304818      .     . ID=enriched_region_2073
#> 2116  0.6222728      .     . ID=enriched_region_2074
#> 2117  1.2741315      .     . ID=enriched_region_2075
#> 2118  0.8375457      .     . ID=enriched_region_2076
#> 2119  0.6307467      .     . ID=enriched_region_2077
#> 2120  0.4815402      .     . ID=enriched_region_2078
#> 2121  0.8013998      .     . ID=enriched_region_2079
#> 2122  0.4967347      .     . ID=enriched_region_2080
#> 2123  0.5645327      .     . ID=enriched_region_2081
#> 2124  0.9611649      .     . ID=enriched_region_2082
#> 2125  0.5982840      .     . ID=enriched_region_2083
#> 2126  0.6144543      .     . ID=enriched_region_2084
#> 2127  0.7057853      .     . ID=enriched_region_2085
#> 2128  1.1565213      .     . ID=enriched_region_2086
#> 2129  0.4815590      .     . ID=enriched_region_2087
#> 2130  0.4711878      .     . ID=enriched_region_2088
#> 2131  0.8868140      .     . ID=enriched_region_2089
#> 2132  0.8010553      .     . ID=enriched_region_2090
#> 2133  0.7300724      .     . ID=enriched_region_2091
#> 2134  0.5251740      .     . ID=enriched_region_2092
#> 2135  0.5686576      .     . ID=enriched_region_2093
#> 2136  0.7173173      .     . ID=enriched_region_2094
#> 2137  0.7690749      .     . ID=enriched_region_2095
#> 2138  0.5104027      .     . ID=enriched_region_2096
#> 2139  0.9518833      .     . ID=enriched_region_2097
#> 2140  0.6321468      .     . ID=enriched_region_2098
#> 2141  0.9158272      .     . ID=enriched_region_2099
#> 2142  1.1709468      .     . ID=enriched_region_2100
#> 2143  0.3966438      .     . ID=enriched_region_2101
#> 2144  1.0120731      .     . ID=enriched_region_2102
#> 2145  0.5068261      .     . ID=enriched_region_2103
#> 2146  0.8083854      .     . ID=enriched_region_2104
#> 2147  0.7125135      .     . ID=enriched_region_2105
#> 2148  0.6682318      .     . ID=enriched_region_2106
#> 2149  1.2222294      .     . ID=enriched_region_2107
#> 2150  0.6532443      .     . ID=enriched_region_2108
#> 2151  0.6898819      .     . ID=enriched_region_2109
#> 2152  0.8638934      .     . ID=enriched_region_2110
#> 2153  0.7947120      .     . ID=enriched_region_2111
#> 2154  0.5519074      .     . ID=enriched_region_2112
#> 2155  0.5297988      .     . ID=enriched_region_2113
#> 2156  1.0076546      .     . ID=enriched_region_2114
#> 2157  1.2136875      .     . ID=enriched_region_2115
#> 2158  0.7806340      .     . ID=enriched_region_2116
#> 2159  1.0689811      .     . ID=enriched_region_2117
#> 2160  0.9516953      .     . ID=enriched_region_2118
#> 2161  0.4790338      .     . ID=enriched_region_2119
#> 2162  0.7193288      .     . ID=enriched_region_2120
#> 2163  0.7149039      .     . ID=enriched_region_2121
#> 2164  0.7746854      .     . ID=enriched_region_2122
#> 2165  0.7653683      .     . ID=enriched_region_2123
#> 2166  0.4641172      .     . ID=enriched_region_2124
#> 2167  0.9012428      .     . ID=enriched_region_2125
#> 2168  1.2905615      .     . ID=enriched_region_2126
#> 2169  1.2505702      .     . ID=enriched_region_2127
#> 2170  0.4256523      .     . ID=enriched_region_2128
#> 2171  1.4090074      .     . ID=enriched_region_2129
#> 2172  0.4567303      .     . ID=enriched_region_2130
#> 2173  1.0324014      .     . ID=enriched_region_2131
#> 2174  1.0534488      .     . ID=enriched_region_2132
#> 2175  0.5438656      .     . ID=enriched_region_2133
#> 2176  0.5933857      .     . ID=enriched_region_2134
#> 2177  0.6547301      .     . ID=enriched_region_2135
#> 2178  1.0522336      .     . ID=enriched_region_2136
#> 2179  0.7962950      .     . ID=enriched_region_2137
#> 2180  0.5721850      .     . ID=enriched_region_2138
#> 2181  1.1986768      .     . ID=enriched_region_2139
#> 2182  1.2238502      .     . ID=enriched_region_2140
#> 2183  0.4708889      .     . ID=enriched_region_2141
#> 2184  0.5750434      .     . ID=enriched_region_2142
#> 2185  0.4153050      .     . ID=enriched_region_2143
#> 2186  0.6663324      .     . ID=enriched_region_2144
#> 2187  2.0519768      .     . ID=enriched_region_2145
#> 2188  0.4490359      .     . ID=enriched_region_2146
#> 2189  0.6975674      .     . ID=enriched_region_2147
#> 2190  1.9268531      .     . ID=enriched_region_2148
#> 2191  1.2502608      .     . ID=enriched_region_2149
#> 2192  1.0888532      .     . ID=enriched_region_2150
#> 2193  0.7532164      .     . ID=enriched_region_2151
#> 2194  1.2944887      .     . ID=enriched_region_2152
#> 2195  0.8507574      .     . ID=enriched_region_2153
#> 2196  0.8983329      .     . ID=enriched_region_2154
#> 2197  1.1514864      .     . ID=enriched_region_2155
#> 2198  0.8093535      .     . ID=enriched_region_2156
#> 2199  0.9858696      .     . ID=enriched_region_2157
#> 2200  0.9582921      .     . ID=enriched_region_2158
#> 2201  1.7331185      .     . ID=enriched_region_2159
#> 2202  0.8280644      .     . ID=enriched_region_2160
#> 2203  0.9443760      .     . ID=enriched_region_2161
#> 2204  2.1667589      .     . ID=enriched_region_2162
#> 2205  1.4576083      .     . ID=enriched_region_2163
#> 2206  0.3896419      .     . ID=enriched_region_2164
#> 2207  0.7612718      .     . ID=enriched_region_2165
#> 2208  0.5487354      .     . ID=enriched_region_2166
#> 2209  0.3829412      .     . ID=enriched_region_2167
#> 2210  0.7647734      .     . ID=enriched_region_2168
#> 2211  0.5584133      .     . ID=enriched_region_2169
#> 2212  0.7717292      .     . ID=enriched_region_2170
#> 2213  1.6774683      .     . ID=enriched_region_2171
#> 2214  0.6585957      .     . ID=enriched_region_2172
#> 2215  0.6585957      .     . ID=enriched_region_2173
#> 2216  1.0792224      .     . ID=enriched_region_2174
#> 2217  0.9279269      .     . ID=enriched_region_2175
#> 2218  0.6022108      .     . ID=enriched_region_2176
#> 2219  0.4384250      .     . ID=enriched_region_2177
#> 2220  0.8938365      .     . ID=enriched_region_2178
#> 2221  0.5837881      .     . ID=enriched_region_2179
#> 2222  0.5364818      .     . ID=enriched_region_2180
#> 2223  0.5083243      .     . ID=enriched_region_2181
#> 2224  1.0472980      .     . ID=enriched_region_2182
#> 2225  0.6182162      .     . ID=enriched_region_2183
#> 2226  0.4756765      .     . ID=enriched_region_2184
#> 2227  0.6039939      .     . ID=enriched_region_2185
#> 2228  0.7835549      .     . ID=enriched_region_2186
#> 2229  0.7216900      .     . ID=enriched_region_2187
#> 2230  0.7698859      .     . ID=enriched_region_2188
#> 2231  0.4770771      .     . ID=enriched_region_2189
#> 2232  0.9720761      .     . ID=enriched_region_2190
#> 2233  0.7963259      .     . ID=enriched_region_2191
#> 2234  1.1704884      .     . ID=enriched_region_2192
#> 2235  0.3552586      .     . ID=enriched_region_2193
#> 2236  0.9298084      .     . ID=enriched_region_2194
#> 2237  0.4400179      .     . ID=enriched_region_2195
#> 2238  1.0209330      .     . ID=enriched_region_2196
#> 2239  0.5654553      .     . ID=enriched_region_2197
#> 2240  0.9804815      .     . ID=enriched_region_2198
#> 2241  0.6327620      .     . ID=enriched_region_2199
#> 2242  0.5701829      .     . ID=enriched_region_2200
#> 2243  0.7514233      .     . ID=enriched_region_2201
#> 2244  1.2215665      .     . ID=enriched_region_2202
#> 2245  0.6719758      .     . ID=enriched_region_2203
#> 2246  0.7671589      .     . ID=enriched_region_2204
#> 2247  0.7205291      .     . ID=enriched_region_2205
#> 2248  0.6565280      .     . ID=enriched_region_2206
#> 2249  0.7568027      .     . ID=enriched_region_2207
#> 2250  0.9746476      .     . ID=enriched_region_2208
#> 2251  0.6866848      .     . ID=enriched_region_2209
#> 2252  0.7677903      .     . ID=enriched_region_2210
#> 2253  0.6766331      .     . ID=enriched_region_2211
#> 2254  0.5851547      .     . ID=enriched_region_2212
#> 2255  0.4188910      .     . ID=enriched_region_2213
#> 2256  0.9085064      .     . ID=enriched_region_2214
#> 2257  0.8439555      .     . ID=enriched_region_2215
#> 2258  0.3973941      .     . ID=enriched_region_2216
#> 2259  0.3516592      .     . ID=enriched_region_2217
#> 2260  0.8658352      .     . ID=enriched_region_2218
#> 2261  0.8126187      .     . ID=enriched_region_2219
#> 2262  0.5192839      .     . ID=enriched_region_2220
#> 2263  0.4709458      .     . ID=enriched_region_2221
#> 2264  0.6345429      .     . ID=enriched_region_2222
#> 2265  0.3795902      .     . ID=enriched_region_2223
#> 2266  0.7479212      .     . ID=enriched_region_2224
#> 2267  1.2227504      .     . ID=enriched_region_2225
#> 2268  1.1273849      .     . ID=enriched_region_2226
#> 2269  0.6681484      .     . ID=enriched_region_2227
#> 2270  0.6000479      .     . ID=enriched_region_2228
#> 2271  0.6874367      .     . ID=enriched_region_2229
#> 2272  0.6971172      .     . ID=enriched_region_2230
#> 2273  0.8475654      .     . ID=enriched_region_2231
#> 2274  0.4453167      .     . ID=enriched_region_2232
#> 2275  0.8983178      .     . ID=enriched_region_2233
#> 2276  0.6551837      .     . ID=enriched_region_2234
#> 2277  0.9146653      .     . ID=enriched_region_2235
#> 2278  0.4302506      .     . ID=enriched_region_2236
#> 2279  0.9642388      .     . ID=enriched_region_2237
#> 2280  1.1442324      .     . ID=enriched_region_2238
#> 2281  0.3957636      .     . ID=enriched_region_2239
#> 2282  0.4622845      .     . ID=enriched_region_2240
#> 2283  0.6722623      .     . ID=enriched_region_2241
#> 2284  0.4177682      .     . ID=enriched_region_2242
#> 2285  0.4954850      .     . ID=enriched_region_2243
#> 2286  0.6819078      .     . ID=enriched_region_2244
#> 2287  1.7311087      .     . ID=enriched_region_2245
#> 2288  0.4249203      .     . ID=enriched_region_2246
#> 2289  0.5387249      .     . ID=enriched_region_2247
#> 2290  1.4629180      .     . ID=enriched_region_2248
#> 2291  0.6027865      .     . ID=enriched_region_2249
#> 2292  0.6629520      .     . ID=enriched_region_2250
#> 2293  0.8637116      .     . ID=enriched_region_2251
#> 2294  0.5172718      .     . ID=enriched_region_2252
#> 2295  0.6818931      .     . ID=enriched_region_2253
#> 2296  0.4753600      .     . ID=enriched_region_2254
#> 2297  0.7972700      .     . ID=enriched_region_2255
#> 2298  0.6695600      .     . ID=enriched_region_2256
#> 2299  1.4828513      .     . ID=enriched_region_2257
#> 2300  0.3878094      .     . ID=enriched_region_2258
#> 2301  0.4441793      .     . ID=enriched_region_2259
#> 2302  0.6599471      .     . ID=enriched_region_2260
#> 2303  0.5424815      .     . ID=enriched_region_2261
#> 2304  1.2223641      .     . ID=enriched_region_2262
#> 2305  0.9172807      .     . ID=enriched_region_2263
#> 2306  0.6982166      .     . ID=enriched_region_2264
#> 2307  0.9608984      .     . ID=enriched_region_2265
#> 2308  0.4963528      .     . ID=enriched_region_2266
#> 2309  1.0152565      .     . ID=enriched_region_2267
#> 2310  0.4489637      .     . ID=enriched_region_2268
#> 2311  0.4571448      .     . ID=enriched_region_2269
#> 2312  0.5702616      .     . ID=enriched_region_2270
#> 2313  0.5118213      .     . ID=enriched_region_2271
#> 2314  0.6300076      .     . ID=enriched_region_2272
#> 2315  0.5535832      .     . ID=enriched_region_2273
#> 2316  0.7734082      .     . ID=enriched_region_2274
#> 2317  0.6946111      .     . ID=enriched_region_2275
#> 2318  0.5427645      .     . ID=enriched_region_2276
#> 2319  1.0673414      .     . ID=enriched_region_2277
#> 2320  1.0212498      .     . ID=enriched_region_2278
#> 2321  1.0552677      .     . ID=enriched_region_2279
#> 2322  1.5076068      .     . ID=enriched_region_2280
#> 2323  0.9511551      .     . ID=enriched_region_2281
#> 2324  0.6590950      .     . ID=enriched_region_2282
#> 2325  0.4463376      .     . ID=enriched_region_2283
#> 2326  1.0333694      .     . ID=enriched_region_2284
#> 2327  0.6320443      .     . ID=enriched_region_2285
#> 2328  0.8305302      .     . ID=enriched_region_2286
#> 2329  0.4638427      .     . ID=enriched_region_2287
#> 2330  0.6916669      .     . ID=enriched_region_2288
#> 2331  0.4732952      .     . ID=enriched_region_2289
#> 2332  0.7363923      .     . ID=enriched_region_2290
#> 2333  0.9901502      .     . ID=enriched_region_2291
#> 2334  0.6815584      .     . ID=enriched_region_2292
#> 2335  0.5878098      .     . ID=enriched_region_2293
#> 2336  0.9689853      .     . ID=enriched_region_2294
#> 2337  0.5358783      .     . ID=enriched_region_2295
#> 2338  1.0306420      .     . ID=enriched_region_2296
#> 2339  0.6353326      .     . ID=enriched_region_2297
#> 2340  0.9242628      .     . ID=enriched_region_2298
#> 2341  0.6339195      .     . ID=enriched_region_2299
#> 2342  1.2909264      .     . ID=enriched_region_2300
#> 2343  1.0817567      .     . ID=enriched_region_2301
#> 2344  1.0269362      .     . ID=enriched_region_2302
#> 2345  0.7339361      .     . ID=enriched_region_2303
#> 2346  0.9023323      .     . ID=enriched_region_2304
#> 2347  0.8821035      .     . ID=enriched_region_2305
#> 2348  0.9127229      .     . ID=enriched_region_2306
#> 2349  1.1999593      .     . ID=enriched_region_2307
#> 2350  0.5092709      .     . ID=enriched_region_2308
#> 2351  0.6464856      .     . ID=enriched_region_2309
#> 2352  0.7828310      .     . ID=enriched_region_2310
#> 2353  0.6707931      .     . ID=enriched_region_2311
#> 2354  1.1411585      .     . ID=enriched_region_2312
#> 2355  1.2558085      .     . ID=enriched_region_2313
#> 2356  0.6849017      .     . ID=enriched_region_2314
#> 2357  0.6415613      .     . ID=enriched_region_2315
#> 2358  0.6202790      .     . ID=enriched_region_2316
#> 2359  0.6221025      .     . ID=enriched_region_2317
#> 2360  0.4052910      .     . ID=enriched_region_2318
#> 2361  1.5629140      .     . ID=enriched_region_2319
#> 2362  0.4550814      .     . ID=enriched_region_2320
#> 2363  0.4501218      .     . ID=enriched_region_2321
#> 2364  0.4745638      .     . ID=enriched_region_2322
#> 2365  0.6327288      .     . ID=enriched_region_2323
#> 2366  0.5949645      .     . ID=enriched_region_2324
#> 2367  0.6268199      .     . ID=enriched_region_2325
#> 2368  0.6546532      .     . ID=enriched_region_2326
#> 2369  0.7481567      .     . ID=enriched_region_2327
#> 2370  0.6924459      .     . ID=enriched_region_2328
#> 2371  1.1022606      .     . ID=enriched_region_2329
#> 2372  1.3457885      .     . ID=enriched_region_2330
#> 2373  0.7542763      .     . ID=enriched_region_2331
#> 2374  0.6661632      .     . ID=enriched_region_2332
#> 2375  0.8614085      .     . ID=enriched_region_2333
#> 2376  0.8394411      .     . ID=enriched_region_2334
#> 2377  0.9000697      .     . ID=enriched_region_2335
#> 2378  0.8208868      .     . ID=enriched_region_2336
#> 2379  0.4113310      .     . ID=enriched_region_2337
#> 2380  0.7377065      .     . ID=enriched_region_2338
#> 2381  0.8751800      .     . ID=enriched_region_2339
#> 2382  0.9741162      .     . ID=enriched_region_2340
#> 2383  0.6017468      .     . ID=enriched_region_2341
#> 2384  0.6722399      .     . ID=enriched_region_2342
#> 2385  0.7649160      .     . ID=enriched_region_2343
#> 2386  0.9894830      .     . ID=enriched_region_2344
#> 2387  0.5657087      .     . ID=enriched_region_2345
#> 2388  0.5274620      .     . ID=enriched_region_2346
#> 2389  0.8125584      .     . ID=enriched_region_2347
#> 2390  0.7555850      .     . ID=enriched_region_2348
#> 2391  0.5278569      .     . ID=enriched_region_2349
#> 2392  0.5011410      .     . ID=enriched_region_2350
#> 2393  0.6234277      .     . ID=enriched_region_2351
#> 2394  0.7212837      .     . ID=enriched_region_2352
#> 2395  0.4866249      .     . ID=enriched_region_2353
#> 2396  0.7145957      .     . ID=enriched_region_2354
#> 2397  1.2175170      .     . ID=enriched_region_2355
#> 2398  0.5102893      .     . ID=enriched_region_2356
#> 2399  0.8750302      .     . ID=enriched_region_2357
#> 2400  0.5728159      .     . ID=enriched_region_2358
#> 2401  0.5736253      .     . ID=enriched_region_2359
#> 2402  0.6625224      .     . ID=enriched_region_2360
#> 2403  0.6782546      .     . ID=enriched_region_2361
#> 2404  0.6824482      .     . ID=enriched_region_2362
#> 2405  1.1363828      .     . ID=enriched_region_2363
#> 2406  1.0004181      .     . ID=enriched_region_2364
#> 2407  0.4164772      .     . ID=enriched_region_2365
#> 2408  1.3788353      .     . ID=enriched_region_2366
#> 2409  0.8770009      .     . ID=enriched_region_2367
#> 2410  0.6170298      .     . ID=enriched_region_2368
#> 2411  0.9317224      .     . ID=enriched_region_2369
#> 2412  0.6618423      .     . ID=enriched_region_2370
#> 2413  0.5444533      .     . ID=enriched_region_2371
#> 2414  0.4440000      .     . ID=enriched_region_2372
#> 2415  0.4420689      .     . ID=enriched_region_2373
#> 2416  0.7412094      .     . ID=enriched_region_2374
#> 2417  0.4913696      .     . ID=enriched_region_2375
#> 2418  0.4271139      .     . ID=enriched_region_2376
#> 2419  0.4902530      .     . ID=enriched_region_2377
#> 2420 -0.4773597      .     .   ID=depleted_region_43
#> 2421 -0.4476067      .     .   ID=depleted_region_44
#> 2422 -0.4956980      .     .   ID=depleted_region_45
#> 2423 -0.5890201      .     .   ID=depleted_region_46
#> 2424 -0.3691232      .     .   ID=depleted_region_47
#> 2425 -0.5352312      .     .   ID=depleted_region_48
#> 2426 -0.4343416      .     .   ID=depleted_region_49
#> 2427 -0.6060315      .     .   ID=depleted_region_50
#> 2428 -0.5936706      .     .   ID=depleted_region_51
#> 2429 -0.5329180      .     .   ID=depleted_region_52
#> 2430 -0.5119259      .     .   ID=depleted_region_53
#> 2431 -0.4593416      .     .   ID=depleted_region_54
#> 2432 -0.3989449      .     .   ID=depleted_region_55
#> 2433 -0.4810646      .     .   ID=depleted_region_56
#> 2434 -0.4382727      .     .   ID=depleted_region_57
#> 2435 -0.4712767      .     .   ID=depleted_region_58
#> 2436 -0.6760852      .     .   ID=depleted_region_59
#> 2437 -0.4381898      .     .   ID=depleted_region_60
#> 2438 -0.7596602      .     .   ID=depleted_region_61
#> 2439 -0.4871105      .     .   ID=depleted_region_62
#> 2440  0.4169380      .     . ID=enriched_region_2378
#> 2441  0.5664827      .     . ID=enriched_region_2379
#> 2442  1.0445548      .     . ID=enriched_region_2380
#> 2443  0.9681352      .     . ID=enriched_region_2381
#> 2444  0.5573334      .     . ID=enriched_region_2382
#> 2445  0.5972769      .     . ID=enriched_region_2383
#> 2446  0.4687905      .     . ID=enriched_region_2384
#> 2447  0.9868059      .     . ID=enriched_region_2385
#> 2448  0.4241415      .     . ID=enriched_region_2386
#> 2449  0.5553777      .     . ID=enriched_region_2387
#> 2450  0.7218441      .     . ID=enriched_region_2388
#> 2451  0.6777317      .     . ID=enriched_region_2389
#> 2452  0.7620218      .     . ID=enriched_region_2390
#> 2453  0.8524845      .     . ID=enriched_region_2391
#> 2454  0.4774372      .     . ID=enriched_region_2392
#> 2455  0.6456892      .     . ID=enriched_region_2393
#> 2456  0.7488081      .     . ID=enriched_region_2394
#> 2457  0.5279643      .     . ID=enriched_region_2395
#> 2458  0.6132954      .     . ID=enriched_region_2396
#> 2459  0.7846005      .     . ID=enriched_region_2397
#> 2460  0.4311106      .     . ID=enriched_region_2398
#> 2461  0.9644426      .     . ID=enriched_region_2399
#> 2462  0.4718638      .     . ID=enriched_region_2400
#> 2463  0.7567610      .     . ID=enriched_region_2401
#> 2464  0.6173133      .     . ID=enriched_region_2402
#> 2465  0.5266146      .     . ID=enriched_region_2403
#> 2466  0.4299857      .     . ID=enriched_region_2404
#> 2467  0.6606919      .     . ID=enriched_region_2405
#> 2468  0.5910817      .     . ID=enriched_region_2406
#> 2469  0.6096385      .     . ID=enriched_region_2407
#> 2470  0.6065176      .     . ID=enriched_region_2408
#> 2471  0.4441781      .     . ID=enriched_region_2409
#> 2472  0.5479805      .     . ID=enriched_region_2410
#> 2473  0.7195121      .     . ID=enriched_region_2411
#> 2474  0.6255444      .     . ID=enriched_region_2412
#> 2475  0.8777645      .     . ID=enriched_region_2413
#> 2476  0.5419068      .     . ID=enriched_region_2414
#> 2477  0.4714527      .     . ID=enriched_region_2415
#> 2478  0.7037150      .     . ID=enriched_region_2416
#> 2479  0.6149506      .     . ID=enriched_region_2417
#> 2480  0.5833092      .     . ID=enriched_region_2418
#> 2481  1.0374719      .     . ID=enriched_region_2419
#> 2482  0.4799849      .     . ID=enriched_region_2420
#> 2483  0.7361878      .     . ID=enriched_region_2421
#> 2484  0.7109950      .     . ID=enriched_region_2422
#> 2485  0.5548839      .     . ID=enriched_region_2423
#> 2486  0.5939849      .     . ID=enriched_region_2424
#> 2487  0.5581691      .     . ID=enriched_region_2425
#> 2488  0.5431795      .     . ID=enriched_region_2426
#> 2489  0.5898290      .     . ID=enriched_region_2427
#> 2490  0.8785800      .     . ID=enriched_region_2428
#> 2491  0.6743759      .     . ID=enriched_region_2429
#> 2492  1.6147647      .     . ID=enriched_region_2430
#> 2493  0.5202215      .     . ID=enriched_region_2431
#> 2494  0.6911405      .     . ID=enriched_region_2432
#> 2495  0.4371011      .     . ID=enriched_region_2433
#> 2496  0.6375736      .     . ID=enriched_region_2434
#> 2497  0.4877384      .     . ID=enriched_region_2435
#> 2498  0.6782528      .     . ID=enriched_region_2436
#> 2499  0.5381382      .     . ID=enriched_region_2437
#> 2500  0.6441313      .     . ID=enriched_region_2438
#> 2501  0.4250300      .     . ID=enriched_region_2439
#> 2502  1.0294504      .     . ID=enriched_region_2440
#> 2503  0.5688104      .     . ID=enriched_region_2441
#> 2504  0.7290574      .     . ID=enriched_region_2442
#> 2505  0.5016483      .     . ID=enriched_region_2443
#> 2506  0.5204671      .     . ID=enriched_region_2444
#> 2507  0.5244198      .     . ID=enriched_region_2445
#> 2508  0.6726325      .     . ID=enriched_region_2446
#> 2509  0.5848828      .     . ID=enriched_region_2447
#> 2510  0.7710816      .     . ID=enriched_region_2448
#> 2511  0.5502484      .     . ID=enriched_region_2449
#> 2512  0.8467939      .     . ID=enriched_region_2450
#> 2513  0.7723299      .     . ID=enriched_region_2451
#> 2514  0.5672175      .     . ID=enriched_region_2452
#> 2515  0.5769779      .     . ID=enriched_region_2453
#> 2516  0.6809694      .     . ID=enriched_region_2454
#> 2517  0.3637604      .     . ID=enriched_region_2455
#> 2518  0.6860032      .     . ID=enriched_region_2456
#> 2519  0.4444245      .     . ID=enriched_region_2457
#> 2520  0.4288390      .     . ID=enriched_region_2458
#> 2521  0.6950079      .     . ID=enriched_region_2459
#> 2522  0.4758059      .     . ID=enriched_region_2460
#> 2523  0.6147979      .     . ID=enriched_region_2461
#> 2524  0.4675822      .     . ID=enriched_region_2462
#> 2525  0.5774060      .     . ID=enriched_region_2463
#> 2526  0.6172557      .     . ID=enriched_region_2464
#> 2527  0.5982600      .     . ID=enriched_region_2465
#> 2528  0.4992561      .     . ID=enriched_region_2466
#> 2529  0.5284140      .     . ID=enriched_region_2467
#> 2530  0.6088522      .     . ID=enriched_region_2468
#> 2531  0.6157180      .     . ID=enriched_region_2469
#> 2532  0.4401459      .     . ID=enriched_region_2470
#> 2533  0.7229171      .     . ID=enriched_region_2471
#> 2534  0.9307652      .     . ID=enriched_region_2472
#> 2535  0.7910244      .     . ID=enriched_region_2473
#> 2536  0.6542268      .     . ID=enriched_region_2474
#> 2537  0.7798375      .     . ID=enriched_region_2475
#> 2538  0.4640068      .     . ID=enriched_region_2476
#> 2539  0.7400546      .     . ID=enriched_region_2477
#> 2540  0.5208397      .     . ID=enriched_region_2478
#> 2541  0.4660759      .     . ID=enriched_region_2479
#> 2542  0.5941094      .     . ID=enriched_region_2480
#> 2543  0.7516163      .     . ID=enriched_region_2481
#> 2544  0.9597034      .     . ID=enriched_region_2482
#> 2545  0.5760736      .     . ID=enriched_region_2483
#> 2546  0.7036600      .     . ID=enriched_region_2484
#> 2547  0.9566723      .     . ID=enriched_region_2485
#> 2548  0.7836989      .     . ID=enriched_region_2486
#> 2549  0.5269773      .     . ID=enriched_region_2487
#> 2550  0.4422125      .     . ID=enriched_region_2488
#> 2551  0.4739693      .     . ID=enriched_region_2489
#> 2552  0.5235146      .     . ID=enriched_region_2490
#> 2553  0.4786455      .     . ID=enriched_region_2491
#> 2554  0.9139456      .     . ID=enriched_region_2492
#> 2555  0.8570468      .     . ID=enriched_region_2493
#> 2556  0.3909396      .     . ID=enriched_region_2494
#> 2557  0.7593765      .     . ID=enriched_region_2495
#> 2558  0.6783479      .     . ID=enriched_region_2496
#> 2559  0.3902688      .     . ID=enriched_region_2497
#> 2560  0.8137552      .     . ID=enriched_region_2498
#> 2561  0.7179117      .     . ID=enriched_region_2499
#> 2562  0.6025793      .     . ID=enriched_region_2500
#> 2563  0.6772408      .     . ID=enriched_region_2501
#> 2564  0.8450303      .     . ID=enriched_region_2502
#> 2565  0.6597924      .     . ID=enriched_region_2503
#> 2566  0.7021082      .     . ID=enriched_region_2504
#> 2567  0.5460236      .     . ID=enriched_region_2505
#> 2568  1.8692018      .     . ID=enriched_region_2506
#> 2569  0.6309975      .     . ID=enriched_region_2507
#> 2570  0.5037300      .     . ID=enriched_region_2508
#> 2571  0.5379897      .     . ID=enriched_region_2509
#> 2572  0.3826835      .     . ID=enriched_region_2510
#> 2573  0.5797002      .     . ID=enriched_region_2511
#> 2574  0.9839240      .     . ID=enriched_region_2512
#> 2575  1.0768736      .     . ID=enriched_region_2513
#> 2576  0.7419997      .     . ID=enriched_region_2514
#> 2577  0.5558911      .     . ID=enriched_region_2515
#> 2578  0.6207588      .     . ID=enriched_region_2516
#> 2579  0.7010677      .     . ID=enriched_region_2517
#> 2580  0.7014374      .     . ID=enriched_region_2518
#> 2581  0.9680063      .     . ID=enriched_region_2519
#> 2582  0.6932207      .     . ID=enriched_region_2520
#> 2583  0.5906442      .     . ID=enriched_region_2521
#> 2584  0.7866231      .     . ID=enriched_region_2522
#> 2585  0.8668420      .     . ID=enriched_region_2523
#> 2586  0.5966627      .     . ID=enriched_region_2524
#> 2587  0.8077841      .     . ID=enriched_region_2525
#> 2588  0.8232696      .     . ID=enriched_region_2526
#> 2589  0.8233016      .     . ID=enriched_region_2527
#> 2590  0.8053375      .     . ID=enriched_region_2528
#> 2591  1.0952353      .     . ID=enriched_region_2529
#> 2592  0.4109528      .     . ID=enriched_region_2530
#> 2593  0.6964190      .     . ID=enriched_region_2531
#> 2594  0.6070802      .     . ID=enriched_region_2532
#> 2595  0.4105253      .     . ID=enriched_region_2533
#> 2596  0.6994507      .     . ID=enriched_region_2534
#> 2597  0.6580182      .     . ID=enriched_region_2535
#> 2598  0.4849168      .     . ID=enriched_region_2536
#> 2599  0.5146619      .     . ID=enriched_region_2537
#> 2600  0.8317721      .     . ID=enriched_region_2538
#> 2601  0.7939547      .     . ID=enriched_region_2539
#> 2602  0.6414516      .     . ID=enriched_region_2540
#> 2603  0.8040100      .     . ID=enriched_region_2541
#> 2604  0.5347453      .     . ID=enriched_region_2542
#> 2605  0.5425736      .     . ID=enriched_region_2543
#> 2606  0.4890606      .     . ID=enriched_region_2544
#> 2607  0.6288333      .     . ID=enriched_region_2545
#> 2608  0.4056771      .     . ID=enriched_region_2546
#> 2609  0.7329749      .     . ID=enriched_region_2547
#> 2610  0.4739803      .     . ID=enriched_region_2548
#> 2611  0.3776685      .     . ID=enriched_region_2549
#> 2612  0.4652896      .     . ID=enriched_region_2550
#> 2613  0.6080859      .     . ID=enriched_region_2551
#> 2614  0.5868771      .     . ID=enriched_region_2552
#> 2615  0.4593540      .     . ID=enriched_region_2553
#> 2616  0.8177331      .     . ID=enriched_region_2554
#> 2617  0.4798502      .     . ID=enriched_region_2555
#> 2618  0.5493829      .     . ID=enriched_region_2556
#> 2619  0.8629207      .     . ID=enriched_region_2557
#> 2620  0.8572823      .     . ID=enriched_region_2558
#> 2621  0.7716354      .     . ID=enriched_region_2559
#> 2622  0.9062331      .     . ID=enriched_region_2560
#> 2623  0.3729154      .     . ID=enriched_region_2561
#> 2624  0.6341761      .     . ID=enriched_region_2562
#> 2625  1.1013814      .     . ID=enriched_region_2563
#> 2626  0.6118114      .     . ID=enriched_region_2564
#> 2627  0.6559213      .     . ID=enriched_region_2565
#> 2628  0.6871016      .     . ID=enriched_region_2566
#> 2629  0.5056148      .     . ID=enriched_region_2567
#> 2630  0.6543697      .     . ID=enriched_region_2568
#> 2631  0.8539663      .     . ID=enriched_region_2569
#> 2632  0.7250941      .     . ID=enriched_region_2570
#> 2633  0.3496043      .     . ID=enriched_region_2571
#> 2634  0.7874051      .     . ID=enriched_region_2572
#> 2635  0.8690869      .     . ID=enriched_region_2573
#> 2636  0.6697426      .     . ID=enriched_region_2574
#> 2637  0.7593239      .     . ID=enriched_region_2575
#> 2638  0.3996213      .     . ID=enriched_region_2576
#> 2639  0.6339176      .     . ID=enriched_region_2577
#> 2640  0.6237387      .     . ID=enriched_region_2578
#> 2641  0.8185550      .     . ID=enriched_region_2579
#> 2642  0.8046870      .     . ID=enriched_region_2580
#> 2643  0.8384888      .     . ID=enriched_region_2581
#> 2644  0.7592443      .     . ID=enriched_region_2582
#> 2645  0.5110388      .     . ID=enriched_region_2583
#> 2646  0.5510691      .     . ID=enriched_region_2584
#> 2647  0.6244404      .     . ID=enriched_region_2585
#> 2648  0.8597530      .     . ID=enriched_region_2586
#> 2649  0.5471026      .     . ID=enriched_region_2587
#> 2650  0.5634679      .     . ID=enriched_region_2588
#> 2651  0.5256912      .     . ID=enriched_region_2589
#> 2652  0.7785198      .     . ID=enriched_region_2590
#> 2653  0.3438027      .     . ID=enriched_region_2591
#> 2654  0.6123615      .     . ID=enriched_region_2592
#> 2655  0.5520918      .     . ID=enriched_region_2593
#> 2656  0.6734813      .     . ID=enriched_region_2594
#> 2657  0.5597514      .     . ID=enriched_region_2595
#> 2658  0.7543122      .     . ID=enriched_region_2596
#> 2659  0.4185539      .     . ID=enriched_region_2597
#> 2660  0.6400433      .     . ID=enriched_region_2598
#> 2661  0.6851062      .     . ID=enriched_region_2599
#> 2662  0.5365330      .     . ID=enriched_region_2600
#> 2663  0.5528427      .     . ID=enriched_region_2601
#> 2664  0.3397805      .     . ID=enriched_region_2602
#> 2665  0.3713141      .     . ID=enriched_region_2603
#> 2666  0.5443630      .     . ID=enriched_region_2604
#> 2667  0.8565330      .     . ID=enriched_region_2605
#> 2668  0.8002542      .     . ID=enriched_region_2606
#> 2669  0.5218790      .     . ID=enriched_region_2607
#> 2670  0.8349431      .     . ID=enriched_region_2608
#> 2671  0.8331873      .     . ID=enriched_region_2609
#> 2672  0.5910160      .     . ID=enriched_region_2610
#> 2673  0.5044548      .     . ID=enriched_region_2611
#> 2674  0.7139656      .     . ID=enriched_region_2612
#> 2675  0.5732422      .     . ID=enriched_region_2613
#> 2676  0.7136743      .     . ID=enriched_region_2614
#> 2677  0.7085647      .     . ID=enriched_region_2615
#> 2678  0.8163067      .     . ID=enriched_region_2616
#> 2679  0.5835368      .     . ID=enriched_region_2617
#> 2680  0.7526155      .     . ID=enriched_region_2618
#> 2681  0.5927312      .     . ID=enriched_region_2619
#> 2682  0.5478448      .     . ID=enriched_region_2620
#> 2683  0.9698039      .     . ID=enriched_region_2621
#> 2684  0.7143012      .     . ID=enriched_region_2622
#> 2685  0.7912425      .     . ID=enriched_region_2623
#> 2686  0.8288935      .     . ID=enriched_region_2624
#> 2687  0.7646232      .     . ID=enriched_region_2625
#> 2688  0.6459428      .     . ID=enriched_region_2626
#> 2689  0.5295994      .     . ID=enriched_region_2627
#> 2690  0.4121911      .     . ID=enriched_region_2628
#> 2691  0.4485269      .     . ID=enriched_region_2629
#> 2692  0.8358222      .     . ID=enriched_region_2630
#> 2693  0.7008847      .     . ID=enriched_region_2631
#> 2694  0.7706958      .     . ID=enriched_region_2632
#> 2695  0.6161416      .     . ID=enriched_region_2633
#> 2696  0.5840229      .     . ID=enriched_region_2634
#> 2697  0.7025675      .     . ID=enriched_region_2635
#> 2698  0.9172462      .     . ID=enriched_region_2636
#> 2699  0.7577256      .     . ID=enriched_region_2637
#> 2700  0.6152264      .     . ID=enriched_region_2638
#> 2701  0.6791233      .     . ID=enriched_region_2639
#> 2702  0.5255605      .     . ID=enriched_region_2640
#> 2703  0.5685464      .     . ID=enriched_region_2641
#> 2704  0.5701151      .     . ID=enriched_region_2642
#> 2705  0.6475100      .     . ID=enriched_region_2643
#> 2706  0.6113391      .     . ID=enriched_region_2644
#> 2707  0.7723135      .     . ID=enriched_region_2645
#> 2708  0.6457666      .     . ID=enriched_region_2646
#> 2709  0.3991650      .     . ID=enriched_region_2647
#> 2710  0.4366208      .     . ID=enriched_region_2648
#> 2711  0.6829324      .     . ID=enriched_region_2649
#> 2712  0.4037789      .     . ID=enriched_region_2650
#> 2713  0.6808661      .     . ID=enriched_region_2651
#> 2714  0.6118321      .     . ID=enriched_region_2652
#> 2715  0.9959254      .     . ID=enriched_region_2653
#> 2716  0.5462663      .     . ID=enriched_region_2654
#> 2717  0.5611174      .     . ID=enriched_region_2655
#> 2718  0.9478795      .     . ID=enriched_region_2656
#> 2719  0.6263052      .     . ID=enriched_region_2657
#> 2720  0.7287490      .     . ID=enriched_region_2658
#> 2721  0.7762253      .     . ID=enriched_region_2659
#> 2722  0.6245619      .     . ID=enriched_region_2660
#> 2723  0.9334790      .     . ID=enriched_region_2661
#> 2724  0.5326270      .     . ID=enriched_region_2662
#> 2725  0.7433027      .     . ID=enriched_region_2663
#> 2726  0.4990570      .     . ID=enriched_region_2664
#> 2727  0.6246847      .     . ID=enriched_region_2665
#> 2728  0.4069535      .     . ID=enriched_region_2666
#> 2729  0.4532822      .     . ID=enriched_region_2667
#> 2730  0.7905794      .     . ID=enriched_region_2668
#> 2731  0.6047726      .     . ID=enriched_region_2669
#> 2732  0.5476662      .     . ID=enriched_region_2670
#> 2733  0.9471473      .     . ID=enriched_region_2671
#> 2734  0.5347442      .     . ID=enriched_region_2672
#> 2735  0.8078804      .     . ID=enriched_region_2673
#> 2736  0.3792830      .     . ID=enriched_region_2674
#> 2737  0.6719835      .     . ID=enriched_region_2675
#> 2738  0.5463033      .     . ID=enriched_region_2676
#> 2739  0.8188755      .     . ID=enriched_region_2677
#> 2740  0.8187890      .     . ID=enriched_region_2678
#> 2741  0.8004687      .     . ID=enriched_region_2679
#> 2742  0.5955145      .     . ID=enriched_region_2680
#> 2743  0.7573386      .     . ID=enriched_region_2681
#> 2744  0.4110806      .     . ID=enriched_region_2682
#> 2745  0.6663343      .     . ID=enriched_region_2683
#> 2746  1.4774620      .     . ID=enriched_region_2684
#> 2747  0.8130433      .     . ID=enriched_region_2685
#> 2748  0.5828635      .     . ID=enriched_region_2686
#> 2749  1.4971442      .     . ID=enriched_region_2687
#> 2750  0.9057195      .     . ID=enriched_region_2688
#> 2751  0.8840282      .     . ID=enriched_region_2689
#> 2752  0.7961650      .     . ID=enriched_region_2690
#> 2753  0.5754745      .     . ID=enriched_region_2691
#> 2754  0.6048964      .     . ID=enriched_region_2692
#> 2755  0.5802748      .     . ID=enriched_region_2693
#> 2756  0.4976162      .     . ID=enriched_region_2694
#> 2757  0.5451196      .     . ID=enriched_region_2695
#> 2758  0.7976072      .     . ID=enriched_region_2696
#> 2759  0.4743002      .     . ID=enriched_region_2697
#> 2760  0.4695707      .     . ID=enriched_region_2698
#> 2761  1.2999276      .     . ID=enriched_region_2699
#> 2762  0.4312594      .     . ID=enriched_region_2700
#> 2763  0.5464842      .     . ID=enriched_region_2701
#> 2764  0.6779610      .     . ID=enriched_region_2702
#> 2765  0.5115413      .     . ID=enriched_region_2703
#> 2766  0.9384645      .     . ID=enriched_region_2704
#> 2767  0.6040066      .     . ID=enriched_region_2705
#> 2768  0.6492999      .     . ID=enriched_region_2706
#> 2769  0.5573556      .     . ID=enriched_region_2707
#> 2770  0.7304695      .     . ID=enriched_region_2708
#> 2771  0.6940282      .     . ID=enriched_region_2709
#> 2772  0.8130076      .     . ID=enriched_region_2710
#> 2773  0.8499287      .     . ID=enriched_region_2711
#> 2774  0.3748516      .     . ID=enriched_region_2712
#> 2775  0.5180331      .     . ID=enriched_region_2713
#> 2776  0.8407866      .     . ID=enriched_region_2714
#> 2777  1.2945088      .     . ID=enriched_region_2715
#> 2778  0.3971849      .     . ID=enriched_region_2716
#> 2779  0.8098147      .     . ID=enriched_region_2717
#> 2780  0.5103063      .     . ID=enriched_region_2718
#> 2781  0.5291002      .     . ID=enriched_region_2719
#> 2782  0.5437636      .     . ID=enriched_region_2720
#> 2783  0.8494867      .     . ID=enriched_region_2721
#> 2784  0.5830047      .     . ID=enriched_region_2722
#> 2785  1.0080905      .     . ID=enriched_region_2723
#> 2786  0.6144549      .     . ID=enriched_region_2724
#> 2787  0.7016414      .     . ID=enriched_region_2725
#> 2788  0.8243234      .     . ID=enriched_region_2726
#> 2789  1.0035824      .     . ID=enriched_region_2727
#> 2790  1.9800745      .     . ID=enriched_region_2728
#> 2791  0.4129357      .     . ID=enriched_region_2729
#> 2792  0.4919339      .     . ID=enriched_region_2730
#> 2793  0.3429303      .     . ID=enriched_region_2731
#> 2794  0.5903745      .     . ID=enriched_region_2732
#> 2795  0.4899828      .     . ID=enriched_region_2733
#> 2796  0.4183345      .     . ID=enriched_region_2734
#> 2797  0.9459294      .     . ID=enriched_region_2735
#> 2798  0.4318175      .     . ID=enriched_region_2736
#> 2799  0.7208734      .     . ID=enriched_region_2737
#> 2800  0.4989606      .     . ID=enriched_region_2738
#> 2801  0.6198495      .     . ID=enriched_region_2739
#> 2802  0.7287663      .     . ID=enriched_region_2740
#> 2803  0.5395495      .     . ID=enriched_region_2741
#> 2804  0.3666663      .     . ID=enriched_region_2742
#> 2805  0.5756096      .     . ID=enriched_region_2743
#> 2806  0.4829715      .     . ID=enriched_region_2744
#> 2807  0.7092534      .     . ID=enriched_region_2745
#> 2808  0.9747844      .     . ID=enriched_region_2746
#> 2809  0.6362574      .     . ID=enriched_region_2747
#> 2810  0.3665464      .     . ID=enriched_region_2748
#> 2811  0.4954779      .     . ID=enriched_region_2749
#> 2812  0.4498113      .     . ID=enriched_region_2750
#> 2813  0.6712687      .     . ID=enriched_region_2751
#> 2814  1.1887001      .     . ID=enriched_region_2752
#> 2815  0.4095350      .     . ID=enriched_region_2753
#> 2816  0.8190364      .     . ID=enriched_region_2754
#> 2817  1.4920722      .     . ID=enriched_region_2755
#> 2818  1.7288765      .     . ID=enriched_region_2756
#> 2819  0.7573005      .     . ID=enriched_region_2757
#> 2820  0.6714469      .     . ID=enriched_region_2758
#> 2821  0.8319480      .     . ID=enriched_region_2759
#> 2822  0.6626174      .     . ID=enriched_region_2760
#> 2823  0.8878542      .     . ID=enriched_region_2761
#> 2824  0.7773903      .     . ID=enriched_region_2762
#> 2825  0.5375200      .     . ID=enriched_region_2763
#> 2826  0.4915940      .     . ID=enriched_region_2764
#> 2827  0.6308040      .     . ID=enriched_region_2765
#> 2828  0.5898128      .     . ID=enriched_region_2766
#> 2829  0.7911718      .     . ID=enriched_region_2767
#> 2830  0.9290543      .     . ID=enriched_region_2768
#> 2831  0.7115275      .     . ID=enriched_region_2769
#> 2832  0.7516456      .     . ID=enriched_region_2770
#> 2833  0.3969029      .     . ID=enriched_region_2771
#> 2834  0.4039840      .     . ID=enriched_region_2772
#> 2835  0.8378241      .     . ID=enriched_region_2773
#> 2836  0.8145844      .     . ID=enriched_region_2774
#> 2837  0.4760027      .     . ID=enriched_region_2775
#> 2838  0.4583800      .     . ID=enriched_region_2776
#> 2839  0.6281491      .     . ID=enriched_region_2777
#> 2840  0.6905468      .     . ID=enriched_region_2778
#> 2841  0.6262040      .     . ID=enriched_region_2779
#> 2842  0.7774773      .     . ID=enriched_region_2780
#> 2843  0.6195238      .     . ID=enriched_region_2781
#> 2844  0.7423897      .     . ID=enriched_region_2782
#> 2845  0.5652222      .     . ID=enriched_region_2783
#> 2846  0.6395642      .     . ID=enriched_region_2784
#> 2847  0.4168140      .     . ID=enriched_region_2785
#> 2848  0.5762732      .     . ID=enriched_region_2786
#> 2849  0.6508265      .     . ID=enriched_region_2787
#> 2850  0.8774359      .     . ID=enriched_region_2788
#> 2851  0.5736440      .     . ID=enriched_region_2789
#> 2852  0.4383798      .     . ID=enriched_region_2790
#> 2853  0.7167362      .     . ID=enriched_region_2791
#> 2854  0.8749092      .     . ID=enriched_region_2792
#> 2855  0.6541033      .     . ID=enriched_region_2793
#> 2856  0.5791811      .     . ID=enriched_region_2794
#> 2857  0.6408052      .     . ID=enriched_region_2795
#> 2858  0.6419391      .     . ID=enriched_region_2796
#> 2859  0.3766314      .     . ID=enriched_region_2797
#> 2860  0.6661176      .     . ID=enriched_region_2798
#> 2861  0.7048159      .     . ID=enriched_region_2799
#> 2862  0.8799371      .     . ID=enriched_region_2800
#> 2863  0.5993290      .     . ID=enriched_region_2801
#> 2864  0.5659804      .     . ID=enriched_region_2802
#> 2865  0.5674758      .     . ID=enriched_region_2803
#> 2866  0.4022647      .     . ID=enriched_region_2804
#> 2867  0.7101578      .     . ID=enriched_region_2805
#> 2868  0.4194732      .     . ID=enriched_region_2806
#> 2869  0.7893822      .     . ID=enriched_region_2807
#> 2870  0.4381093      .     . ID=enriched_region_2808
#> 2871  0.6262157      .     . ID=enriched_region_2809
#> 2872  0.6649468      .     . ID=enriched_region_2810
#> 2873  0.7742222      .     . ID=enriched_region_2811
#> 2874  0.6160930      .     . ID=enriched_region_2812
#> 2875  0.8647334      .     . ID=enriched_region_2813
#> 2876  0.7208061      .     . ID=enriched_region_2814
#> 2877  0.5710369      .     . ID=enriched_region_2815
#> 2878  0.8208262      .     . ID=enriched_region_2816
#> 2879  0.7550754      .     . ID=enriched_region_2817
#> 2880  0.4638722      .     . ID=enriched_region_2818
#> 2881  0.8054761      .     . ID=enriched_region_2819
#> 2882  0.6474519      .     . ID=enriched_region_2820
#> 2883  0.7555056      .     . ID=enriched_region_2821
#> 2884  0.7488404      .     . ID=enriched_region_2822
#> 2885  0.8851877      .     . ID=enriched_region_2823
#> 2886  0.6076554      .     . ID=enriched_region_2824
#> 2887  0.5271561      .     . ID=enriched_region_2825
#> 2888  0.5841228      .     . ID=enriched_region_2826
#> 2889  1.0807685      .     . ID=enriched_region_2827
#> 2890  0.7237491      .     . ID=enriched_region_2828
#> 2891  0.5362596      .     . ID=enriched_region_2829
#> 2892  1.5080602      .     . ID=enriched_region_2830
#> 2893  0.7657581      .     . ID=enriched_region_2831
#> 2894  0.6453655      .     . ID=enriched_region_2832
#> 2895  0.5863317      .     . ID=enriched_region_2833
#> 2896  0.6813392      .     . ID=enriched_region_2834
#> 2897  0.6744430      .     . ID=enriched_region_2835
#> 2898  0.8887502      .     . ID=enriched_region_2836
#> 2899  0.9990210      .     . ID=enriched_region_2837
#> 2900  0.4576050      .     . ID=enriched_region_2838
#> 2901  0.6199751      .     . ID=enriched_region_2839
#> 2902  0.5195896      .     . ID=enriched_region_2840
#> 2903  0.5885575      .     . ID=enriched_region_2841
#> 2904  0.8266974      .     . ID=enriched_region_2842
#> 2905  0.5234516      .     . ID=enriched_region_2843
#> 2906  1.1398042      .     . ID=enriched_region_2844
#> 2907  0.7299727      .     . ID=enriched_region_2845
#> 2908  0.6088664      .     . ID=enriched_region_2846
#> 2909  0.7441437      .     . ID=enriched_region_2847
#> 2910  0.6815728      .     . ID=enriched_region_2848
#> 2911  0.9316071      .     . ID=enriched_region_2849
#> 2912  0.4257641      .     . ID=enriched_region_2850
#> 2913  1.1489039      .     . ID=enriched_region_2851
#> 2914  0.6844200      .     . ID=enriched_region_2852
#> 2915  0.6840518      .     . ID=enriched_region_2853
#> 2916  0.5925103      .     . ID=enriched_region_2854
#> 2917  0.5380991      .     . ID=enriched_region_2855
#> 2918  0.8503819      .     . ID=enriched_region_2856
#> 2919  0.6543726      .     . ID=enriched_region_2857
#> 2920  0.7658912      .     . ID=enriched_region_2858
#> 2921  0.7893957      .     . ID=enriched_region_2859
#> 2922  0.6946559      .     . ID=enriched_region_2860
#> 2923  0.5918120      .     . ID=enriched_region_2861
#> 2924  0.3953243      .     . ID=enriched_region_2862
#> 2925  0.5370565      .     . ID=enriched_region_2863
#> 2926  0.6149302      .     . ID=enriched_region_2864
#> 2927  0.6705611      .     . ID=enriched_region_2865
#> 2928  0.6951726      .     . ID=enriched_region_2866
#> 2929  0.5361605      .     . ID=enriched_region_2867
#> 2930  0.6566538      .     . ID=enriched_region_2868
#> 2931  0.5715890      .     . ID=enriched_region_2869
#> 2932  0.4719807      .     . ID=enriched_region_2870
#> 2933  0.7583203      .     . ID=enriched_region_2871
#> 2934  0.7022822      .     . ID=enriched_region_2872
#> 2935  0.7866222      .     . ID=enriched_region_2873
#> 2936  0.7288014      .     . ID=enriched_region_2874
#> 2937  0.4508948      .     . ID=enriched_region_2875
#> 2938  0.5187600      .     . ID=enriched_region_2876
#> 2939  0.4869078      .     . ID=enriched_region_2877
#> 2940  0.4914710      .     . ID=enriched_region_2878
#> 2941  0.5223665      .     . ID=enriched_region_2879
#> 2942  0.5324901      .     . ID=enriched_region_2880
#> 2943  0.5680425      .     . ID=enriched_region_2881
#> 2944  0.7655432      .     . ID=enriched_region_2882
#> 2945  0.4295032      .     . ID=enriched_region_2883
#> 2946  0.7797208      .     . ID=enriched_region_2884
#> 2947  0.7679555      .     . ID=enriched_region_2885
#> 2948  0.6256141      .     . ID=enriched_region_2886
#> 2949  0.4864465      .     . ID=enriched_region_2887
#> 2950  0.6595889      .     . ID=enriched_region_2888
#> 2951  0.6344186      .     . ID=enriched_region_2889
#> 2952  0.5261706      .     . ID=enriched_region_2890
#> 2953  0.5868751      .     . ID=enriched_region_2891
#> 2954  0.6178711      .     . ID=enriched_region_2892
#> 2955  0.4446071      .     . ID=enriched_region_2893
#> 2956  1.0578443      .     . ID=enriched_region_2894
#> 2957  0.5386085      .     . ID=enriched_region_2895
#> 2958  0.6339666      .     . ID=enriched_region_2896
#> 2959  0.6295491      .     . ID=enriched_region_2897
#> 2960  0.6243812      .     . ID=enriched_region_2898
#> 2961  0.4992255      .     . ID=enriched_region_2899
#> 2962  0.6715631      .     . ID=enriched_region_2900
#> 2963  0.5699995      .     . ID=enriched_region_2901
#> 2964  0.6086064      .     . ID=enriched_region_2902
#> 2965  0.5640861      .     . ID=enriched_region_2903
#> 2966  0.6366506      .     . ID=enriched_region_2904
#> 2967  0.4864152      .     . ID=enriched_region_2905
#> 2968  0.6463055      .     . ID=enriched_region_2906
#> 2969  0.6888308      .     . ID=enriched_region_2907
#> 2970  0.9351080      .     . ID=enriched_region_2908
#> 2971  1.5069199      .     . ID=enriched_region_2909
#> 2972  0.7045361      .     . ID=enriched_region_2910
#> 2973  0.9136918      .     . ID=enriched_region_2911
#> 2974  0.6801635      .     . ID=enriched_region_2912
#> 2975  0.6806114      .     . ID=enriched_region_2913
#> 2976  0.6183640      .     . ID=enriched_region_2914
#> 2977  0.5861472      .     . ID=enriched_region_2915
#> 2978  0.4980854      .     . ID=enriched_region_2916
#> 2979  0.6685964      .     . ID=enriched_region_2917
#> 2980  0.4656703      .     . ID=enriched_region_2918
#> 2981  0.8576638      .     . ID=enriched_region_2919
#> 2982  0.4283966      .     . ID=enriched_region_2920
#> 2983  0.6925600      .     . ID=enriched_region_2921
#> 2984  0.5686831      .     . ID=enriched_region_2922
#> 2985  0.4628091      .     . ID=enriched_region_2923
#> 2986  0.5033670      .     . ID=enriched_region_2924
#> 2987  0.5678377      .     . ID=enriched_region_2925
#> 2988  0.4726268      .     . ID=enriched_region_2926
#> 2989  0.6515194      .     . ID=enriched_region_2927
#> 2990  0.6613791      .     . ID=enriched_region_2928
#> 2991  1.0683437      .     . ID=enriched_region_2929
#> 2992  0.6003190      .     . ID=enriched_region_2930
#> 2993  0.5721285      .     . ID=enriched_region_2931
#> 2994  0.5395279      .     . ID=enriched_region_2932
#> 2995  0.5649286      .     . ID=enriched_region_2933
#> 2996  0.7436067      .     . ID=enriched_region_2934
#> 2997  0.6093780      .     . ID=enriched_region_2935
#> 2998  0.6503975      .     . ID=enriched_region_2936
#> 2999  0.5825867      .     . ID=enriched_region_2937
#> 3000  0.4856250      .     . ID=enriched_region_2938
#> 3001  0.5304067      .     . ID=enriched_region_2939
#> 3002  0.9041793      .     . ID=enriched_region_2940
#> 3003  0.6021788      .     . ID=enriched_region_2941
#> 3004  0.7030589      .     . ID=enriched_region_2942
#> 3005  0.7677710      .     . ID=enriched_region_2943
#> 3006  0.6135249      .     . ID=enriched_region_2944
#> 3007  0.4679032      .     . ID=enriched_region_2945
#> 3008  0.3946885      .     . ID=enriched_region_2946
#> 3009  0.8612229      .     . ID=enriched_region_2947
#> 3010  1.4011629      .     . ID=enriched_region_2948
#> 3011  0.4359270      .     . ID=enriched_region_2949
#> 3012  0.5424985      .     . ID=enriched_region_2950
#> 3013  0.6429657      .     . ID=enriched_region_2951
#> 3014  0.6561983      .     . ID=enriched_region_2952
#> 3015  0.5055091      .     . ID=enriched_region_2953
#> 3016  0.5895226      .     . ID=enriched_region_2954
#> 3017  0.5817959      .     . ID=enriched_region_2955
#> 3018  0.5986448      .     . ID=enriched_region_2956
#> 3019  0.6118846      .     . ID=enriched_region_2957
#> 3020  0.6575324      .     . ID=enriched_region_2958
#> 3021  0.4284883      .     . ID=enriched_region_2959
#> 3022  0.4312713      .     . ID=enriched_region_2960
#> 3023  0.4889039      .     . ID=enriched_region_2961
#> 3024  0.6564123      .     . ID=enriched_region_2962
#> 3025  0.6165739      .     . ID=enriched_region_2963
#> 3026  0.5679214      .     . ID=enriched_region_2964
#> 3027  0.7639322      .     . ID=enriched_region_2965
#> 3028  0.5280118      .     . ID=enriched_region_2966
#> 3029  0.6832711      .     . ID=enriched_region_2967
#> 3030  0.6895355      .     . ID=enriched_region_2968
#> 3031  0.6472174      .     . ID=enriched_region_2969
#> 3032  0.7994343      .     . ID=enriched_region_2970
#> 3033  0.3797479      .     . ID=enriched_region_2971
#> 3034  0.4157314      .     . ID=enriched_region_2972
#> 3035  0.6126951      .     . ID=enriched_region_2973
#> 3036  0.4894172      .     . ID=enriched_region_2974
#> 3037  0.4658807      .     . ID=enriched_region_2975
#> 3038  1.2692514      .     . ID=enriched_region_2976
#> 3039  0.6764297      .     . ID=enriched_region_2977
#> 3040  0.4690321      .     . ID=enriched_region_2978
#> 3041  0.4348460      .     . ID=enriched_region_2979
#> 3042  0.7222234      .     . ID=enriched_region_2980
#> 3043  0.6958334      .     . ID=enriched_region_2981
#> 3044  0.5361991      .     . ID=enriched_region_2982
#> 3045  0.4550238      .     . ID=enriched_region_2983
#> 3046  0.5919264      .     . ID=enriched_region_2984
#> 3047  0.5619425      .     . ID=enriched_region_2985
#> 3048  0.9500822      .     . ID=enriched_region_2986
#> 3049  0.5316259      .     . ID=enriched_region_2987
#> 3050  0.4413693      .     . ID=enriched_region_2988
#> 3051  0.4832092      .     . ID=enriched_region_2989
#> 3052  1.0714794      .     . ID=enriched_region_2990
#> 3053  0.6779411      .     . ID=enriched_region_2991
#> 3054  0.7954251      .     . ID=enriched_region_2992
#> 3055  1.0864277      .     . ID=enriched_region_2993
#> 3056  0.3881302      .     . ID=enriched_region_2994
#> 3057  0.4632051      .     . ID=enriched_region_2995
#> 3058  0.5162301      .     . ID=enriched_region_2996
#> 3059  0.5485894      .     . ID=enriched_region_2997
#> 3060  0.4680542      .     . ID=enriched_region_2998
#> 3061  0.5285815      .     . ID=enriched_region_2999
#> 3062  0.8409870      .     . ID=enriched_region_3000
#> 3063  0.4224710      .     . ID=enriched_region_3001
#> 3064  0.6387053      .     . ID=enriched_region_3002
#> 3065  0.7144657      .     . ID=enriched_region_3003
#> 3066  0.6718799      .     . ID=enriched_region_3004
#> 3067  1.8111985      .     . ID=enriched_region_3005
#> 3068  1.2917667      .     . ID=enriched_region_3006
#> 3069  0.5138245      .     . ID=enriched_region_3007
#> 3070  0.5384665      .     . ID=enriched_region_3008
#> 3071  0.5814537      .     . ID=enriched_region_3009
#> 3072  0.6407908      .     . ID=enriched_region_3010
#> 3073  0.5656776      .     . ID=enriched_region_3011
#> 3074  0.4775864      .     . ID=enriched_region_3012
#> 3075  0.3765597      .     . ID=enriched_region_3013
#> 3076  0.6208012      .     . ID=enriched_region_3014
#> 3077  0.5023672      .     . ID=enriched_region_3015
#> 3078  0.5383058      .     . ID=enriched_region_3016
#> 3079  0.8294623      .     . ID=enriched_region_3017
#> 3080  0.5023672      .     . ID=enriched_region_3018
#> 3081  0.5383069      .     . ID=enriched_region_3019
#> 3082  0.8488002      .     . ID=enriched_region_3020
#> 3083  0.9969468      .     . ID=enriched_region_3021
#> 3084  0.4534372      .     . ID=enriched_region_3022
#> 3085  0.6212814      .     . ID=enriched_region_3023
#> 3086  0.6909813      .     . ID=enriched_region_3024
#> 3087  0.5089069      .     . ID=enriched_region_3025
#> 3088  0.8598465      .     . ID=enriched_region_3026
#> 3089  0.7845549      .     . ID=enriched_region_3027
#> 3090  0.5805711      .     . ID=enriched_region_3028
#> 3091  0.5336827      .     . ID=enriched_region_3029
#> 3092  1.0102908      .     . ID=enriched_region_3030
#> 3093  0.7292042      .     . ID=enriched_region_3031
#> 3094  0.7544226      .     . ID=enriched_region_3032
#> 3095  0.6808608      .     . ID=enriched_region_3033
#> 3096  0.4442964      .     . ID=enriched_region_3034
#> 3097  0.4164320      .     . ID=enriched_region_3035
#> 3098  0.6340411      .     . ID=enriched_region_3036
#> 3099  0.7819005      .     . ID=enriched_region_3037
#> 3100  0.6486603      .     . ID=enriched_region_3038
#> 3101  0.8433942      .     . ID=enriched_region_3039
#> 3102  0.4831944      .     . ID=enriched_region_3040
#> 3103  0.7199273      .     . ID=enriched_region_3041
#> 3104  0.6516164      .     . ID=enriched_region_3042
#> 3105  0.4499625      .     . ID=enriched_region_3043
#> 3106  0.3858924      .     . ID=enriched_region_3044
#> 3107  0.5338279      .     . ID=enriched_region_3045
#> 3108  0.5831626      .     . ID=enriched_region_3046
#> 3109  0.8233651      .     . ID=enriched_region_3047
#> 3110  0.6676841      .     . ID=enriched_region_3048
#> 3111  0.5680461      .     . ID=enriched_region_3049
#> 3112  1.0327123      .     . ID=enriched_region_3050
#> 3113  0.5994422      .     . ID=enriched_region_3051
#> 3114  0.8241464      .     . ID=enriched_region_3052
#> 3115  0.7413451      .     . ID=enriched_region_3053
#> 3116  0.7384913      .     . ID=enriched_region_3054
#> 3117  0.8592479      .     . ID=enriched_region_3055
#> 3118  0.4539819      .     . ID=enriched_region_3056
#> 3119  0.4313988      .     . ID=enriched_region_3057
#> 3120  0.9101575      .     . ID=enriched_region_3058
#> 3121  0.6600465      .     . ID=enriched_region_3059
#> 3122  0.4238950      .     . ID=enriched_region_3060
#> 3123  0.4943168      .     . ID=enriched_region_3061
#> 3124  0.6503399      .     . ID=enriched_region_3062
#> 3125  0.5775685      .     . ID=enriched_region_3063
#> 3126  0.5790349      .     . ID=enriched_region_3064
#> 3127  0.6238397      .     . ID=enriched_region_3065
#> 3128  0.5733597      .     . ID=enriched_region_3066
#> 3129  0.6733146      .     . ID=enriched_region_3067
#> 3130  0.3185287      .     . ID=enriched_region_3068
#> 3131  0.4233807      .     . ID=enriched_region_3069
#> 3132  0.7076855      .     . ID=enriched_region_3070
#> 3133  0.6779826      .     . ID=enriched_region_3071
#> 3134  0.8053045      .     . ID=enriched_region_3072
#> 3135  0.3818412      .     . ID=enriched_region_3073
#> 3136  0.6563509      .     . ID=enriched_region_3074
#> 3137  0.7605193      .     . ID=enriched_region_3075
#> 3138  0.4017651      .     . ID=enriched_region_3076
#> 3139  0.7736852      .     . ID=enriched_region_3077
#> 3140  0.8743143      .     . ID=enriched_region_3078
#> 3141  0.6775028      .     . ID=enriched_region_3079
#> 3142  0.7935750      .     . ID=enriched_region_3080
#> 3143  0.3905274      .     . ID=enriched_region_3081
#> 3144  0.4052284      .     . ID=enriched_region_3082
#> 3145  0.5878205      .     . ID=enriched_region_3083
#> 3146  0.9094363      .     . ID=enriched_region_3084
#> 3147  0.4581782      .     . ID=enriched_region_3085
#> 3148  0.4421652      .     . ID=enriched_region_3086
#> 3149  0.6704375      .     . ID=enriched_region_3087
#> 3150  0.5196736      .     . ID=enriched_region_3088
#> 3151  0.9025977      .     . ID=enriched_region_3089
#> 3152  0.7050598      .     . ID=enriched_region_3090
#> 3153  1.8293707      .     . ID=enriched_region_3091
#> 3154  0.5167250      .     . ID=enriched_region_3092
#> 3155  0.4612830      .     . ID=enriched_region_3093
#> 3156  0.6920301      .     . ID=enriched_region_3094
#> 3157  0.7263275      .     . ID=enriched_region_3095
#> 3158  0.5226001      .     . ID=enriched_region_3096
#> 3159  0.6848596      .     . ID=enriched_region_3097
#> 3160  0.4707760      .     . ID=enriched_region_3098
#> 3161  0.5935519      .     . ID=enriched_region_3099
#> 3162  1.6399458      .     . ID=enriched_region_3100
#> 3163  0.7538004      .     . ID=enriched_region_3101
#> 3164  0.4098777      .     . ID=enriched_region_3102
#> 3165  0.6569286      .     . ID=enriched_region_3103
#> 3166  0.4311308      .     . ID=enriched_region_3104
#> 3167  0.6199511      .     . ID=enriched_region_3105
#> 3168  0.9981668      .     . ID=enriched_region_3106
#> 3169  0.4283576      .     . ID=enriched_region_3107
#> 3170  0.5833442      .     . ID=enriched_region_3108
#> 3171  0.5721942      .     . ID=enriched_region_3109
#> 3172  0.5833442      .     . ID=enriched_region_3110
#> 3173  0.6714880      .     . ID=enriched_region_3111
#> 3174  0.8532680      .     . ID=enriched_region_3112
#> 3175  0.6621166      .     . ID=enriched_region_3113
#> 3176  0.4700535      .     . ID=enriched_region_3114
#> 3177  0.5951889      .     . ID=enriched_region_3115
#> 3178  0.7505698      .     . ID=enriched_region_3116
#> 3179  0.7446697      .     . ID=enriched_region_3117
#> 3180  0.7530350      .     . ID=enriched_region_3118
#> 3181  0.6414763      .     . ID=enriched_region_3119
#> 3182  0.4978411      .     . ID=enriched_region_3120
#> 3183  0.6305028      .     . ID=enriched_region_3121
#> 3184 -0.5281942      .     .   ID=depleted_region_63
#> 3185 -0.5276280      .     .   ID=depleted_region_64
#> 3186 -0.4728484      .     .   ID=depleted_region_65
#> 3187  0.6107007      .     . ID=enriched_region_3122
#> 3188  0.9975794      .     . ID=enriched_region_3123
#> 3189  2.4508308      .     . ID=enriched_region_3124
#> 3190  0.6922455      .     . ID=enriched_region_3125
#> 3191  0.9267069      .     . ID=enriched_region_3126
#> 3192  1.2178090      .     . ID=enriched_region_3127
#> 3193  0.4203893      .     . ID=enriched_region_3128
#> 3194  0.8674189      .     . ID=enriched_region_3129
#> 3195  0.4429784      .     . ID=enriched_region_3130
#> 3196  0.9120408      .     . ID=enriched_region_3131
#> 3197  0.8456724      .     . ID=enriched_region_3132
#> 3198  0.5050488      .     . ID=enriched_region_3133
#> 3199  1.2218069      .     . ID=enriched_region_3134
#> 3200  0.4065994      .     . ID=enriched_region_3135
#> 3201  0.6787830      .     . ID=enriched_region_3136
#> 3202  1.1193767      .     . ID=enriched_region_3137
#> 3203  1.0340025      .     . ID=enriched_region_3138
#> 3204  0.7049510      .     . ID=enriched_region_3139
#> 3205  0.7460548      .     . ID=enriched_region_3140
#> 3206  0.7180600      .     . ID=enriched_region_3141
#> 3207  0.7596704      .     . ID=enriched_region_3142
#> 3208  0.8281098      .     . ID=enriched_region_3143
#> 3209  0.9242568      .     . ID=enriched_region_3144
#> 3210  0.8112166      .     . ID=enriched_region_3145
#> 3211  0.5875874      .     . ID=enriched_region_3146
#> 3212  1.1068402      .     . ID=enriched_region_3147
#> 3213  0.8877766      .     . ID=enriched_region_3148
#> 3214  0.9015034      .     . ID=enriched_region_3149
#> 3215  0.6569728      .     . ID=enriched_region_3150
#> 3216  0.4133541      .     . ID=enriched_region_3151
#> 3217  1.5015876      .     . ID=enriched_region_3152
#> 3218  0.7463366      .     . ID=enriched_region_3153
#> 3219  0.6980551      .     . ID=enriched_region_3154
#> 3220  0.6930138      .     . ID=enriched_region_3155
#> 3221  0.8235790      .     . ID=enriched_region_3156
#> 3222  0.9324125      .     . ID=enriched_region_3157
#> 3223  0.6323013      .     . ID=enriched_region_3158
#> 3224  0.6730288      .     . ID=enriched_region_3159
#> 3225  0.7019005      .     . ID=enriched_region_3160
#> 3226  1.0340926      .     . ID=enriched_region_3161
#> 3227  0.9049325      .     . ID=enriched_region_3162
#> 3228  0.7988814      .     . ID=enriched_region_3163
#> 3229  0.6558211      .     . ID=enriched_region_3164
#> 3230  0.6167743      .     . ID=enriched_region_3165
#> 3231  0.7626378      .     . ID=enriched_region_3166
#> 3232  1.7975593      .     . ID=enriched_region_3167
#> 3233  1.1364242      .     . ID=enriched_region_3168
#> 3234  0.6876663      .     . ID=enriched_region_3169
#> 3235  0.4607700      .     . ID=enriched_region_3170
#> 3236  0.5012477      .     . ID=enriched_region_3171
#> 3237  0.7906265      .     . ID=enriched_region_3172
#> 3238  0.6486833      .     . ID=enriched_region_3173
#> 3239  0.6639294      .     . ID=enriched_region_3174
#> 3240  0.7697287      .     . ID=enriched_region_3175
#> 3241  0.5936057      .     . ID=enriched_region_3176
#> 3242  0.9277805      .     . ID=enriched_region_3177
#> 3243  0.3517688      .     . ID=enriched_region_3178
#> 3244  0.4537445      .     . ID=enriched_region_3179
#> 3245  0.8666655      .     . ID=enriched_region_3180
#> 3246  0.4854945      .     . ID=enriched_region_3181
#> 3247  1.1288552      .     . ID=enriched_region_3182
#> 3248  0.7863317      .     . ID=enriched_region_3183
#> 3249  0.7339482      .     . ID=enriched_region_3184
#> 3250  1.0083981      .     . ID=enriched_region_3185
#> 3251  0.5319294      .     . ID=enriched_region_3186
#> 3252  0.9554255      .     . ID=enriched_region_3187
#> 3253  0.4516325      .     . ID=enriched_region_3188
#> 3254  0.5965691      .     . ID=enriched_region_3189
#> 3255  1.0305730      .     . ID=enriched_region_3190
#> 3256  0.7233784      .     . ID=enriched_region_3191
#> 3257  0.4564316      .     . ID=enriched_region_3192
#> 3258  0.9552657      .     . ID=enriched_region_3193
#> 3259  1.0970064      .     . ID=enriched_region_3194
#> 3260  0.9612153      .     . ID=enriched_region_3195
#> 3261  0.5803647      .     . ID=enriched_region_3196
#> 3262  0.8109183      .     . ID=enriched_region_3197
#> 3263  0.7429482      .     . ID=enriched_region_3198
#> 3264  0.7466930      .     . ID=enriched_region_3199
#> 3265  0.4231523      .     . ID=enriched_region_3200
#> 3266  0.4231523      .     . ID=enriched_region_3201
#> 3267  1.0123869      .     . ID=enriched_region_3202
#> 3268  0.4543627      .     . ID=enriched_region_3203
#> 3269  0.7054356      .     . ID=enriched_region_3204
#> 3270  0.6838275      .     . ID=enriched_region_3205
#> 3271  0.5522111      .     . ID=enriched_region_3206
#> 3272  0.9519598      .     . ID=enriched_region_3207
#> 3273  0.9133953      .     . ID=enriched_region_3208
#> 3274  0.4803538      .     . ID=enriched_region_3209
#> 3275  0.5770213      .     . ID=enriched_region_3210
#> 3276  0.7324747      .     . ID=enriched_region_3211
#> 3277  0.4988523      .     . ID=enriched_region_3212
#> 3278  0.7677329      .     . ID=enriched_region_3213
#> 3279  0.9278834      .     . ID=enriched_region_3214
#> 3280  0.5431481      .     . ID=enriched_region_3215
#> 3281  0.5240968      .     . ID=enriched_region_3216
#> 3282  0.8641755      .     . ID=enriched_region_3217
#> 3283  0.9023188      .     . ID=enriched_region_3218
#> 3284  1.0054721      .     . ID=enriched_region_3219
#> 3285  1.3402870      .     . ID=enriched_region_3220
#> 3286  1.7590476      .     . ID=enriched_region_3221
#> 3287  1.7060883      .     . ID=enriched_region_3222
#> 3288  0.4389637      .     . ID=enriched_region_3223
#> 3289  0.5847568      .     . ID=enriched_region_3224
#> 3290  0.8476209      .     . ID=enriched_region_3225
#> 3291  0.7062052      .     . ID=enriched_region_3226
#> 3292  0.6964801      .     . ID=enriched_region_3227
#> 3293  0.7428419      .     . ID=enriched_region_3228
#> 3294  1.0791212      .     . ID=enriched_region_3229
#> 3295  0.7893259      .     . ID=enriched_region_3230
#> 3296  1.0098031      .     . ID=enriched_region_3231
#> 3297  0.7005148      .     . ID=enriched_region_3232
#> 3298  0.6363466      .     . ID=enriched_region_3233
#> 3299  0.7074893      .     . ID=enriched_region_3234
#> 3300  0.4728963      .     . ID=enriched_region_3235
#> 3301  0.4111965      .     . ID=enriched_region_3236
#> 3302  0.4564087      .     . ID=enriched_region_3237
#> 3303  0.7805303      .     . ID=enriched_region_3238
#> 3304  0.4981439      .     . ID=enriched_region_3239
#> 3305  0.6734710      .     . ID=enriched_region_3240
#> 3306  0.8137485      .     . ID=enriched_region_3241
#> 3307  0.4784509      .     . ID=enriched_region_3242
#> 3308  0.5642218      .     . ID=enriched_region_3243
#> 3309  0.8375181      .     . ID=enriched_region_3244
#> 3310  1.3265060      .     . ID=enriched_region_3245
#> 3311  0.9775935      .     . ID=enriched_region_3246
#> 3312  0.5305960      .     . ID=enriched_region_3247
#> 3313  0.6191724      .     . ID=enriched_region_3248
#> 3314  0.5265656      .     . ID=enriched_region_3249
#> 3315  0.8817693      .     . ID=enriched_region_3250
#> 3316  0.6730023      .     . ID=enriched_region_3251
#> 3317  0.5184516      .     . ID=enriched_region_3252
#> 3318  1.0405793      .     . ID=enriched_region_3253
#> 3319  0.5709243      .     . ID=enriched_region_3254
#> 3320  0.5091947      .     . ID=enriched_region_3255
#> 3321  0.4642713      .     . ID=enriched_region_3256
#> 3322  1.5603002      .     . ID=enriched_region_3257
#> 3323  0.7151433      .     . ID=enriched_region_3258
#> 3324  0.6886484      .     . ID=enriched_region_3259
#> 3325  0.4385251      .     . ID=enriched_region_3260
#> 3326  0.4864786      .     . ID=enriched_region_3261
#> 3327  0.4181120      .     . ID=enriched_region_3262
#> 3328  1.3671256      .     . ID=enriched_region_3263
#> 3329  0.6587443      .     . ID=enriched_region_3264
#> 3330  1.0757233      .     . ID=enriched_region_3265
#> 3331  0.9594420      .     . ID=enriched_region_3266
#> 3332  0.3934367      .     . ID=enriched_region_3267
#> 3333  0.7662160      .     . ID=enriched_region_3268
#> 3334  0.7496212      .     . ID=enriched_region_3269
#> 3335  0.8205382      .     . ID=enriched_region_3270
#> 3336  0.7136379      .     . ID=enriched_region_3271
#> 3337  0.6499080      .     . ID=enriched_region_3272
#> 3338  1.1163117      .     . ID=enriched_region_3273
#> 3339  0.6565743      .     . ID=enriched_region_3274
#> 3340  0.5428461      .     . ID=enriched_region_3275
#> 3341  1.3847043      .     . ID=enriched_region_3276
#> 3342  0.7866376      .     . ID=enriched_region_3277
#> 3343  0.8252203      .     . ID=enriched_region_3278
#> 3344  0.5336941      .     . ID=enriched_region_3279
#> 3345  0.6411449      .     . ID=enriched_region_3280
#> 3346  0.6810587      .     . ID=enriched_region_3281
#> 3347  1.6127201      .     . ID=enriched_region_3282
#> 3348  0.6496233      .     . ID=enriched_region_3283
#> 3349  1.0769269      .     . ID=enriched_region_3284
#> 3350  0.8152838      .     . ID=enriched_region_3285
#> 3351  0.7924271      .     . ID=enriched_region_3286
#> 3352  0.7187112      .     . ID=enriched_region_3287
#> 3353  0.8450369      .     . ID=enriched_region_3288
#> 3354  0.9076770      .     . ID=enriched_region_3289
#> 3355  0.6233220      .     . ID=enriched_region_3290
#> 3356  1.9409756      .     . ID=enriched_region_3291
#> 3357  1.2172396      .     . ID=enriched_region_3292
#> 3358  0.6033836      .     . ID=enriched_region_3293
#> 3359  0.5940127      .     . ID=enriched_region_3294
#> 3360  0.6746902      .     . ID=enriched_region_3295
#> 3361  0.4025650      .     . ID=enriched_region_3296
#> 3362  0.8266280      .     . ID=enriched_region_3297
#> 3363  0.4182374      .     . ID=enriched_region_3298
#> 3364  0.6732907      .     . ID=enriched_region_3299
#> 3365  0.7790886      .     . ID=enriched_region_3300
#> 3366  1.1940695      .     . ID=enriched_region_3301
#> 3367  0.4673697      .     . ID=enriched_region_3302
#> 3368  0.5450314      .     . ID=enriched_region_3303
#> 3369  0.5589140      .     . ID=enriched_region_3304
#> 3370  0.7145635      .     . ID=enriched_region_3305
#> 3371  0.4940057      .     . ID=enriched_region_3306
#> 3372  0.9146926      .     . ID=enriched_region_3307
#> 3373  0.6414592      .     . ID=enriched_region_3308
#> 3374  1.5239841      .     . ID=enriched_region_3309
#> 3375  0.4167021      .     . ID=enriched_region_3310
#> 3376  1.3212214      .     . ID=enriched_region_3311
#> 3377  0.6829986      .     . ID=enriched_region_3312
#> 3378  0.4822175      .     . ID=enriched_region_3313
#> 3379  0.4050381      .     . ID=enriched_region_3314
#> 3380  0.6046282      .     . ID=enriched_region_3315
#> 3381  0.7316813      .     . ID=enriched_region_3316
#> 3382  1.4454703      .     . ID=enriched_region_3317
#> 3383  0.3656963      .     . ID=enriched_region_3318
#> 3384  0.3582491      .     . ID=enriched_region_3319
#> 3385  0.8910918      .     . ID=enriched_region_3320
#> 3386  1.2983452      .     . ID=enriched_region_3321
#> 3387  1.3543952      .     . ID=enriched_region_3322
#> 3388  1.3111233      .     . ID=enriched_region_3323
#> 3389  0.9221240      .     . ID=enriched_region_3324
#> 3390  0.5551429      .     . ID=enriched_region_3325
#> 3391  0.9973846      .     . ID=enriched_region_3326
#> 3392  0.7112190      .     . ID=enriched_region_3327
#> 3393  0.7112662      .     . ID=enriched_region_3328
#> 3394  0.7308873      .     . ID=enriched_region_3329
#> 3395  0.5118080      .     . ID=enriched_region_3330
#> 3396  0.5886793      .     . ID=enriched_region_3331
#> 3397  0.7848586      .     . ID=enriched_region_3332
#> 3398  1.0821695      .     . ID=enriched_region_3333
#> 3399  0.4860398      .     . ID=enriched_region_3334
#> 3400  0.6629002      .     . ID=enriched_region_3335
#> 3401  0.8179157      .     . ID=enriched_region_3336
#> 3402  0.5914908      .     . ID=enriched_region_3337
#> 3403  0.5619021      .     . ID=enriched_region_3338
#> 3404  2.0244624      .     . ID=enriched_region_3339
#> 3405  0.6081089      .     . ID=enriched_region_3340
#> 3406  0.8766233      .     . ID=enriched_region_3341
#> 3407  0.6305834      .     . ID=enriched_region_3342
#> 3408  0.8724337      .     . ID=enriched_region_3343
#> 3409  0.9509147      .     . ID=enriched_region_3344
#> 3410  0.7487240      .     . ID=enriched_region_3345
#> 3411  0.8825619      .     . ID=enriched_region_3346
#> 3412  0.8333006      .     . ID=enriched_region_3347
#> 3413  0.5835869      .     . ID=enriched_region_3348
#> 3414  0.8231604      .     . ID=enriched_region_3349
#> 3415  0.4373257      .     . ID=enriched_region_3350
#> 3416  0.6630300      .     . ID=enriched_region_3351
#> 3417  0.7473400      .     . ID=enriched_region_3352
#> 3418  0.4581354      .     . ID=enriched_region_3353
#> 3419  0.9556220      .     . ID=enriched_region_3354
#> 3420  0.8217693      .     . ID=enriched_region_3355
#> 3421  1.1139376      .     . ID=enriched_region_3356
#> 3422  0.7349253      .     . ID=enriched_region_3357
#> 3423  0.7905128      .     . ID=enriched_region_3358
#> 3424  0.4788085      .     . ID=enriched_region_3359
#> 3425  0.6200594      .     . ID=enriched_region_3360
#> 3426  0.5136214      .     . ID=enriched_region_3361
#> 3427  0.7100533      .     . ID=enriched_region_3362
#> 3428  1.0662571      .     . ID=enriched_region_3363
#> 3429  1.2244863      .     . ID=enriched_region_3364
#> 3430  1.4312081      .     . ID=enriched_region_3365
#> 3431  1.0398854      .     . ID=enriched_region_3366
#> 3432  0.6803461      .     . ID=enriched_region_3367
#> 3433  0.8943122      .     . ID=enriched_region_3368
#> 3434  0.7124529      .     . ID=enriched_region_3369
#> 3435  0.7852580      .     . ID=enriched_region_3370
#> 3436  0.6769875      .     . ID=enriched_region_3371
#> 3437  0.9874807      .     . ID=enriched_region_3372
#> 3438  0.9660666      .     . ID=enriched_region_3373
#> 3439  0.6514983      .     . ID=enriched_region_3374
#> 3440  0.5503703      .     . ID=enriched_region_3375
#> 3441  0.6562894      .     . ID=enriched_region_3376
#> 3442  0.9591519      .     . ID=enriched_region_3377
#> 3443  0.4683004      .     . ID=enriched_region_3378
#> 3444  0.5779720      .     . ID=enriched_region_3379
#> 3445  0.5028955      .     . ID=enriched_region_3380
#> 3446  0.3955098      .     . ID=enriched_region_3381
#> 3447  0.8596597      .     . ID=enriched_region_3382
#> 3448  0.4544607      .     . ID=enriched_region_3383
#> 3449  0.8782604      .     . ID=enriched_region_3384
#> 3450  0.4814468      .     . ID=enriched_region_3385
#> 3451  1.0137192      .     . ID=enriched_region_3386
#> 3452  0.8681150      .     . ID=enriched_region_3387
#> 3453  1.8580459      .     . ID=enriched_region_3388
#> 3454  0.4470278      .     . ID=enriched_region_3389
#> 3455  0.6215924      .     . ID=enriched_region_3390
#> 3456  0.6082717      .     . ID=enriched_region_3391
#> 3457  0.8207630      .     . ID=enriched_region_3392
#> 3458  0.5252411      .     . ID=enriched_region_3393
#> 3459  1.3453043      .     . ID=enriched_region_3394
#> 3460  1.1849705      .     . ID=enriched_region_3395
#> 3461  0.9158317      .     . ID=enriched_region_3396
#> 3462  0.5958024      .     . ID=enriched_region_3397
#> 3463  0.5245346      .     . ID=enriched_region_3398
#> 3464  1.0315770      .     . ID=enriched_region_3399
#> 3465  0.6043931      .     . ID=enriched_region_3400
#> 3466  0.5806098      .     . ID=enriched_region_3401
#> 3467  0.5682132      .     . ID=enriched_region_3402
#> 3468  0.5441237      .     . ID=enriched_region_3403
#> 3469  0.5624868      .     . ID=enriched_region_3404
#> 3470  0.4484869      .     . ID=enriched_region_3405
#> 3471  1.1910239      .     . ID=enriched_region_3406
#> 3472  1.0719323      .     . ID=enriched_region_3407
#> 3473  0.9933851      .     . ID=enriched_region_3408
#> 3474  0.3863969      .     . ID=enriched_region_3409
#> 3475  0.4758917      .     . ID=enriched_region_3410
#> 3476  0.8374113      .     . ID=enriched_region_3411
#> 3477  0.5067587      .     . ID=enriched_region_3412
#> 3478  0.5988887      .     . ID=enriched_region_3413
#> 3479  1.4164185      .     . ID=enriched_region_3414
#> 3480  0.4414564      .     . ID=enriched_region_3415
#> 3481  0.8826473      .     . ID=enriched_region_3416
#> 3482  0.8140155      .     . ID=enriched_region_3417
#> 3483  0.5704526      .     . ID=enriched_region_3418
#> 3484  0.5205656      .     . ID=enriched_region_3419
#> 3485  0.6629495      .     . ID=enriched_region_3420
#> 3486  0.8458681      .     . ID=enriched_region_3421
#> 3487  0.7862055      .     . ID=enriched_region_3422
#> 3488  0.7790566      .     . ID=enriched_region_3423
#> 3489  0.8456554      .     . ID=enriched_region_3424
#> 3490  0.4285780      .     . ID=enriched_region_3425
#> 3491  0.6580117      .     . ID=enriched_region_3426
#> 3492  0.7466467      .     . ID=enriched_region_3427
#> 3493  1.0479293      .     . ID=enriched_region_3428
#> 3494  0.4162081      .     . ID=enriched_region_3429
#> 3495  0.6804799      .     . ID=enriched_region_3430
#> 3496  0.7769945      .     . ID=enriched_region_3431
#> 3497  0.7216087      .     . ID=enriched_region_3432
#> 3498  0.8537420      .     . ID=enriched_region_3433
#> 3499  0.6584087      .     . ID=enriched_region_3434
#> 3500  0.8672357      .     . ID=enriched_region_3435
#> 3501  0.7087398      .     . ID=enriched_region_3436
#> 3502  0.9089868      .     . ID=enriched_region_3437
#> 3503  0.7398272      .     . ID=enriched_region_3438
#> 3504  0.4053316      .     . ID=enriched_region_3439
#> 3505  1.1695395      .     . ID=enriched_region_3440
#> 3506  0.4577443      .     . ID=enriched_region_3441
#> 3507  0.8693747      .     . ID=enriched_region_3442
#> 3508  1.3953958      .     . ID=enriched_region_3443
#> 3509  0.5528991      .     . ID=enriched_region_3444
#> 3510  0.5578188      .     . ID=enriched_region_3445
#> 3511  0.8249120      .     . ID=enriched_region_3446
#> 3512  0.5652915      .     . ID=enriched_region_3447
#> 3513  0.6040804      .     . ID=enriched_region_3448
#> 3514  0.9046913      .     . ID=enriched_region_3449
#> 3515  0.4918091      .     . ID=enriched_region_3450
#> 3516  1.4308105      .     . ID=enriched_region_3451
#> 3517  0.8410354      .     . ID=enriched_region_3452
#> 3518  0.5087652      .     . ID=enriched_region_3453
#> 3519  0.4315029      .     . ID=enriched_region_3454
#> 3520  0.6099250      .     . ID=enriched_region_3455
#> 3521  0.7085327      .     . ID=enriched_region_3456
#> 3522  0.7345636      .     . ID=enriched_region_3457
#> 3523  1.1788299      .     . ID=enriched_region_3458
#> 3524  0.8065508      .     . ID=enriched_region_3459
#> 3525  0.5713343      .     . ID=enriched_region_3460
#> 3526  0.5097526      .     . ID=enriched_region_3461
#> 3527  0.7690239      .     . ID=enriched_region_3462
#> 3528  1.6918459      .     . ID=enriched_region_3463
#> 3529  0.7783497      .     . ID=enriched_region_3464
#> 3530  0.5773437      .     . ID=enriched_region_3465
#> 3531  0.3442914      .     . ID=enriched_region_3466
#> 3532  0.9419655      .     . ID=enriched_region_3467
#> 3533  0.4631714      .     . ID=enriched_region_3468
#> 3534  0.5560171      .     . ID=enriched_region_3469
#> 3535  1.0132969      .     . ID=enriched_region_3470
#> 3536  0.5439337      .     . ID=enriched_region_3471
#> 3537  0.7276923      .     . ID=enriched_region_3472
#> 3538  0.7822913      .     . ID=enriched_region_3473
#> 3539  1.5529137      .     . ID=enriched_region_3474
#> 3540  0.4838059      .     . ID=enriched_region_3475
#> 3541  0.5187550      .     . ID=enriched_region_3476
#> 3542  0.4873061      .     . ID=enriched_region_3477
#> 3543  0.6620582      .     . ID=enriched_region_3478
#> 3544  0.5984551      .     . ID=enriched_region_3479
#> 3545  0.7681628      .     . ID=enriched_region_3480
#> 3546  0.4582111      .     . ID=enriched_region_3481
#> 3547  0.8612211      .     . ID=enriched_region_3482
#> 3548  0.8716851      .     . ID=enriched_region_3483
#> 3549  0.6357437      .     . ID=enriched_region_3484
#> 3550  0.4820548      .     . ID=enriched_region_3485
#> 3551  0.5895740      .     . ID=enriched_region_3486
#> 3552  0.5384967      .     . ID=enriched_region_3487
#> 3553  0.6148440      .     . ID=enriched_region_3488
#> 3554  0.5655957      .     . ID=enriched_region_3489
#> 3555  0.6936957      .     . ID=enriched_region_3490
#> 3556  0.6729145      .     . ID=enriched_region_3491
#> 3557  0.5576985      .     . ID=enriched_region_3492
#> 3558  0.6543760      .     . ID=enriched_region_3493
#> 3559  0.7333341      .     . ID=enriched_region_3494
#> 3560  0.5207595      .     . ID=enriched_region_3495
#> 3561  0.6607815      .     . ID=enriched_region_3496
#> 3562  0.9036046      .     . ID=enriched_region_3497
#> 3563  0.4539405      .     . ID=enriched_region_3498
#> 3564  0.3753904      .     . ID=enriched_region_3499
#> 3565  0.4578585      .     . ID=enriched_region_3500
#> 3566  1.0858203      .     . ID=enriched_region_3501
#> 3567  0.4653216      .     . ID=enriched_region_3502
#> 3568  0.4229695      .     . ID=enriched_region_3503
#> 3569  0.4596981      .     . ID=enriched_region_3504
#> 3570  0.7000990      .     . ID=enriched_region_3505
#> 3571  0.7865101      .     . ID=enriched_region_3506
#> 3572  0.6002884      .     . ID=enriched_region_3507
#> 3573  0.4373408      .     . ID=enriched_region_3508
#> 3574  0.7378123      .     . ID=enriched_region_3509
#> 3575  0.9827138      .     . ID=enriched_region_3510
#> 3576  0.5875040      .     . ID=enriched_region_3511
#> 3577  0.4984442      .     . ID=enriched_region_3512
#> 3578  0.4386929      .     . ID=enriched_region_3513
#> 3579  0.7629899      .     . ID=enriched_region_3514
#> 3580  0.5691304      .     . ID=enriched_region_3515
#> 3581  1.7336759      .     . ID=enriched_region_3516
#> 3582  0.7939690      .     . ID=enriched_region_3517
#> 3583  1.1643027      .     . ID=enriched_region_3518
#> 3584  0.4791629      .     . ID=enriched_region_3519
#> 3585  0.6415688      .     . ID=enriched_region_3520
#> 3586  0.6497168      .     . ID=enriched_region_3521
#> 3587  0.8032531      .     . ID=enriched_region_3522
#> 3588  1.5014586      .     . ID=enriched_region_3523
#> 3589  0.8604681      .     . ID=enriched_region_3524
#> 3590  0.6691239      .     . ID=enriched_region_3525
#> 3591  0.5439765      .     . ID=enriched_region_3526
#> 3592  1.2596072      .     . ID=enriched_region_3527
#> 3593  1.0494553      .     . ID=enriched_region_3528
#> 3594  0.4384371      .     . ID=enriched_region_3529
#> 3595  1.3239461      .     . ID=enriched_region_3530
#> 3596  0.8055367      .     . ID=enriched_region_3531
#> 3597  0.5809155      .     . ID=enriched_region_3532
#> 3598  0.9082503      .     . ID=enriched_region_3533
#> 3599  0.5867162      .     . ID=enriched_region_3534
#> 3600  0.5018927      .     . ID=enriched_region_3535
#> 3601  0.5108398      .     . ID=enriched_region_3536
#> 3602  0.5414335      .     . ID=enriched_region_3537
#> 3603  0.4272450      .     . ID=enriched_region_3538
#> 3604  0.5356157      .     . ID=enriched_region_3539
#> 3605  1.3378533      .     . ID=enriched_region_3540
#> 3606  0.8538472      .     . ID=enriched_region_3541
#> 3607  0.8376553      .     . ID=enriched_region_3542
#> 3608  0.4823953      .     . ID=enriched_region_3543
#> 3609  1.3192519      .     . ID=enriched_region_3544
#> 3610  0.7165759      .     . ID=enriched_region_3545
#> 3611  0.8172786      .     . ID=enriched_region_3546
#> 3612  0.4633041      .     . ID=enriched_region_3547
#> 3613  0.6403617      .     . ID=enriched_region_3548
#> 3614  0.7797807      .     . ID=enriched_region_3549
#> 3615  0.4573673      .     . ID=enriched_region_3550
#> 3616  1.0165022      .     . ID=enriched_region_3551
#> 3617  0.5905431      .     . ID=enriched_region_3552
#> 3618  0.8668616      .     . ID=enriched_region_3553
#> 3619  1.0569028      .     . ID=enriched_region_3554
#> 3620  0.8789140      .     . ID=enriched_region_3555
#> 3621  0.9226343      .     . ID=enriched_region_3556
#> 3622  0.5233494      .     . ID=enriched_region_3557
#> 3623  0.5173728      .     . ID=enriched_region_3558
#> 3624  0.6830872      .     . ID=enriched_region_3559
#> 3625  0.5316785      .     . ID=enriched_region_3560
#> 3626  0.5649067      .     . ID=enriched_region_3561
#> 3627  0.6301254      .     . ID=enriched_region_3562
#> 3628  0.6716574      .     . ID=enriched_region_3563
#> 3629  0.8973367      .     . ID=enriched_region_3564
#> 3630  0.5532936      .     . ID=enriched_region_3565
#> 3631  0.9903512      .     . ID=enriched_region_3566
#> 3632  0.6088734      .     . ID=enriched_region_3567
#> 3633  0.5850029      .     . ID=enriched_region_3568
#> 3634  0.7476464      .     . ID=enriched_region_3569
#> 3635  0.7907030      .     . ID=enriched_region_3570
#> 3636  0.9409967      .     . ID=enriched_region_3571
#> 3637  1.3073691      .     . ID=enriched_region_3572
#> 3638  0.5619642      .     . ID=enriched_region_3573
#> 3639  0.5891573      .     . ID=enriched_region_3574
#> 3640  0.9499000      .     . ID=enriched_region_3575
#> 3641  0.9608347      .     . ID=enriched_region_3576
#> 3642  2.3002915      .     . ID=enriched_region_3577
#> 3643  0.7383032      .     . ID=enriched_region_3578
#> 3644  1.5649368      .     . ID=enriched_region_3579
#> 3645  1.1419191      .     . ID=enriched_region_3580
#> 3646  0.6407398      .     . ID=enriched_region_3581
#> 3647  0.5586449      .     . ID=enriched_region_3582
#> 3648  0.7514363      .     . ID=enriched_region_3583
#> 3649  0.7684255      .     . ID=enriched_region_3584
#> 3650  0.5791504      .     . ID=enriched_region_3585
#> 3651  1.1790754      .     . ID=enriched_region_3586
#> 3652  0.9192430      .     . ID=enriched_region_3587
#> 3653  0.7612419      .     . ID=enriched_region_3588
#> 3654  0.6222796      .     . ID=enriched_region_3589
#> 3655  1.1366255      .     . ID=enriched_region_3590
#> 3656  0.6753657      .     . ID=enriched_region_3591
#> 3657  0.5745468      .     . ID=enriched_region_3592
#> 3658  0.6745928      .     . ID=enriched_region_3593
#> 3659  0.4779795      .     . ID=enriched_region_3594
#> 3660  0.6942470      .     . ID=enriched_region_3595
#> 3661  0.4878280      .     . ID=enriched_region_3596
#> 3662  0.9152041      .     . ID=enriched_region_3597
#> 3663  0.9177157      .     . ID=enriched_region_3598
#> 3664  0.4093555      .     . ID=enriched_region_3599
#> 3665  0.6027604      .     . ID=enriched_region_3600
#> 3666  0.5023827      .     . ID=enriched_region_3601
#> 3667  0.4701913      .     . ID=enriched_region_3602
#> 3668  0.4346992      .     . ID=enriched_region_3603
#> 3669  0.6327093      .     . ID=enriched_region_3604
#> 3670  0.6201667      .     . ID=enriched_region_3605
#> 3671  0.7664176      .     . ID=enriched_region_3606
#> 3672  0.7679577      .     . ID=enriched_region_3607
#> 3673  1.3605172      .     . ID=enriched_region_3608
#> 3674  0.9420372      .     . ID=enriched_region_3609
#> 3675  0.6100194      .     . ID=enriched_region_3610
#> 3676  0.7189765      .     . ID=enriched_region_3611
#> 3677  0.8626959      .     . ID=enriched_region_3612
#> 3678  0.6364150      .     . ID=enriched_region_3613
#> 3679  0.3669820      .     . ID=enriched_region_3614
#> 3680  0.6729636      .     . ID=enriched_region_3615
#> 3681  0.6178750      .     . ID=enriched_region_3616
#> 3682  1.2619022      .     . ID=enriched_region_3617
#> 3683  0.5327790      .     . ID=enriched_region_3618
#> 3684  0.4524986      .     . ID=enriched_region_3619
#> 3685  0.6947592      .     . ID=enriched_region_3620
#> 3686  0.8876236      .     . ID=enriched_region_3621
#> 3687  0.6987820      .     . ID=enriched_region_3622
#> 3688  1.1881942      .     . ID=enriched_region_3623
#> 3689  1.5393651      .     . ID=enriched_region_3624
#> 3690  1.0198653      .     . ID=enriched_region_3625
#> 3691  0.6345471      .     . ID=enriched_region_3626
#> 3692  1.0716395      .     . ID=enriched_region_3627
#> 3693  0.5778192      .     . ID=enriched_region_3628
#> 3694  0.3649097      .     . ID=enriched_region_3629
#> 3695  0.4796942      .     . ID=enriched_region_3630
#> 3696  0.5650449      .     . ID=enriched_region_3631
#> 3697  0.8099875      .     . ID=enriched_region_3632
#> 3698  0.8499460      .     . ID=enriched_region_3633
#> 3699  1.8051160      .     . ID=enriched_region_3634
#> 3700  0.7577857      .     . ID=enriched_region_3635
#> 3701  1.7698343      .     . ID=enriched_region_3636
#> 3702  1.0893419      .     . ID=enriched_region_3637
#> 3703  0.9450521      .     . ID=enriched_region_3638
#> 3704  0.9058068      .     . ID=enriched_region_3639
#> 3705  0.3534712      .     . ID=enriched_region_3640
#> 3706  0.9808512      .     . ID=enriched_region_3641
#> 3707  0.9516754      .     . ID=enriched_region_3642
#> 3708  1.4657980      .     . ID=enriched_region_3643
#> 3709  1.1538032      .     . ID=enriched_region_3644
#> 3710  0.7808195      .     . ID=enriched_region_3645
#> 3711  0.7358925      .     . ID=enriched_region_3646
#> 3712  0.7265767      .     . ID=enriched_region_3647
#> 3713  0.9897152      .     . ID=enriched_region_3648
#> 3714  0.4815383      .     . ID=enriched_region_3649
#> 3715  0.6316741      .     . ID=enriched_region_3650
#> 3716  1.5492280      .     . ID=enriched_region_3651
#> 3717  1.0098609      .     . ID=enriched_region_3652
#> 3718  0.8771057      .     . ID=enriched_region_3653
#> 3719  0.8818522      .     . ID=enriched_region_3654
#> 3720  0.7750556      .     . ID=enriched_region_3655
#> 3721  0.7367754      .     . ID=enriched_region_3656
#> 3722  1.0504985      .     . ID=enriched_region_3657
#> 3723  1.0295796      .     . ID=enriched_region_3658
#> 3724  1.1700304      .     . ID=enriched_region_3659
#> 3725  0.5147068      .     . ID=enriched_region_3660
#> 3726  0.4853223      .     . ID=enriched_region_3661
#> 3727  0.9616604      .     . ID=enriched_region_3662
#> 3728  0.3499288      .     . ID=enriched_region_3663
#> 3729  0.6691988      .     . ID=enriched_region_3664
#> 3730  2.2007529      .     . ID=enriched_region_3665
#> 3731  0.7935407      .     . ID=enriched_region_3666
#> 3732  0.6876687      .     . ID=enriched_region_3667
#> 3733  0.8193413      .     . ID=enriched_region_3668
#> 3734  0.6065706      .     . ID=enriched_region_3669
#> 3735  0.4159069      .     . ID=enriched_region_3670
#> 3736  0.7146591      .     . ID=enriched_region_3671
#> 3737  0.7315423      .     . ID=enriched_region_3672
#> 3738  0.8544234      .     . ID=enriched_region_3673
#> 3739  0.4597194      .     . ID=enriched_region_3674
#> 3740  1.3358133      .     . ID=enriched_region_3675
#> 3741  1.3105960      .     . ID=enriched_region_3676
#> 3742  1.0286131      .     . ID=enriched_region_3677
#> 3743  1.4863368      .     . ID=enriched_region_3678
#> 3744  0.7234573      .     . ID=enriched_region_3679
#> 3745  0.5541341      .     . ID=enriched_region_3680
#> 3746  0.6207629      .     . ID=enriched_region_3681
#> 3747  0.6706250      .     . ID=enriched_region_3682
#> 3748  0.6858422      .     . ID=enriched_region_3683
#> 3749  0.6563083      .     . ID=enriched_region_3684
#> 3750  0.5152913      .     . ID=enriched_region_3685
#> 3751  0.7825331      .     . ID=enriched_region_3686
#> 3752  0.5082847      .     . ID=enriched_region_3687
#> 3753  0.6343993      .     . ID=enriched_region_3688
#> 3754  0.8859079      .     . ID=enriched_region_3689
#> 3755  0.9029453      .     . ID=enriched_region_3690
#> 3756  0.8760186      .     . ID=enriched_region_3691
#> 3757  0.4423912      .     . ID=enriched_region_3692
#> 3758  0.5466804      .     . ID=enriched_region_3693
#> 3759  0.7207095      .     . ID=enriched_region_3694
#> 3760  1.8352868      .     . ID=enriched_region_3695
#> 3761  0.6393102      .     . ID=enriched_region_3696
#> 3762  0.6375614      .     . ID=enriched_region_3697
#> 3763  0.6885897      .     . ID=enriched_region_3698
#> 3764  0.8353384      .     . ID=enriched_region_3699
#> 3765  0.5495391      .     . ID=enriched_region_3700
#> 3766  1.0196128      .     . ID=enriched_region_3701
#> 3767  0.9263817      .     . ID=enriched_region_3702
#> 3768  1.0938849      .     . ID=enriched_region_3703
#> 3769  0.6652083      .     . ID=enriched_region_3704
#> 3770  0.6741487      .     . ID=enriched_region_3705
#> 3771  0.7512611      .     . ID=enriched_region_3706
#> 3772  0.4198898      .     . ID=enriched_region_3707
#> 3773  0.5179696      .     . ID=enriched_region_3708
#> 3774  0.4844641      .     . ID=enriched_region_3709
#> 3775  0.7848763      .     . ID=enriched_region_3710
#> 3776  1.2813342      .     . ID=enriched_region_3711
#> 3777  0.7001472      .     . ID=enriched_region_3712
#> 3778  1.8591207      .     . ID=enriched_region_3713
#> 3779  0.6462238      .     . ID=enriched_region_3714
#> 3780  0.6004700      .     . ID=enriched_region_3715
#> 3781  0.4893372      .     . ID=enriched_region_3716
#> 3782  0.6982676      .     . ID=enriched_region_3717
#> 3783  0.7066343      .     . ID=enriched_region_3718
#> 3784  0.7871033      .     . ID=enriched_region_3719
#> 3785  0.6309130      .     . ID=enriched_region_3720
#> 3786  0.9074770      .     . ID=enriched_region_3721
#> 3787  0.8318739      .     . ID=enriched_region_3722
#> 3788  0.5668466      .     . ID=enriched_region_3723
#> 3789  0.5031544      .     . ID=enriched_region_3724
#> 3790  0.5421439      .     . ID=enriched_region_3725
#> 3791  0.8363724      .     . ID=enriched_region_3726
#> 3792  0.7930714      .     . ID=enriched_region_3727
#> 3793  0.4240345      .     . ID=enriched_region_3728
#> 3794  0.8798483      .     . ID=enriched_region_3729
#> 3795  0.6881182      .     . ID=enriched_region_3730
#> 3796  0.6008825      .     . ID=enriched_region_3731
#> 3797  0.8768269      .     . ID=enriched_region_3732
#> 3798  0.7682056      .     . ID=enriched_region_3733
#> 3799  0.4275596      .     . ID=enriched_region_3734
#> 3800  0.5601281      .     . ID=enriched_region_3735
#> 3801  0.7605974      .     . ID=enriched_region_3736
#> 3802  0.3852228      .     . ID=enriched_region_3737
#> 3803  0.8177564      .     . ID=enriched_region_3738
#> 3804  0.9257879      .     . ID=enriched_region_3739
#> 3805  0.6402013      .     . ID=enriched_region_3740
#> 3806  0.7494366      .     . ID=enriched_region_3741
#> 3807  0.5479153      .     . ID=enriched_region_3742
#> 3808  1.2372777      .     . ID=enriched_region_3743
#> 3809  1.5993868      .     . ID=enriched_region_3744
#> 3810  1.9197678      .     . ID=enriched_region_3745
#> 3811  1.0173495      .     . ID=enriched_region_3746
#> 3812  0.8413536      .     . ID=enriched_region_3747
#> 3813  0.4650777      .     . ID=enriched_region_3748
#> 3814  1.1399830      .     . ID=enriched_region_3749
#> 3815  0.6117198      .     . ID=enriched_region_3750
#> 3816  1.0377011      .     . ID=enriched_region_3751
#> 3817  1.3153330      .     . ID=enriched_region_3752
#> 3818  0.7090450      .     . ID=enriched_region_3753
#> 3819  0.5930333      .     . ID=enriched_region_3754
#> 3820  0.8070486      .     . ID=enriched_region_3755
#> 3821  0.3625278      .     . ID=enriched_region_3756
#> 3822  0.6357272      .     . ID=enriched_region_3757
#> 3823  0.6894710      .     . ID=enriched_region_3758
#> 3824  0.4770391      .     . ID=enriched_region_3759
#> 3825  0.3776603      .     . ID=enriched_region_3760
#> 3826  0.7566113      .     . ID=enriched_region_3761
#> 3827  0.6163365      .     . ID=enriched_region_3762
#> 3828  1.5965553      .     . ID=enriched_region_3763
#> 3829  0.7170450      .     . ID=enriched_region_3764
#> 3830  0.7304269      .     . ID=enriched_region_3765
#> 3831  1.7094876      .     . ID=enriched_region_3766
#> 3832  0.6382305      .     . ID=enriched_region_3767
#> 3833  0.4571045      .     . ID=enriched_region_3768
#> 3834  0.6701221      .     . ID=enriched_region_3769
#> 3835  0.6515181      .     . ID=enriched_region_3770
#> 3836  0.5679215      .     . ID=enriched_region_3771
#> 3837  0.5619066      .     . ID=enriched_region_3772
#> 3838  0.8340920      .     . ID=enriched_region_3773
#> 3839  0.6023557      .     . ID=enriched_region_3774
#> 3840  0.8434778      .     . ID=enriched_region_3775
#> 3841  0.3375814      .     . ID=enriched_region_3776
#> 3842  0.5795597      .     . ID=enriched_region_3777
#> 3843  0.6506297      .     . ID=enriched_region_3778
#> 3844  0.5475456      .     . ID=enriched_region_3779
#> 3845  0.5680271      .     . ID=enriched_region_3780
#> 3846  0.5010175      .     . ID=enriched_region_3781
#> 3847  0.8174319      .     . ID=enriched_region_3782
#> 3848  0.7885652      .     . ID=enriched_region_3783
#> 3849  0.8558194      .     . ID=enriched_region_3784
#> 3850  0.8747716      .     . ID=enriched_region_3785
#> 3851  0.8257484      .     . ID=enriched_region_3786
#> 3852  0.7069083      .     . ID=enriched_region_3787
#> 3853  0.6321350      .     . ID=enriched_region_3788
#> 3854  0.5171174      .     . ID=enriched_region_3789
#> 3855  0.5526823      .     . ID=enriched_region_3790
#> 3856  0.3846505      .     . ID=enriched_region_3791
#> 3857  0.4160462      .     . ID=enriched_region_3792
#> 3858  0.4434589      .     . ID=enriched_region_3793
#> 3859  0.7492197      .     . ID=enriched_region_3794
#> 3860  1.0423693      .     . ID=enriched_region_3795
#> 3861  0.4130358      .     . ID=enriched_region_3796
#> 3862  0.5875429      .     . ID=enriched_region_3797
#> 3863  1.1063612      .     . ID=enriched_region_3798
#> 3864  0.5253939      .     . ID=enriched_region_3799
#> 3865  0.8873464      .     . ID=enriched_region_3800
#> 3866  0.5956450      .     . ID=enriched_region_3801
#> 3867  0.5919976      .     . ID=enriched_region_3802
#> 3868  0.6784934      .     . ID=enriched_region_3803
#> 3869  1.0755134      .     . ID=enriched_region_3804
#> 3870  0.6188781      .     . ID=enriched_region_3805
#> 3871  0.8627696      .     . ID=enriched_region_3806
#> 3872  0.4098920      .     . ID=enriched_region_3807
#> 3873  0.5987230      .     . ID=enriched_region_3808
#> 3874  0.6440614      .     . ID=enriched_region_3809
#> 3875  1.1285425      .     . ID=enriched_region_3810
#> 3876  0.7162380      .     . ID=enriched_region_3811
#> 3877  0.4393491      .     . ID=enriched_region_3812
#> 3878  0.6416278      .     . ID=enriched_region_3813
#> 3879  1.7154330      .     . ID=enriched_region_3814
#> 3880  0.9174562      .     . ID=enriched_region_3815
#> 3881  0.5581704      .     . ID=enriched_region_3816
#> 3882  0.5043971      .     . ID=enriched_region_3817
#> 3883  0.6319251      .     . ID=enriched_region_3818
#> 3884  1.0228819      .     . ID=enriched_region_3819
#> 3885  0.4221424      .     . ID=enriched_region_3820
#> 3886  0.8298596      .     . ID=enriched_region_3821
#> 3887  0.7087757      .     . ID=enriched_region_3822
#> 3888  0.5271885      .     . ID=enriched_region_3823
#> 3889  0.6540732      .     . ID=enriched_region_3824
#> 3890  0.7127034      .     . ID=enriched_region_3825
#> 3891  0.9479827      .     . ID=enriched_region_3826
#> 3892  0.7652910      .     . ID=enriched_region_3827
#> 3893  1.6168160      .     . ID=enriched_region_3828
#> 3894  0.6568504      .     . ID=enriched_region_3829
#> 3895  0.8737129      .     . ID=enriched_region_3830
#> 3896  0.7736791      .     . ID=enriched_region_3831
#> 3897  0.5172618      .     . ID=enriched_region_3832
#> 3898  1.5602261      .     . ID=enriched_region_3833
#> 3899  2.1353222      .     . ID=enriched_region_3834
#> 3900  0.6273222      .     . ID=enriched_region_3835
#> 3901  0.9275610      .     . ID=enriched_region_3836
#> 3902  0.8687956      .     . ID=enriched_region_3837
#> 3903  0.6508532      .     . ID=enriched_region_3838
#> 3904  0.8792783      .     . ID=enriched_region_3839
#> 3905  0.9316820      .     . ID=enriched_region_3840
#> 3906  0.4942096      .     . ID=enriched_region_3841
#> 3907  1.0410844      .     . ID=enriched_region_3842
#> 3908  0.6964815      .     . ID=enriched_region_3843
#> 3909  0.4648671      .     . ID=enriched_region_3844
#> 3910  0.8372667      .     . ID=enriched_region_3845
#> 3911  0.9959562      .     . ID=enriched_region_3846
#> 3912  0.9659799      .     . ID=enriched_region_3847
#> 3913  1.2233247      .     . ID=enriched_region_3848
#> 3914  1.1812072      .     . ID=enriched_region_3849
#> 3915  0.5159771      .     . ID=enriched_region_3850
#> 3916  0.9134577      .     . ID=enriched_region_3851
#> 3917  1.7723729      .     . ID=enriched_region_3852
#> 3918  1.3557811      .     . ID=enriched_region_3853
#> 3919  0.6347352      .     . ID=enriched_region_3854
#> 3920  1.9773062      .     . ID=enriched_region_3855
#> 3921  1.2005806      .     . ID=enriched_region_3856
#> 3922 -0.5700024      .     .   ID=depleted_region_66
#> 3923 -0.5412730      .     .   ID=depleted_region_67
#> 3924 -0.5221039      .     .   ID=depleted_region_68
#> 3925 -0.6106805      .     .   ID=depleted_region_69
#> 3926 -0.5799082      .     .   ID=depleted_region_70
#> 3927 -0.5502417      .     .   ID=depleted_region_71
#> 3928 -0.5208067      .     .   ID=depleted_region_72
#> 3929 -0.4854225      .     .   ID=depleted_region_73
#> 3930 -0.6633459      .     .   ID=depleted_region_74
#> 3931 -0.4773992      .     .   ID=depleted_region_75
#> 3932 -0.5984177      .     .   ID=depleted_region_76
#> 3933 -0.5141094      .     .   ID=depleted_region_77
#> 3934 -0.4838738      .     .   ID=depleted_region_78
#> 3935 -0.5936954      .     .   ID=depleted_region_79
#> 3936 -0.5686779      .     .   ID=depleted_region_80
#> 3937 -0.4944214      .     .   ID=depleted_region_81
#> 3938 -1.0484315      .     .   ID=depleted_region_82
#> 3939 -1.0250679      .     .   ID=depleted_region_83
#> 3940 -1.1896083      .     .   ID=depleted_region_84
#> 3941 -1.3299027      .     .   ID=depleted_region_85
#> 3942  0.5957662      .     . ID=enriched_region_3857
#> 3943  2.0476938      .     . ID=enriched_region_3858
#> 3944  0.9201751      .     . ID=enriched_region_3859
#> 3945  1.0545465      .     . ID=enriched_region_3860
#> 3946  1.3765505      .     . ID=enriched_region_3861
#> 3947  0.7182077      .     . ID=enriched_region_3862
#> 3948  0.5283345      .     . ID=enriched_region_3863
#> 3949  1.6201354      .     . ID=enriched_region_3864
#> 3950  1.6070417      .     . ID=enriched_region_3865
#> 3951  0.5395108      .     . ID=enriched_region_3866
#> 3952  0.6238469      .     . ID=enriched_region_3867
#> 3953  1.9454044      .     . ID=enriched_region_3868
#> 3954  0.8481319      .     . ID=enriched_region_3869
#> 3955  0.6271912      .     . ID=enriched_region_3870
#> 3956  1.2768593      .     . ID=enriched_region_3871
st <- "chr3R 2 37 0.13859536\n"
read_wig(st)
#>   seqid start end     score
#> 1 chr3R     2  37 0.1385954
read_wig("data-raw/wiggle_bedtype.wig.gz")
#>     seqid start  end         score
#> 1   chr3R     2   37  0.1385953581
#> 2   chr3R    41   76  0.1465185993
#> 3   chr3R    81  116  0.1545451426
#> 4   chr3R   120  155  0.1642926659
#> 5   chr3R   158  193  0.1839837907
#> 6   chr3R   197  232  0.2312031061
#> 7   chr3R   237  272  0.2682289816
#> 8   chr3R   276  311  0.2470996869
#> 9   chr3R   316  351  0.1723276423
#> 10  chr3R   359  394  0.0817864156
#> 11  chr3R   402  437 -0.0001201868
#> 12  chr3R   441  476 -0.0799136609
#> 13  chr3R   480  515 -0.1541698345
#> 14  chr3R   521  556 -0.2166997964
#> 15  chr3R   559  594 -0.2192474680
#> 16  chr3R   599  634 -0.1887972875
#> 17  chr3R   637  670 -0.1696802793
#> 18  chr3R   671  706 -0.1776613253
#> 19  chr3R   710  745 -0.2021655210
#> 20  chr3R   746  781 -0.2113810545
#> 21  chr3R   782  817 -0.2059290767
#> 22  chr3R   825  860 -0.2028158210
#> 23  chr3R   864  899 -0.2188935761
#> 24  chr3R   908  943 -0.2338571541
#> 25  chr3R   949  984 -0.2271185695
#> 26  chr3R   988 1023 -0.2148247498
#> 27  chr3R  1026 1061 -0.2157083557
#> 28  chr3R  1070 1103 -0.2226407935
#> 29  chr3R  1104 1139 -0.2161687713
#> 30  chr3R  1143 1178 -0.2066534120
#> 31  chr3R  1182 1217 -0.2074818739
#> 32  chr3R  1218 1253 -0.2214974785
#> 33  chr3R  1259 1294 -0.2589892583
#> 34  chr3R  1296 1331 -0.2961612040
#> 35  chr3R  1334 1369 -0.3483180660
#> 36  chr3R  1373 1408 -0.3981577827
#> 37  chr3R  1412 1447 -0.4253919322
#> 38  chr3R  1451 1486 -0.4336053826
#> 39  chr3R  1491 1526 -0.4269835015
#> 40  chr3R  1528 1563 -0.4039818891
#> 41  chr3R  1567 1602 -0.3414940828
#> 42  chr3R  1603 1638 -0.2539414919
#> 43  chr3R  1641 1676 -0.1780342622
#> 44  chr3R  1680 1715 -0.1348469258
#> 45  chr3R  1723 1756 -0.1127027037
#> 46  chr3R  1757 1792 -0.0969893497
#> 47  chr3R  1796 1831 -0.0979955465
#> 48  chr3R  1835 1870 -0.0987385404
#> 49  chr3R  1874 1909 -0.1001919638
#> 50  chr3R  1911 1946 -0.0966900556
#> 51  chr3R  1949 1984 -0.1072339120
#> 52  chr3R  2246 2280  0.0075643254
#> 53  chr3R  2281 2316 -0.0198417055
#> 54  chr3R  2318 2353 -0.0517804736
#> 55  chr3R  2361 2396 -0.0665080032
#> 56  chr3R  2404 2439 -0.0810197502
#> 57  chr3R  2442 2477 -0.1036061093
#> 58  chr3R  2481 2516 -0.1537474766
#> 59  chr3R  2524 2559 -0.1957645064
#> 60  chr3R  2568 2603 -0.2199304818
#> 61  chr3R  2610 2645 -0.1884440588
#> 62  chr3R  2648 2683 -0.1315234921
#> 63  chr3R  2691 2726 -0.0662215612
#> 64  chr3R  2727 2762 -0.0290297075
#> 65  chr3R  2768 2803 -0.0119348492
#> 66  chr3R  2805 2840 -0.0151932996
#> 67  chr3R  2846 2881 -0.0231924534
#> 68  chr3R  2886 2921 -0.0435626350
#> 69  chr3R  2922 2957 -0.0713897005
#> 70  chr3R  2963 2998 -0.1061060030
#> 71  chr3R  3005 3039 -0.1183896789
#> 72  chr3R  3040 3075 -0.1102052253
#> 73  chr3R  3079 3114 -0.1119942695
#> 74  chr3R  3119 3152 -0.1338991533
#> 75  chr3R  3153 3188 -0.1703917780
#> 76  chr3R  3189 3224 -0.1990830651
#> 77  chr3R  3228 3263 -0.1983808135
#> 78  chr3R  3265 3300 -0.1726394284
#> 79  chr3R  3304 3339 -0.1626586164
#> 80  chr3R  3345 3380 -0.2046032500
#> 81  chr3R  3388 3423 -0.2395550256
#> 82  chr3R  3424 3459 -0.2609986522
#> 83  chr3R  3464 3499 -0.2713917686
#> 84  chr3R  3506 3541 -0.2792018894
#> 85  chr3R  3594 3628 -0.2966108983
#> 86  chr3R  3629 3664 -0.3027317198
#> 87  chr3R  4269 4304  0.0473661570
#> 88  chr3R  4307 4342  0.0465595296
#> 89  chr3R  4350 4385  0.0454995796
#> 90  chr3R  4388 4422  0.0428496000
#> 91  chr3R  4423 4458  0.0366144461
#> 92  chr3R  4462 4497  0.0248052509
#> 93  chr3R  4500 4535  0.0077043585
#> 94  chr3R  4540 4575 -0.0095962894
#> 95  chr3R  4579 4614 -0.0201169679
#> 96  chr3R  4616 4651 -0.0208845260
#> 97  chr3R  4652 4687 -0.0307253742
#> 98  chr3R  4689 4724 -0.0549639135
#> 99  chr3R  4727 4762 -0.0961983020
#> 100 chr3R  4765 4800 -0.1345662010
# read_bed("data-raw/six_col.bed.gz") # no eg data yet.
```

### how to extend:

1. make a `skel_*()` that outputs named `list` that can be passed as the arguments to `do_read()`. Give it a class of `"input_list"`
2. write necessary `infer_*()` functions to modify and or validate any intricacies to the format.
3. test, examples, etc.
