# 02 — Análise NGS & Genômica

Pipelines de processamento e análise de dados de sequenciamento de nova geração.

## Objetivo

> _Descreva a pergunta biológica e o tipo de dado (DNA-seq, RNA-seq, etc.)._

## Possíveis ideias

- Pipeline de controle de qualidade e alinhamento (FastQC → trimming → BWA/STAR).
- Variant calling e anotação (GATK / bcftools → VEP / SnpEff).
- Análise de expressão diferencial em RNA-seq (salmon/STAR → DESeq2/edgeR).

## Dados

> _Fonte (SRA, ENA, etc.), accession e script de download. Não versionar FASTQ/BAM._

## Pipeline

> _Diagrama/etapas do fluxo. Considere Snakemake ou Nextflow para reprodutibilidade._

## Resultados

> _Tabelas de variantes/expressão, figuras (PCA, volcano plot) e conclusões._

## Ferramentas

Adicione um `environment.yml` próprio aqui com, por exemplo:
`fastqc`, `samtools`, `bwa`, `bcftools`, `snakemake` (canal bioconda).
