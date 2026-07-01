# Startr — WEB-startr

v0.4.1

A static site built with [Eleventy](https://www.11ty.dev/) and served via nginx. Part of the [Startr.Cloud](https://startr.cloud) project family, maintained by OpenCo.ca.

## Quick start

```bash
# Local development (via Startr.sh)
make it_run

# Docker build and run (serves on localhost:8080)
make it_docker_run

# Deploy to CapRover
make deploy
```

Run `make` (or `make help`) to see all available targets.

## Build and deploy

| Command | What it does |
| --- | --- |
| `make it_run` | Dev server via Startr.sh |
| `make it_build` | Build static site via Startr.sh |
| `make it_docker_build` | Build Docker image (Eleventy + nginx) |
| `make it_docker_run` | Build and run container on port 8080 |
| `make deploy` | Deploy to CapRover |
| `make it_build_multi_arch_push_GHCR` | Build amd64+arm64 and push to GHCR |

## Releases

We use [git-flow-next](https://github.com/git-flow-next/git-flow-next) (`brew install git-flow-next`).

```bash
make patch_release      # bump 0.4.0 → 0.4.1
make minor_release      # bump 0.4.0 → 0.5.0
make major_release      # bump 0.4.0 → 1.0.0
make release_finish     # merge, tag, push
```

## Setting up your build environment

### Prerequisites

- [Node.js](https://nodejs.org/) (v18+)
- [git-flow-next](https://github.com/git-flow-next/git-flow-next) -- `brew install git-flow-next`
- [Docker](https://www.docker.com/) (optional, if you want to build containers)
- [CapRover CLI](https://caprover.com/) (optional, if you deploy to CapRover) -- `npm install -g caprover`

### Linux (Debian/Ubuntu)

```bash
sudo apt-get update
sudo apt-get install git zlib1g-dev
```

> Note: `sudo` runs a command as the root (admin) user.

### Create your ssh key

It's simpler to work with repos if you have your ssh key setup.

```bash
username@username-computername:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/username/.ssh/id_rsa):                     
Created directory '/home/username/.ssh'.
Enter passphrase (empty for no passphrase): 
```

If you are not dealing with a high sercurity project and you trust your computer you can put no passphrase.

### Find and use your public ssh key

To show your ssh key use command `cat /home/username/.ssh/id_rsa.pub`

Your ssh key can be used to securly connect to servers and services. To use your ssh key with Github follow the always up to date [Github SSH Guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

## Keep your projects clean

Choose or make a directory for your local repos.

I recomend ~/Documents/Projects

## Clone this and other repos you are working on

Fork and Clone the folowing repos to your machine

- <https://github.com/opencoca/startr>
- <https://github.com/opencoca/simpleweb>
- <https://github.com/opencoca/lt2d_school>
- <https://github.com/opencoca/lt2d_school_admin>

> Note: our team uses master repos with submodules. If work on many projects with our team ask your supervisor if you're eligable for access to parent repos

To clone a repo to directory of your choosing open up your terminal, cd (or pushd) to the directory of your choosing and run:
`git clone https://github.com/opencoca/startr`
`git clone git@github.com:username/project.git`

(found by clicking dropdown on download)

## Git commands you should know

```bash
git config --global user.email "yourname@something.com"
git config --global user.name "YourName"

git pull
git status
git diff
git add README.md
git status
git commit
git push
```

## Use Pyenv and Pipenv

Pyenv lets you switch between multiple versions of Python. Pipenv manages per-project dependencies (similar to npm or bundler but for Python). They work well together when you have projects that need different Python versions.

<https://github.com/pyenv/pyenv-installer>

### Pyenv Install

```bash
source-shell
$ curl https://pyenv.run | bash
```

`pyenv.run` redirects to the install script in this repository and the invocation above is equivalent to:

`curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash`

Restart your shell so the path changes take effect:

```bash
source-shell
$ exec $SHELL
```

You can now begin using pyenv.

### Pipenv Install

Pipenv gives you a straightforward way to set up a working environment for your project.

Install pipenv using python's pip

`pip install --user pipenv`

## License

Copyright 2019–2026 12787326 Canada Inc.

Licensed under the [AGPLv3](https://opensource.org/licenses/agpl-3.0).
