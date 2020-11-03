# single cell RNA-seq data analysis pipeline for thesis @ Katajisto Lab

## Introduction
This analysis pipeline is used to process and analyze three scRNA-seq datasets.
 - **Data_preprocessing**: Perform data loading, QC, normalization, feature selection, data correction, and dimensionality reduction for the datasets
 - **Clustering**: Perform clustering on the primary dataset (uncorrected & cell cycle corrected)
 - **DE analysis**: Find marker genes from the primary datasets
 - **Trajectory_inference**: Perform trajectory inference and calculate gene importances for all datasets
 - **Cell_annotations**: Perform mapping of primary data cells onto the cell types of reference datasets
 - **Metabolic_pathways**: Identify differential metabolic modules / pathways along the trajectories

### Data
Three datasets are used in the pipeline of which one is our primary data and two other are used as reference datasets

 - Reference data sets:
    - De Micheli et al. (2020): GEO GSE143435
    - Dell'Orso et al. (2019): GEO GSE126834

The reference data sets are available in NCBI GEO:
  - https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE126834
  - https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE143435

The primary data set is not publicly available.

### Folder breakdown
```
 -- script
    |_ data_preprocessing.Rmd
    |_ Clustering.Rmd
    |_ DE_analysis.Rmd
    |_ Trajectory_inference.Rmd
    |_ Cell_annotations.Rmd
    |_ Metabolic_pathways.Rmd
 -- saved
    |_ <all saved objects are stored in this folder>
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

