# 03 — Desenvolvimento de Ferramentas

Scripts, pacotes e CLIs reutilizáveis para análises bioinformáticas reprodutíveis.

## Objetivo

> _Que problema recorrente esta ferramenta resolve?_

## Possíveis ideias

- CLI em Python para parsing/conversão de formatos (FASTA, GFF, VCF).
- Pacote Python instalável (`pip install -e .`) com testes (`pytest`).
- Wrapper/automação de um fluxo de análise.

## Uso

```bash
# exemplo
python -m minha_ferramenta --input arquivo.fasta --output resultado.tsv
```

## Desenvolvimento

```bash
conda activate bioinfo
pip install -e .
pytest
```

## Estrutura sugerida

```
03-tool-development/
├── src/minha_ferramenta/
├── tests/
├── pyproject.toml
└── README.md
```
