# docker_hub
Repository for Automated Builds into the [Eichler Lab Docker Hub](https://hub.docker.com/orgs/eichlerlab/)

<br>

## Process of Docker builds

### 1. Clone repo

```commandline
git clone https://github.com/EichlerLab/docker_hub.git
```


<br>

### 2. Prepare Dockerfile
- Place the Dockerfile of the specific version of the software you wish to build in the format of **./software/version/Dockerfile**, and then push it to the main branch.
- An Example of the Folder Structure
```commandline
.
├── {unique_software_name}
│   └── {version_1}
│   │   └── Dockerfile
│   └── {version_2}
│       └── Dockerfile
├── {unique_software_name}
│   └── {version_1}
│       └── Dockerfile
│       └── environment.yml
├── .git/
├── .github
│   └── workflows
│       └── docker-autobuild.yml
└── README.md
```

<br>

### 3. Automated Docker image builds
- The operation process and logs of GitHub Actions after the push can be checked in the [Actions tab](https://github.com/EichlerLab/docker_hub/actions) of the repository. However, the current GitHub Action is **triggered only when changes to the {software}/{version}/Dockerfile or {software}/{version}/environment.yml are reflected in the main branch, and it does not operate merely by request.**
- If the Dockerfile is successfully built, the software will be built at the address **eichlerlab/software:version** on Docker Hub, with the repository name as the software and the version as the tag according to the commands defined in the YAML file. (e.g., base_docker/latest/Dockfile -> eichlerlab/base_docker:latest)

<br>

### 4. Setting for external reference to installed software (HIGHLY RECOMMENDED).
 - Enter in the format `{software}={version}` in the `/app/software.list` file, separated by newlines.
 - The method of writting to the /app/software.list file during the builds is left to the discretion of the maintainer.
 - If you install without specifying a version using `apt-get` or `yum`, it could be difficult to know the version immediately. An example of processing script within a Dockerfile for this is as follows.

```commandline
RUN mkdir -p /app && \
    SOFTWARE_LIST_FILE="/app/software.list" && \
    touch $SOFTWARE_LIST_FILE && \
    OSID=$(grep "^ID=" /etc/os-release | cut -d"=" -f2 | sed 's/"//g') && \

    SOFTWARE_FROM_PKG="samtools \
    bedtools" && \

    SOFTWARE_VERSION_MANUAL="minimap2=2.26" && \

    for SOFTWARE_PKG in $SOFTWARE_FROM_PKG; do \
        if [ "${OSID}" = "ubuntu" ] || [ "${OSID}" = "debian" ]; then \
            INSTALLED_VERSION=$(apt-cache policy ${SOFTWARE_PKG} | grep 'Installed' | awk -F":" '{print $NF}' | cut -d"-" -f1 | cut -d"+" -f1 | sed 's/ //g'); \
        elif [ "${OSID}" = "centos" ]; then \
            INSTALLED_VERSION=$(yum list installed | grep "^${SOFTWARE_PKG}\." | awk '{print $2}' | awk -F":" '{print $NF}' | cut -d"-" -f1 | cut -d"+" -f1); \
        fi; \
        if [ ! -z "${INSTALLED_VERSION}" ]; then \
            echo "${SOFTWARE_PKG}=${INSTALLED_VERSION}" >> $SOFTWARE_LIST_FILE; \
        fi; \
    done && \

    for SOFTWARE_INFO in $SOFTWARE_VERSION_MANUAL;do \
        echo "$SOFTWARE_INFO" >> $SOFTWARE_LIST_FILE; \
    done
```

## CAUTION

Since the path **.github/workflows/** is fixed by Github Actions, yaml files **MUST** be located within the directory. Placing workflow yaml files in any other path will result in the GitHub Actions system not recognizing those files.


