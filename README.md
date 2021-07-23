NVIcheckmate: extension of checkmate with argument checking adapted for NVIverse
================================================================================

<!-- README.md is generated from README.Rmd. Please edit that file -->

-   [Overview](#overview)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Copyright and license](#copyright-and-license)
-   [Contributing](#contributing)

Overview
========

`NVIcheckmate` is an extension of
[`checkmate`](https://CRAN.R-project.org/package=checkmate) with
additional functions for argument checking for use in NVIverse
functions. `NVIverse` is a collection of R-packages with tools to
facilitate data management and data reporting at the Norwegian
Veterinary Institute (NVI).

#### NVIverse packages

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 8%" />
<col style="width: 78%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Package</th>
<th style="text-align: left;">Status</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">NVIconfig</td>
<td style="text-align: left;">Private</td>
<td style="text-align: left;">Configuration information necessary for some NVIverse functions</td>
</tr>
<tr class="even">
<td style="text-align: left;">NVIdb</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate the use of NVI’s databases</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NVIpretty</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to make R-output pretty in accord with NVI’s graphical profile</td>
</tr>
<tr class="even">
<td style="text-align: left;">NVIbatch</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate the running of R-scripts in batch mode at NVI</td>
</tr>
<tr class="odd">
<td style="text-align: left;">NVIcheckmate</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Extension of checkmate with argument checking adapted for NVIverse</td>
</tr>
<tr class="even">
<td style="text-align: left;">OKplan</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate the planning of surveillance programmes for the NFSA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">OKcheck</td>
<td style="text-align: left;">Public</td>
<td style="text-align: left;">Tools to facilitate checking of data from national surveillance programmes</td>
</tr>
</tbody>
</table>

The main purpose of `NVIcheckmate` is to provide checks and assertions
for functions in `NVIverse` in the case that the checks and assertions
are not available in `checkmate`. These include specialized argument
checking as well as checking other requirements like if a package is
installed, if the users credentials are available and, if an valid
ODBC-channel exists.

In addition, an argument for adding a custom message is included in
selected assertions from `checkmate`. Thereby, the error messages for a
specific function may be adapted to provide more meaningful error
messages.

`NVIcheckmate` is intended for use together with `checkmate`.
`NVIcheckmate` intend to follow the same principles as `checkmate`
concerning input and error messages. The argument checking in `NVIverse`
uses the assert class in `checkmate` for collecting and reporting the
assertions, and assertions from `checkmate` and `NVIcheckmate` are
combined when checking the arguments of a function.

When and if functionality covered by `NVIcheckmate` are included in
`checkmate` as available at Cran, the corresponding function will be
depreciated and thereafter removed from `NVIcheckmate`.

Installation
============

`NVIcheckmate` is available at
[GitHub](https://github.com/NorwegianVeterinaryInstitute). To install
`NVIcheckmate` you will need:

-   R version &gt; 4.0.0
-   R package `devtools`
-   Rtools 4.0

First install and attach the `devtools` package.

    install.packages("devtools")
    library(devtools)

To install (or update) the `NVIcheckmate` package, run the following
code:

    remotes::install_github("NorwegianVeterinaryInstitute/NVIcheckmate", 
        upgrade = FALSE, 
        build = TRUE,
        build_manual = TRUE)

Usage
=====

To come.

Copyright and license
=====================

#### NVIcheckmate

Copyright (c) 2021 Norwegian Veterinary Institute  
License: BSD 3-Clause

Functions and code from `checkmate` have been imported into
`NVIcheckmate`. For some of them, the code have been partly modified.
The modifications are commented in the respective source files. Code
from `checkmate` are the copyright of the copyright holders of
`checkmate`.

#### checkmate

Copyright (c) 2021 Michael Lang
(<a href="mailto:michellang@@gmail.com" class="email">michellang@@gmail.com</a>)  
License: BSD 3-Clause

#### Functions and code imported from `checkmate`

<table>
<colgroup>
<col style="width: 12%" />
<col style="width: 8%" />
<col style="width: 31%" />
<col style="width: 47%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Function</th>
<th style="text-align: left;">Directory</th>
<th style="text-align: left;">Description</th>
<th style="text-align: left;">Modification</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">assert.R</td>
<td style="text-align: left;">./R</td>
<td style="text-align: left;">Combines multiple checks into one assertion</td>
<td style="text-align: left;">None. Imported as is from checkmate 2.1.0 at Github to include argument ‘add’</td>
</tr>
<tr class="even">
<td style="text-align: left;">mstopOrPush.R</td>
<td style="text-align: left;">./R</td>
<td style="text-align: left;">Internal function mstopOrPush used in assert.R</td>
<td style="text-align: left;">None</td>
</tr>
<tr class="odd">
<td style="text-align: left;">helper.R</td>
<td style="text-align: left;">./R</td>
<td style="text-align: left;">Internal function mstop used in assert.R</td>
<td style="text-align: left;">None</td>
</tr>
<tr class="even">
<td style="text-align: left;">makeAssertFunction.R</td>
<td style="text-align: left;">./R</td>
<td style="text-align: left;">Creates an assertion function from a check function</td>
<td style="text-align: left;">Adds the argument ‘comment’ when creating an assertion function</td>
</tr>
<tr class="odd">
<td style="text-align: left;">assert.R</td>
<td style="text-align: left;">./man-roxygen</td>
<td style="text-align: left;">help template</td>
<td style="text-align: left;">yes</td>
</tr>
<tr class="even">
<td style="text-align: left;">checker.R</td>
<td style="text-align: left;">./man-roxygen</td>
<td style="text-align: left;">help template</td>
<td style="text-align: left;">yes</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fmatch.R</td>
<td style="text-align: left;">./man-roxygen</td>
<td style="text-align: left;">help template</td>
<td style="text-align: left;">None</td>
</tr>
<tr class="even">
<td style="text-align: left;">makeFunction.R</td>
<td style="text-align: left;">./man-roxygen</td>
<td style="text-align: left;">help template</td>
<td style="text-align: left;">None</td>
</tr>
<tr class="odd">
<td style="text-align: left;">null.ok.R</td>
<td style="text-align: left;">./man-roxygen</td>
<td style="text-align: left;">help template</td>
<td style="text-align: left;">None</td>
</tr>
<tr class="even">
<td style="text-align: left;">x.R</td>
<td style="text-align: left;">./man-roxygen</td>
<td style="text-align: left;">help template</td>
<td style="text-align: left;">None</td>
</tr>
</tbody>
</table>

Contributing
============

Contributions to develop `NVIcheckmate` is highly appreciated. There are
several ways you can contribute to this project: ask a question, propose
an idea, report a bug, improve the documentation, or contribute code.
The vignette “Contribute to NVIcheckmate” gives more information.

------------------------------------------------------------------------

Please note that the NVIcheckmate project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
