
* I strongly recommend https://github.com/diogocavilha/fancy-git

* Must setup Keybase bots starting with https://github.com/keybase/pykeybasebot
* call Google Colab from the comand line!!! https://github.com/TensorTom/colabctl
* should run https://github.com/toniov/gcalcron for experimenting with calendar controlled tasks.
* Looking into CapRover for simpler Docker management https://caprover.com/docs/get-started.html
* https://github.com/micahflee/passphraseme

Ifs you're on the RIAC team:

`git clone --recurse-submodules -j10 keybase://team/robotinacan/RobotInACan`

If you're on the OpenCo team: 

`git clone --recurse-submodules -j10 keybase://team/opencoca/OpenCo`

If you're on the Startr team:
`git clone --recurse-submodules -j10 https://github.com/opencoca/startr.git`

Once you've got all your repos it's a good ideo to keep things clean with git flow

`git flow init`

* When working with submodules it's a good idea to track the changes

`git config --local status.submoduleSummary true`

*Clone all of a users github repos 
`curl -s https://api.github.com/users/ecraft2learn/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone`

Note: many versions of Ubuntu come with a broken curl! The following will solve this:
```
git clone https://github.com/bagder/curl.git
sudo apt-get update
sudo apt-get install curl 
```



