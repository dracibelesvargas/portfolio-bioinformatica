# Revisão exploratória — Inflammaging (inflamação + envelhecimento)

> **Fase 1 do projeto.** Objetivo desta revisão: mapear os dados públicos, recursos e
> assinaturas gênicas disponíveis para estudar o *inflammaging* via transcriptômica,
> antes de fixar a análise. Os datasets abaixo são **candidatos a avaliar** — os
> acessos precisam ser conferidos diretamente no GEO antes de baixar.
>
> _Última atualização: 2026-06-19._

## 1. Conceito

**Inflammaging** (ou *inflamm-aging*) é o aumento crônico, sistêmico e de baixo grau
de marcadores pró-inflamatórios que acompanha o envelhecimento, e é fator de risco
para múltiplas doenças crônicas relacionadas à idade (cardiovasculares, metabólicas,
neurodegenerativas). É um dos elos entre **senescência celular** (via o *SASP*) e o
declínio funcional do envelhecimento — e conecta-se a doenças inflamatórias do tecido
adiposo, como o **lipedema** (recorte possível para um projeto futuro).

## 2. Recursos e bases de dados

| Recurso | O que oferece | Link |
|---------|---------------|------|
| **Aging Atlas (GAAA)** | Base multi-ômica de envelhecimento; coleção curada de genes (*Genes Archived in Aging Atlas*) em 10 *gene sets* + vias KEGG | https://ngdc.cncb.ac.cn/aging/index |
| **SASP Atlas** | Atlas proteômico do *senescence-associated secretory phenotype* (citocinas, quimiocinas, proteases) por tipo celular/indutor | https://www.saspatlas.com |
| **GTEx** | Expressão (RNA-seq) em ~49 tecidos humanos, idades 20–79 — base para mudanças de expressão por idade | https://gtexportal.org |
| **voyAGEr** | Interface web para alterações de expressão relacionadas à idade em 49 tecidos humanos, por sexo | https://elifesciences.org/articles/88623 |
| **GEO / NCBI** | Repositório primário de datasets de expressão (microarray e RNA-seq) | https://www.ncbi.nlm.nih.gov/geo/ |

## 3. Datasets candidatos (GEO) — a verificar

| Acesso | Descrição | Tipo | Uso possível |
|--------|-----------|------|--------------|
| **GSE123696 / GSE123697 / GSE123698** | Sangue total de jovens vs idosos saudáveis (seguimento de 3 anos) | Microarray | Expressão diferencial jovem×idoso (bom ponto de partida) |
| **GSE263013** | Transcriptoma associado a elementos repetitivos e inflammaging em adultos de meia-idade/idosos | RNA-seq | Inflammaging + sensores imunes inatos / IL-6 |
| **GSE150728 / GSE145926** | PBMC scRNA-seq (coortes jovens/idosas; imunossenescência) | scRNA-seq | Atlas de células imunes no envelhecimento (avançado) |

> ⚠️ Confirme no GEO: nº de amostras, grupos etários, plataforma, disponibilidade de
> contagens brutas (RNA-seq) ou intensidades (microarray) e metadados de fenótipo.
> Prefira para começar um dataset **bulk** (microarray ou RNA-seq) com dois grupos
> bem definidos (jovem × idoso) — pipeline mais simples e didático.

## 4. Assinaturas gênicas de referência

- **SASP** — citocinas/quimiocinas/proteases secretadas por células senescentes
  (ex.: IL-6, IL-8/CXCL8, IL-1β); biomarcadores plasmáticos como **GDF15**, **STC1**, **SERPINs**.
- **iAge** (relógio inflamatório, Sayed et al. 2021, *Nature Aging*) — destaca a
  quimiocina **CXCL9** como principal contribuinte da inflamação sistêmica relacionada à idade.
- **AP-1 (JUN/FOS)** — ativação transcricional do complexo AP-1 como assinatura
  conservada de envelhecimento imune e possível driver do inflammaging.
- **GAAA gene sets** (Aging Atlas) — conjuntos gênicos curados + vias KEGG para enriquecimento.
- Marcadores de inflammaging em sangue (ex.: **FASLG**, VCAM1) relatados em transcriptoma de idosos.

## 5. Métodos propostos (R / Bioconductor)

1. **Aquisição:** `GEOquery` para baixar a matriz de expressão + metadados.
2. **QC e normalização:** microarray → `limma` (normalização + `lmFit`/`eBayes`);
   RNA-seq (contagens) → `DESeq2` ou `edgeR`.
3. **Expressão diferencial:** jovem × idoso, com correção por sexo/lote como covariáveis.
4. **Enriquecimento funcional:** `clusterProfiler` (GO, KEGG, Reactome) + GSEA com
   `msigdbr` (Hallmark: *Inflammatory Response*, *TNFA Signaling via NFKB*, *IL6/JAK/STAT3*)
   e os *gene sets* do Aging Atlas.
5. **Visualização:** volcano plot, heatmap dos DEGs, enrichment dotplot, PCA.
6. **(Opcional)** Comparar a assinatura obtida com SASP/iAge/AP-1 e discutir sobreposição.

## 6. Próximos passos

- [ ] Escolher 1 dataset bulk inicial (recomendo confirmar o GSE123696 ou um RNA-seq jovem×idoso).
- [ ] Rodar `R/01_download_data.R` e inspecionar metadados/grupos.
- [ ] Executar o pipeline DE → enriquecimento.
- [ ] Escrever os resultados no README do projeto (figuras + interpretação clínica).

## 7. Referências

- Sayed et al. (2021). An inflammatory aging clock (iAge)… *Nature Aging*. https://www.nature.com/articles/s43587-021-00082-y
- Basisty et al. (2020). A proteomic atlas of senescence-associated secretomes (SASP Atlas). *PLOS Biology*. https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.3000599
- Aging Atlas Consortium (2021). Aging Atlas: a multi-omics database for aging biology. *Nucleic Acids Research*. https://academic.oup.com/nar/article/49/D1/D825/5943197
- AP-1 (JUN/FOS) como assinatura de envelhecimento imune. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10086525/
- Elementos repetitivos e inflammaging (GSE263013). *GeroScience*. https://link.springer.com/article/10.1007/s11357-024-01126-y
- voyAGEr (alterações de expressão por idade em tecidos humanos). *eLife*. https://elifesciences.org/articles/88623
