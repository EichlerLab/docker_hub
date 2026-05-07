#!/usr/bin/bash

ORG="eichlerlab"
PAGE=1
echo -e "#REPO\tTAG\tSOURCE\tOS\tSOFTWARE"
while true; do
    response=$(curl -s "https://hub.docker.com/v2/repositories/$ORG/?page=$PAGE")
    REPOS=$(echo "$response" | jq -r '.results | .[].name')
    for REPO in $REPOS;do
        for TAG in $(curl -s "https://hub.docker.com/v2/repositories/${ORG}/${REPO}/tags/" | jq -r '.results | .[].name' | sort);do
            SOURCE="docker://$ORG/$REPO:$TAG"
            OSNAME=$(singularity exec $SOURCE grep "PRETTY_NAME" /etc/os-release | sed -e 's/PRETTY_NAME=//g' -e 's/"//g' -e 's/ /-/g')
            SOFTWARE=$(echo $(singularity exec $SOURCE cat /app/software.list) | sed 's/ /,/g')
            if [ -z "$SOFTWARE" ];then
                SOFTWARE="Unknown"
            fi
            echo -e "$REPO\t$TAG\t$SOURCE\t$OSNAME\t$SOFTWARE"
        done
    done
    if [[ $(echo "$response" | jq -r '.next') == "null" ]]; then
        break
    fi
    ((PAGE++))
done