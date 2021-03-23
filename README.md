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

You will need to have git installed 
`sudo apt install git git-flow`

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
