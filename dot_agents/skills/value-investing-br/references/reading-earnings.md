# Reading a Quarterly Earnings Release

## Where to Find It
- Company's Investor Relations (RI) website → "Resultados" or "Earnings Releases"
- B3: dados.b3.com.br → company page → ITR/DFP filings
- Aggregators: Investidor10, Status Invest, Suno (for summaries)

Always read the **official release first**, then cross-reference with analyst coverage.

---

## The Three Numbers That Matter Most

### 1. Recurring Net Profit (Lucro Líquido Recorrente)
This is Filter 2. Companies report two versions:
- **Reported (contábil):** includes everything — tax credits, asset sales, provision reversals.
- **Recurring (recorrente/ajustado):** strips one-off items. This is the number to use.

**How to identify non-recurring items:** look for footnotes or the "Eventos Não Recorrentes" section. Common examples:
- "Efeito tributário relacionado a incorporação de X" → tax benefit, non-recurring
- "Reversão de provisão judicial" → legal provision reversal, non-recurring
- "Ganho na venda de participação em Y" → asset disposal, non-recurring

**Example:**
| | 1Q Current Year | 1Q Prior Year | YoY |
|--|--|--|--|
| Reported net profit | R$2.1B | R$1.6B | +31% |
| Non-recurring items | +R$400M tax credit | — | — |
| **Recurring net profit** | **R$1.7B** | **R$1.6B** | **+6%** |

The headline +31% looks strong. The recurring +6% is the real number — modest but positive, passes Filter 2.

### 2. EBITDA (Earnings Before Interest, Taxes, Depreciation, Amortization)
Measures operational cash generation before financial structure. Use it to:
- Calculate Net Debt/EBITDA (Filter 3)
- Verify whether revenue growth is translating into operational profit

**Warning sign:** revenue growing but EBITDA flat or falling → costs growing faster than revenue → margin compression.

### 3. Net Debt / EBITDA
**Formula:** (Gross Debt − Cash) / EBITDA (last 12 months)

**Example:**
- Gross debt: R$25B
- Cash: R$6B
- Net debt: R$19B
- EBITDA (LTM): R$7B
- **Net Debt/EBITDA: 2.7x** → comfortable, passes Filter 3

**Banks use different metrics:** no Net Debt/EBITDA. Use instead:
- **Basel Index (Índice de Basileia):** capital adequacy. Above 13% is healthy. Find in "Gestão de Capital" section.
- **NPL 90+ (Inadimplência >90 dias):** below 3.5% is healthy. Rising NPL with rising provisions = earnings pressure ahead.

---

## The YoY vs. QoQ Distinction

Always compare **same quarter, prior year (YoY)** — not sequential quarters (QoQ).

Why: most businesses are seasonal. A bank's Q4 is typically stronger than Q1 due to year-end credit demand. Comparing Q1 to Q4 produces a misleading decline that is purely seasonal. YoY removes this noise.

**Exception:** when tracking a recovery, QoQ can confirm trend direction — but YoY remains the primary signal.

---

## Guidance: What to Look For

Guidance is management's projection for the full year. Read it as a signal of management's confidence.

| Guidance change | Signal |
|---|---|
| Raised mid-year | Management sees better-than-expected performance |
| Maintained | Execution on track |
| Narrowed to lower half of range | Soft warning — things are harder than expected |
| Revised down with explanation | Yellow flag — verify if structural or one-off |
| Revised down + cost of credit raised sharply | Red flag — Filter 2 at risk |

**Where to find it:** "Guidance" or "Projeções" section of the earnings release, typically a table with metric ranges for the year.
