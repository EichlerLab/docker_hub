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
├── .git/
├── .github
│   └── workflows
│       └── docker-autobuild.yml
└── README.md
```

<br>

### 3. Automated Docker image builds
- The operation process and logs of GitHub Actions after the push can be checked in the [Actions tab](https://github.com/EichlerLab/docker_hub/actions) of the repository. However, the current GitHub Action is **triggered only when changes to the Dockerfile are reflected in the main branch, and it does not operate merely by request.**
- If the Dockerfile is successfully built, the software will be built at the address **eichlerlab/software:version** on Docker Hub, with the repository name as the software and the version as the tag according to the commands defined in the YAML file. (e.g., base_docker/latest/Dockfile -> eichlerlab/base_docker:latest)

<br>

## CAUTION

Since the path **.github/workflows/** is fixed by Github Actions, yaml files **MUST** be located within the directory. Placing workflow yaml files in any other path will result in the GitHub Actions system not recognizing those files.

