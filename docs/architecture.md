# Architecture

## OMP Web container

OMP Web runs in a Linux container on the Mac mini. Compose mounts the configured host project root (`~/Projects`) at the same path in the container, `~/.omp/agent` read-write for sessions and provider state, and `~/.agents/skills` read-only for user-authored skills. The tool process shares the container user with OMP Web, so it can read the OMP state and skill mounts as well as every file under `~/Projects`; projects containing secrets are in scope. No other host home directories are mounted.

The local Dockerfile builds OMP Web from upstream commit `f54521209fcdc8b7fce83d700bb16a6e8d6f2dc9` on the pinned Bun 1.4.3 image. It installs Linux `workctl` from revision `8797ac2edac87f2ce3ba16341756301a9d56a2a3`, Rust/Cargo 1.99.1 for project builds and `workctl update`, Git, GitHub CLI 2.102.0, and GitLab CLI 1.123.0. CLI release artifacts are checksum-verified. The host's macOS tools are not mounted or modified.

Compose persists Cargo's home and cache in a named volume. Build outputs such as Cargo `target/` and JavaScript `node_modules/` are created under the writable project bind mount and therefore appear on the host; Linux-native artifacts may need cleaning before a macOS build. Bun is available for JavaScript package installation; the npm CLI is not installed. GitHub/GitLab authentication is not copied from the host; the CLIs need separate authentication inside the container before API operations.
