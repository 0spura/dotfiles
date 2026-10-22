ARG BUN_VERSION=1.4.3
ARG BUN_IMAGE_DIGEST=sha256:923bedb355f7746666659f71e724998159a5c8c54bd1cb1030e1975a0698415b
ARG RUST_IMAGE_DIGEST=sha256:5c1a1732ac3f77635b24d397ceb67b4d9ea61de348f68c0aa54a79fd01e65c69
ARG OMP_WEB_REF=f54521209fcdc8b7fce83d700bb16a6e8d6f2dc9
ARG WORKCTL_REV=8797ac2edac87f2ce3ba16341756301a9d56a2a3

FROM rust:1.99.1-bookworm@${RUST_IMAGE_DIGEST} AS rust-toolchain
FROM docker:29.8.2-cli@sha256:35cfcf893c20f2931f4909151b5407aaaeab711277de7ce8b8f521f095d54c32 AS docker-cli

FROM rust:1.99.1-bookworm@${RUST_IMAGE_DIGEST} AS workctl-build
ARG WORKCTL_REV
RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential pkg-config ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && cargo install --git https://github.com/0spura/workctl --rev "${WORKCTL_REV}" --locked --root /opt/workctl

FROM oven/bun:${BUN_VERSION}-debian@${BUN_IMAGE_DIGEST} AS app-build
ARG OMP_WEB_REF
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
RUN git init /app \
 && git -C /app remote add origin https://github.com/ddallabenetta/omp-web.git \
 && git -C /app fetch --depth=1 origin "${OMP_WEB_REF}" \
 && git -C /app checkout --detach FETCH_HEAD
WORKDIR /app
RUN bun install --frozen-lockfile \
 && bun run build

FROM oven/bun:${BUN_VERSION}-debian@${BUN_IMAGE_DIGEST} AS runtime
ARG UID=1000
ARG GID=1000
ARG TARGETARCH
ARG GH_VERSION=2.102.0
ARG GLAB_VERSION=1.123.0

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ca-certificates curl git build-essential pkg-config; \
    case "${TARGETARCH}" in \
      arm64) gh_sha=5006962696f01e1624b3fcf1f9d8e1a11547f24bf067dd2a0371b7b421945237; glab_sha=f7c1930977fdd75bea6735eed0b628d4411536b3208c124101db42d6cfb9378e ;; \
      amd64) gh_sha=7e54a307f90afdc59796c325ec0c49fb09e6c18537727207a8ac7513584ea5b0; glab_sha=0effb3e550b80fd826b5a50655acc7fe7142728d0afe9a1d5d857aa2fc651f5a ;; \
      *) echo "Unsupported target architecture: ${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    gh_deb="/tmp/gh_${GH_VERSION}_linux_${TARGETARCH}.deb"; \
    glab_deb="/tmp/glab_${GLAB_VERSION}_linux_${TARGETARCH}.deb"; \
    curl -fsSL "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${TARGETARCH}.deb" -o "${gh_deb}"; \
    curl -fsSL "https://gitlab.com/api/v4/projects/gitlab-org%2Fcli/packages/generic/glab/${GLAB_VERSION}/glab_${GLAB_VERSION}_linux_${TARGETARCH}.deb" -o "${glab_deb}"; \
    echo "${gh_sha}  ${gh_deb}" | sha256sum -c -; \
    echo "${glab_sha}  ${glab_deb}" | sha256sum -c -; \
    apt-get install -y --no-install-recommends "${gh_deb}" "${glab_deb}"; \
    rm -f "${gh_deb}" "${glab_deb}"; \
    rm -rf /var/lib/apt/lists/*

RUN groupmod --gid "${GID}" bun \
 && groupmod --new-name omp bun \
 && usermod --login omp --home /home/omp --move-home --gid omp bun \
 && usermod --uid "${UID}" omp \
 && mkdir -p /home/omp/.omp/agent /home/omp/.cargo /home/omp/.config/gh /workspace \
 && chown -R omp:omp /home/omp /workspace

COPY --from=rust-toolchain /usr/local/cargo /usr/local/cargo
COPY --from=rust-toolchain /usr/local/rustup /usr/local/rustup
COPY --from=workctl-build /opt/workctl/bin/workctl /usr/local/bin/workctl
COPY --from=docker-cli /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker-cli /usr/local/libexec/docker/cli-plugins/docker-buildx /usr/local/libexec/docker/cli-plugins/docker-buildx
COPY --from=docker-cli /usr/local/libexec/docker/cli-plugins/docker-compose /usr/local/libexec/docker/cli-plugins/docker-compose
COPY --from=app-build --chown=omp:omp /app/node_modules /app/node_modules
COPY --from=app-build --chown=omp:omp /app/.next /app/.next
COPY --from=app-build --chown=omp:omp /app/public /app/public
COPY --from=app-build --chown=omp:omp /app/bin /app/bin
COPY --from=app-build --chown=omp:omp /app/next.config.ts /app/package.json /app/

ENV HOME=/home/omp \
    CARGO_HOME=/home/omp/.cargo \
    RUSTUP_HOME=/usr/local/rustup \
    PATH=/home/omp/.cargo/bin:/usr/local/cargo/bin:${PATH} \
    NODE_ENV=production \
    PORT=30141 \
    OMP_WEB_HOSTNAME=0.0.0.0 \
    OMP_WEB_NO_OPEN=1

VOLUME ["/home/omp/.omp"]
EXPOSE 30141
USER omp
WORKDIR /workspace

HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD bun --eval 'const r = await fetch(`http://127.0.0.1:${process.env.PORT ?? 30141}/`); process.exit(r.status < 500 ? 0 : 1)'

ENTRYPOINT ["bun", "/app/bin/omp-web.js"]
