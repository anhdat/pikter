# pikter - Picture on iTerm


![pikter-demo](https://raw.githubusercontent.com/anhdat/pikter/master/pikter-nyan-demo.gif)


Note: works with iTerm2 version 2.9 or later. Get one [here](https://iterm2.com/downloads/beta/iTerm2-2_9_20160313.zip).

## Usage:

```
    pikter <filePath>... [--width=<px>, --height=<px>, (-d | --debug)]
```

- Display an image:

```
    pikter cat.jpg
```

- Display a list of images:

```
    pikter cat.jpg dog.png duck.gif
```

- Display width custom size

```
    pikter dolphin.jpg --width 200
```

- Print out debug

```
    pikter dolphin.jpg --width 200 --debug
```

## Dependencies

[docopt.swift](https://github.com/docopt/docopt.swift)

## Credits

iTerm2's image display feature [document](https://www.iterm2.com/images.html)

Nyan Cat image obtained from [here](http://www.nyan.cat/cats/original.gif)
