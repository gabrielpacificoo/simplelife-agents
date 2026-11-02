#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="${SCRIPT_DIR}/agents"
TARGET_DIR="${HOME}/.agents/simplelife"

if [ ! -d "${SOURCE_DIR}" ]; then
  echo "Diretório de agentes não encontrado: ${SOURCE_DIR}"
  exit 1
fi

mkdir -p "${TARGET_DIR}"
find "${TARGET_DIR}" -mindepth 1 -exec rm -rf {} +
cp -a "${SOURCE_DIR}/." "${TARGET_DIR}/"

echo "Agentes atualizados em ${TARGET_DIR}"
