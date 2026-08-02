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
#> ✔ Downloading from Bank of England [533ms]
#> 
#> # BoE [boe_consumer_credit]: 3 series [LPMBI2O,LPMVZRJ,LPMB4TS] · 414 obs · 2015-01-01 to 2026-08-02 · freq=monthly
#>           date        type amount_gbp_m
#> 1   2015-01-31 credit_card        61303
#> 2   2015-02-28 credit_card        61417
#> 3   2015-03-31 credit_card        61519
#> 4   2015-04-30 credit_card        61777
#> 5   2015-05-31 credit_card        61797
#> 6   2015-06-30 credit_card        61938
#> 7   2015-07-31 credit_card        62596
#> 8   2015-08-31 credit_card        62538
#> 9   2015-09-30 credit_card        62697
#> 10  2015-10-31 credit_card        62821
#> 11  2015-11-30 credit_card        63119
#> 12  2015-12-31 credit_card        63437
#> 13  2016-01-31 credit_card        63747
#> 14  2016-02-29 credit_card        63796
#> 15  2016-03-31 credit_card        64343
#> 16  2016-04-30 credit_card        64321
#> 17  2016-05-31 credit_card        64770
#> 18  2016-06-30 credit_card        65075
#> 19  2016-07-31 credit_card        65396
#> 20  2016-08-31 credit_card        65726
#> 21  2016-09-30 credit_card        65645
#> 22  2016-10-31 credit_card        66277
#> 23  2016-11-30 credit_card        66577
#> 24  2016-12-31 credit_card        66767
#> 25  2017-01-31 credit_card        66989
#> 26  2017-02-28 credit_card        67296
#> 27  2017-03-31 credit_card        67658
#> 28  2017-04-30 credit_card        68016
#> 29  2017-05-31 credit_card        68135
#> 30  2017-06-30 credit_card        68374
#> 31  2017-07-31 credit_card        68714
#> 32  2017-08-31 credit_card        68933
#> 33  2017-09-30 credit_card        69331
#> 34  2017-10-31 credit_card        69590
#> 35  2017-11-30 credit_card        70017
#> 36  2017-12-31 credit_card        70312
#> 37  2018-01-31 credit_card        70373
#> 38  2018-02-28 credit_card        70803
#> 39  2018-03-31 credit_card        70791
#> 40  2018-04-30 credit_card        71241
#> 41  2018-05-31 credit_card        71592
#> 42  2018-06-30 credit_card        71986
#> 43  2018-07-31 credit_card        71947
#> 44  2018-08-31 credit_card        72131
#> 45  2018-09-30 credit_card        72238
#> 46  2018-10-31 credit_card        72217
#> 47  2018-11-30 credit_card        72366
#> 48  2018-12-31 credit_card        72293
#> 49  2019-01-31 credit_card        72509
#> 50  2019-02-28 credit_card        72757
#> 51  2019-03-31 credit_card        72806
#> 52  2019-04-30 credit_card        72777
#> 53  2019-05-31 credit_card        72888
#> 54  2019-06-30 credit_card        72812
#> 55  2019-07-31 credit_card        72372
#> 56  2019-08-31 credit_card        72357
#> 57  2019-09-30 credit_card        72286
#> 58  2019-10-31 credit_card        72301
#> 59  2019-11-30 credit_card        71959
#> 60  2019-12-31 credit_card        72226
#> 61  2020-01-31 credit_card        72393
#> 62  2020-02-29 credit_card        72015
#> 63  2020-03-31 credit_card        69459
#> 64  2020-04-30 credit_card        64297
#> 65  2020-05-31 credit_card        62307
#> 66  2020-06-30 credit_card        61669
#> 67  2020-07-31 credit_card        62297
#> 68  2020-08-31 credit_card        62350
#> 69  2020-09-30 credit_card        61298
#> 70  2020-10-31 credit_card        60408
#> 71  2020-11-30 credit_card        59160
#> 72  2020-12-31 credit_card        58181
#> 73  2021-01-31 credit_card        56788
#> 74  2021-02-28 credit_card        55814
#> 75  2021-03-31 credit_card        55782
#> 76  2021-04-30 credit_card        55774
#> 77  2021-05-31 credit_card        56378
#> 78  2021-06-30 credit_card        56363
#> 79  2021-07-31 credit_card        57008
#> 80  2021-08-31 credit_card        57299
#> 81  2021-09-30 credit_card        57768
#> 82  2021-10-31 credit_card        58319
#> 83  2021-11-30 credit_card        58844
#> 84  2021-12-31 credit_card        58532
#> 85  2022-01-31 credit_card        58651
#> 86  2022-02-28 credit_card        59398
#> 87  2022-03-31 credit_card        60038
#> 88  2022-04-30 credit_card        60619
#> 89  2022-05-31 credit_card        61137
#> 90  2022-06-30 credit_card        61305
#> 91  2022-07-31 credit_card        61749
#> 92  2022-08-31 credit_card        62173
#> 93  2022-09-30 credit_card        62210
#> 94  2022-10-31 credit_card        62584
#> 95  2022-11-30 credit_card        63351
#> 96  2022-12-31 credit_card        63171
#> 97  2023-01-31 credit_card        63873
#> 98  2023-02-28 credit_card        64510
#> 99  2023-03-31 credit_card        64938
#> 100 2023-04-30 credit_card        65545
#> 101 2023-05-31 credit_card        65957
#> 102 2023-06-30 credit_card        66295
#> 103 2023-07-31 credit_card        66675
#> 104 2023-08-31 credit_card        67125
#> 105 2023-09-30 credit_card        67606
#> 106 2023-10-31 credit_card        67974
#> 107 2023-11-30 credit_card        68834
#> 108 2023-12-31 credit_card        69013
#> 109 2024-01-31 credit_card        69428
#> 110 2024-02-29 credit_card        69702
#> 111 2024-03-31 credit_card        70222
#> 112 2024-04-30 credit_card        70132
#> 113 2024-05-31 credit_card        70623
#> 114 2024-06-30 credit_card        70805
#> 115 2024-07-31 credit_card        71084
#> 116 2024-08-31 credit_card        71358
#> 117 2024-09-30 credit_card        71579
#> 118 2024-10-31 credit_card        71939
#> 119 2024-11-30 credit_card        71680
#> 120 2024-12-31 credit_card        71981
#> 121 2025-01-31 credit_card        72606
#> 122 2025-02-28 credit_card        73209
#> 123 2025-03-31 credit_card        73438
#> 124 2025-04-30 credit_card        74320
#> 125 2025-05-31 credit_card        74468
#> 126 2025-06-30 credit_card        74935
#> 127 2025-07-31 credit_card        75542
#> 128 2025-08-31 credit_card        76093
#> 129 2025-09-30 credit_card        76604
#> 130 2025-10-31 credit_card        77010
#> 131 2025-11-30 credit_card        77753
#> 132 2025-12-31 credit_card        78276
#> 133 2026-01-31 credit_card        78905
#> 134 2026-02-28 credit_card        79404
#> 135 2026-03-31 credit_card        79785
#> 136 2026-04-30 credit_card        79586
#> 137 2026-05-31 credit_card        79960
#> 138 2026-06-30 credit_card        81573
#> 139 2015-01-31       other       110190
#> 140 2015-02-28       other       109742
#> 141 2015-03-31       other       111084
#> 142 2015-04-30       other       111326
#> 143 2015-05-31       other       111960
#> 144 2015-06-30       other       112561
#> 145 2015-07-31       other       113556
#> 146 2015-08-31       other       114280
#> 147 2015-09-30       other       113520
#> 148 2015-10-31       other       114442
#> 149 2015-11-30       other       115053
#> 150 2015-12-31       other       115408
#> 151 2016-01-31       other       116463
#> 152 2016-02-29       other       117578
#> 153 2016-03-31       other       118719
#> 154 2016-04-30       other       119428
#> 155 2016-05-31       other       120120
#> 156 2016-06-30       other       121184
#> 157 2016-07-31       other       121698
#> 158 2016-08-31       other       122602
#> 159 2016-09-30       other       123412
#> 160 2016-10-31       other       124156
#> 161 2016-11-30       other       125785
#> 162 2016-12-31       other       126434
#> 163 2017-01-31       other       127415
#> 164 2017-02-28       other       128702
#> 165 2017-03-31       other       130049
#> 166 2017-04-30       other       130544
#> 167 2017-05-31       other       131885
#> 168 2017-06-30       other       132548
#> 169 2017-07-31       other       133271
#> 170 2017-08-31       other       134254
#> 171 2017-09-30       other       135323
#> 172 2017-10-31       other       136424
#> 173 2017-11-30       other       137328
#> 174 2017-12-31       other       138403
#> 175 2018-01-31       other       138716
#> 176 2018-02-28       other       140070
#> 177 2018-03-31       other       140885
#> 178 2018-04-30       other       141687
#> 179 2018-05-31       other       142572
#> 180 2018-06-30       other       143263
#> 181 2018-07-31       other       143802
#> 182 2018-08-31       other       144510
#> 183 2018-09-30       other       145649
#> 184 2018-10-31       other       145745
#> 185 2018-11-30       other       146284
#> 186 2018-12-31       other       146781
#> 187 2019-01-31       other       147470
#> 188 2019-02-28       other       147186
#> 189 2019-03-31       other       147830
#> 190 2019-04-30       other       148282
#> 191 2019-05-31       other       148622
#> 192 2019-06-30       other       149237
#> 193 2019-07-31       other       149761
#> 194 2019-08-31       other       151775
#> 195 2019-09-30       other       152211
#> 196 2019-10-31       other       152733
#> 197 2019-11-30       other       153356
#> 198 2019-12-31       other       152085
#> 199 2020-01-31       other       152545
#> 200 2020-02-29       other       153192
#> 201 2020-03-31       other       151899
#> 202 2020-04-30       other       148317
#> 203 2020-05-31       other       145583
#> 204 2020-06-30       other       145023
#> 205 2020-07-31       other       145298
#> 206 2020-08-31       other       145225
#> 207 2020-09-30       other       145279
#> 208 2020-10-31       other       145220
#> 209 2020-11-30       other       144130
#> 210 2020-12-31       other       144012
#> 211 2021-01-31       other       143270
#> 212 2021-02-28       other       142790
#> 213 2021-03-31       other       142474
#> 214 2021-04-30       other       140946
#> 215 2021-05-31       other       141006
#> 216 2021-06-30       other       140968
#> 217 2021-07-31       other       141042
#> 218 2021-08-31       other       141246
#> 219 2021-09-30       other       140922
#> 220 2021-10-31       other       139055
#> 221 2021-11-30       other       139376
#> 222 2021-12-31       other       139934
#> 223 2022-01-31       other       139875
#> 224 2022-02-28       other       140098
#> 225 2022-03-31       other       140356
#> 226 2022-04-30       other       141084
#> 227 2022-05-31       other       141295
#> 228 2022-06-30       other       141873
#> 229 2022-07-31       other       142591
#> 230 2022-08-31       other       142745
#> 231 2022-09-30       other       143213
#> 232 2022-10-31       other       143441
#> 233 2022-11-30       other       143430
#> 234 2022-12-31       other       143690
#> 235 2023-01-31       other       145288
#> 236 2023-02-28       other       145997
#> 237 2023-03-31       other       146807
#> 238 2023-04-30       other       147700
#> 239 2023-05-31       other       147809
#> 240 2023-06-30       other       148945
#> 241 2023-07-31       other       149487
#> 242 2023-08-31       other       150260
#> 243 2023-09-30       other       150949
#> 244 2023-10-31       other       151696
#> 245 2023-11-30       other       152564
#> 246 2023-12-31       other       150477
#> 247 2024-01-31       other       151749
#> 248 2024-02-29       other       152450
#> 249 2024-03-31       other       153142
#> 250 2024-04-30       other       156822
#> 251 2024-05-31       other       157950
#> 252 2024-06-30       other       158831
#> 253 2024-07-31       other       159457
#> 254 2024-08-31       other       160090
#> 255 2024-09-30       other       160962
#> 256 2024-10-31       other       160677
#> 257 2024-11-30       other       160892
#> 258 2024-12-31       other       161627
#> 259 2025-01-31       other       162238
#> 260 2025-02-28       other       162632
#> 261 2025-03-31       other       162585
#> 262 2025-04-30       other       163112
#> 263 2025-05-31       other       163644
#> 264 2025-06-30       other       164405
#> 265 2025-07-31       other       165226
#> 266 2025-08-31       other       166054
#> 267 2025-09-30       other       166602
#> 268 2025-10-31       other       167533
#> 269 2025-11-30       other       168525
#> 270 2025-12-31       other       169590
#> 271 2026-01-31       other       170485
#> 272 2026-02-28       other       171173
#> 273 2026-03-31       other       172250
#> 274 2026-04-30       other       173819
#> 275 2026-05-31       other       174976
#> 276 2026-06-30       other       174760
#> 277 2015-01-31       total       171493
#> 278 2015-02-28       total       171159
#> 279 2015-03-31       total       172603
#> 280 2015-04-30       total       173103
#> 281 2015-05-31       total       173757
#> 282 2015-06-30       total       174498
#> 283 2015-07-31       total       176152
#> 284 2015-08-31       total       176818
#> 285 2015-09-30       total       176217
#> 286 2015-10-31       total       177263
#> 287 2015-11-30       total       178172
#> 288 2015-12-31       total       178845
#> 289 2016-01-31       total       180209
#> 290 2016-02-29       total       181374
#> 291 2016-03-31       total       183062
#> 292 2016-04-30       total       183749
#> 293 2016-05-31       total       184890
#> 294 2016-06-30       total       186260
#> 295 2016-07-31       total       187093
#> 296 2016-08-31       total       188327
#> 297 2016-09-30       total       189057
#> 298 2016-10-31       total       190433
#> 299 2016-11-30       total       192362
#> 300 2016-12-31       total       193201
#> 301 2017-01-31       total       194404
#> 302 2017-02-28       total       195998
#> 303 2017-03-31       total       197706
#> 304 2017-04-30       total       198560
#> 305 2017-05-31       total       200019
#> 306 2017-06-30       total       200922
#> 307 2017-07-31       total       201985
#> 308 2017-08-31       total       203188
#> 309 2017-09-30       total       204654
#> 310 2017-10-31       total       206014
#> 311 2017-11-30       total       207345
#> 312 2017-12-31       total       208716
#> 313 2018-01-31       total       209089
#> 314 2018-02-28       total       210873
#> 315 2018-03-31       total       211676
#> 316 2018-04-30       total       212928
#> 317 2018-05-31       total       214164
#> 318 2018-06-30       total       215248
#> 319 2018-07-31       total       215749
#> 320 2018-08-31       total       216641
#> 321 2018-09-30       total       217887
#> 322 2018-10-31       total       217962
#> 323 2018-11-30       total       218650
#> 324 2018-12-31       total       219074
#> 325 2019-01-31       total       219979
#> 326 2019-02-28       total       219943
#> 327 2019-03-31       total       220636
#> 328 2019-04-30       total       221059
#> 329 2019-05-31       total       221510
#> 330 2019-06-30       total       222049
#> 331 2019-07-31       total       222134
#> 332 2019-08-31       total       224131
#> 333 2019-09-30       total       224498
#> 334 2019-10-31       total       225034
#> 335 2019-11-30       total       225315
#> 336 2019-12-31       total       224312
#> 337 2020-01-31       total       224939
#> 338 2020-02-29       total       225207
#> 339 2020-03-31       total       221358
#> 340 2020-04-30       total       212614
#> 341 2020-05-31       total       207890
#> 342 2020-06-30       total       206692
#> 343 2020-07-31       total       207595
#> 344 2020-08-31       total       207575
#> 345 2020-09-30       total       206577
#> 346 2020-10-31       total       205628
#> 347 2020-11-30       total       203290
#> 348 2020-12-31       total       202193
#> 349 2021-01-31       total       200058
#> 350 2021-02-28       total       198604
#> 351 2021-03-31       total       198257
#> 352 2021-04-30       total       196720
#> 353 2021-05-31       total       197384
#> 354 2021-06-30       total       197331
#> 355 2021-07-31       total       198050
#> 356 2021-08-31       total       198545
#> 357 2021-09-30       total       198691
#> 358 2021-10-31       total       197374
#> 359 2021-11-30       total       198219
#> 360 2021-12-31       total       198467
#> 361 2022-01-31       total       198526
#> 362 2022-02-28       total       199496
#> 363 2022-03-31       total       200393
#> 364 2022-04-30       total       201703
#> 365 2022-05-31       total       202432
#> 366 2022-06-30       total       203178
#> 367 2022-07-31       total       204340
#> 368 2022-08-31       total       204918
#> 369 2022-09-30       total       205423
#> 370 2022-10-31       total       206024
#> 371 2022-11-30       total       206781
#> 372 2022-12-31       total       206862
#> 373 2023-01-31       total       209162
#> 374 2023-02-28       total       210507
#> 375 2023-03-31       total       211745
#> 376 2023-04-30       total       213245
#> 377 2023-05-31       total       213766
#> 378 2023-06-30       total       215240
#> 379 2023-07-31       total       216162
#> 380 2023-08-31       total       217385
#> 381 2023-09-30       total       218555
#> 382 2023-10-31       total       219671
#> 383 2023-11-30       total       221398
#> 384 2023-12-31       total       219490
#> 385 2024-01-31       total       221177
#> 386 2024-02-29       total       222152
#> 387 2024-03-31       total       223364
#> 388 2024-04-30       total       226954
#> 389 2024-05-31       total       228573
#> 390 2024-06-30       total       229636
#> 391 2024-07-31       total       230541
#> 392 2024-08-31       total       231448
#> 393 2024-09-30       total       232541
#> 394 2024-10-31       total       232615
#> 395 2024-11-30       total       232572
#> 396 2024-12-31       total       233608
#> 397 2025-01-31       total       234844
#> 398 2025-02-28       total       235841
#> 399 2025-03-31       total       236023
#> 400 2025-04-30       total       237432
#> 401 2025-05-31       total       238112
#> 402 2025-06-30       total       239340
#> 403 2025-07-31       total       240768
#> 404 2025-08-31       total       242147
#> 405 2025-09-30       total       243206
#> 406 2025-10-31       total       244542
#> 407 2025-11-30       total       246278
#> 408 2025-12-31       total       247866
#> 409 2026-01-31       total       249390
#> 410 2026-02-28       total       250577
#> 411 2026-03-31       total       252036
#> 412 2026-04-30       total       253405
#> 413 2026-05-31       total       254936
#> 414 2026-06-30       total       256333
options(op)
# }
```
