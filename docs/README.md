# Code-lab

Experimentos rápidos: testes técnicos, estudos, protótipos, snippets e provas de conceito . Foco em **aprender e validar**.

## Convenções
- **Pasta:** `code-lab/<habilidade>/<nome_experimento>`
- **Status:** `draft` | `done` | `revisit`
- **Tags:** tecnologia/técnica/domínio (ex.: `python`, `vibration`, `timeseries`)
- **Arquivos mínimos:**  `notebook.ipynb` ou `src/main.py`

## Front‑matter modelo
```yaml
---
title: "FFT básica em sinal de vibração"
skill: "signal-processing"
tags: ["python","fft","vibration","timeseries"]
status: "done"
created: "2025-08-14"
updated: "2025-08-14"
colab_url: "https://colab.research.google.com/github/<user>/<repo>/blob/main/code-lab/signal-processing/fft_demo/notebook.ipynb"
---


---

## 3) Template de README por experimento

```markdown
# <Título do experimento>

> **Objetivo (≤ 2 linhas):** O que você quis validar?

## Contexto
Breve motivação.

## Dados / Entrada
Fonte ou como gerar (se sintético).

## Passos
1. …
2. …

## Resultado rápido
- O que funcionou / não funcionou.
- Próximos passos.

## Executar
- Notebook: `notebook.ipynb`  
- Colab: [Abrir no Colab](<colab_url>)

## Licença
MIT

