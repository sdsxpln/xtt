#!/bin/bash
# Copyright 2017 Xaptum, Inc.
# 
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License

set -e

if [[ $# -ne 1 ]]; then
        echo "usage: $0 <absolute-path-to-ecdaa-source-directory>"
        exit 1
fi

source_dir="$1"
git clone https://github.com/xaptum/ecdaa "${source_dir}" 
pushd "${source_dir}" 
mkdir -p build
pushd build
cmake .. -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DCMAKE_PREFIX_PATH=${local_install_dir}
cmake --build .
cmake --build . --target install
popd
popd
