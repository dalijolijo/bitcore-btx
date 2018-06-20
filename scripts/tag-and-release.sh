#!/bin/bash
set -e

######### Adjust these variables as needed ################

insightApiDir="${HOME}/source/insight-btx-api"
insightUIDir="${HOME}/source/insight-btx-ui"
btxcoreDir="${HOME}/source/btxcore"
btxcoreNodeDir="${HOME}/source/btxcore-node"

###########################################################

# given a string tag, make signed commits, push to relevant repos, create signed tags and publish to npm

bump_version () {
  sed -i '' -e "s/\"version\"\: .*$/\"version\"\: \"${shortTag}\",/g" package.json
}

set_deps () {
  sed -i '' -e "s/\"btxcore-node\"\: .*$/\"btxcore-node\"\: \"${shortTag}\",/g" package.json
  sed -i '' -e "s/\"insight-btx-api\"\: .*$/\"insight-btx-api\"\: \"${shortTag}\",/g" package.json
  sed -i '' -e "s/\"insight-btx-ui\"\: .*$/\"insight-btx-ui\"\: \"${tag}\"/g" package.json
}

tag="${1}"
shortTag=`echo "${tag}" | cut -c 2-`

if [ -z "${tag}" ]; then
  echo ""
  echo "No tag given, exiting."
  exit 1
fi


#############################################
# btxcore-node
#############################################
function btxcoreNode() {
  echo ""
  echo "Starting with btxcore-node..."
  sleep 2
  pushd "${btxcoreNodeDir}"

  sudo rm -fr node_modules
  bump_version
  npm install

  git add .
  git diff --staged
  echo ""
  echo -n 'Resume?: (Y/n): '

  read ans

  if [ "${ans}" == 'n' ]; then
    echo "Exiting as requested."
    exit 0
  fi

  echo ""
  echo "Committing changes for btxcore-node..."
  sleep 2
  git commit -S

  echo ""
  echo "Pushing changes to Github..."
  git push origin master && git push upstream master

  echo ""
  echo "Signing a tag"
  git tag -s "${tag}" -m"${tag}"


  echo ""
  echo "Pushing the tag to upstream..."
  git push upstream "${tag}"

  echo ""
  echo "Publishing to npm..."
  npm publish --tag beta

  popd
}

#############################################
# insight-btx-api
#############################################
function insightApi() {
  echo ""
  echo "Releasing insight-btx-api..."
  sleep 2
  pushd "${insightApiDir}"

  sudo rm -fr node_modules
  bump_version
  npm install

  git add .
  git diff --staged
  echo ""
  echo -n 'Resume?: (Y/n): '

  read ans

  if [ "${ans}" == 'n' ]; then
    echo "Exiting as requested."
    exit 0
  fi

  echo ""
  echo "Committing changes for insight-btx-api..."
  sleep 2
  git commit -S

  echo ""
  echo "Pushing changes to Github..."
  git push origin master && git push upstream master

  echo ""
  echo "Signing a tag"
  git tag -s "${tag}" -m"${tag}"


  echo ""
  echo "Pushing the tag to upstream..."
  git push upstream "${tag}"

  echo ""
  echo "Publishing to npm..."
  npm publish --tag beta

  popd
}

#############################################
# insight-btx-ui
#############################################
function insightUi() {
  echo ""
  echo "Releasing insight-btx-ui..."
  sleep 2
  pushd "${insightUIDir}"

  sudo rm -fr node_modules
  bump_version
  npm install

  git add .
  git diff --staged
  echo ""
  echo -n 'Resume?: (Y/n): '

  read ans

  if [ "${ans}" == 'n' ]; then
    echo "Exiting as requested."
    exit 0
  fi

  echo ""
  echo "Committing changes for insight-btx-ui..."
  sleep 2
  git commit -S

  echo ""
  echo "Pushing changes to Github..."
  git push origin master && git push upstream master

  echo ""
  echo "Signing a tag"
  git tag -s "${tag}" -m"${tag}"


  echo ""
  echo "Pushing the tag to upstream..."
  git push upstream "${tag}"

  echo ""
  echo "Publishing to npm..."
  npm publish --tag beta

  popd
}

#############################################
# btxcore
#############################################
function btxcore() {
  echo ""
  echo "Releasing btxcore..."
  sleep 2
  pushd "${btxcoreDir}"

  sudo rm -fr node_modules
  bump_version
  set_deps

  npm install

  git add .
  git diff --staged
  echo ""
  echo -n 'Resume?: (Y/n): '

  read ans

  if [ "${ans}" == 'n' ]; then
    echo "Exiting as requested."
    exit 0
  fi

  echo ""
  echo "Committing changes for btxcore..."
  sleep 2
  git commit -S

  echo ""
  echo "Pushing changes to Github..."
  git push origin master && git push upstream master

  echo ""
  echo "Signing a tag"
  git tag -s "${tag}" -m"${tag}"


  echo ""
  echo "Pushing the tag to upstream..."
  git push upstream "${tag}"

  echo ""
  echo "Publishing to npm..."
  npm publish --tag beta

  popd

  echo "Completed releasing tag: ${tag}"
}

echo ""
echo "Tagging with ${tag}..."

echo "Assuming projects at ${HOME}/source..."

releases="${2}"
if [ -z "${releases}" ]; then
  btxcoreNode
  insightApi
  insightUi
  btxcore
else
  eval "${releases}"
fi

