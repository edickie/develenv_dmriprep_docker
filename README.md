# develenv_dmriprep_docker
a dockerfile that builds the devel env for dmriprep

This is what I use to build a dmriprep devel env on a local computer

To make this work for you..

0. build your own fork of dmriprep on github

0. clone from your own fork (with the master branch latest release).

0. build a local "dmriprep base layer"

```sh
cd dmriprep
docker build . -t dmriprep:latest
```

1. clone this repo

```sh
git clone https://github.com/edickie/develenv_dmriprep_docker.git
```

1. (a) ... if running for the first time change open the Dockerfile and change the git clone statement to point to your own fork for dmriprep..

2. Now open up powershell and run the dockerfile

If you want some data (beyond that already in the tests) to work with then you should make a folder somewhere and mount it into the docker as you run it.

```sh
mkdir ~/data
cd ~/code/develenv_dmriprep_docker

docker build . -t dmriprep_devel:latest
docker run --rm -it -v ~/data:/data -p 8888:8888 dmriprep_devel:latest

```


```sh
${GITHUBUSER}=edickie
cd /home/${GITHUBUSER}/dmriprep
git fetch upstream  # Always start with an updated upstream
git checkout -b fix/bug-1222 upstream/master ## name the branch you want to be on
cd /
jupyter lab
```

3. The commandline will print and address to point your browser to.. Point your browser to this address..
