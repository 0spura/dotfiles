# Deep Modules

Vocabulary for shaping a module so it earns its place, from Ousterhout's *A Philosophy of Software Design*. Reach for it when deciding where a boundary goes.

- **Depth:** a module is deep when a large amount of behavior sits behind a small interface. Depth is the goal, so favor the design that hides the most behind the least.
- **Interface vs implementation:** the interface is everything a caller must know; the implementation is everything else. A change that grows the interface to shrink the implementation usually loses.
- **Shallow module:** an interface nearly as complex as what it hides. It costs a name and a boundary without buying much, so inline it back.
- **Information hiding:** each design decision lives inside one module, invisible to the rest. A decision leaked across modules turns one change into edits everywhere.
- **Seam:** the boundary where two modules meet. Put it where the interface is narrowest and the traffic across it is simplest.
- **Pull complexity down:** a module absorbs complexity so its callers avoid it. A slightly harder implementation that spares every caller is the right trade.
- **General over special-purpose:** an interface shaped for the first caller's need goes shallow when the second caller arrives. Shape it for the behavior, not the first use.
