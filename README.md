libutils.sh
===========

A collection of convenience scripts and functions for bash

Introduction
------------

This little "library" is intended to provide convenience functions for
developing simple bash scripts.

Synopsis
--------

Clone repository and add following to your bashrc:
```bash
PATH+=":/path/to/libutils.sh"
shopt -s sourcepath # this is usually turned on by default
```
And then later...
```bash
source progress.sh
# use progressbar
```

