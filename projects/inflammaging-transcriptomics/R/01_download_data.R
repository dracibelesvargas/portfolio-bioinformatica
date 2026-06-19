# 01_download_data.R — baixa um dataset do GEO e inspeciona os metadados
# Ajuste GSE_ID para o dataset escolhido na revisão (docs/revisao-datasets.md).

library(GEOquery)

# ---- CONFIGURE AQUI ----
GSE_ID  <- "GSE123696"          # <-- troque pelo acesso escolhido
DEST_DIR <- "data"              # pasta de download (não versionada)
# -------------------------

dir.create(DEST_DIR, showWarnings = FALSE, recursive = TRUE)

# Baixa a série. GSEMatrix=TRUE retorna ExpressionSet(s) já montados.
gset <- getGEO(GSE_ID, GSEMatrix = TRUE, destdir = DEST_DIR)

# Algumas séries têm mais de uma plataforma -> lista. Pegue a primeira.
if (length(gset) > 1) {
  message("Série com múltiplas plataformas; usando a primeira. Confira qual é a correta.")
}
eset <- gset[[1]]

# Inspeção rápida
message("Dimensões (genes x amostras): ", paste(dim(eset), collapse = " x "))
message("\nVariáveis de fenótipo disponíveis:")
print(colnames(Biobase::pData(eset)))

# Mostre as primeiras linhas dos metadados para identificar a coluna de idade/grupo
print(utils::head(Biobase::pData(eset)))

# Salva o ExpressionSet para os próximos scripts
saveRDS(eset, file.path(DEST_DIR, paste0(GSE_ID, "_eset.rds")))
message("\nExpressionSet salvo em ", file.path(DEST_DIR, paste0(GSE_ID, "_eset.rds")))

# PRÓXIMO PASSO: identifique nos metadados a coluna que separa jovem x idoso
# (ex.: idade, "age", "group") e anote o nome para usar no script 02/03.
