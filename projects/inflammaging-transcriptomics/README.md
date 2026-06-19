# Inflammaging — análise de transcriptoma

Projeto de bioinformática sobre **inflammaging**: a inflamação crônica de baixo grau que
acompanha o envelhecimento e conecta senescência celular, doenças inflamatórias e
declínio funcional. O objetivo é caracterizar, a partir de dados públicos de transcriptoma,
a assinatura inflamatória associada à idade e suas vias biológicas.

> Tema motivado pelo interesse em doenças inflamatórias (ex.: lipedema) e envelhecimento.
> O lipedema é um recorte possível para uma fase futura.

## Status

| Fase | Descrição | Situação |
|------|-----------|----------|
| 1 | Revisão exploratória dos dados públicos | ✅ ver [`docs/revisao-datasets.md`](docs/revisao-datasets.md) |
| 2 | Escolha do dataset + download | ⬜ a fazer |
| 3 | QC, normalização e expressão diferencial | ⬜ a fazer |
| 4 | Enriquecimento funcional + figuras | ⬜ a fazer |
| 5 | Interpretação e escrita dos resultados | ⬜ a fazer |

## Stack

R / Bioconductor: `GEOquery`, `limma`/`DESeq2`/`edgeR`, `clusterProfiler`, `msigdbr`,
`org.Hs.eg.db`, `ggplot2`, `EnhancedVolcano`, `pheatmap`.

## Estrutura

```
inflammaging-transcriptomics/
├── README.md
├── docs/
│   └── revisao-datasets.md     # Fase 1: revisão dos dados disponíveis
├── R/
│   ├── 00_setup.R              # instala/carrega pacotes Bioconductor
│   ├── 01_download_data.R      # baixa dataset do GEO (GEOquery)
│   ├── 02_qc_normalizacao.R    # QC + normalização
│   ├── 03_expressao_diferencial.R  # DE (limma ou DESeq2)
│   └── 04_enriquecimento.R     # GO/KEGG/GSEA (clusterProfiler)
├── data/                       # dados (não versionados)
└── results/                    # figuras e tabelas geradas
```

## Como rodar

```r
# No R, a partir desta pasta:
source("R/00_setup.R")            # instala dependências (uma vez)
source("R/01_download_data.R")    # ajuste o GSE escolhido dentro do script
source("R/02_qc_normalizacao.R")
source("R/03_expressao_diferencial.R")
source("R/04_enriquecimento.R")
```

## Próximo passo

Ler `docs/revisao-datasets.md` e escolher um dataset *bulk* inicial (jovem × idoso).
Recomendado começar por um conjunto com dois grupos etários bem definidos.
