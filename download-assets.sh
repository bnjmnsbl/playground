#!/usr/bin/env bash
#
# download-assets.sh
# Lädt alle Assets (Logo, Favicon, Partner-Logos, Host-Grotesk-Fonts)
# von citylab-berlin.org in die lokale ./assets-Struktur neben der index.html.
#
# Nutzung:  im Ordner mit der index.html ausführen:
#   bash download-assets.sh
#
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p assets/fonts

theme="https://citylab-berlin.org/app/themes/flynt-citylab/dist/assets"
uploads="https://citylab-berlin.org/app/uploads"

echo "→ Logos & Favicon…"
curl -fsSL "$theme/logo-T6_mdScd.svg"            -o assets/logo.svg
curl -fsSL "$uploads/2026/02/cropped-favicon-270x270.png" -o assets/favicon.png
curl -fsSL "$uploads/2026/04/logo-partner-logo-ts.svg"    -o assets/logo-partner-ts.svg
curl -fsSL "$uploads/2026/04/logo-partner-logo-bln.svg"   -o assets/logo-partner-bln.svg

echo "→ Host Grotesk (5 Schnitte)…"
curl -fsSL "$theme/host-grotesk-v5-latin-regular-qDxuE_yq.woff2"   -o assets/fonts/host-grotesk-regular.woff2
curl -fsSL "$theme/host-grotesk-v5-latin-italic-Bs-kq6BB.woff2"    -o assets/fonts/host-grotesk-italic.woff2
curl -fsSL "$theme/host-grotesk-v5-latin-500-B7155YqD.woff2"       -o assets/fonts/host-grotesk-500.woff2
curl -fsSL "$theme/host-grotesk-v5-latin-700-C2wxdkf9.woff2"       -o assets/fonts/host-grotesk-700.woff2
curl -fsSL "$theme/host-grotesk-v5-latin-700italic-BGr443ba.woff2" -o assets/fonts/host-grotesk-700italic.woff2

echo
echo "✓ Fertig. Struktur:"
echo "  ./index.html"
echo "  ./assets/{logo.svg, favicon.png, logo-partner-ts.svg, logo-partner-bln.svg}"
echo "  ./assets/fonts/host-grotesk-*.woff2"
