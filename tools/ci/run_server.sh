#!/bin/bash
set -euo pipefail

tools/deploy.sh ci_test
# mkdir ci_test/config

# run with example config to make sure that the configuration absolutely works as intended
cp -p config/example/* ci_test/config/
# test config
cp -p tools/ci/ci_config.txt ci_test/config/config.txt

cd ci_test
DreamDaemon cev_eris.dmb -close -trusted -verbose -params "log-directory=ci"
cd ..
cat ci_test/data/logs/ci/clean_run.lk
