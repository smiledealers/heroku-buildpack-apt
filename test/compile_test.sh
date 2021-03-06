#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile() {
  cat > ${BUILD_DIR}/Aptsources <<EOF
deb http://ppa.launchpad.net/mc3man/trusty-media/ubuntu trusty main
EOF

  cat > ${BUILD_DIR}/Aptfile <<EOF
ffmpeg
s3cmd
wget
EOF

  compile

  assertCapturedSuccess

  assertCaptured "Fetching .debs for s3cmd"
  assertCaptured "Installing s3cmd_"
  assertCaptured "Fetching .debs for wget"
  assertCaptured "Installing wget_"
}
