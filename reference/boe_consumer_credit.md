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
#> ✔ Downloading from Bank of England [587ms]
#> 
#> # BoE [boe_consumer_credit]: 3 series [LPMBI2O,LPMVZRJ,LPMB4TS] · 417 obs · 2015-01-01 to 2026-09-19 · freq=monthly
#>           date        type amount_gbp_m
#> 1   2015-01-31 credit_card        61303
#> 2   2015-02-28 credit_card        61417
#> 3   2015-03-31 credit_card        61520
#> 4   2015-04-30 credit_card        61777
#> 5   2015-05-31 credit_card        61797
#> 6   2015-06-30 credit_card        61938
#> 7   2015-07-31 credit_card        62595
#> 8   2015-08-31 credit_card        62538
#> 9   2015-09-30 credit_card        62697
#> 10  2015-10-31 credit_card        62821
#> 11  2015-11-30 credit_card        63118
#> 12  2015-12-31 credit_card        63437
#> 13  2016-01-31 credit_card        63747
#> 14  2016-02-29 credit_card        63796
#> 15  2016-03-31 credit_card        64343
#> 16  2016-04-30 credit_card        64320
#> 17  2016-05-31 credit_card        64771
#> 18  2016-06-30 credit_card        65076
#> 19  2016-07-31 credit_card        65396
#> 20  2016-08-31 credit_card        65726
#> 21  2016-09-30 credit_card        65644
#> 22  2016-10-31 credit_card        66277
#> 23  2016-11-30 credit_card        66577
#> 24  2016-12-31 credit_card        66767
#> 25  2017-01-31 credit_card        66989
#> 26  2017-02-28 credit_card        67297
#> 27  2017-03-31 credit_card        67657
#> 28  2017-04-30 credit_card        68016
#> 29  2017-05-31 credit_card        68135
#> 30  2017-06-30 credit_card        68373
#> 31  2017-07-31 credit_card        68714
#> 32  2017-08-31 credit_card        68934
#> 33  2017-09-30 credit_card        69331
#> 34  2017-10-31 credit_card        69591
#> 35  2017-11-30 credit_card        70017
#> 36  2017-12-31 credit_card        70312
#> 37  2018-01-31 credit_card        70372
#> 38  2018-02-28 credit_card        70803
#> 39  2018-03-31 credit_card        70791
#> 40  2018-04-30 credit_card        71241
#> 41  2018-05-31 credit_card        71593
#> 42  2018-06-30 credit_card        71986
#> 43  2018-07-31 credit_card        71947
#> 44  2018-08-31 credit_card        72130
#> 45  2018-09-30 credit_card        72238
#> 46  2018-10-31 credit_card        72217
#> 47  2018-11-30 credit_card        72365
#> 48  2018-12-31 credit_card        72292
#> 49  2019-01-31 credit_card        72508
#> 50  2019-02-28 credit_card        72757
#> 51  2019-03-31 credit_card        72806
#> 52  2019-04-30 credit_card        72781
#> 53  2019-05-31 credit_card        72887
#> 54  2019-06-30 credit_card        72812
#> 55  2019-07-31 credit_card        72372
#> 56  2019-08-31 credit_card        72356
#> 57  2019-09-30 credit_card        72286
#> 58  2019-10-31 credit_card        72301
#> 59  2019-11-30 credit_card        71959
#> 60  2019-12-31 credit_card        72227
#> 61  2020-01-31 credit_card        72392
#> 62  2020-02-29 credit_card        72015
#> 63  2020-03-31 credit_card        69459
#> 64  2020-04-30 credit_card        64302
#> 65  2020-05-31 credit_card        62307
#> 66  2020-06-30 credit_card        61669
#> 67  2020-07-31 credit_card        62296
#> 68  2020-08-31 credit_card        62349
#> 69  2020-09-30 credit_card        61297
#> 70  2020-10-31 credit_card        60407
#> 71  2020-11-30 credit_card        59158
#> 72  2020-12-31 credit_card        58181
#> 73  2021-01-31 credit_card        56789
#> 74  2021-02-28 credit_card        55814
#> 75  2021-03-31 credit_card        55782
#> 76  2021-04-30 credit_card        55779
#> 77  2021-05-31 credit_card        56378
#> 78  2021-06-30 credit_card        56363
#> 79  2021-07-31 credit_card        57008
#> 80  2021-08-31 credit_card        57299
#> 81  2021-09-30 credit_card        57768
#> 82  2021-10-31 credit_card        58318
#> 83  2021-11-30 credit_card        58843
#> 84  2021-12-31 credit_card        58531
#> 85  2022-01-31 credit_card        58653
#> 86  2022-02-28 credit_card        59396
#> 87  2022-03-31 credit_card        60038
#> 88  2022-04-30 credit_card        60623
#> 89  2022-05-31 credit_card        61138
#> 90  2022-06-30 credit_card        61305
#> 91  2022-07-31 credit_card        61749
#> 92  2022-08-31 credit_card        62172
#> 93  2022-09-30 credit_card        62208
#> 94  2022-10-31 credit_card        62580
#> 95  2022-11-30 credit_card        63351
#> 96  2022-12-31 credit_card        63169
#> 97  2023-01-31 credit_card        63877
#> 98  2023-02-28 credit_card        64509
#> 99  2023-03-31 credit_card        64938
#> 100 2023-04-30 credit_card        65549
#> 101 2023-05-31 credit_card        65959
#> 102 2023-06-30 credit_card        66295
#> 103 2023-07-31 credit_card        66674
#> 104 2023-08-31 credit_card        67124
#> 105 2023-09-30 credit_card        67603
#> 106 2023-10-31 credit_card        67970
#> 107 2023-11-30 credit_card        68835
#> 108 2023-12-31 credit_card        69009
#> 109 2024-01-31 credit_card        69428
#> 110 2024-02-29 credit_card        69701
#> 111 2024-03-31 credit_card        70225
#> 112 2024-04-30 credit_card        70139
#> 113 2024-05-31 credit_card        70630
#> 114 2024-06-30 credit_card        70815
#> 115 2024-07-31 credit_card        71078
#> 116 2024-08-31 credit_card        71355
#> 117 2024-09-30 credit_card        71574
#> 118 2024-10-31 credit_card        71931
#> 119 2024-11-30 credit_card        71680
#> 120 2024-12-31 credit_card        71974
#> 121 2025-01-31 credit_card        72602
#> 122 2025-02-28 credit_card        73205
#> 123 2025-03-31 credit_card        73442
#> 124 2025-04-30 credit_card        74330
#> 125 2025-05-31 credit_card        74483
#> 126 2025-06-30 credit_card        74958
#> 127 2025-07-31 credit_card        75526
#> 128 2025-08-31 credit_card        76086
#> 129 2025-09-30 credit_card        76596
#> 130 2025-10-31 credit_card        77002
#> 131 2025-11-30 credit_card        77747
#> 132 2025-12-31 credit_card        78265
#> 133 2026-01-31 credit_card        78896
#> 134 2026-02-28 credit_card        79402
#> 135 2026-03-31 credit_card        79791
#> 136 2026-04-30 credit_card        79601
#> 137 2026-05-31 credit_card        79988
#> 138 2026-06-30 credit_card        81624
#> 139 2026-07-31 credit_card        82250
#> 140 2015-01-31       other       110190
#> 141 2015-02-28       other       109743
#> 142 2015-03-31       other       111085
#> 143 2015-04-30       other       111326
#> 144 2015-05-31       other       111960
#> 145 2015-06-30       other       112561
#> 146 2015-07-31       other       113556
#> 147 2015-08-31       other       114280
#> 148 2015-09-30       other       113520
#> 149 2015-10-31       other       114442
#> 150 2015-11-30       other       115053
#> 151 2015-12-31       other       115408
#> 152 2016-01-31       other       116463
#> 153 2016-02-29       other       117578
#> 154 2016-03-31       other       118720
#> 155 2016-04-30       other       119428
#> 156 2016-05-31       other       120120
#> 157 2016-06-30       other       121184
#> 158 2016-07-31       other       121698
#> 159 2016-08-31       other       122602
#> 160 2016-09-30       other       123412
#> 161 2016-10-31       other       124155
#> 162 2016-11-30       other       125785
#> 163 2016-12-31       other       126434
#> 164 2017-01-31       other       127416
#> 165 2017-02-28       other       128703
#> 166 2017-03-31       other       130048
#> 167 2017-04-30       other       130543
#> 168 2017-05-31       other       131884
#> 169 2017-06-30       other       132548
#> 170 2017-07-31       other       133271
#> 171 2017-08-31       other       134255
#> 172 2017-09-30       other       135323
#> 173 2017-10-31       other       136425
#> 174 2017-11-30       other       137328
#> 175 2017-12-31       other       138403
#> 176 2018-01-31       other       138716
#> 177 2018-02-28       other       140072
#> 178 2018-03-31       other       140885
#> 179 2018-04-30       other       141686
#> 180 2018-05-31       other       142572
#> 181 2018-06-30       other       143263
#> 182 2018-07-31       other       143804
#> 183 2018-08-31       other       144509
#> 184 2018-09-30       other       145649
#> 185 2018-10-31       other       145745
#> 186 2018-11-30       other       146283
#> 187 2018-12-31       other       146780
#> 188 2019-01-31       other       147469
#> 189 2019-02-28       other       147189
#> 190 2019-03-31       other       147830
#> 191 2019-04-30       other       148281
#> 192 2019-05-31       other       148622
#> 193 2019-06-30       other       149237
#> 194 2019-07-31       other       149763
#> 195 2019-08-31       other       151774
#> 196 2019-09-30       other       152211
#> 197 2019-10-31       other       152733
#> 198 2019-11-30       other       153355
#> 199 2019-12-31       other       152084
#> 200 2020-01-31       other       152544
#> 201 2020-02-29       other       153195
#> 202 2020-03-31       other       151899
#> 203 2020-04-30       other       148318
#> 204 2020-05-31       other       145584
#> 205 2020-06-30       other       145024
#> 206 2020-07-31       other       145299
#> 207 2020-08-31       other       145224
#> 208 2020-09-30       other       145279
#> 209 2020-10-31       other       145220
#> 210 2020-11-30       other       144129
#> 211 2020-12-31       other       144010
#> 212 2021-01-31       other       143269
#> 213 2021-02-28       other       142793
#> 214 2021-03-31       other       142474
#> 215 2021-04-30       other       140948
#> 216 2021-05-31       other       141006
#> 217 2021-06-30       other       140969
#> 218 2021-07-31       other       141043
#> 219 2021-08-31       other       141245
#> 220 2021-09-30       other       140921
#> 221 2021-10-31       other       139054
#> 222 2021-11-30       other       139374
#> 223 2021-12-31       other       139932
#> 224 2022-01-31       other       139874
#> 225 2022-02-28       other       140101
#> 226 2022-03-31       other       140356
#> 227 2022-04-30       other       141089
#> 228 2022-05-31       other       141296
#> 229 2022-06-30       other       141875
#> 230 2022-07-31       other       142591
#> 231 2022-08-31       other       142742
#> 232 2022-09-30       other       143210
#> 233 2022-10-31       other       143438
#> 234 2022-11-30       other       143428
#> 235 2022-12-31       other       143688
#> 236 2023-01-31       other       145288
#> 237 2023-02-28       other       146001
#> 238 2023-03-31       other       146809
#> 239 2023-04-30       other       147708
#> 240 2023-05-31       other       147812
#> 241 2023-06-30       other       148948
#> 242 2023-07-31       other       149483
#> 243 2023-08-31       other       150255
#> 244 2023-09-30       other       150944
#> 245 2023-10-31       other       151692
#> 246 2023-11-30       other       152560
#> 247 2023-12-31       other       150475
#> 248 2024-01-31       other       151750
#> 249 2024-02-29       other       152454
#> 250 2024-03-31       other       153146
#> 251 2024-04-30       other       156832
#> 252 2024-05-31       other       157954
#> 253 2024-06-30       other       158837
#> 254 2024-07-31       other       159449
#> 255 2024-08-31       other       160081
#> 256 2024-09-30       other       160954
#> 257 2024-10-31       other       160669
#> 258 2024-11-30       other       160888
#> 259 2024-12-31       other       161627
#> 260 2025-01-31       other       162241
#> 261 2025-02-28       other       162638
#> 262 2025-03-31       other       162592
#> 263 2025-04-30       other       163122
#> 264 2025-05-31       other       163652
#> 265 2025-06-30       other       164420
#> 266 2025-07-31       other       165209
#> 267 2025-08-31       other       166042
#> 268 2025-09-30       other       166591
#> 269 2025-10-31       other       167521
#> 270 2025-11-30       other       168520
#> 271 2025-12-31       other       169590
#> 272 2026-01-31       other       170492
#> 273 2026-02-28       other       171183
#> 274 2026-03-31       other       172261
#> 275 2026-04-30       other       173828
#> 276 2026-05-31       other       174987
#> 277 2026-06-30       other       174786
#> 278 2026-07-31       other       175279
#> 279 2015-01-31       total       171493
#> 280 2015-02-28       total       171159
#> 281 2015-03-31       total       172604
#> 282 2015-04-30       total       173103
#> 283 2015-05-31       total       173757
#> 284 2015-06-30       total       174500
#> 285 2015-07-31       total       176151
#> 286 2015-08-31       total       176818
#> 287 2015-09-30       total       176217
#> 288 2015-10-31       total       177264
#> 289 2015-11-30       total       178171
#> 290 2015-12-31       total       178845
#> 291 2016-01-31       total       180209
#> 292 2016-02-29       total       181374
#> 293 2016-03-31       total       183063
#> 294 2016-04-30       total       183749
#> 295 2016-05-31       total       184891
#> 296 2016-06-30       total       186260
#> 297 2016-07-31       total       187094
#> 298 2016-08-31       total       188328
#> 299 2016-09-30       total       189056
#> 300 2016-10-31       total       190432
#> 301 2016-11-30       total       192362
#> 302 2016-12-31       total       193201
#> 303 2017-01-31       total       194405
#> 304 2017-02-28       total       196000
#> 305 2017-03-31       total       197706
#> 306 2017-04-30       total       198559
#> 307 2017-05-31       total       200019
#> 308 2017-06-30       total       200921
#> 309 2017-07-31       total       201985
#> 310 2017-08-31       total       203188
#> 311 2017-09-30       total       204654
#> 312 2017-10-31       total       206015
#> 313 2017-11-30       total       207346
#> 314 2017-12-31       total       208715
#> 315 2018-01-31       total       209088
#> 316 2018-02-28       total       210874
#> 317 2018-03-31       total       211676
#> 318 2018-04-30       total       212927
#> 319 2018-05-31       total       214165
#> 320 2018-06-30       total       215248
#> 321 2018-07-31       total       215751
#> 322 2018-08-31       total       216640
#> 323 2018-09-30       total       217887
#> 324 2018-10-31       total       217961
#> 325 2018-11-30       total       218648
#> 326 2018-12-31       total       219072
#> 327 2019-01-31       total       219978
#> 328 2019-02-28       total       219946
#> 329 2019-03-31       total       220636
#> 330 2019-04-30       total       221062
#> 331 2019-05-31       total       221509
#> 332 2019-06-30       total       222049
#> 333 2019-07-31       total       222136
#> 334 2019-08-31       total       224130
#> 335 2019-09-30       total       224496
#> 336 2019-10-31       total       225033
#> 337 2019-11-30       total       225314
#> 338 2019-12-31       total       224311
#> 339 2020-01-31       total       224936
#> 340 2020-02-29       total       225210
#> 341 2020-03-31       total       221359
#> 342 2020-04-30       total       212620
#> 343 2020-05-31       total       207890
#> 344 2020-06-30       total       206693
#> 345 2020-07-31       total       207595
#> 346 2020-08-31       total       207574
#> 347 2020-09-30       total       206576
#> 348 2020-10-31       total       205626
#> 349 2020-11-30       total       203287
#> 350 2020-12-31       total       202191
#> 351 2021-01-31       total       200057
#> 352 2021-02-28       total       198607
#> 353 2021-03-31       total       198255
#> 354 2021-04-30       total       196727
#> 355 2021-05-31       total       197384
#> 356 2021-06-30       total       197331
#> 357 2021-07-31       total       198051
#> 358 2021-08-31       total       198544
#> 359 2021-09-30       total       198689
#> 360 2021-10-31       total       197372
#> 361 2021-11-30       total       198217
#> 362 2021-12-31       total       198463
#> 363 2022-01-31       total       198527
#> 364 2022-02-28       total       199497
#> 365 2022-03-31       total       200393
#> 366 2022-04-30       total       201713
#> 367 2022-05-31       total       202434
#> 368 2022-06-30       total       203180
#> 369 2022-07-31       total       204340
#> 370 2022-08-31       total       204914
#> 371 2022-09-30       total       205418
#> 372 2022-10-31       total       206018
#> 373 2022-11-30       total       206779
#> 374 2022-12-31       total       206858
#> 375 2023-01-31       total       209166
#> 376 2023-02-28       total       210510
#> 377 2023-03-31       total       211746
#> 378 2023-04-30       total       213257
#> 379 2023-05-31       total       213771
#> 380 2023-06-30       total       215243
#> 381 2023-07-31       total       216157
#> 382 2023-08-31       total       217379
#> 383 2023-09-30       total       218548
#> 384 2023-10-31       total       219662
#> 385 2023-11-30       total       221395
#> 386 2023-12-31       total       219484
#> 387 2024-01-31       total       221178
#> 388 2024-02-29       total       222155
#> 389 2024-03-31       total       223371
#> 390 2024-04-30       total       226971
#> 391 2024-05-31       total       228584
#> 392 2024-06-30       total       229652
#> 393 2024-07-31       total       230527
#> 394 2024-08-31       total       231436
#> 395 2024-09-30       total       232528
#> 396 2024-10-31       total       232599
#> 397 2024-11-30       total       232568
#> 398 2024-12-31       total       233602
#> 399 2025-01-31       total       234843
#> 400 2025-02-28       total       235844
#> 401 2025-03-31       total       236034
#> 402 2025-04-30       total       237452
#> 403 2025-05-31       total       238135
#> 404 2025-06-30       total       239378
#> 405 2025-07-31       total       240735
#> 406 2025-08-31       total       242128
#> 407 2025-09-30       total       243187
#> 408 2025-10-31       total       244523
#> 409 2025-11-30       total       246267
#> 410 2025-12-31       total       247855
#> 411 2026-01-31       total       249389
#> 412 2026-02-28       total       250585
#> 413 2026-03-31       total       252052
#> 414 2026-04-30       total       253430
#> 415 2026-05-31       total       254976
#> 416 2026-06-30       total       256410
#> 417 2026-07-31       total       257529
options(op)
# }
```
