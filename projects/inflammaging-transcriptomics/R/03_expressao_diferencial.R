# 03_expressao_diferencial.R — expressão diferencial jovem x idoso (limma)
# Para RNA-seq por contagens, troque por DESeq2 (ver bloco comentado ao final).

library(limma)
library(EnhancedVolcano)

GSE_ID <- "GSE123696"   # <-- mesmo dos scripts anteriores
eset  <- readRDS(file.path("data", paste0(GSE_ID, "_eset.rds")))
expr  <- readRDS(file.path("data", paste0(GSE_ID, "_expr_norm.rds")))
pheno <- Biobase::pData(eset)

# ---- DEFINA O GRUPO (jovem x idoso) ----
# Ajuste para a coluna real dos metadados (veja a saída do script 01).
# Exemplo 1: a partir de uma coluna de idade numérica
#   idade <- as.numeric(gsub("[^0-9]", "", pheno[["age:ch1"]]))
#   grupo <- factor(ifelse(idade >= 60, "idoso", "jovem"), levels = c("jovem", "idoso"))
# Exemplo 2: a partir de uma coluna categórica já existente
#   grupo <- factor(pheno[["group:ch1"]])
grupo <- factor(pheno[["group:ch1"]])   # <-- AJUSTE AQUI
stopifnot(length(grupo) == ncol(expr))
print(table(grupo))

# Modelo linear (acrescente covariáveis como sexo/lote se disponíveis)
design <- model.matrix(~ grupo)
fit <- lmFit(expr, design)
fit <- eBayes(fit)

# Resultados do contraste idoso vs jovem (2º coeficiente)
res <- topTable(fit, coef = 2, number = Inf, sort.by = "P")
res$gene <- rownames(res)

dir.create("results", showWarnings = FALSE)
write.csv(res, file.path("results", "DEG_idoso_vs_jovem.csv"), row.names = FALSE)

# DEGs significativos
sig <- subset(res, adj.P.Val < 0.05 & abs(logFC) > 0.5)
message("DEGs significativos (adj.P<0.05, |logFC|>0.5): ", nrow(sig))

# Volcano plot
png(file.path("results", "volcano.png"), width = 900, height = 800)
print(
  EnhancedVolcano(res,
    lab = res$gene, x = "logFC", y = "adj.P.Val",
    pCutoff = 0.05, FCcutoff = 0.5,
    title = "Idoso vs Jovem", subtitle = "Expressão diferencial")
)
dev.off()

saveRDS(res, file.path("data", paste0(GSE_ID, "_DEG.rds")))
message("DE concluído. Tabela e volcano em results/.")

# --------------------------------------------------------------------------
# ALTERNATIVA RNA-seq (contagens brutas) com DESeq2:
# library(DESeq2)
# dds <- DESeqDataSetFromMatrix(countData = counts, colData = coldata, design = ~ grupo)
# dds <- DESeq(dds)
# res <- results(dds, contrast = c("grupo", "idoso", "jovem"))
# --------------------------------------------------------------------------
