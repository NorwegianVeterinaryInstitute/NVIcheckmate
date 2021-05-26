NVIcheckmate: extension of checkmate with argument checking adapted for NVIverse
================

  - [Overview](#overview)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Copyright and license](#copyright-and-license)
  - [Contributing](#contributing)

# Overview
`NVIcheckmate` is an extension of `checkmate` with functions for argument checking 
adapted to `NVIverse`. `NVIverse` is a collection of R-packages with tools for the 
Norwegian Veterinary Institute.

The main purpose of `NVIcheckmate` is to include checks/assertions on requirements 
necessary for the functions to work. These may not be arguments, but conditions 
like if an open RODBC-channel exist, if the users credentials are available and, 
if a package is installed.

In addition the possibility of a custom message is included in assertions. Thereby, 
the error messages may be adapted to the specific function for which the argument 
is checked. The intention is to give more meaningful error messages.

`NVIcheckmate` is intended for use together with `checkmate`. The argument checking
in `NVIverse` uses the assert class in `checkmate`for collecting and reporting the
assertions, and assertions in `checkmate` and `NVIcheckmate` will be used together 
to get the best argument checking.

# Installation

`NVIcheckmate` is available at https://github.com/NorwegianVeterinaryInstitute. 
To install `NVIcheckmate` you will need:
  - R version > 4.0.0
  - R package `devtools`
  - Rtools 4.0

First install and attach the `devtools` package.  

``` r
install.packages("devtools")
library(devtools)
```

To install (or update) the `NVIcheckmate` package, run the following code:

``` r
remotes::install_github("NorwegianVeterinaryInstitute/NVIcheckmate", 
	upgrade = FALSE, 
	build = TRUE,
	build_manual = TRUE)
```

# Usage


# Copyright and license
Copyright 2021 Norwegian Veterinary Institute

`NVIcheckmate` intend to follow the same principles as `checkmate` concerning 
input and error messages. Functions and code from `checkmate` have been imported 
to facilitate this. `checkmate` is the copyright of Michael Lang. 

The following functions and code have been imported from `checkmate`, some of 
them have been partly modified. The modifications are commented in the respective 
source files. Code from `checkmate` is the copyright of Michael Lang (michellang@gmail.com).

- makeAssertFunction.R (modified to include the argument `comment =` in assert-functions)
- assert.R
- helper.R (only the internal function mstop() is activated)
- assert.R (template for help text)
- checker.R (template for help text)
- fmatch.R (template for help text)
- makeFunction.R (template for help text)
- null.ok.R (template for help text)
- x.R (template for help text)


Both `NVIcheckmate` and `checkmate` is licensed under the BSD 3-Clause License 
(the "License"); The files in `NVIcheckmate` should be used in compliance with the [License](https://opensource.org/licenses/BSD-3-Clause).

# Contributing

Contributions to develop `NVIcheckmate` is highly appreciated. You may, for example, 
contribute by reporting a bug, fixing documentation errors, contributing new code, 
or commenting on issues/pull requests. 

-----

Please note that the NVIcheckmate project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By 
contributing to this project, you agree to abide by its terms.
