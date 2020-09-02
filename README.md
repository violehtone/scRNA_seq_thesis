# single cell RNA-seq data analysis pipeline for thesis @ Katajisto Lab

## Introduction
The data_preprocessing.Rmd script (in the script folder) is used for performing the data pre-processing of 3 scRNA-seq data sets.

 - One dataset is primary data and the other two are used as reference datasets.
 - Reference data sets:
    - De Micheli et al. (2020): GSE143435 data set
    - Dell'Orso et al. (2019): GSE126834 data set

The reference data sets are available in NCBI GEO:
  - https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE126834
  - https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE143435

The primary data set is not publicly available.

### Folder breakdown
```
 -- script
    |_ data_preprocessing.Rmd
 -- saved
 -- results
 -- data
    |_ filtered_feature_bc_matrix
        |_ barcodes.tsv.gz
        |_ features.tsv.gz
        |_ matrix.mtx.gz
    |_ GSE143435
        |_ GSE143435_DeMicheli_D0_FACSatlas_metadata.txt
        |_ GSE143435_DeMicheli_D0_FACSatlas_rawdata.txt
        |_ GSE143435_DeMicheli_D5_FACSatlas_metadata.txt
        |_ GSE143435_DeMicheli_D5_FACSatlas_rawdata.txt
        |_ GSE143435_DeMicheli_D7_FACSatlas_metadata.txt
        |_ GSE143435_DeMicheli_D7_FACSatlas_rawdata.txt
    |_ GSE126834
        |_ homeostatic_muscs_1
                |_ barcodes.tsv
                |_ genes.tsv
                |_ matrix.mtx
        |_ homeostatic_muscs_2
                |_ barcodes.tsv
                |_ genes.tsv
                |_ matrix.mtx
        |_ inj_60h_muscs_1
                |_ barcodes.tsv
                |_ genes.tsv
                |_ matrix.mtx
        |_ inj_60h_muscs_2
                |_ barcodes.tsv
                |_ genes.tsv
                |_ matrix.mtx
        |_ primary_MB
                |_ barcodes.tsv
                |_ genes.tsv
                |_ matrix.mtx
```

