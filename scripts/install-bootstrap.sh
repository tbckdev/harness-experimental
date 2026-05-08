#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_DIR="$(pwd)"
DRY_RUN=0
FORCE=0
ASSUME_YES=0
POSITIONAL_TARGET=""
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

usage() {
  cat <<'USAGE'
Usage:
  scripts/install-bootstrap.sh [--directory PATH] [PATH] [--dry-run] [--force] [--yes]

Options:
  --directory PATH   Install into PATH
  PATH               Positional target path
  --dry-run          Report actions without writing files
  --force            Backup and overwrite conflicting non-protected files
  --yes              Skip interactive confirmation
  -h, --help         Show help
USAGE
}

log() {
  printf '%s\n' "$*"
}

warn() {
  printf 'WARN: %s\n' "$*" >&2
}

die() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 1
}

backup_file() {
  local path="$1"
  local backup="${path}.bak.${TIMESTAMP}"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "DRY-RUN backup $path -> $backup"
  else
    cp -p "$path" "$backup"
    log "BACKUP $path -> $backup"
  fi
}

copy_file() {
  local src_rel="$1"
  local src="$SOURCE_ROOT/$src_rel"
  local dst="$TARGET_DIR/$src_rel"
  local dst_dir
  dst_dir="$(dirname "$dst")"

  if [[ ! -f "$src" ]]; then
    die "Missing source file: $src_rel"
  fi

  if [[ -e "$dst" ]]; then
    if [[ "$FORCE" -eq 1 ]]; then
      backup_file "$dst"
    else
      die "Refusing to overwrite existing file without --force: $src_rel"
    fi
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "DRY-RUN mkdir -p $dst_dir"
    log "DRY-RUN copy $src_rel -> $dst"
  else
    mkdir -p "$dst_dir"
    cp "$src" "$dst"
    log "COPY $src_rel -> $dst"
  fi
}

confirm() {
  if [[ "$ASSUME_YES" -eq 1 || "$DRY_RUN" -eq 1 ]]; then
    return 0
  fi
  printf 'Install harness bootstrap into %s ? [y/N] ' "$TARGET_DIR"
  read -r reply
  case "$reply" in
    y|Y|yes|YES) return 0 ;;
    *) die "Aborted by user" ;;
  esac
}

PROTECTED_PATHS=(
  "AGENTS.md"
  "docs"
  "scripts"
)

COPY_FILES=(
  "AGENTS.md"
  "README.md"
  "docs/HARNESS.md"
  "docs/HARNESS_LIFECYCLE.md"
  "docs/FEATURE_INTAKE.md"
  "docs/ARCHITECTURE.md"
  "docs/TEST_MATRIX.md"
  "docs/TRACEABILITY.md"
  "docs/VERSIONING.md"
  "docs/HARNESS_BACKLOG.md"
  "docs/HARNESS_ROADMAP.md"
  "docs/README.md"
  "docs/GLOSSARY.md"
  "docs/product/README.md"
  "docs/stories/README.md"
  "docs/stories/backlog.md"
  "docs/stories/epics/README.md"
  "docs/decisions/README.md"
  "docs/templates/spec-intake.md"
  "docs/templates/story.md"
  "docs/templates/validation-report.md"
  "docs/templates/decision.md"
  "docs/templates/high-risk-story/overview.md"
  "docs/templates/high-risk-story/design.md"
  "docs/templates/high-risk-story/execplan.md"
  "docs/templates/high-risk-story/validation.md"
  "docs/examples/README.md"
  "docs/examples/spec-intake-example.md"
  "docs/examples/story-example.md"
  "docs/examples/test-matrix-example.md"
  "docs/examples/decision-example.md"
  "scripts/README.md"
)

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --directory)
        [[ $# -ge 2 ]] || die "--directory requires a path"
        TARGET_DIR="$2"
        shift 2
        ;;
      --dry-run)
        DRY_RUN=1
        shift
        ;;
      --force)
        FORCE=1
        shift
        ;;
      --yes)
        ASSUME_YES=1
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      --*)
        die "Unknown option: $1"
        ;;
      *)
        if [[ -n "$POSITIONAL_TARGET" ]]; then
          die "Multiple target paths provided"
        fi
        POSITIONAL_TARGET="$1"
        shift
        ;;
    esac
  done

  if [[ -n "$POSITIONAL_TARGET" ]]; then
    if [[ "$TARGET_DIR" != "$(pwd)" ]]; then
      die "Use either positional target path or --directory, not both"
    fi
    TARGET_DIR="$POSITIONAL_TARGET"
  fi
}

main() {
  parse_args "$@"

  TARGET_DIR="$(mkdir -p "$TARGET_DIR" && cd "$TARGET_DIR" && pwd)"

  for protected in "${PROTECTED_PATHS[@]}"; do
    if [[ -e "$TARGET_DIR/$protected" ]]; then
      die "Protected target path already exists: $protected"
    fi
  done

  if [[ "$TARGET_DIR" == "$SOURCE_ROOT" ]]; then
    die "Refusing to install into source repository root"
  fi

  log "Source root: $SOURCE_ROOT"
  log "Target dir:  $TARGET_DIR"
  log "Mode:        $([[ "$DRY_RUN" -eq 1 ]] && echo dry-run || echo write)"
  log "Force:       $([[ "$FORCE" -eq 1 ]] && echo enabled || echo disabled)"
  log "Files:       ${#COPY_FILES[@]}"

  confirm

  for file in "${COPY_FILES[@]}"; do
    copy_file "$file"
  done

  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "DRY-RUN complete. No files were written."
  else
    log "Install complete."
  fi
}

main "$@"
