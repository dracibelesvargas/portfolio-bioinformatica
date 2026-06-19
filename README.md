# Portfólio de Bioinformática

Portfólio de projetos desenvolvido para transição de carreira na área de **bioinformática**.
Cada projeto é autocontido, reprodutível e documentado, demonstrando competências em
análise de dados biológicos, pipelines de NGS, desenvolvimento de ferramentas e
bioinformática estrutural.

## Sobre

> _Espaço para sua apresentação: formação, motivação para a transição de carreira e
> principais habilidades. Atualize esta seção conforme avança._

## Áreas e projetos

| # | Área | Pasta | Status |
|---|------|-------|--------|
| 01 | Data Science & Estatística | [`projects/01-data-science-stats`](projects/01-data-science-stats) | 🚧 em planejamento |
| 02 | Análise NGS & Genômica | [`projects/02-ngs-genomics`](projects/02-ngs-genomics) | 🚧 em planejamento |
| 03 | Desenvolvimento de Ferramentas | [`projects/03-tool-development`](projects/03-tool-development) | 🚧 em planejamento |
| 04 | Bioinformática Estrutural & Proteínas | [`projects/04-structural-proteins`](projects/04-structural-proteins) | 🚧 em planejamento |

## Ambiente

O ambiente base usa **Python** (via Anaconda/conda). Para reproduzir:

```bash
conda env create -f environment.yml
conda activate bioinfo
```

Projetos individuais podem definir dependências adicionais em seus próprios
`environment.yml` ou `requirements.txt`.

## Estrutura

```
bioinfo/
├── environment.yml          # ambiente conda base
├── data/                    # dados (não versionados — ver .gitignore)
├── projects/                # um diretório por projeto
│   ├── 01-data-science-stats/
│   ├── 02-ngs-genomics/
│   ├── 03-tool-development/
│   └── 04-structural-proteins/
└── README.md
```

## Convenções

- Cada projeto tem seu próprio `README.md` com objetivo, dados, métodos e resultados.
- Dados brutos e grandes **não** são versionados (ver `.gitignore`); inclua scripts de download.
- Notebooks devem rodar de cima a baixo sem erros antes de commitar.

## Contato

- Email: dracibelesvargas@gmail.com
