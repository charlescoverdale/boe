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
  cache = TRUE,
  include_student_loans = FALSE
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

- include_student_loans:

  Logical. If `FALSE` (default), the monthly headline series excluding
  the Student Loans Company are used (`LPMBI2O`, `LPMVZRJ`, `LPMB4TS`).
  If `TRUE`, the annually updated series including student loans are
  used (`LPMVZRI`, `LPMVZRJ`, `LPMVZRK`); note their most recent months
  trail the headline measure. Credit cards are identical under both
  measures.

## Value

A data frame with columns:

- date:

  Date. End of month.

- type:

  Character. Credit type.

- amount_gbp_m:

  Numeric. Outstanding amount (millions of pounds).

## Details

By default the headline measure excluding the Student Loans Company is
returned. This is the measure updated every month in the Bank's Money
and Credit release. The alternative measure including student loans is
only updated once a year, when the Student Loans Company publishes its
data, so its recent months lag the headline measure by up to a year;
request it with `include_student_loans = TRUE`.

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
#> ✔ Downloading from Bank of England [640ms]
#> 
#> # BoE [boe_consumer_credit]: 3 series [LPMBI2O,LPMVZRJ,LPMB4TS] · 423 obs · 2015-01-01 to 2026-11-09 · freq=monthly
#>           date        type amount_gbp_m
#> 1   2015-01-31 credit_card        61303
#> 2   2015-02-28 credit_card        61417
#> 3   2015-03-31 credit_card        61520
#> 4   2015-04-30 credit_card        61777
#> 5   2015-05-31 credit_card        61796
#> 6   2015-06-30 credit_card        61938
#> 7   2015-07-31 credit_card        62597
#> 8   2015-08-31 credit_card        62537
#> 9   2015-09-30 credit_card        62697
#> 10  2015-10-31 credit_card        62821
#> 11  2015-11-30 credit_card        63118
#> 12  2015-12-31 credit_card        63436
#> 13  2016-01-31 credit_card        63745
#> 14  2016-02-29 credit_card        63795
#> 15  2016-03-31 credit_card        64343
#> 16  2016-04-30 credit_card        64322
#> 17  2016-05-31 credit_card        64770
#> 18  2016-06-30 credit_card        65074
#> 19  2016-07-31 credit_card        65394
#> 20  2016-08-31 credit_card        65727
#> 21  2016-09-30 credit_card        65646
#> 22  2016-10-31 credit_card        66276
#> 23  2016-11-30 credit_card        66577
#> 24  2016-12-31 credit_card        66767
#> 25  2017-01-31 credit_card        66989
#> 26  2017-02-28 credit_card        67297
#> 27  2017-03-31 credit_card        67659
#> 28  2017-04-30 credit_card        68015
#> 29  2017-05-31 credit_card        68135
#> 30  2017-06-30 credit_card        68375
#> 31  2017-07-31 credit_card        68713
#> 32  2017-08-31 credit_card        68932
#> 33  2017-09-30 credit_card        69331
#> 34  2017-10-31 credit_card        69591
#> 35  2017-11-30 credit_card        70016
#> 36  2017-12-31 credit_card        70311
#> 37  2018-01-31 credit_card        70373
#> 38  2018-02-28 credit_card        70804
#> 39  2018-03-31 credit_card        70794
#> 40  2018-04-30 credit_card        71240
#> 41  2018-05-31 credit_card        71591
#> 42  2018-06-30 credit_card        71986
#> 43  2018-07-31 credit_card        71947
#> 44  2018-08-31 credit_card        72132
#> 45  2018-09-30 credit_card        72237
#> 46  2018-10-31 credit_card        72217
#> 47  2018-11-30 credit_card        72366
#> 48  2018-12-31 credit_card        72291
#> 49  2019-01-31 credit_card        72507
#> 50  2019-02-28 credit_card        72757
#> 51  2019-03-31 credit_card        72805
#> 52  2019-04-30 credit_card        72781
#> 53  2019-05-31 credit_card        72889
#> 54  2019-06-30 credit_card        72810
#> 55  2019-07-31 credit_card        72372
#> 56  2019-08-31 credit_card        72356
#> 57  2019-09-30 credit_card        72286
#> 58  2019-10-31 credit_card        72300
#> 59  2019-11-30 credit_card        71958
#> 60  2019-12-31 credit_card        72227
#> 61  2020-01-31 credit_card        72394
#> 62  2020-02-29 credit_card        72016
#> 63  2020-03-31 credit_card        69460
#> 64  2020-04-30 credit_card        64301
#> 65  2020-05-31 credit_card        62304
#> 66  2020-06-30 credit_card        61669
#> 67  2020-07-31 credit_card        62297
#> 68  2020-08-31 credit_card        62348
#> 69  2020-09-30 credit_card        61300
#> 70  2020-10-31 credit_card        60408
#> 71  2020-11-30 credit_card        59157
#> 72  2020-12-31 credit_card        58180
#> 73  2021-01-31 credit_card        56786
#> 74  2021-02-28 credit_card        55813
#> 75  2021-03-31 credit_card        55782
#> 76  2021-04-30 credit_card        55780
#> 77  2021-05-31 credit_card        56375
#> 78  2021-06-30 credit_card        56362
#> 79  2021-07-31 credit_card        57007
#> 80  2021-08-31 credit_card        57299
#> 81  2021-09-30 credit_card        57769
#> 82  2021-10-31 credit_card        58321
#> 83  2021-11-30 credit_card        58842
#> 84  2021-12-31 credit_card        58533
#> 85  2022-01-31 credit_card        58649
#> 86  2022-02-28 credit_card        59396
#> 87  2022-03-31 credit_card        60035
#> 88  2022-04-30 credit_card        60623
#> 89  2022-05-31 credit_card        61136
#> 90  2022-06-30 credit_card        61303
#> 91  2022-07-31 credit_card        61747
#> 92  2022-08-31 credit_card        62173
#> 93  2022-09-30 credit_card        62211
#> 94  2022-10-31 credit_card        62596
#> 95  2022-11-30 credit_card        63346
#> 96  2022-12-31 credit_card        63168
#> 97  2023-01-31 credit_card        63870
#> 98  2023-02-28 credit_card        64508
#> 99  2023-03-31 credit_card        64936
#> 100 2023-04-30 credit_card        65548
#> 101 2023-05-31 credit_card        65962
#> 102 2023-06-30 credit_card        66301
#> 103 2023-07-31 credit_card        66675
#> 104 2023-08-31 credit_card        67121
#> 105 2023-09-30 credit_card        67601
#> 106 2023-10-31 credit_card        68001
#> 107 2023-11-30 credit_card        68818
#> 108 2023-12-31 credit_card        69000
#> 109 2024-01-31 credit_card        69416
#> 110 2024-02-29 credit_card        69693
#> 111 2024-03-31 credit_card        70218
#> 112 2024-04-30 credit_card        70141
#> 113 2024-05-31 credit_card        70644
#> 114 2024-06-30 credit_card        70829
#> 115 2024-07-31 credit_card        71098
#> 116 2024-08-31 credit_card        71342
#> 117 2024-09-30 credit_card        71565
#> 118 2024-10-31 credit_card        71965
#> 119 2024-11-30 credit_card        71654
#> 120 2024-12-31 credit_card        71957
#> 121 2025-01-31 credit_card        72583
#> 122 2025-02-28 credit_card        73194
#> 123 2025-03-31 credit_card        73434
#> 124 2025-04-30 credit_card        74338
#> 125 2025-05-31 credit_card        74512
#> 126 2025-06-30 credit_card        74993
#> 127 2025-07-31 credit_card        75575
#> 128 2025-08-31 credit_card        76042
#> 129 2025-09-30 credit_card        76589
#> 130 2025-10-31 credit_card        77021
#> 131 2025-11-30 credit_card        77713
#> 132 2025-12-31 credit_card        78238
#> 133 2026-01-31 credit_card        78868
#> 134 2026-02-28 credit_card        79381
#> 135 2026-03-31 credit_card        79785
#> 136 2026-04-30 credit_card        79611
#> 137 2026-05-31 credit_card        80032
#> 138 2026-06-30 credit_card        81690
#> 139 2026-07-31 credit_card        82360
#> 140 2026-08-31 credit_card        83355
#> 141 2026-09-30 credit_card        83708
#> 142 2015-01-31       other       110190
#> 143 2015-02-28       other       109744
#> 144 2015-03-31       other       111086
#> 145 2015-04-30       other       111326
#> 146 2015-05-31       other       111959
#> 147 2015-06-30       other       112562
#> 148 2015-07-31       other       113557
#> 149 2015-08-31       other       114280
#> 150 2015-09-30       other       113520
#> 151 2015-10-31       other       114442
#> 152 2015-11-30       other       115053
#> 153 2015-12-31       other       115407
#> 154 2016-01-31       other       116461
#> 155 2016-02-29       other       117578
#> 156 2016-03-31       other       118720
#> 157 2016-04-30       other       119429
#> 158 2016-05-31       other       120121
#> 159 2016-06-30       other       121184
#> 160 2016-07-31       other       121696
#> 161 2016-08-31       other       122602
#> 162 2016-09-30       other       123413
#> 163 2016-10-31       other       124155
#> 164 2016-11-30       other       125785
#> 165 2016-12-31       other       126434
#> 166 2017-01-31       other       127416
#> 167 2017-02-28       other       128704
#> 168 2017-03-31       other       130050
#> 169 2017-04-30       other       130542
#> 170 2017-05-31       other       131884
#> 171 2017-06-30       other       132549
#> 172 2017-07-31       other       133270
#> 173 2017-08-31       other       134254
#> 174 2017-09-30       other       135323
#> 175 2017-10-31       other       136426
#> 176 2017-11-30       other       137327
#> 177 2017-12-31       other       138401
#> 178 2018-01-31       other       138715
#> 179 2018-02-28       other       140070
#> 180 2018-03-31       other       140887
#> 181 2018-04-30       other       141686
#> 182 2018-05-31       other       142571
#> 183 2018-06-30       other       143264
#> 184 2018-07-31       other       143804
#> 185 2018-08-31       other       144511
#> 186 2018-09-30       other       145648
#> 187 2018-10-31       other       145745
#> 188 2018-11-30       other       146285
#> 189 2018-12-31       other       146778
#> 190 2019-01-31       other       147469
#> 191 2019-02-28       other       147185
#> 192 2019-03-31       other       147829
#> 193 2019-04-30       other       148283
#> 194 2019-05-31       other       148624
#> 195 2019-06-30       other       149237
#> 196 2019-07-31       other       149762
#> 197 2019-08-31       other       151775
#> 198 2019-09-30       other       152211
#> 199 2019-10-31       other       152733
#> 200 2019-11-30       other       153355
#> 201 2019-12-31       other       152084
#> 202 2020-01-31       other       152545
#> 203 2020-02-29       other       153191
#> 204 2020-03-31       other       151901
#> 205 2020-04-30       other       148319
#> 206 2020-05-31       other       145584
#> 207 2020-06-30       other       145027
#> 208 2020-07-31       other       145300
#> 209 2020-08-31       other       145223
#> 210 2020-09-30       other       145279
#> 211 2020-10-31       other       145220
#> 212 2020-11-30       other       144126
#> 213 2020-12-31       other       144007
#> 214 2021-01-31       other       143266
#> 215 2021-02-28       other       142787
#> 216 2021-03-31       other       142475
#> 217 2021-04-30       other       140953
#> 218 2021-05-31       other       141010
#> 219 2021-06-30       other       140973
#> 220 2021-07-31       other       141045
#> 221 2021-08-31       other       141246
#> 222 2021-09-30       other       140920
#> 223 2021-10-31       other       139051
#> 224 2021-11-30       other       139370
#> 225 2021-12-31       other       139929
#> 226 2022-01-31       other       139870
#> 227 2022-02-28       other       140095
#> 228 2022-03-31       other       140357
#> 229 2022-04-30       other       141097
#> 230 2022-05-31       other       141307
#> 231 2022-06-30       other       141883
#> 232 2022-07-31       other       142594
#> 233 2022-08-31       other       142740
#> 234 2022-09-30       other       143207
#> 235 2022-10-31       other       143430
#> 236 2022-11-30       other       143418
#> 237 2022-12-31       other       143680
#> 238 2023-01-31       other       145283
#> 239 2023-02-28       other       145997
#> 240 2023-03-31       other       146814
#> 241 2023-04-30       other       147719
#> 242 2023-05-31       other       147831
#> 243 2023-06-30       other       148964
#> 244 2023-07-31       other       149499
#> 245 2023-08-31       other       150244
#> 246 2023-09-30       other       150932
#> 247 2023-10-31       other       151678
#> 248 2023-11-30       other       152544
#> 249 2023-12-31       other       150459
#> 250 2024-01-31       other       151739
#> 251 2024-02-29       other       152449
#> 252 2024-03-31       other       153153
#> 253 2024-04-30       other       156853
#> 254 2024-05-31       other       157989
#> 255 2024-06-30       other       158861
#> 256 2024-07-31       other       159482
#> 257 2024-08-31       other       160058
#> 258 2024-09-30       other       160928
#> 259 2024-10-31       other       160642
#> 260 2024-11-30       other       160865
#> 261 2024-12-31       other       161607
#> 262 2025-01-31       other       162228
#> 263 2025-02-28       other       162637
#> 264 2025-03-31       other       162603
#> 265 2025-04-30       other       163148
#> 266 2025-05-31       other       163698
#> 267 2025-06-30       other       164458
#> 268 2025-07-31       other       165267
#> 269 2025-08-31       other       165999
#> 270 2025-09-30       other       166547
#> 271 2025-10-31       other       167485
#> 272 2025-11-30       other       168486
#> 273 2025-12-31       other       169562
#> 274 2026-01-31       other       170476
#> 275 2026-02-28       other       171183
#> 276 2026-03-31       other       172280
#> 277 2026-04-30       other       173862
#> 278 2026-05-31       other       175042
#> 279 2026-06-30       other       174843
#> 280 2026-07-31       other       175537
#> 281 2026-08-31       other       176497
#> 282 2026-09-30       other       177492
#> 283 2015-01-31       total       171493
#> 284 2015-02-28       total       171160
#> 285 2015-03-31       total       172606
#> 286 2015-04-30       total       173103
#> 287 2015-05-31       total       173755
#> 288 2015-06-30       total       174500
#> 289 2015-07-31       total       176154
#> 290 2015-08-31       total       176817
#> 291 2015-09-30       total       176217
#> 292 2015-10-31       total       177264
#> 293 2015-11-30       total       178171
#> 294 2015-12-31       total       178843
#> 295 2016-01-31       total       180206
#> 296 2016-02-29       total       181373
#> 297 2016-03-31       total       183064
#> 298 2016-04-30       total       183751
#> 299 2016-05-31       total       184891
#> 300 2016-06-30       total       186258
#> 301 2016-07-31       total       187091
#> 302 2016-08-31       total       188328
#> 303 2016-09-30       total       189059
#> 304 2016-10-31       total       190430
#> 305 2016-11-30       total       192362
#> 306 2016-12-31       total       193201
#> 307 2017-01-31       total       194405
#> 308 2017-02-28       total       196002
#> 309 2017-03-31       total       197709
#> 310 2017-04-30       total       198558
#> 311 2017-05-31       total       200019
#> 312 2017-06-30       total       200924
#> 313 2017-07-31       total       201983
#> 314 2017-08-31       total       203187
#> 315 2017-09-30       total       204655
#> 316 2017-10-31       total       206016
#> 317 2017-11-30       total       207343
#> 318 2017-12-31       total       208712
#> 319 2018-01-31       total       209088
#> 320 2018-02-28       total       210875
#> 321 2018-03-31       total       211680
#> 322 2018-04-30       total       212926
#> 323 2018-05-31       total       214163
#> 324 2018-06-30       total       215250
#> 325 2018-07-31       total       215751
#> 326 2018-08-31       total       216643
#> 327 2018-09-30       total       217886
#> 328 2018-10-31       total       217962
#> 329 2018-11-30       total       218651
#> 330 2018-12-31       total       219069
#> 331 2019-01-31       total       219976
#> 332 2019-02-28       total       219942
#> 333 2019-03-31       total       220634
#> 334 2019-04-30       total       221064
#> 335 2019-05-31       total       221512
#> 336 2019-06-30       total       222048
#> 337 2019-07-31       total       222134
#> 338 2019-08-31       total       224131
#> 339 2019-09-30       total       224497
#> 340 2019-10-31       total       225033
#> 341 2019-11-30       total       225313
#> 342 2019-12-31       total       224311
#> 343 2020-01-31       total       224939
#> 344 2020-02-29       total       225207
#> 345 2020-03-31       total       221361
#> 346 2020-04-30       total       212620
#> 347 2020-05-31       total       207888
#> 348 2020-06-30       total       206696
#> 349 2020-07-31       total       207597
#> 350 2020-08-31       total       207571
#> 351 2020-09-30       total       206579
#> 352 2020-10-31       total       205628
#> 353 2020-11-30       total       203283
#> 354 2020-12-31       total       202187
#> 355 2021-01-31       total       200052
#> 356 2021-02-28       total       198600
#> 357 2021-03-31       total       198257
#> 358 2021-04-30       total       196734
#> 359 2021-05-31       total       197385
#> 360 2021-06-30       total       197335
#> 361 2021-07-31       total       198052
#> 362 2021-08-31       total       198545
#> 363 2021-09-30       total       198689
#> 364 2021-10-31       total       197372
#> 365 2021-11-30       total       198213
#> 366 2021-12-31       total       198462
#> 367 2022-01-31       total       198519
#> 368 2022-02-28       total       199491
#> 369 2022-03-31       total       200392
#> 370 2022-04-30       total       201720
#> 371 2022-05-31       total       202444
#> 372 2022-06-30       total       203187
#> 373 2022-07-31       total       204341
#> 374 2022-08-31       total       204913
#> 375 2022-09-30       total       205418
#> 376 2022-10-31       total       206026
#> 377 2022-11-30       total       206764
#> 378 2022-12-31       total       206848
#> 379 2023-01-31       total       209152
#> 380 2023-02-28       total       210504
#> 381 2023-03-31       total       211750
#> 382 2023-04-30       total       213267
#> 383 2023-05-31       total       213793
#> 384 2023-06-30       total       215265
#> 385 2023-07-31       total       216174
#> 386 2023-08-31       total       217366
#> 387 2023-09-30       total       218532
#> 388 2023-10-31       total       219679
#> 389 2023-11-30       total       221362
#> 390 2023-12-31       total       219459
#> 391 2024-01-31       total       221155
#> 392 2024-02-29       total       222142
#> 393 2024-03-31       total       223371
#> 394 2024-04-30       total       226994
#> 395 2024-05-31       total       228634
#> 396 2024-06-30       total       229690
#> 397 2024-07-31       total       230579
#> 398 2024-08-31       total       231400
#> 399 2024-09-30       total       232493
#> 400 2024-10-31       total       232607
#> 401 2024-11-30       total       232519
#> 402 2024-12-31       total       233564
#> 403 2025-01-31       total       234811
#> 404 2025-02-28       total       235832
#> 405 2025-03-31       total       236037
#> 406 2025-04-30       total       237486
#> 407 2025-05-31       total       238210
#> 408 2025-06-30       total       239451
#> 409 2025-07-31       total       240842
#> 410 2025-08-31       total       242041
#> 411 2025-09-30       total       243136
#> 412 2025-10-31       total       244506
#> 413 2025-11-30       total       246199
#> 414 2025-12-31       total       247799
#> 415 2026-01-31       total       249344
#> 416 2026-02-28       total       250565
#> 417 2026-03-31       total       252066
#> 418 2026-04-30       total       253473
#> 419 2026-05-31       total       255073
#> 420 2026-06-30       total       256533
#> 421 2026-07-31       total       257898
#> 422 2026-08-31       total       259852
#> 423 2026-09-30       total       261200
options(op)
# }
```
