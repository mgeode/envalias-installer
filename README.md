# Envalias-installer
Installing different Aliases on unixbased Environments as Linux, MacOSx or Windows Cygwin.

## Installation

```
   make

   Password: <sudo password>
```

The Installation add a entry in your **/etc/profile** and create on new file **/etc/bash.aliases**.

## Strukture

#### alias.d/
Aliases for all systems. Must end on *.aliases

#### exports.d/
Location for export definition. Must end on *.export 

#### private.d/
Location for non-public stuff

#### os/
Location for operating system dependent definitions

