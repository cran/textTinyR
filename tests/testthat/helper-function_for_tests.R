
#-------------------------
# global variable cnt_tsts
#-------------------------

cnt_tsts <- 1



#-----------------------------------------------------------------------------------------------------
# exception for the Linux-debian-clang distribution because I get an error in the following languages
# due to the fact that the input text I use to test these functions includes apostrophes or dashes.
# This cannot be changed, therefore I'll skip these tests for the debian distribution
#
#        greek, russian, bulgarian, arabic, armenian, bengali, estonian, hebrew, hindi, hungarian,
#        irish, marathi, persian, spanish
#
# SEE also the e-mail that I received from CRAN at the end of this file.
#-----------------------------------------------------------------------------------------------------


exception_latin1_locale_debian = function() {

  run_test = TRUE

  if (Sys.info()[['sysname']] == 'Linux') {

    extract_distribution = system2(command = "lsb_release", args = c("-i"), stdout = TRUE, stderr = TRUE)            # https://www.cyberciti.biz/faq/find-linux-distribution-name-version-number/

    find_debian = strsplit(extract_distribution, "\t")[[1]][2]

    if (find_debian == "Debian") {

      run_test = FALSE
    }
  }

  return(run_test)
}


#========================================================================================================================================================================================
# message I received from CRAN on 11th April 2019:
#=================================================
#
# Prof Brian Ripley
# 11 Apr 2019, 09:00 (3 days ago)
# to Jeffrey, Emmanuel, Max, Hadley, David, Jim, Eugene, Bob, Erik, Shinya, Oliver, Kirill, Philippe, Scott, Noam, Gábor, Elin, Malte, Lorenz, Lionel, Sean, me, Florian, Edzer, CRAN
#
# This concerns packages
#
# CHNOSZ SARP.moodle caret dplyr fpeek fs gestalt hyphenatr incadata
# jpndistrict lobstr lucr pillar postGIStools rbison rchie rcmdcheck
# rcrossref rdatacite rerddap rgbif rplos skimr snakecase styler svglite
# swirl swirlify taxize testthat textTinyR traitdataform units urltools
#
# which are failing their checks in a strict Latin-1 locale: see the
# debian-clang results.  (Several of these seem to stem from vcr.)
#
# On Linux, such a locale can be ensured via LC_CTYPE=en_US (which may
#                                                            need installing for distros that micro-package).  AFAWK it cannot be
# done on Windows.
#
# 1) The character in don't is an (ASCII) apostrophe, not a right quote:
#
# don’t
#
# (with a right quote) is used in packages CHNOSZ dplyr ptstem skimr
# styler text2vec textTinyR (and others not failing).
#
# 2) en and em dashes are not portable, found in packages
# CHNOSZ SARP.moodle caret dplyr gestalt ptstem quanteda rchie rcrossref
# rdatacite rerddap rgbif rplos taxize textTinyR traitdataform units .
#
# 3) Using \uxxxx coding for non-ASCII chars in R character strings should
# help in some cases (see 'Writing R Extensions').
#
# Please correct before May 10 to safely retain the package on CRAN.
#========================================================================================================================================================================================
# message I received from CRAN on 13th Oct 2021:
#===============================================
#
# Prof Brian Ripley
#
# Dear maintainer,
#
# Please see the problems shown on
# <https://cran.r-project.org/web/checks/check_results_textTinyR.html>.
#
# Please correct before 2021-10-27 to safely retain your package on CRAN.
#
# The CRAN Team
#................................................

# The error occurred in:
# .
# .
# test-tokenization_transformation.R : test id 328
#
# *** caught segfault ***
#   address 6d6f7709, cause 'memory not mapped'
#................................................

# I omitted the test with id 328 from solaris testing:

is_solaris = function() {
  return(grepl('SunOS', Sys.info()['sysname']))                    # see: https://stackoverflow.com/a/23840917
}

# ========================================================================================================================================================================================

