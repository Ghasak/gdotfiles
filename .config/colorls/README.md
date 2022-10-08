# How to configure Colorls
Current config for `colorls` uses the `light` mode, which means the configurations `light_color.yaml` is loaded.
To get this theme in our `colorls` command, we must pass the flag `--light`, instead of `--dark`, which is the default theme, As shown below:

```shell
alias lsd='colorls -l -a -h --light -t --sort-dirs'
Where:
-l : means long
-a : all files and directories and dot included.
-h : Human readable format
--light: is the theme flag for light only
-t : tree command (not necessary)
--sort-dirs: to sort the directories by name, at started.
```

## References

- [More about changing the colorls theme colors ](https://github.com/athityakumar/colorls/issues/165)
- [More about changing the colorls theme colors ](https://github.com/athityakumar/colorls/issues/364)
- [More about changing the colorls theme colors ](https://github.com/athityakumar/colorls/issues/165)
- [More about changing the colorls theme colors ](https://github.com/athityakumar/colorls/issues/364)
- [colorlist](https://github.com/sickill/rainbow#color-list )
- [ ]( )
- [ ]( )

