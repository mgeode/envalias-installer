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
Aliases for all systems

#### opt/
Place for special aliases
- linux.alias
This Aliases working only on Linux
- osx.alias
This Aliases working only on OSX
- winodws.alias
Only Windows aliases
- global.exports
Set your Exports
- private.aliases
Write your personal aliases here.


