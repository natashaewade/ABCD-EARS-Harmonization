# ABCD Study: EARS-Harmonization

This repository provides R code examples of how to process and analyze EARS data from the Adolescent Brain Cognitive Development (ABCD) Study. The ABCD Study is a 10-year longitudinal study of youth who were 9-10 years-old at baseline. Starting at their Year 4 follow-up visit (ages 13-14), youth were invited to participate in an additional study element of downloading an app (EARS; developed by Ksana Health) to passively log their smartphone use behaviors (which apps they use, number of keyboard strokes within an app, and when these occur).

The code herein was first used in the manuscript, "Passively Sensing Smartphone Use in Teens: Rates of Use by Sex and Across Operating Systems", by Alexander et al. (preprint: https://osf.io/preprints/psyarxiv/evkz9). Data used was from ABCD Data Release 5.0 (doi: 10.15154/8873-zj65; https://nda.nih.gov/study.html?id=2147).

The paper details passive sensing mobile smartphone data collection methods and validity and describes patterns of teen smartphone use. Additional details about the ABCD Study can be viewed elsewhere (e.g., https://abcdstudy.org/; Jernigan et al., 2018, Dev Cogn Neurosci).

## Data 

To run these examples, you will need access to the ABCD data resource. Access can be requested through the NIMH Data Archive (NDA) at https://nda.nih.gov/abcd/request-access. Users must create an NDA account and complete a data use certification request. Once approval to access the data is granted, data users will need to download the data from NDA:

- To access the prepared summary data in the tabulated data resource, go to https://nda.nih.gov/study.html?id=2147 and click on "ABCD 5.0 Tabulated Release Data" within the "Results" section of the page. 
- To access the more raw EARS data, go to https://nda.nih.gov/general-query.html?q=query=featured-datasets:Adolescent%20Brain%20Cognitive%20Development%20Study%20(ABCD). Select "Release 5.0 Moble Device Usage Raw Data (EARS)" from under "Release 5.0 Raw Data - June 2023".

Once you obtained access and downloaded the ABCD and EARS data,

- clone this repository to your machine.
- copy the `nt_y_ears.csv` table from the tabulated data resource into the `data/` directory.
- copy the `abcd_earsraw01/` directory containing the EARS raw data into the `data/` directory.

After that, the `data/` directory should look like this

```
data/
 ├── README.md
 ├── abcd_earsraw01
 │   ├── ABCD_usage_log_NDAR_INVXXXXXXXX.zip
 │   ├── ...
 │   ├── earrawdata_NDAR_INVXXXXXXXX.zip
 │   ├── ...
 └── nt_y_ears.csv
```

## R environment

This repository is organized as an RStudio project and the needed packages and their versions are tracked using the [`{renv}` package](https://rstudio.github.io/renv/articles/renv.html). The easiest way to recreate the needed R environment to use the code is to follow the following steps:

- (install [R](https://cran.rstudio.com/) and [RStudio](https://posit.co/download/rstudio-desktop/))
- clone this repository to your local computer
- navigate into the top level directory
- double click the `abcd-ears.Rproj` file (this will open RStudio with the working directory correctly set)
- execute `renv::restore()` from the command prompt

The R version used to create and test this code is 4.2.3.

## Code examples

The example code for how to process and analyze EARS data can be found in the following two R scripts in the top level directory:

- `ears-and-ios-categ.R`: Code for combining Android (Google Play) and iOS (App Store) categories.
- `ears-hourly-binning.R`: Code for extracting EARS raw data, binning it into hours, and plotting it.

## Additional Notes

- We have observed that code running times vary significantly by machine. For the hourly binning code, it can take <60 seconds or >45 minutes
- Cleaning of the data in the ears-hourly-binning.R code is similar to that of the summary data provided by Ksana Health and described in the Supplement to the primary manuscript.
 Briefly, this means that we remove apps that can run for close to 24 hours (see list below). We further remove observations longer than 20 hours.

**Removed apps:**

- `com.android.systemui`
- `com.lge.qmemoplus`
- `com.google.android.gms`
- `com.sec.android.app.launcher`
- `com.sec.android.mimage.photoretouching`
- `us.ozteam.bigfoot`
- `com.pixel.art.coloring.color.number`
- `com.robtopx.geometryjumplite`
- `com.google.android.inputmethod.latin`
- `com.lge.clock`
- `com.pt.bark`
- `com.tct.launcher`
- `com.lge.launcher3`
- `royaln.Removeunwantedcontent`
- `com.samsung.android.contacts`
- `com.google.android.packageinstaller`
- `com.wssyncmldm`

