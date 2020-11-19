# single cell RNA-seq data analysis pipeline for thesis @ Katajisto Lab
**Ville Lehtonen**
Master's thesis project @ Katajisto Lab
University of Amsterdam / Vrije Universiteit Amsterdam
M.Sc. in Bioinformatics and Systems Biology

## Introduction
This analysis pipeline is used to process and analyze three scRNA-seq datasets.  Data preprocessing should be run first as the downstream
analyses are dependent on the R objects generated by it. It is recommended to run the scripts in the order shown below as some of the downstream
analyses also use the output of other downstream analyses as their input. The pipeline contains the following scripts

 - **Data_preprocessing**: Perform data loading, QC, normalization, feature selection, data correction, and dimensionality reduction for the datasets
 - **Clustering**: Perform clustering on the primary dataset (uncorrected & cell cycle corrected)
 - **DE analysis**: Find marker genes from the primary datasets
 - **Trajectory_inference**: Perform trajectory inference and calculate gene importances for all datasets
 - **Cell_annotations**: Perform mapping of primary data cells onto the cell types of reference datasets
 - **Metabolic_pathways**: Perform trajectory inference, cell type annotation, and DE analysis on a subset of metabolic genes (determined by KEGG)
 - **Metabolic_pathways_pt2**: Aggregate metabolic gene expression into module/pathway expression and compute the module/pathway importances on trajectories

### Data
Three datasets are used in the pipeline of which one is our primary data and two other are used as reference datasets

 - Reference data sets:
    - De Micheli et al. (2020): GEO GSE143437
    - Dell'Orso et al. (2019): GEO GSE126834

The reference data sets are available in NCBI GEO:
  - https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE126834
  - https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE143437

The primary data set is not publicly available.

### Folder breakdown
Below is shown the folder breakdown of this project. The 'R_objects' and the 'data' folders are not uploaded to Github due to their large sizes (~7GB in total).

```
 -- script
    |_ data_preprocessing.Rmd
    |_ Clustering.Rmd
    |_ DE_analysis.Rmd
    |_ Trajectory_inference.Rmd
    |_ Cell_annotations.Rmd
    |_ Metabolic_pathways.Rmd
    |_ Metabolic_pathways_pt2.Rmd
 -- saved
    |_ tables
    |_ figures
    |_ R_objects
 -- data
    |_ filtered_feature_bc_matrix
        |_ barcodes.tsv.gz
        |_ features.tsv.gz
        |_ matrix.mtx.gz
    |_ GSE143437
        |_ GSE143437_DeMicheli_MuSCatlas_rawdata.txt
        |_ GSE143437_DeMicheli_MuSCatlas_metadata.txt
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

