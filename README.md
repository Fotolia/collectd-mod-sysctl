## Build & Install

    $ make

You may want to add an extra directory for include (under freebsd for example)
    $ make EXTRA_INCLUDE=-I /path/to/collectd/work/src

Installation is dead simple

    # make install
or
    # make install PREFIX=/usr/local

## Example config

    LoadPlugin sysctl
    <Plugin sysctl>
      <Instance "files">
        Key "fs.file-nr"
        Index 1
      </Instance>
      <Instance "shmall">
        Key "kernel.shmall"
        Index 1
      </Instance>
    </Plugin>

Key is the sysctl name, and index is (under linux) the field to extract, starting at one.

For example :
    fs.file-nr = 3040       0       610991

Index 1 will return "3040" while index 3 would have returned "610991"
