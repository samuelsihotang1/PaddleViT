#!/usr/bin/env bash
# The CI, run on this machine: what .github/workflows/pylint.yml ran (pylint
# over the Python files). There are no GitHub workflows: the account has no
# Actions billing. Run it before every push: scripts/ci-local.sh
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
python -m pip install --quiet --upgrade pylint
git ls-files -z '*.py' | xargs -0 python -m pylint
echo "ci-local: passed"
