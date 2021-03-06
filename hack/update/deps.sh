#!/usr/bin/env bash
# Kindly borrowed from Kind
# https://github.com/kubernetes-sigs/kind/blob/c5298b2/hack/update/deps.sh
#
# Copyright 2018 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Runs go mod tidy, go mod vendor, and then prunes vendor
#
# Usage:
#   deps.sh
set -o errexit -o nounset -o pipefail

# cd to the repo root
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
cd "${REPO_ROOT}"

# tidy all modules
hack/go_container.sh go mod tidy
SOURCE_DIR="${REPO_ROOT}/hack/tools" hack/go_container.sh go mod tidy
