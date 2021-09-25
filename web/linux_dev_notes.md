# The folowing should be followed when developing on linux

We strongly recommend https://github.com/diogocavilha/fancy-git

If you're on the Startr team:

`git clone --recurse-submodules -j10 https://github.com/opencoca/startr.git`

Once you've got all your repos it's a good ideo to keep things clean with git flow

`git flow init`

* When working with submodules it's a good idea to track the changes

`git config --local status.submoduleSummary true`

*Clone all of a users github repos 

`curl -s https://api.github.com/users/ecraft2learn/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone`

Note: many versions of Ubuntu come with a broken curl! The following will solve this:

``` bash
git clone https://github.com/bagder/curl.git
sudo apt-get update
sudo apt-get install curl 
```

