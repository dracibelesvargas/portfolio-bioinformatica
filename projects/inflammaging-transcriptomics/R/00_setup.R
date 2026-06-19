# 00_setup.R — instala e carrega os pacotes necessários
# Rode uma vez para preparar o ambiente. Requer R >= 4.3.

# --- BiocManager (gerenciador de pacotes Bioconductor) ---
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Pacotes do Bioconductor
bioc_pkgs <- c(
  "GEOquery",        # baixar dados do GEO
  "limma",           # DE para microarray
  "DESeq2",          # DE para RNA-seq (contagens)
  "edgeR",           # alternativa para RNA-seq
  "clusterProfiler", # enriquecimento funcional (GO/KEGG/GSEA)
  "org.Hs.eg.db",    # anotação de genes humanos
  "EnhancedVolcano"  # volcano plot
)

# Pacotes do CRAN
cran_pkgs <- c(
  "ggplot2",
  "pheatmap",
  "msigdbr",         # gene sets MSigDB (Hallmark etc.)
  "dplyr",
  "tibble"
)

to_install_bioc <- bioc_pkgs[!vapply(bioc_pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(to_install_bioc) > 0) BiocManager::install(to_install_bioc, update = FALSE, ask = FALSE)

to_install_cran <- cran_pkgs[!vapply(cran_pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(to_install_cran) > 0) install.packages(to_install_cran)

# Carrega tudo
invisible(lapply(c(bioc_pkgs, cran_pkgs), library, character.only = TRUE))

message("Ambiente pronto. Pacotes carregados com sucesso.")
