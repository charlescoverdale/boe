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
#> ✔ Downloading from Bank of England [388ms]
#> 
#>           date        type amount_gbp_m
#> 1   2015-01-31 credit_card        61304
#> 2   2015-02-28 credit_card        61417
#> 3   2015-03-31 credit_card        61516
#> 4   2015-04-30 credit_card        61787
#> 5   2015-05-31 credit_card        61794
#> 6   2015-06-30 credit_card        61935
#> 7   2015-07-31 credit_card        62596
#> 8   2015-08-31 credit_card        62536
#> 9   2015-09-30 credit_card        62696
#> 10  2015-10-31 credit_card        62822
#> 11  2015-11-30 credit_card        63117
#> 12  2015-12-31 credit_card        63436
#> 13  2016-01-31 credit_card        63743
#> 14  2016-02-29 credit_card        63793
#> 15  2016-03-31 credit_card        64350
#> 16  2016-04-30 credit_card        64332
#> 17  2016-05-31 credit_card        64768
#> 18  2016-06-30 credit_card        65075
#> 19  2016-07-31 credit_card        65393
#> 20  2016-08-31 credit_card        65726
#> 21  2016-09-30 credit_card        65644
#> 22  2016-10-31 credit_card        66275
#> 23  2016-11-30 credit_card        66577
#> 24  2016-12-31 credit_card        66768
#> 25  2017-01-31 credit_card        66987
#> 26  2017-02-28 credit_card        67292
#> 27  2017-03-31 credit_card        67659
#> 28  2017-04-30 credit_card        68020
#> 29  2017-05-31 credit_card        68134
#> 30  2017-06-30 credit_card        68375
#> 31  2017-07-31 credit_card        68713
#> 32  2017-08-31 credit_card        68932
#> 33  2017-09-30 credit_card        69332
#> 34  2017-10-31 credit_card        69588
#> 35  2017-11-30 credit_card        70017
#> 36  2017-12-31 credit_card        70310
#> 37  2018-01-31 credit_card        70374
#> 38  2018-02-28 credit_card        70801
#> 39  2018-03-31 credit_card        70805
#> 40  2018-04-30 credit_card        71243
#> 41  2018-05-31 credit_card        71591
#> 42  2018-06-30 credit_card        71991
#> 43  2018-07-31 credit_card        71944
#> 44  2018-08-31 credit_card        72129
#> 45  2018-09-30 credit_card        72234
#> 46  2018-10-31 credit_card        72216
#> 47  2018-11-30 credit_card        72366
#> 48  2018-12-31 credit_card        72292
#> 49  2019-01-31 credit_card        72511
#> 50  2019-02-28 credit_card        72756
#> 51  2019-03-31 credit_card        72805
#> 52  2019-04-30 credit_card        72779
#> 53  2019-05-31 credit_card        72886
#> 54  2019-06-30 credit_card        72811
#> 55  2019-07-31 credit_card        72371
#> 56  2019-08-31 credit_card        72357
#> 57  2019-09-30 credit_card        72284
#> 58  2019-10-31 credit_card        72299
#> 59  2019-11-30 credit_card        71961
#> 60  2019-12-31 credit_card        72226
#> 61  2020-01-31 credit_card        72398
#> 62  2020-02-29 credit_card        72019
#> 63  2020-03-31 credit_card        69458
#> 64  2020-04-30 credit_card        64302
#> 65  2020-05-31 credit_card        62301
#> 66  2020-06-30 credit_card        61669
#> 67  2020-07-31 credit_card        62296
#> 68  2020-08-31 credit_card        62346
#> 69  2020-09-30 credit_card        61296
#> 70  2020-10-31 credit_card        60407
#> 71  2020-11-30 credit_card        59157
#> 72  2020-12-31 credit_card        58180
#> 73  2021-01-31 credit_card        56791
#> 74  2021-02-28 credit_card        55813
#> 75  2021-03-31 credit_card        55782
#> 76  2021-04-30 credit_card        55780
#> 77  2021-05-31 credit_card        56374
#> 78  2021-06-30 credit_card        56364
#> 79  2021-07-31 credit_card        57009
#> 80  2021-08-31 credit_card        57296
#> 81  2021-09-30 credit_card        57765
#> 82  2021-10-31 credit_card        58310
#> 83  2021-11-30 credit_card        58840
#> 84  2021-12-31 credit_card        58533
#> 85  2022-01-31 credit_card        58660
#> 86  2022-02-28 credit_card        59401
#> 87  2022-03-31 credit_card        60034
#> 88  2022-04-30 credit_card        60632
#> 89  2022-05-31 credit_card        61134
#> 90  2022-06-30 credit_card        61304
#> 91  2022-07-31 credit_card        61745
#> 92  2022-08-31 credit_card        62170
#> 93  2022-09-30 credit_card        62205
#> 94  2022-10-31 credit_card        62570
#> 95  2022-11-30 credit_card        63344
#> 96  2022-12-31 credit_card        63176
#> 97  2023-01-31 credit_card        63892
#> 98  2023-02-28 credit_card        64525
#> 99  2023-03-31 credit_card        64928
#> 100 2023-04-30 credit_card        65565
#> 101 2023-05-31 credit_card        65951
#> 102 2023-06-30 credit_card        66289
#> 103 2023-07-31 credit_card        66666
#> 104 2023-08-31 credit_card        67115
#> 105 2023-09-30 credit_card        67599
#> 106 2023-10-31 credit_card        67947
#> 107 2023-11-30 credit_card        68823
#> 108 2023-12-31 credit_card        69023
#> 109 2024-01-31 credit_card        69467
#> 110 2024-02-29 credit_card        69751
#> 111 2024-03-31 credit_card        70201
#> 112 2024-04-30 credit_card        70173
#> 113 2024-05-31 credit_card        70587
#> 114 2024-06-30 credit_card        70792
#> 115 2024-07-31 credit_card        71066
#> 116 2024-08-31 credit_card        71341
#> 117 2024-09-30 credit_card        71561
#> 118 2024-10-31 credit_card        71907
#> 119 2024-11-30 credit_card        71671
#> 120 2024-12-31 credit_card        72004
#> 121 2025-01-31 credit_card        72670
#> 122 2025-02-28 credit_card        73304
#> 123 2025-03-31 credit_card        73395
#> 124 2025-04-30 credit_card        74376
#> 125 2025-05-31 credit_card        74386
#> 126 2025-06-30 credit_card        74919
#> 127 2025-07-31 credit_card        75508
#> 128 2025-08-31 credit_card        76057
#> 129 2025-09-30 credit_card        76577
#> 130 2025-10-31 credit_card        76974
#> 131 2025-11-30 credit_card        77754
#> 132 2025-12-31 credit_card        78324
#> 133 2026-01-31 credit_card        79000
#> 134 2026-02-28 credit_card        79544
#> 135 2015-01-31       other       182799
#> 136 2015-02-28       other       183427
#> 137 2015-03-31       other       185627
#> 138 2015-04-30       other       186938
#> 139 2015-05-31       other       188928
#> 140 2015-06-30       other       190437
#> 141 2015-07-31       other       192418
#> 142 2015-08-31       other       194173
#> 143 2015-09-30       other       194287
#> 144 2015-10-31       other       196405
#> 145 2015-11-30       other       198102
#> 146 2015-12-31       other       199482
#> 147 2016-01-31       other       201508
#> 148 2016-02-29       other       203830
#> 149 2016-03-31       other       205889
#> 150 2016-04-30       other       207774
#> 151 2016-05-31       other       210012
#> 152 2016-06-30       other       212207
#> 153 2016-07-31       other       213915
#> 154 2016-08-31       other       215826
#> 155 2016-09-30       other       217800
#> 156 2016-10-31       other       219703
#> 157 2016-11-30       other       222600
#> 158 2016-12-31       other       224478
#> 159 2017-01-31       other       226499
#> 160 2017-02-28       other       229105
#> 161 2017-03-31       other       231698
#> 162 2017-04-30       other       233661
#> 163 2017-05-31       other       236280
#> 164 2017-06-30       other       238319
#> 165 2017-07-31       other       240315
#> 166 2017-08-31       other       242609
#> 167 2017-09-30       other       245020
#> 168 2017-10-31       other       247405
#> 169 2017-11-30       other       249701
#> 170 2017-12-31       other       252162
#> 171 2018-01-31       other       253866
#> 172 2018-02-28       other       256724
#> 173 2018-03-31       other       258993
#> 174 2018-04-30       other       261342
#> 175 2018-05-31       other       263810
#> 176 2018-06-30       other       266177
#> 177 2018-07-31       other       268184
#> 178 2018-08-31       other       270468
#> 179 2018-09-30       other       273098
#> 180 2018-10-31       other       274630
#> 181 2018-11-30       other       276760
#> 182 2018-12-31       other       278666
#> 183 2019-01-31       other       281139
#> 184 2019-02-28       other       282605
#> 185 2019-03-31       other       285036
#> 186 2019-04-30       other       287136
#> 187 2019-05-31       other       288951
#> 188 2019-06-30       other       291391
#> 189 2019-07-31       other       293367
#> 190 2019-08-31       other       297034
#> 191 2019-09-30       other       298943
#> 192 2019-10-31       other       300896
#> 193 2019-11-30       other       303210
#> 194 2019-12-31       other       303403
#> 195 2020-01-31       other       305821
#> 196 2020-02-29       other       308381
#> 197 2020-03-31       other       308840
#> 198 2020-04-30       other       307075
#> 199 2020-05-31       other       306231
#> 200 2020-06-30       other       307460
#> 201 2020-07-31       other       309511
#> 202 2020-08-31       other       311131
#> 203 2020-09-30       other       312619
#> 204 2020-10-31       other       316577
#> 205 2020-11-30       other       317408
#> 206 2020-12-31       other       318933
#> 207 2021-01-31       other       320719
#> 208 2021-02-28       other       320116
#> 209 2021-03-31       other       321541
#> 210 2021-04-30       other       322004
#> 211 2021-05-31       other       324119
#> 212 2021-06-30       other       325863
#> 213 2021-07-31       other       327737
#> 214 2021-08-31       other       329511
#> 215 2021-09-30       other       330961
#> 216 2021-10-31       other       331166
#> 217 2021-11-30       other       333098
#> 218 2021-12-31       other       335403
#> 219 2022-01-31       other       337543
#> 220 2022-02-28       other       339965
#> 221 2022-03-31       other       342177
#> 222 2022-04-30       other       345053
#> 223 2022-05-31       other       347467
#> 224 2022-06-30       other       350256
#> 225 2022-07-31       other       353126
#> 226 2022-08-31       other       355152
#> 227 2022-09-30       other       357735
#> 228 2022-10-31       other       359934
#> 229 2022-11-30       other       362120
#> 230 2022-12-31       other       364393
#> 231 2023-01-31       other       368282
#> 232 2023-02-28       other       371382
#> 233 2023-03-31       other       374714
#> 234 2023-04-30       other       378161
#> 235 2023-05-31       other       380694
#> 236 2023-06-30       other       384686
#> 237 2023-07-31       other       387716
#> 238 2023-08-31       other       391247
#> 239 2023-09-30       other       394836
#> 240 2023-10-31       other       398018
#> 241 2023-11-30       other       401739
#> 242 2023-12-31       other       402670
#> 243 2024-01-31       other       406800
#> 244 2024-02-29       other       410428
#> 245 2024-03-31       other       414285
#> 246 2024-04-30       other       420020
#> 247 2024-05-31       other       424224
#> 248 2024-06-30       other       427834
#> 249 2024-07-31       other       430944
#> 250 2024-08-31       other       434546
#> 251 2024-09-30       other       438036
#> 252 2024-10-31       other       440357
#> 253 2024-11-30       other       443598
#> 254 2024-12-31       other       446920
#> 255 2025-01-31       other       450644
#> 256 2025-02-28       other       453874
#> 257 2025-03-31       other       456619
#> 258 2015-01-31       total       244102
#> 259 2015-02-28       total       244844
#> 260 2015-03-31       total       247143
#> 261 2015-04-30       total       248724
#> 262 2015-05-31       total       250722
#> 263 2015-06-30       total       252372
#> 264 2015-07-31       total       255014
#> 265 2015-08-31       total       256709
#> 266 2015-09-30       total       256983
#> 267 2015-10-31       total       259228
#> 268 2015-11-30       total       261220
#> 269 2015-12-31       total       262917
#> 270 2016-01-31       total       265251
#> 271 2016-02-29       total       267623
#> 272 2016-03-31       total       270239
#> 273 2016-04-30       total       272107
#> 274 2016-05-31       total       274779
#> 275 2016-06-30       total       277283
#> 276 2016-07-31       total       279307
#> 277 2016-08-31       total       281552
#> 278 2016-09-30       total       283444
#> 279 2016-10-31       total       285979
#> 280 2016-11-30       total       289176
#> 281 2016-12-31       total       291247
#> 282 2017-01-31       total       293486
#> 283 2017-02-28       total       296398
#> 284 2017-03-31       total       299357
#> 285 2017-04-30       total       301681
#> 286 2017-05-31       total       304414
#> 287 2017-06-30       total       306695
#> 288 2017-07-31       total       309028
#> 289 2017-08-31       total       311541
#> 290 2017-09-30       total       314352
#> 291 2017-10-31       total       316993
#> 292 2017-11-30       total       319717
#> 293 2017-12-31       total       322471
#> 294 2018-01-31       total       324239
#> 295 2018-02-28       total       327526
#> 296 2018-03-31       total       329798
#> 297 2018-04-30       total       332585
#> 298 2018-05-31       total       335401
#> 299 2018-06-30       total       338168
#> 300 2018-07-31       total       340128
#> 301 2018-08-31       total       342597
#> 302 2018-09-30       total       345332
#> 303 2018-10-31       total       346847
#> 304 2018-11-30       total       349126
#> 305 2018-12-31       total       350958
#> 306 2019-01-31       total       353650
#> 307 2019-02-28       total       355361
#> 308 2019-03-31       total       357841
#> 309 2019-04-30       total       359915
#> 310 2019-05-31       total       361836
#> 311 2019-06-30       total       364203
#> 312 2019-07-31       total       365738
#> 313 2019-08-31       total       369391
#> 314 2019-09-30       total       371227
#> 315 2019-10-31       total       373196
#> 316 2019-11-30       total       375171
#> 317 2019-12-31       total       375629
#> 318 2020-01-31       total       378219
#> 319 2020-02-29       total       380400
#> 320 2020-03-31       total       378297
#> 321 2020-04-30       total       371376
#> 322 2020-05-31       total       368532
#> 323 2020-06-30       total       369129
#> 324 2020-07-31       total       371806
#> 325 2020-08-31       total       373477
#> 326 2020-09-30       total       373916
#> 327 2020-10-31       total       376984
#> 328 2020-11-30       total       376566
#> 329 2020-12-31       total       377114
#> 330 2021-01-31       total       377510
#> 331 2021-02-28       total       375929
#> 332 2021-03-31       total       377324
#> 333 2021-04-30       total       377784
#> 334 2021-05-31       total       380493
#> 335 2021-06-30       total       382227
#> 336 2021-07-31       total       384746
#> 337 2021-08-31       total       386807
#> 338 2021-09-30       total       388726
#> 339 2021-10-31       total       389476
#> 340 2021-11-30       total       391938
#> 341 2021-12-31       total       393935
#> 342 2022-01-31       total       396203
#> 343 2022-02-28       total       399365
#> 344 2022-03-31       total       402211
#> 345 2022-04-30       total       405685
#> 346 2022-05-31       total       408601
#> 347 2022-06-30       total       411560
#> 348 2022-07-31       total       414871
#> 349 2022-08-31       total       417322
#> 350 2022-09-30       total       419939
#> 351 2022-10-31       total       422504
#> 352 2022-11-30       total       425464
#> 353 2022-12-31       total       427569
#> 354 2023-01-31       total       432174
#> 355 2023-02-28       total       435907
#> 356 2023-03-31       total       439642
#> 357 2023-04-30       total       443726
#> 358 2023-05-31       total       446645
#> 359 2023-06-30       total       450975
#> 360 2023-07-31       total       454382
#> 361 2023-08-31       total       458363
#> 362 2023-09-30       total       462435
#> 363 2023-10-31       total       465965
#> 364 2023-11-30       total       470562
#> 365 2023-12-31       total       471693
#> 366 2024-01-31       total       476266
#> 367 2024-02-29       total       480179
#> 368 2024-03-31       total       484486
#> 369 2024-04-30       total       490193
#> 370 2024-05-31       total       494811
#> 371 2024-06-30       total       498626
#> 372 2024-07-31       total       502010
#> 373 2024-08-31       total       505887
#> 374 2024-09-30       total       509598
#> 375 2024-10-31       total       512264
#> 376 2024-11-30       total       515270
#> 377 2024-12-31       total       518925
#> 378 2025-01-31       total       523314
#> 379 2025-02-28       total       527178
#> 380 2025-03-31       total       530014
options(op)
# }
```
