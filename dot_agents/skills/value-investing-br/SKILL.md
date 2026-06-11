---
name: value-investing-br
description: >
  Use this skill whenever the user asks to analyze, research, compare, or select stocks for long-term investing. Also trigger when the user mentions: "which stock should I buy", "next contribution", "analyze a company", "is X worth investing in", "which is better: X or Y", "update my portfolio", "screen stocks", "fundamentals of", "emergency reserve", "how much to save before investing", "when to diversify", "international stocks", "BDRs", or any variant of fundamentals-based screening of Brazilian equities or personal investment structure.
---

# Value Investing Brazil — Stock Selection Framework

## Reference Files
Load the relevant file when the user's question goes deeper than the main framework:
- `references/reading-earnings.md` — how to read a quarterly release, calculate recurring earnings, Net Debt/EBITDA, Basel Index, and interpret guidance. Load when user asks about analyzing a specific company or reading results.
- `references/exit-strategy.md` — when and how to exit a position, valid vs. invalid exit reasons, partial vs. full exit, and rotation logic. Load when user asks about selling, rotating, or when to leave a position.
- `references/tax-brazil.md` — R$20,000 monthly exemption, loss harvesting, JCP vs. dividends, DARF, IRPF declaration. Load when user asks about tax, IR, or optimizing sales timing.

---

## Stage 0 — Before Investing in Equities

### Emergency Reserve (Non-Negotiable First Step)
Build **6× monthly expenses** (not income) in daily-liquidity instruments before allocating to equities: Tesouro Selic, daily-liquidity CDBs, or high-yield savings accounts. Distribute across 2–3 institutions to reduce single-institution risk. Never in equities or illiquid assets.

**Building in parallel:** while reserve is below target, split monthly surplus 70% toward reserve / 30% toward equities. Once complete, redirect 100% to equities.

**Why it matters:** the most common reason retail investors sell good stocks at the worst moment is not emotion — it is necessity. The reserve eliminates forced selling.

---

## Stage 1 — Initial Portfolio Construction (Years 1–2)

### Core Philosophy
Become a partner in companies that **grow earnings recurrently**, in perennial sectors, with governance that protects minority shareholders. Wealth compounds through earnings × time × consistent contributions — not timing or speculation.

> If the company grows earnings, price follows in the long run. If earnings stagnate or fall, so does your wealth.

### The 5 Non-Negotiable Filters

Apply in order. Any failure is eliminatory.

**Filter 1 — Ordinary share (ON) with 100% Tag Along**
Ticker ending in 3, Tag Along confirmed at 100%. Preferred shares (ending 4) and Units (ending 11) are prohibited — they do not offer full minority protection in control changes. Check: statusinvest.com.br → "Tag Along" field.

**Filter 2 — Recurring growing net profit**
Recurring (not reported) earnings must grow consecutively across recent quarters and years. Strip out: tax credits, asset sales, provision reversals, one-off financial gains. Operational earnings must grow. Elimination signal: 2+ consecutive quarters of recurring earnings decline, or guidance revised down with structural deterioration. → See `references/reading-earnings.md` for how to calculate this.

**Filter 3 — Healthy debt**
- Energy / Insurance: Net Debt/EBITDA below 3.0x comfortable; above 3.5x attention; above 4.0x red flag.
- Banks: Basel Index above 13%; NPL (90+ days) below 3.5%.
Warning: leverage rising quarter-over-quarter without proportional revenue growth. → See `references/reading-earnings.md` for calculation examples.

**Filter 4 — Long listing history**
Minimum 5 years on B3 with audited results. Prefer 10+ years to evaluate behavior across adverse cycles. Eliminate recent IPOs and companies with recurring losses.

**Filter 5 — Perennial sector**
Banking, electric energy, or insurance for Stage 1. Avoid for beginners: commodities, discretionary retail, real estate, technology without an earnings track record.

### The 6-Company Rule
Build exactly **6 companies across 3 sectors:** 2 Banks + 2 Energy + 2 Insurers.

Recommended entry order: Bank 1 → Energy 1 → Insurer 1 → Energy 2 → Bank 2 or Insurer 2 → final pair.

**Contribution logic:** always direct new capital to the most underweight position by percentage. Removes the emotional "which one looks cheaper" decision.

### Sector Analysis Notes

**Banking:** evaluate NPL ratio, credit portfolio growth, Basel Index, ROE, and efficiency ratio. State-owned banks carry additional political and sector-concentration risk. Private banks typically respond faster to NPL cycles.

**Electric Energy:** evaluate concession type and leverage trajectory. Transmission companies often use Unit structures — check Filter 1. Generation companies have higher earnings growth potential but more operational volatility. Rising leverage during investment cycles is expected; verify whether new assets generate proportional recurring revenue.

**Insurance:** evaluate loss ratio, premium growth, and financial income composition. Part of earnings comes from investing float at the Selic rate — when Selic falls, financial income compresses. Assess what share of earnings is operational vs. financial.

---

## Stage 2 — Portfolio Expansion

Move to Stage 2 when **all three conditions** are met:
1. Emergency reserve fully funded.
2. All 6 positions established and tracked across at least 4 quarterly earnings cycles.
3. You can read a quarterly release and independently identify whether earnings growth was recurring — without external recommendations.

The third condition is the most important. Expanding before developing this judgment scales exposure without scaling skill.

**Beyond the 3 defensive sectors:** the 5 filters apply unchanged to any sector. Other sectors with structural demand: basic sanitation (evaluate leverage and concession renewal risk), healthcare (evaluate organic vs. acquisition-driven growth), consumer staples (evaluate free cash flow consistency over reported earnings), infrastructure concessions (check Unit structure and leverage).

**Position sizing:** practical ceiling for individual stock-picking without professional research capacity is 10–12 positions. Beyond this, diversification gains diminish and tracking quality degrades. If broader diversification is desired, ETFs become more efficient than adding individual positions.

---

## Stage 3 — Geographic Diversification

Add international exposure when the domestic portfolio is established and you understand that a Brazil-only portfolio carries concentrated country risk (fiscal policy, currency, political cycles, sector correlation).

**How to access:**
- **BDRs:** foreign companies via B3 in BRL. Accessible, no foreign account needed. Lower liquidity and currency conversion costs apply.
- **International brokerage:** direct access to NYSE/NASDAQ in USD. Better liquidity, full asset universe, position held in foreign currency (natural hedge).

**The 5 filters apply internationally:** Filter 1 becomes evaluating voting rights and shareholder protection under the company's jurisdiction. Filters 2–5 are identical in principle.

**Reference allocation ranges by stage:**

| Stage | Brazil Equities | International | Reserve / Fixed Income |
|-------|----------------|---------------|----------------------|
| 0 | 0% | 0% | 100% |
| 1 | 80–100% | 0% | Reserve complete |
| 2 | 70–80% | 10–20% | Reserve maintained |
| 3 | 50–70% | 20–40% | Reserve maintained |

These are reference ranges, not rigid rules. Never increase equity allocation at the expense of the emergency reserve.

---

## Quantitative Metrics Reference

| Metric | Reference |
|--------|-----------|
| P/E | Banks 7–12x; Energy 10–16x; Insurance 8–14x |
| P/BV | Below 3x reasonable for quality companies |
| ROE | Above 15% good; above 20% excellent |
| Net Debt/EBITDA | Below 3x comfortable |
| Interest Coverage | Above 3x healthy |
| NPL 90+ (banks) | Below 3.5% healthy |
| Basel Index (banks) | Above 13% good |
| Earnings Growth YoY | Positive minimum; above 10% p.a. ideal |

> P/E caution: low P/E can signal opportunity or deterioration. Always cross-reference with earnings growth direction. In emerging markets, historical ranges include stress periods that distort the reference.

---

## Common Pitfalls

**High Dividend Yield illusion:** high DY in isolation signals price decline, unsustainable payout, or stagnant earnings — not opportunity. Dividends are a consequence of earnings growth, not a substitute for it.

**Units:** ticker ending in 11 bundles ON+PN. No 100% Tag Along on full position. Eliminated by Filter 1 regardless of yield.

**Macro noise vs. fundamental deterioration:** price drop from geopolitical/macro noise with fundamentals intact = contribution opportunity. Price drop from falling earnings, rising debt, or guidance cut = wait for 2+ quarters of confirmed recovery. → See `references/exit-strategy.md` for full exit framework.

**Hidden concentration:** a holding company and its underlying asset simultaneously represent nearly identical exposure. The 6-company rule requires truly distinct sector exposure.

**Tax-driven decisions:** never hold a deteriorating position to avoid realizing a gain. The tax cost is almost always lower than the loss from staying in a broken thesis. → See `references/tax-brazil.md` for the R$20,000 exemption and loss harvesting rules.

---

## Research Process

1. Confirm ON ticker with 100% Tag Along (Filter 1).
2. Find latest quarterly release — official IR or InfoMoney / Suno / Nord Investimentos.
3. Identify recurring earnings growth vs. same quarter prior year. → `references/reading-earnings.md`
4. Check leverage: Net Debt/EBITDA below 3.5x and stable?
5. Cross-reference P/E with sector historical range.
6. Check guidance: revised up, maintained, or down?
7. Compare with sector alternatives — which passes the filters most cleanly right now?

---

## Behavioral Principles

- Consistent contributions outperform yield optimization at small portfolio sizes.
- Ignore macroeconomic noise. The only question: is the company still growing earnings?
- Do not time tops or bottoms. A price drop with solid fundamentals is a discount on the same quality.
- Self-knowledge first: if a 30% drawdown triggers selling, equities may not be the right vehicle.
- Track before you expand: 4+ quarterly cycles across 6 companies builds the judgment needed for Stage 2.

---

## Quick Decision Checklist

- [ ] ON share with 100% Tag Along?
- [ ] Recurring earnings grew vs. same quarter prior year?
- [ ] Growth is operational (not purely financial/tax-driven)?
- [ ] Leverage below 3.5x Net Debt/EBITDA (or Basel above 13% for banks)?
- [ ] 5+ years of listing with earnings track record?
- [ ] Perennial sector?
- [ ] P/E within sector historical range?
- [ ] No duplication with existing portfolio exposure?

**8/8** = recommended entry. **7/8** = note the failed item. **6/8 or fewer** = wait or find a sector alternative.
