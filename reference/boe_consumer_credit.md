# Download consumer credit outstanding

Downloads monthly outstanding amounts of consumer credit (total, credit
cards, and other consumer credit). Seasonally adjusted. Available from
April 1993.

## Usage

``` r
boe_consumer_credit(
  type = c("total", "credit_card", "other"),
  from = "1993-04-01",
  to = Sys.Date(),
  cache = TRUE
)
```

## Source

<https://www.bankofengland.co.uk/boeapps/database/>

## Arguments

- type:

  Character vector. One or more of `"total"`, `"credit_card"`,
  `"other"`. Defaults to all three.

- from:

  Date or character (YYYY-MM-DD). Start date. Defaults to
  `"1993-04-01"`.

- to:

  Date or character (YYYY-MM-DD). End date. Defaults to today.

- cache:

  Logical. Use cached data if available (default `TRUE`).

## Value

A data frame with columns:

- date:

  Date. End of month.

- type:

  Character. Credit type.

- amount_gbp_m:

  Numeric. Outstanding amount (millions of pounds).

## See also

Other credit and housing:
[`boe_mortgage_approvals()`](https://charlescoverdale.github.io/boe/reference/boe_mortgage_approvals.md),
[`boe_mortgage_rates()`](https://charlescoverdale.github.io/boe/reference/boe_mortgage_rates.md)

## Examples

``` r
# \donttest{
op <- options(boe.cache_dir = tempdir())
boe_consumer_credit(from = "2015-01-01")
#> ℹ Downloading from Bank of England
#> ✔ Downloading from Bank of England [614ms]
#> 
#> # BoE [boe_consumer_credit]: 3 series [LPMVZRI,LPMVZRJ,LPMVZRK] · 381 obs · 2015-01-01 to 2026-05-08 · freq=monthly
#>           date        type amount_gbp_m
#> 1   2015-01-31 credit_card        61303
#> 2   2015-02-28 credit_card        61417
#> 3   2015-03-31 credit_card        61519
#> 4   2015-04-30 credit_card        61781
#> 5   2015-05-31 credit_card        61795
#> 6   2015-06-30 credit_card        61938
#> 7   2015-07-31 credit_card        62596
#> 8   2015-08-31 credit_card        62536
#> 9   2015-09-30 credit_card        62696
#> 10  2015-10-31 credit_card        62822
#> 11  2015-11-30 credit_card        63118
#> 12  2015-12-31 credit_card        63437
#> 13  2016-01-31 credit_card        63743
#> 14  2016-02-29 credit_card        63795
#> 15  2016-03-31 credit_card        64346
#> 16  2016-04-30 credit_card        64325
#> 17  2016-05-31 credit_card        64771
#> 18  2016-06-30 credit_card        65076
#> 19  2016-07-31 credit_card        65393
#> 20  2016-08-31 credit_card        65726
#> 21  2016-09-30 credit_card        65645
#> 22  2016-10-31 credit_card        66276
#> 23  2016-11-30 credit_card        66577
#> 24  2016-12-31 credit_card        66768
#> 25  2017-01-31 credit_card        66989
#> 26  2017-02-28 credit_card        67297
#> 27  2017-03-31 credit_card        67659
#> 28  2017-04-30 credit_card        68015
#> 29  2017-05-31 credit_card        68134
#> 30  2017-06-30 credit_card        68374
#> 31  2017-07-31 credit_card        68713
#> 32  2017-08-31 credit_card        68934
#> 33  2017-09-30 credit_card        69332
#> 34  2017-10-31 credit_card        69590
#> 35  2017-11-30 credit_card        70017
#> 36  2017-12-31 credit_card        70310
#> 37  2018-01-31 credit_card        70372
#> 38  2018-02-28 credit_card        70803
#> 39  2018-03-31 credit_card        70797
#> 40  2018-04-30 credit_card        71241
#> 41  2018-05-31 credit_card        71593
#> 42  2018-06-30 credit_card        71988
#> 43  2018-07-31 credit_card        71947
#> 44  2018-08-31 credit_card        72131
#> 45  2018-09-30 credit_card        72236
#> 46  2018-10-31 credit_card        72216
#> 47  2018-11-30 credit_card        72365
#> 48  2018-12-31 credit_card        72291
#> 49  2019-01-31 credit_card        72508
#> 50  2019-02-28 credit_card        72758
#> 51  2019-03-31 credit_card        72805
#> 52  2019-04-30 credit_card        72783
#> 53  2019-05-31 credit_card        72887
#> 54  2019-06-30 credit_card        72810
#> 55  2019-07-31 credit_card        72371
#> 56  2019-08-31 credit_card        72357
#> 57  2019-09-30 credit_card        72286
#> 58  2019-10-31 credit_card        72301
#> 59  2019-11-30 credit_card        71959
#> 60  2019-12-31 credit_card        72227
#> 61  2020-01-31 credit_card        72391
#> 62  2020-02-29 credit_card        72016
#> 63  2020-03-31 credit_card        69461
#> 64  2020-04-30 credit_card        64305
#> 65  2020-05-31 credit_card        62302
#> 66  2020-06-30 credit_card        61671
#> 67  2020-07-31 credit_card        62296
#> 68  2020-08-31 credit_card        62347
#> 69  2020-09-30 credit_card        61298
#> 70  2020-10-31 credit_card        60408
#> 71  2020-11-30 credit_card        59157
#> 72  2020-12-31 credit_card        58180
#> 73  2021-01-31 credit_card        56782
#> 74  2021-02-28 credit_card        55812
#> 75  2021-03-31 credit_card        55782
#> 76  2021-04-30 credit_card        55784
#> 77  2021-05-31 credit_card        56375
#> 78  2021-06-30 credit_card        56363
#> 79  2021-07-31 credit_card        57009
#> 80  2021-08-31 credit_card        57299
#> 81  2021-09-30 credit_card        57768
#> 82  2021-10-31 credit_card        58314
#> 83  2021-11-30 credit_card        58842
#> 84  2021-12-31 credit_card        58531
#> 85  2022-01-31 credit_card        58645
#> 86  2022-02-28 credit_card        59397
#> 87  2022-03-31 credit_card        60039
#> 88  2022-04-30 credit_card        60639
#> 89  2022-05-31 credit_card        61136
#> 90  2022-06-30 credit_card        61305
#> 91  2022-07-31 credit_card        61746
#> 92  2022-08-31 credit_card        62172
#> 93  2022-09-30 credit_card        62208
#> 94  2022-10-31 credit_card        62577
#> 95  2022-11-30 credit_card        63346
#> 96  2022-12-31 credit_card        63170
#> 97  2023-01-31 credit_card        63869
#> 98  2023-02-28 credit_card        64511
#> 99  2023-03-31 credit_card        64939
#> 100 2023-04-30 credit_card        65577
#> 101 2023-05-31 credit_card        65953
#> 102 2023-06-30 credit_card        66292
#> 103 2023-07-31 credit_card        66671
#> 104 2023-08-31 credit_card        67123
#> 105 2023-09-30 credit_card        67603
#> 106 2023-10-31 credit_card        67963
#> 107 2023-11-30 credit_card        68827
#> 108 2023-12-31 credit_card        69010
#> 109 2024-01-31 credit_card        69426
#> 110 2024-02-29 credit_card        69705
#> 111 2024-03-31 credit_card        70224
#> 112 2024-04-30 credit_card        70195
#> 113 2024-05-31 credit_card        70594
#> 114 2024-06-30 credit_card        70801
#> 115 2024-07-31 credit_card        71078
#> 116 2024-08-31 credit_card        71353
#> 117 2024-09-30 credit_card        71571
#> 118 2024-10-31 credit_card        71925
#> 119 2024-11-30 credit_card        71673
#> 120 2024-12-31 credit_card        71984
#> 121 2025-01-31 credit_card        72611
#> 122 2025-02-28 credit_card        73217
#> 123 2025-03-31 credit_card        73446
#> 124 2025-04-30 credit_card        74397
#> 125 2025-05-31 credit_card        74404
#> 126 2025-06-30 credit_card        74940
#> 127 2025-07-31 credit_card        75531
#> 128 2025-08-31 credit_card        76079
#> 129 2025-09-30 credit_card        76595
#> 130 2025-10-31 credit_card        76993
#> 131 2025-11-30 credit_card        77750
#> 132 2025-12-31 credit_card        78287
#> 133 2026-01-31 credit_card        78919
#> 134 2026-02-28 credit_card        79421
#> 135 2026-03-31 credit_card        79797
#> 136 2015-01-31       other       182799
#> 137 2015-02-28       other       183426
#> 138 2015-03-31       other       185627
#> 139 2015-04-30       other       186938
#> 140 2015-05-31       other       188929
#> 141 2015-06-30       other       190437
#> 142 2015-07-31       other       192418
#> 143 2015-08-31       other       194173
#> 144 2015-09-30       other       194287
#> 145 2015-10-31       other       196405
#> 146 2015-11-30       other       198102
#> 147 2015-12-31       other       199482
#> 148 2016-01-31       other       201508
#> 149 2016-02-29       other       203830
#> 150 2016-03-31       other       205889
#> 151 2016-04-30       other       207774
#> 152 2016-05-31       other       210012
#> 153 2016-06-30       other       212208
#> 154 2016-07-31       other       213915
#> 155 2016-08-31       other       215826
#> 156 2016-09-30       other       217800
#> 157 2016-10-31       other       219703
#> 158 2016-11-30       other       222600
#> 159 2016-12-31       other       224478
#> 160 2017-01-31       other       226499
#> 161 2017-02-28       other       229105
#> 162 2017-03-31       other       231698
#> 163 2017-04-30       other       233661
#> 164 2017-05-31       other       236281
#> 165 2017-06-30       other       238319
#> 166 2017-07-31       other       240315
#> 167 2017-08-31       other       242609
#> 168 2017-09-30       other       245020
#> 169 2017-10-31       other       247405
#> 170 2017-11-30       other       249701
#> 171 2017-12-31       other       252162
#> 172 2018-01-31       other       253866
#> 173 2018-02-28       other       256725
#> 174 2018-03-31       other       258992
#> 175 2018-04-30       other       261342
#> 176 2018-05-31       other       263810
#> 177 2018-06-30       other       266177
#> 178 2018-07-31       other       268183
#> 179 2018-08-31       other       270468
#> 180 2018-09-30       other       273098
#> 181 2018-10-31       other       274631
#> 182 2018-11-30       other       276760
#> 183 2018-12-31       other       278666
#> 184 2019-01-31       other       281139
#> 185 2019-02-28       other       282605
#> 186 2019-03-31       other       285036
#> 187 2019-04-30       other       287136
#> 188 2019-05-31       other       288951
#> 189 2019-06-30       other       291391
#> 190 2019-07-31       other       293368
#> 191 2019-08-31       other       297034
#> 192 2019-09-30       other       298943
#> 193 2019-10-31       other       300896
#> 194 2019-11-30       other       303210
#> 195 2019-12-31       other       303404
#> 196 2020-01-31       other       305821
#> 197 2020-02-29       other       308381
#> 198 2020-03-31       other       308839
#> 199 2020-04-30       other       307074
#> 200 2020-05-31       other       306230
#> 201 2020-06-30       other       307459
#> 202 2020-07-31       other       309510
#> 203 2020-08-31       other       311131
#> 204 2020-09-30       other       312620
#> 205 2020-10-31       other       316577
#> 206 2020-11-30       other       317409
#> 207 2020-12-31       other       318936
#> 208 2021-01-31       other       320720
#> 209 2021-02-28       other       320116
#> 210 2021-03-31       other       321540
#> 211 2021-04-30       other       322003
#> 212 2021-05-31       other       324118
#> 213 2021-06-30       other       325862
#> 214 2021-07-31       other       327735
#> 215 2021-08-31       other       329510
#> 216 2021-09-30       other       330961
#> 217 2021-10-31       other       331168
#> 218 2021-11-30       other       333099
#> 219 2021-12-31       other       335408
#> 220 2022-01-31       other       337544
#> 221 2022-02-28       other       339965
#> 222 2022-03-31       other       342173
#> 223 2022-04-30       other       345051
#> 224 2022-05-31       other       347464
#> 225 2022-06-30       other       350253
#> 226 2022-07-31       other       353124
#> 227 2022-08-31       other       355152
#> 228 2022-09-30       other       357735
#> 229 2022-10-31       other       359937
#> 230 2022-11-30       other       362126
#> 231 2022-12-31       other       364403
#> 232 2023-01-31       other       368284
#> 233 2023-02-28       other       371382
#> 234 2023-03-31       other       374706
#> 235 2023-04-30       other       378156
#> 236 2023-05-31       other       380689
#> 237 2023-06-30       other       384681
#> 238 2023-07-31       other       387712
#> 239 2023-08-31       other       391247
#> 240 2023-09-30       other       394838
#> 241 2023-10-31       other       398022
#> 242 2023-11-30       other       401748
#> 243 2023-12-31       other       402688
#> 244 2024-01-31       other       406804
#> 245 2024-02-29       other       410428
#> 246 2024-03-31       other       414271
#> 247 2024-04-30       other       420010
#> 248 2024-05-31       other       424215
#> 249 2024-06-30       other       427826
#> 250 2024-07-31       other       430938
#> 251 2024-08-31       other       434546
#> 252 2024-09-30       other       438039
#> 253 2024-10-31       other       440365
#> 254 2024-11-30       other       443612
#> 255 2024-12-31       other       446949
#> 256 2025-01-31       other       450659
#> 257 2025-02-28       other       453881
#> 258 2025-03-31       other       456575
#> 259 2015-01-31       total       244102
#> 260 2015-02-28       total       244843
#> 261 2015-03-31       total       247146
#> 262 2015-04-30       total       248718
#> 263 2015-05-31       total       250723
#> 264 2015-06-30       total       252374
#> 265 2015-07-31       total       255014
#> 266 2015-08-31       total       256709
#> 267 2015-09-30       total       256984
#> 268 2015-10-31       total       259227
#> 269 2015-11-30       total       261220
#> 270 2015-12-31       total       262918
#> 271 2016-01-31       total       265251
#> 272 2016-02-29       total       267624
#> 273 2016-03-31       total       270234
#> 274 2016-04-30       total       272099
#> 275 2016-05-31       total       274782
#> 276 2016-06-30       total       277283
#> 277 2016-07-31       total       279308
#> 278 2016-08-31       total       281552
#> 279 2016-09-30       total       283445
#> 280 2016-10-31       total       285979
#> 281 2016-11-30       total       289177
#> 282 2016-12-31       total       291246
#> 283 2017-01-31       total       293488
#> 284 2017-02-28       total       296402
#> 285 2017-03-31       total       299357
#> 286 2017-04-30       total       301676
#> 287 2017-05-31       total       304415
#> 288 2017-06-30       total       306694
#> 289 2017-07-31       total       309028
#> 290 2017-08-31       total       311543
#> 291 2017-09-30       total       314352
#> 292 2017-10-31       total       316995
#> 293 2017-11-30       total       319718
#> 294 2017-12-31       total       322471
#> 295 2018-01-31       total       324238
#> 296 2018-02-28       total       327527
#> 297 2018-03-31       total       329789
#> 298 2018-04-30       total       332584
#> 299 2018-05-31       total       335403
#> 300 2018-06-30       total       338165
#> 301 2018-07-31       total       340131
#> 302 2018-08-31       total       342598
#> 303 2018-09-30       total       345334
#> 304 2018-10-31       total       346847
#> 305 2018-11-30       total       349125
#> 306 2018-12-31       total       350958
#> 307 2019-01-31       total       353647
#> 308 2019-02-28       total       355362
#> 309 2019-03-31       total       357841
#> 310 2019-04-30       total       359918
#> 311 2019-05-31       total       361837
#> 312 2019-06-30       total       364201
#> 313 2019-07-31       total       365739
#> 314 2019-08-31       total       369391
#> 315 2019-09-30       total       371229
#> 316 2019-10-31       total       373198
#> 317 2019-11-30       total       375169
#> 318 2019-12-31       total       375631
#> 319 2020-01-31       total       378212
#> 320 2020-02-29       total       380397
#> 321 2020-03-31       total       378299
#> 322 2020-04-30       total       371380
#> 323 2020-05-31       total       368532
#> 324 2020-06-30       total       369129
#> 325 2020-07-31       total       371806
#> 326 2020-08-31       total       373478
#> 327 2020-09-30       total       373918
#> 328 2020-10-31       total       376985
#> 329 2020-11-30       total       376566
#> 330 2020-12-31       total       377116
#> 331 2021-01-31       total       377501
#> 332 2021-02-28       total       375928
#> 333 2021-03-31       total       377322
#> 334 2021-04-30       total       377788
#> 335 2021-05-31       total       380493
#> 336 2021-06-30       total       382225
#> 337 2021-07-31       total       384744
#> 338 2021-08-31       total       386810
#> 339 2021-09-30       total       388730
#> 340 2021-10-31       total       389482
#> 341 2021-11-30       total       391941
#> 342 2021-12-31       total       393939
#> 343 2022-01-31       total       396189
#> 344 2022-02-28       total       399361
#> 345 2022-03-31       total       402212
#> 346 2022-04-30       total       405690
#> 347 2022-05-31       total       408600
#> 348 2022-06-30       total       411558
#> 349 2022-07-31       total       414870
#> 350 2022-08-31       total       417324
#> 351 2022-09-30       total       419943
#> 352 2022-10-31       total       422515
#> 353 2022-11-30       total       425472
#> 354 2022-12-31       total       427573
#> 355 2023-01-31       total       432153
#> 356 2023-02-28       total       435893
#> 357 2023-03-31       total       439645
#> 358 2023-04-30       total       443734
#> 359 2023-05-31       total       446642
#> 360 2023-06-30       total       450973
#> 361 2023-07-31       total       454382
#> 362 2023-08-31       total       458370
#> 363 2023-09-30       total       462441
#> 364 2023-10-31       total       465986
#> 365 2023-11-30       total       470575
#> 366 2023-12-31       total       471698
#> 367 2024-01-31       total       476230
#> 368 2024-02-29       total       480133
#> 369 2024-03-31       total       484495
#> 370 2024-04-30       total       490205
#> 371 2024-05-31       total       494809
#> 372 2024-06-30       total       498627
#> 373 2024-07-31       total       502016
#> 374 2024-08-31       total       505899
#> 375 2024-09-30       total       509610
#> 376 2024-10-31       total       512290
#> 377 2024-11-30       total       515286
#> 378 2024-12-31       total       518933
#> 379 2025-01-31       total       523270
#> 380 2025-02-28       total       527098
#> 381 2025-03-31       total       530022
options(op)
# }
```
