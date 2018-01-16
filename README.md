# Visual Studio Code

[![Build Status](https://travis-ci.org/vfalies/vscode.svg?branch=master)](https://travis-ci.org/vfalies/vscode)

Vscode is a container to use Visual Studio Code with Docker for PHP projects.
This container is based on VFAC PHP Stack (https://hub.docker.com/r/vfac/envdevphpbase/)

## Plugins

Some plugins are installed for PHP development:

- [php-intellisense](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-intellisense)
- [alignment](https://marketplace.visualstudio.com/items?itemName=annsk.alignment)
- [beautify](https://marketplace.visualstudio.com/items?itemName=HookyQR.beautify)
- [vscode-code-outline](https://marketplace.visualstudio.com/items?itemName=patrys.vscode-code-outline)
- [vscode-docker](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker)
- [jshint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.jshint)
- [vscode-markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [phpcsfixer](https://marketplace.visualstudio.com/items?itemName=makao.phpcsfixer)
- [php-debug](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug)
- [php-docblocker](https://marketplace.visualstudio.com/items?itemName=neilbrayfield.php-docblocker)
- [php-pack](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-pack)
- [phpcs](https://marketplace.visualstudio.com/items?itemName=ikappas.phpcs)
- [twig](https://marketplace.visualstudio.com/items?itemName=whatwedo.twig)
- [vscode-twig-pack](https://marketplace.visualstudio.com/items?itemName=bajdzis.vscode-twig-pack)

## Usage

This container is based on X11 sharing that's why it is usable only on system using X11 (like Linux distribution).

To run the container, you can use the script given:

```shell
./vscode
```

or use the complete command line instruction

```shell
docker run \
    -ti \
    --rm \
    -d --device /dev/dri \
    -v /tmp/.X11-unix:/tmp/.X11-unix  \
    -v $HOME:/home/developer \
    -v $PWD:/var/www/html \
    --env DISPLAY=unix$DISPLAY  \
    --name vscode  \
    --net="host"  \
    --user $(id -u $(whoami)):$(id -g $(whoami)) \
    vscode
```

an alias can be created to simplify utilisation.

This container has been designed to be used with EnvDev(https://vfac.fr/projects/envdev) project.