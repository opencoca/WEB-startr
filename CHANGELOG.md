# Changelog

All notable changes to this project will be documented in this file.

## [0.4.1] - 2026-07-01

### Added
- Makefile with git-flow-next release/hotfix targets
- Dockerfile (Node 20 build stage, nginx:alpine serve stage)
- CapRover `captain-definition`
- `.dockerignore` using the `.*` allowlist convention
- Docker targets: `it_docker_build`, `it_docker_run`, `it_stop`, `it_clean`, `it_gone`
- GHCR multi-arch push via `it_build_multi_arch_push_GHCR`
- Startr.sh web targets: `it_run`, `it_build`, `it_build_n_run`

## [0.4.0] - 2024-12-01

### Changed
- Smoother audio crossfade transitions
- CSS cursor fallback fix
- Code structure cleanup
- Version History large images added
- Removed stale `.env` from web/style
- Component examples now 3 columns on medium screens
- Startr Style docs updated

## [0.2.0] - 2021-11-23

### Added
- Initial release with Eleventy-based static site
- Lesson sheets, lockbox pages, Sierra Leone certifications
- SSH and git setup documentation
