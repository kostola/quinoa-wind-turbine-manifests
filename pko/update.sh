#!/bin/bash

set -euio pipefail

cd $( dirname $0 )

set -x

# single
kustomize build kustomize > src/single/resources.yaml

# multi
for component in application infinispan kafka; do
    kustomize build "kustomize/${component}" > "src/multi/components/${component}/resources.yaml"
done
