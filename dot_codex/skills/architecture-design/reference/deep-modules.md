# Deep Modules

Use this vocabulary when choosing a module seam:

- **Deep module:** substantial behavior behind a small interface; prefer it when it reduces caller knowledge.
- **Interface:** everything callers must know, including invariants, ordering, errors, configuration, and performance.
- **Seam:** the place callers and tests cross the interface; put it where traffic and knowledge are smallest.
- **Information hiding:** keep each volatile decision inside one module.
- **Shallow module:** an interface nearly as complex as its implementation; remove the indirection unless it buys real leverage.
- **Adapter:** a concrete implementation of an interface. Add a seam when variation is real, not speculative.
- **Deletion test:** if removing a module only removes delegation and its
  behavior does not reappear at callers, inline it instead.
