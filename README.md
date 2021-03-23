# startr

## Setting up your Build Environment 

Note: it's simpler to work with repos if you have your ssh key setup.

Choose or make a directory for your local repos.

I recomend ~/Documents/Projects

Clone the folowing repos to your machine:

https://github.com/opencoca/lt2d_school

https://github.com/opencoca/lt2d_school_admin

https://github.com/opencoca/simpleweb

https://github.com/opencoca/startr



## To install your repos:

You will need to have git and the following packages installed 
`sudo apt install git git-flow zlib1g-dev
`

## To create your ssh key:
```
username@username-computername:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/username/.ssh/id_rsa):                     
Created directory '/home/username/.ssh'.
Enter passphrase (empty for no passphrase): 
```

put no passphrase

## find ssh after

to show your ssh key use command `cat /home/username/.ssh/id_rsa.pub`

clone a repo to directory of your choosing by using the following command
`git clone git@github.com:username/project.git` (found by clicking dropdown on download)

## USE PYENV and PIPENV

https://github.com/pyenv/pyenv-installer

### Pyenv Install:

```source-shell
$ curl https://pyenv.run | bash
```

`pyenv.run` redirects to the install script in this repository and the invocation above is equivalent to:

$ curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

Restart your shell so the path changes take effect:

```source-shell
$ exec $SHELL
```

You can now begin using pyenv.

If you need, `export USE_GIT_URI` to use `git://` instead of `https://` for git clone.



