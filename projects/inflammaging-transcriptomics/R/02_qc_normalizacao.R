# 02_qc_normalizacao.R — controle de qualidade e normalização
# Microarray: normalização + log2 (limma). RNA-seq (contagens): use DESeq2 no script 03.

library(limma)
library(ggplot2)

GSE_ID <- "GSE123696"   # <-- mesmo do script 01
eset <- readRDS(file.path("data", paste0(GSE_ID, "_eset.rds")))

expr <- Biobase::exprs(eset)
pheno <- Biobase::pData(eset)

# --- Checagem: dados em escala log? Microarrays às vezes vêm em escala linear ---
qx <- as.numeric(quantile(expr, c(0, 0.25, 0.5, 0.75, 0.99, 1), na.rm = TRUE))
needs_log <- (qx[5] > 100) || (qx[6] - qx[1] > 50 && qx[2] > 0)
if (needs_log) {
  expr[expr <= 0] <- NaN
  expr <- log2(expr)
  message("Aplicado log2 (dados pareciam estar em escala linear).")
}

# Normalização entre amostras (quantile) — apropriada para microarray
expr <- normalizeBetweenArrays(expr, method = "quantile")

# --- QC visual ---
dir.create("results", showWarnings = FALSE)

# Boxplot da distribuição por amostra
png(file.path("results", "qc_boxplot.png"), width = 1200, height = 600)
boxplot(expr, las = 2, outline = FALSE, main = "Distribuição da expressão por amostra")
dev.off()

# PCA
pca <- prcomp(t(na.omit(expr)), scale. = TRUE)
var_exp <- round(100 * pca$sdev^2 / sum(pca$sdev^2), 1)
pca_df <- data.frame(PC1 = pca$x[, 1], PC2 = pca$x[, 2])
png(file.path("results", "qc_pca.png"), width = 800, height = 600)
print(
  ggplot(pca_df, aes(PC1, PC2)) +
    geom_point(size = 3) +
    labs(x = paste0("PC1 (", var_exp[1], "%)"),
         y = paste0("PC2 (", var_exp[2], "%)"),
         title = "PCA das amostras") +
    theme_minimal()
)
dev.off()

# Salva matriz normalizada
saveRDS(expr, file.path("data", paste0(GSE_ID, "_expr_norm.rds")))
message("QC concluído. Figuras em results/, matriz normalizada salva em data/.")
