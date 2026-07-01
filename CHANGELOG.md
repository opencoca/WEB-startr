# Changelog

All notable changes to this project will be documented in this file.

## [0.4.1] - 2026-07-01

### Added
- Standard Startr Makefile with git-flow-next release/hotfix workflow
- Dockerfile (multi-stage: Node 20 + nginx:alpine) for containerized builds
- CapRover `captain-definition` for one-command deploys
- `.dockerignore` with canonical `.*` allowlist convention
- Docker lifecycle targets: `it_docker_build`, `it_docker_run`, `it_stop`, `it_clean`, `it_gone`
- GHCR multi-arch push target (`it_build_multi_arch_push_GHCR`)
- Startr.sh web targets: `it_run`, `it_build`, `it_build_n_run`

## [0.4.0] - 2024-12-01

### Changed
- Enhance audio transition logic for smoother crossfade effects
- Fix cursor fallback in CSS for improved usability
- Refactor code structure for improved readability and maintainability
- Add Version History large images
- Remove obsolete `.env` file from web/style directory
- Switch component examples to 3 columns on medium screens
- Update Startr Style docs

## [0.2.0] - 2021-11-23

### Added
- Initial release with Eleventy-based static site
- Lesson sheets, lockbox pages, Sierra Leone certifications
- SSH and git setup documentation
