# Lutris

Lutris container for intel and nvidia cpu and gpu based systems, components for amd are currently not installed.

## Build

`docker build .`

## Run

First create a named volume to persistently save your games.

`docker volume create lutris`

than start the container with:

`docker run -it --network=host --rm --privileged --env DISPLAY=$DISPLAY --volume=$XAUTH:/root/.Xauthority:rw --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw -v lutris:/home/user:rw --privileged lutris`

## Troubleshooting

### No x11 application can be started

Install xhost and run `xhost +local:docker` before starting the container

### Docker build loading microcode failure

The error message regarding loading new microcode into the cpu can be ignored, the build still completes.
But you should install the latest microcode update for your cpu.
