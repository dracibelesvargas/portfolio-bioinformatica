# Roadmap de Aprendizado — Bioinformática

Plano de estudos para formação como bioinformata autônoma, do zero à autonomia,
aprendendo **fazendo** (cada módulo se aplica aos projetos reais do portfólio).

> **Estratégia:** começamos por **R** (estatística + genômica via Bioconductor, aplicação
> imediata no projeto de inflammaging) e depois adicionamos **Python** (automação, NGS,
> machine learning). Aprender uma linguagem por vez evita sobrecarga.

Legenda: ⬜ a fazer · 🔄 em andamento · ✅ concluído

---

## Módulo 0 — Preparação do ambiente
- ⬜ Instalar **R** e **RStudio**
- ⬜ Conhecer a interface do RStudio (console, script, environment, plots)
- ✅ Git configurado e repositório no GitHub
- ⬜ Noções de linha de comando (terminal)
- ⬜ Anaconda no PATH / Anaconda Prompt (para a fase Python)

## Módulo 1 — Fundamentos de R
- ⬜ Variáveis, tipos de dados (numeric, character, logical, factor)
- ⬜ Vetores, listas, `data.frame`
- ⬜ Operadores, indexação (`[ ]`, `$`)
- ⬜ Controle de fluxo (`if`, `for`, `while`) e funções
- ⬜ Importar dados (`read.csv`) e inspecionar
- ⬜ **tidyverse**: `dplyr` (manipular) e `ggplot2` (visualizar)
- 🎯 Mini-projeto: análise exploratória de um dataset clínico simples

## Módulo 2 — Estatística aplicada (em R)
- ⬜ Estatística descritiva e distribuições
- ⬜ Visualização de distribuições (histograma, boxplot)
- ⬜ Testes de hipótese: t-test, Wilcoxon, qui-quadrado, ANOVA
- ⬜ Correlação e regressão (linear/logística)
- ⬜ **Testes múltiplos e correção de FDR** (essencial em genômica)
- 🎯 Aplicar em dados reais de expressão

## Módulo 3 — Biologia molecular para bioinformática
- ⬜ Dogma central: DNA → RNA → proteína
- ⬜ Expressão gênica e regulação; o que é transcriptoma
- ⬜ Tecnologias: microarray, RNA-seq, sequenciamento (NGS)
- ⬜ Bancos de dados: NCBI, Ensembl, **GEO**, UniProt, KEGG, GO
- ⬜ Vocabulário para ler artigos da área

## Módulo 4 — Bioinformática aplicada em R/Bioconductor
- ⬜ Bioconductor e estruturas de dados (`ExpressionSet`, `SummarizedExperiment`)
- ⬜ Download e organização de dados (`GEOquery`)
- ⬜ Controle de qualidade e normalização
- ⬜ **Expressão diferencial** (`limma` / `DESeq2`)
- ⬜ **Enriquecimento funcional** (`clusterProfiler`, GSEA)
- ⬜ Visualizações: volcano plot, heatmap, PCA
- 🎯 Projeto: **inflammaging-transcriptomics** completo

## Módulo 5 — Python para bioinformática
- ⬜ Fundamentos de Python (sintaxe, estruturas de dados, funções)
- ⬜ Ambientes com conda; Jupyter Notebook
- ⬜ `pandas`, `numpy`, `matplotlib`/`seaborn`
- ⬜ **Biopython** (manipular sequências, parsear FASTA/GenBank)
- ⬜ Scripts e automação de tarefas
- 🎯 Mini-projeto: ferramenta/CLI simples

## Módulo 6 — NGS, Linux e pipelines
- ⬜ Linha de comando Linux/bash
- ⬜ Formatos: FASTQ, SAM/BAM, VCF, GFF
- ⬜ Ferramentas: FastQC, trimming, alinhamento, samtools
- ⬜ Workflow managers: **Snakemake** ou **Nextflow**
- ⬜ Reprodutibilidade (ambientes, versionamento)

## Módulo 7 — Skills profissionais (contínuo)
- 🔄 Git/GitHub (commits, branches, organização) — já iniciado
- ⬜ Documentação: RMarkdown e Jupyter
- ⬜ Boas práticas de código e estrutura de projetos
- ⬜ Comunicação de resultados (figuras, relatórios)
- ⬜ Construção e apresentação do portfólio

## Módulo 8 — Especialização (escolher depois)
- ⬜ Machine learning aplicado a dados ômicos
- ⬜ Single-cell (scRNA-seq)
- ⬜ Bioinformática estrutural / proteínas
- ⬜ Multi-ômica e integração de dados

---

## Como trabalhamos
1. **Conceito** — o tutor explica o porquê, com exemplos curtos.
2. **Prática** — você escreve o código (eu não entrego pronto).
3. **Revisão** — eu corrijo, aponto erros e o que melhorar.
4. **Exercício** — desafios para fixar; depuração você mesma.
5. **Aplicação** — levar o aprendido para um projeto real do portfólio.

> Registro de progresso: marque os itens conforme avança. Atualizado conforme caminhamos.
