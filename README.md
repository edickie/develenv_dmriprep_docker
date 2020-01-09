# develenv_dmriprep_docker
a dockerfile that builds the devel env for dmriprep.

Note: The idea of this devel env is that you push and pull to your own github fork from inside the docker env (the terminal in jupyerhub). So when using this workflow..**remember that any work that is not pushed to github will disapear when the docker is closed**. Therefore, when using this environment, commit and push you your fork very regularly!

### Step 0: get a working version of docker on your local computer. 

(For windows users on work laptops (without admin rights), this can take a little work)


### Step 1: Fork the dmriprep repo to your own github user

This is what I use to build a dmriprep devel env on a local computer

To make this work for you..

1. build your own fork of dmriprep on github. Following the instructions in [the dmriprep contribution guidlines](.https://github.com/nipreps/dmriprep/blob/master/CONTRIBUTING.md).

### Step 2. Clone this repo to your local computer

Clone this repo to your local computer

```sh
git clone https://github.com/edickie/develenv_dmriprep_docker.git
```

### Step 3. pull (or re-pull) the latest version of the dmriprep docker to your system

This builds the latest release of dmriprep into your current system. You should do this regularly (before running step 3) in order to insure that your are developing on top of the more release version of the software background..

```sh
docker pull nipreps/dmriprep:latest
```

## Step 4. build your local test environment docker image

Now open up your terminal (or windows powershell) and build the dockerfile

```sh
cd develenv_dmriprep_docker

## this should be repeated before any new build of the devel env..
docker pull nipreps/dmriprep:latest

## builds your version
docker build \
  -t dmriprep_devel:latest \
  --build-arg GITHUBUSER=<your_github_username> \
  --build-arg GITHUBNAME=<First Last> \
  --build-arg GITHUBEMAIL=<your email> .
```

For example - this is what mine looks like (don't use this unless you want all you coding work to be attributed to me!)

```sh
cd ~/code/develenv_dmriprep_docker

docker build -t dmriprep_devel:latest --build-arg GITHUBUSER=edickie --build-arg GITHUBNAME="Erin Dickie" --build-arg GITHUBEMAIL="erin.w.dickie@gmail.com" .
```

### Step 5 Run the docker

If you want some data (beyond that already in the tests) to work with then you should make a folder somewhere and mount it into the docker as you run it.


```sh
docker run --rm -it \
 -v /path/to/local/data>:/home/<your_github_username>/data \
 -p 8888:8888 \
 dmriprep_devel:latest

```

I do it like this..

```sh
docker run --rm -it -v C:\Users\erin_dickie\data:/home/edickie/data -p 8888:8888 dmriprep_devel:latest
```

## Step 6: Inside the docker build a git-branch to play on and fire up jupyterlab

Don't forget to check out [the dmriprep contribution guidelines](.https://github.com/nipreps/dmriprep/blob/master/CONTRIBUTING.md) for tips for how to name your branch!.

```sh
GITHUBUSER=edickie

## config the github so you can push changes back
cd /home/${GITHUBUSER}/dmriprep

git fetch upstream  # Always start with an updated upstream
git checkout -b fix/bug-1222 upstream/master ## name the branch you want to be on
cd /
jupyter lab --allow-root
```

## Step 7: point your browser to jupyter lab and start coding!

The commandline will print and address to point your browser to.. Point your browser to this address..
