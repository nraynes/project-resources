#!/bin/bash

while getopts l:c: flag
do
    case "${flag}" in
        l) language=${OPTARG};;
        c) copyright=${OPTARG};;
    esac
done

if [ "$language" == "" ]; then
    language="rust"
fi

if [ "$copyright" == "" ]; then
    copyright="permissive"
fi

mkdir .github
mkdir .github/workflows
bash $PROJECT_RESOURCES/global/vhooks
cp $PROJECT_RESOURCES/global/github/workflows/release.yml .github/workflows/release.yml
cp $PROJECT_RESOURCES/rust/github/workflows/test.yml .github/workflows/test.yml
cp $PROJECT_RESOURCES/rust/hooks/pre-commit .hooks/pre-commit
cp $COMMITALYZER/bin/commit-msg .hooks/commit-msg
cp -R $COMMITALYZER/commit-rules/ commit-rules/
cp -R $SEMVER/.release/ .release/
cp $SEMVER/sample.config.semver.json config.semver.json

if [ "$copyright" == "permissive" ]; then
    cp -R $PROJECT_RESOURCES/global/Licensing/Permissive/LICENSES LICENSES
    cp $PROJECT_RESOURCES/global/Licensing/Permissive/LICENSE LICENSE
    if [ "$language" == "rust" ]; then
        cp $PROJECT_RESOURCES/rust/Licensing/deny.toml deny.toml
    fi
    cp $PROJECT_RESOURCES/global/sample.README.md README.md
else
    touch README.md
fi
