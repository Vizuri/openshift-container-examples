oc login -u developer -p developer
oc new-project marriott-test

oc new-app --file docker-container-template.yaml --param=APP_NAME=rhel-base-container --param=GIT_SOURCE_URL=https://github.com/Vizuri/openshift-container-examples.git --param=GIT_SOURCE_REF=master --param=GIT_SOURCE_CONTEXT=rhel-base-container

oc new-app --file docker-container-template.yaml --param=APP_NAME=atomic-base-container --param=GIT_SOURCE_URL=https://github.com/Vizuri/openshift-container-examples.git --param=GIT_SOURCE_REF=master --param=GIT_SOURCE_CONTEXT=atomic-base-container

oc new-app --file nodejs-template.yaml --param=APP_NAME=rhel-nodejs-container --param=GIT_SOURCE_URL=https://github.com/Vizuri/openshift-container-examples.git --param=GIT_SOURCE_REF=master --param=GIT_SOURCE_CONTEXT=rhel-nodejs-container

oc start-build -w rhel-base-container
oc start-build -w atomic-base-container
oc start-build rhel-nodejs-container
