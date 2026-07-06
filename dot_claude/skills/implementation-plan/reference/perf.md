# Performance Item

Type prefix: `perf(<scope>):` → executed by the **perf** agent.

The bottleneck is discovered empirically by profiling at runtime, so leave Baseline, Bottleneck, and Change blank — the perf agent measures and fills them in. State a measurable target up front. `<scope>` names what is optimized, not the technique.

```markdown
## Problem
[what is slow or resource-heavy, and where — response time, memory, CPU, throughput]

## Baseline
[leave blank — measured by the perf agent]

## Target
[what improvement looks like — latency < X ms, memory < Y MB, throughput > Z req/s]

## Bottleneck
[leave blank — profiled by the perf agent]

## Change
[leave blank — filled in by the perf agent]

## Implementation Surface
- `[path/module]` - [suspected hot path, if known — used for parallel-safety]

## Acceptance
- [ ] verification shows improvement meeting the target
- [ ] behavior and correctness unchanged
- [ ] no regression in adjacent paths

## Verification
[benchmark or timed command, runnable before and after under comparable conditions]
```
