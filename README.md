# Whole Tale Matlab installation

This repo can be used to build the `matlab-install` image used
by the Whole Tale `repo2docker_wholetale` MatlabBuildPack.

Installing Matlab using the buildpack requires access to the ~20GB
installation media as well as license and private installation key.
After downloading the full installation media as ISO image, this repo
is used to build a Docker image containiner just required installation
files.  The buildpack relies on the Docker buildkit `RUN --mount`  
feature to install Matlab products and toolboxes.

Build steps:
* Download installation media (iso), license, and key 
* Clone this repo
* Mount ISO
* Create `network.lic`
* Build image

### Note on licenses

Whole Tale uses institutional licenses from Jetstream (Indiana University,
Univeristy of Texas at Austin). Licenses are now also available from 
the University of Illinois at Urbana-Champaign.

## Download installation media

For U of I staff, the installation media  and licenses can be obtained
from https://webstore.illinois.edu/.

### Clone this repo

```
git clone https://github.com/whole-tale/matlab-install
cd matlab-install
```

## Mount ISO

Mount the downloaded ISO into the `matlab-install` subdirectory:

```
sudo mount -o loop /<path-to-iso>/RYYYYx_Linux.iso ./matlab-install/
```

Where `YYYYx` is `2019b`, `2020a`, etc.

###
Create file `network.lic` for site where image will be deployed. 

### Build the image

In addition to the 20GB ISO, building the image requires at least 40GB
of disk space:

```
docker build -t registry.local.wholetale.org/matlab-install:R2019b .
```

For production installations, push the image to the local registry:
```
docker push registry.wholetale.org/matlab-install:R2019b
```

