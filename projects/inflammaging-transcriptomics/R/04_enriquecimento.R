# 04_enriquecimento.R — enriquecimento funcional dos DEGs (clusterProfiler)
# GO/KEGG por sobre-representação + GSEA com Hallmark (foco em inflamação).

library(clusterProfiler)
library(org.Hs.eg.db)
library(msigdbr)
library(ggplot2)

GSE_ID <- "GSE123696"
res <- readRDS(file.path("data", paste0(GSE_ID, "_DEG.rds")))
dir.create("results", showWarnings = FALSE)

# IMPORTANTE: 'res$gene' pode ser ID de sonda — converta para SÍMBOLO/ENTREZ conforme
# a plataforma. Aqui assumimos que já são símbolos de gene (SYMBOL). Ajuste se necessário.
sig <- subset(res, adj.P.Val < 0.05 & abs(logFC) > 0.5)
genes_sig <- unique(sig$gene)

# Mapeia SYMBOL -> ENTREZID
entrez <- bitr(genes_sig, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

# --- Sobre-representação (ORA): GO Biological Process ---
ego <- enrichGO(gene = entrez$ENTREZID, OrgDb = org.Hs.eg.db,
                ont = "BP", pAdjustMethod = "BH",
                pvalueCutoff = 0.05, readable = TRUE)
if (!is.null(ego) && nrow(as.data.frame(ego)) > 0) {
  write.csv(as.data.frame(ego), file.path("results", "enrich_GO_BP.csv"), row.names = FALSE)
  png(file.path("results", "enrich_GO_dotplot.png"), width = 1000, height = 800)
  print(dotplot(ego, showCategory = 20) + ggtitle("GO BP — DEGs do envelhecimento"))
  dev.off()
}

# --- KEGG ---
ekegg <- enrichKEGG(gene = entrez$ENTREZID, organism = "hsa", pvalueCutoff = 0.05)
if (!is.null(ekegg) && nrow(as.data.frame(ekegg)) > 0) {
  write.csv(as.data.frame(ekegg), file.path("results", "enrich_KEGG.csv"), row.names = FALSE)
}

# --- GSEA com Hallmark (MSigDB) — captura vias inflamatórias ---
# Ranqueia TODOS os genes por logFC.
ranked <- res[!is.na(res$logFC), ]
ranked <- ranked[order(-ranked$logFC), ]
gene_list <- ranked$logFC
names(gene_list) <- ranked$gene

hallmark <- msigdbr(species = "Homo sapiens", category = "H")
term2gene <- hallmark[, c("gs_name", "gene_symbol")]

gsea <- GSEA(geneList = gene_list, TERM2GENE = term2gene, pvalueCutoff = 0.25)
if (!is.null(gsea) && nrow(as.data.frame(gsea)) > 0) {
  write.csv(as.data.frame(gsea), file.path("results", "GSEA_hallmark.csv"), row.names = FALSE)
  png(file.path("results", "GSEA_dotplot.png"), width = 1000, height = 800)
  print(dotplot(gsea, showCategory = 20) + ggtitle("GSEA Hallmark"))
  dev.off()
}

message("Enriquecimento concluído. Tabelas e figuras em results/.")
# Vias-chave a observar: HALLMARK_INFLAMMATORY_RESPONSE,
# HALLMARK_TNFA_SIGNALING_VIA_NFKB, HALLMARK_IL6_JAK_STAT3_SIGNALING,
# HALLMARK_INTERFERON_GAMMA_RESPONSE (relevantes para inflammaging).
