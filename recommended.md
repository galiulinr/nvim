## recommended packages

### fd
[github](https://github.com/sharkdp/fd)

Ubuntu(Debian):

```bash
sudo apt install fd-find
```

Note that the binary is called fdfind as the binary name fd is already used by another package. It is recommended that after installation, you add a link to fd by executing command ln -s $(which fdfind) ~/.local/bin/fd, in order to use fd in the same way as in this documentation. Make sure that $HOME/.local/bin is in your $PATH.

```bash
ln -s $(which fdfind) ~/.local/bin/fd
```
