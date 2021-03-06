# EnvAlias-Installer
Installing different Aliases on unixbased Environments as Linux, MacOSx or Windows Cygwin.

## Installation

```
   make

   Password: <sudo password>
```

The Installation add a entry in your **~/.bashrc** or **~/.bash_profile (osX)** and create a new file **/etc/bash.aliases**.

## Strukture

##### alias.d/
Aliases for all systems. Must end on *.aliases

##### exports.d/
Location for export definition. Must end on *.export

##### private.d/
Location for non-public stuff. Define your private things here.

##### scripts.d/
Location for scripts

##### os/
Location for operating system dependent definitions


### Useful links to setup a ENV

- [JENV - Manage your Java environment](http://www.jenv.be)
- [Bash - Manipulating Strings](https://www.tldp.org/LDP/abs/html/string-manipulation.html)




### Installing MAKE
#### OSX
```
  xcode-select --install

  ls -la /Library/Developer/CommandLineTools/

  ls -la /Library/Developer/CommandLineTools/usr/bin/

  g++ -v
```

#### Linux
```
  apt-get install -g make
  g++ -v
```


#### Cygwin
Use Cygwin-Installer and find the "Devel" (development)

```
g++ -v
```

##### CYGWIN-Special
Configure Copy-Paste under cygwin

**~/.bashrc:**
```
    stty lnext ^q stop undef start undef`
```

**~/.inputrc:**
```
    "\C-v": paste-from-clipboard
```

Note, this appears to be a Cygwin-specific solution. Linux users could use custom key bindings in gnome-terminal or konsole, or translation tables with xterm.

***Useful commands for reference:***
```
    $ bind -p
    $ stty -a
```