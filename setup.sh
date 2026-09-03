#!/usr/bin/env bash
# Preflight check for the workshop environment.
#
# Run this BEFORE the session, on the machine you will use during the session.
# It changes nothing — it only reports what is missing, so there is time to fix it.
#
# Usage:
#   ./setup.sh

set -uo pipefail

REQUIRED_PYTHON_MAJOR=3
REQUIRED_PYTHON_MINOR=8
REQUIRED_NODE_MAJOR=18

failures=0
warnings=0

pass() { printf '  ok    %s\n' "$1"; }
fail() { printf '  FAIL  %s\n' "$1"; failures=$((failures + 1)); }
warn() { printf '  warn  %s\n' "$1"; warnings=$((warnings + 1)); }

echo "Workshop environment check"
echo

echo "Required tools"

if command -v python3 >/dev/null 2>&1; then
  version=$(python3 -c 'import sys; print("%d.%d" % sys.version_info[:2])')
  if python3 -c "import sys; sys.exit(0 if sys.version_info >= ($REQUIRED_PYTHON_MAJOR, $REQUIRED_PYTHON_MINOR) else 1)"; then
    pass "python3 $version"
  else
    fail "python3 $version (need ${REQUIRED_PYTHON_MAJOR}.${REQUIRED_PYTHON_MINOR} or newer)"
  fi
else
  fail "python3 not found"
fi

if command -v node >/dev/null 2>&1; then
  version=$(node --version)
  major=$(printf '%s' "${version#v}" | cut -d. -f1)
  if [ "$major" -ge "$REQUIRED_NODE_MAJOR" ]; then
    pass "node $version"
  else
    fail "node $version (need v${REQUIRED_NODE_MAJOR} or newer for global fetch)"
  fi
else
  fail "node not found"
fi

for tool in curl git; do
  if command -v "$tool" >/dev/null 2>&1; then
    pass "$tool"
  else
    fail "$tool not found"
  fi
done

echo
echo "Optional tools"

for tool in jq http; do
  if command -v "$tool" >/dev/null 2>&1; then
    pass "$tool"
  else
    warn "$tool not found (nice to have, exercises work without it)"
  fi
done

echo
echo "Network"

if curl --silent --show-error --fail --max-time 10 \
  --output /dev/null https://jsonplaceholder.typicode.com/posts/1 2>/dev/null; then
  pass "reached the demo API"
else
  fail "cannot reach https://jsonplaceholder.typicode.com — check proxy or firewall"
fi

echo
if [ "$failures" -gt 0 ]; then
  echo "$failures check(s) failed. Fix these before the session starts."
  exit 1
fi

if [ "$warnings" -gt 0 ]; then
  echo "Ready, with $warnings optional tool(s) missing."
else
  echo "Ready."
fi
