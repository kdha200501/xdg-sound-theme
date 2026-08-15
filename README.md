# How to

##### branch off from the upstream tag corresponding to the latest package version

```shell
$ cd xdg-sound-theme
$ git checkout master
$ ./create-branch.sh
```

##### Sort out dependencies

```shell
$ sudo dnf builddep xdg-sound-theme
$ meson setup build --prefix=/usr
```

##### Compile and install `xdg-sound-theme`

```shell
$ ninja -C build
$ sudo ninja -C build install
```
