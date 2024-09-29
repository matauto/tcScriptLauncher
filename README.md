## Purpose of the program
tcScriptLauncher is application designed to launch other applications or
scripts from desktop on TinyCore system. In current version two buttons launch
mplayer to display view from USB camera(Sony EyeToy) and view from wifi survivalence camera(Imou bullet 2C).
TinyCore is installed on touchscreen AIO, which acts as terminal installed in tractor
tcScriptLauncher code is based on [cpanel](https://github.com/tinycorelinux/fltk_projects/blob/master/cpanel/cpanel.cxx) from TinyCore
## Host system
Scripts and C++ launcher is targeting TinyCore Linux.
Application use FLTK gui library which is used natively on TinyCore.
To compile application on TinyCore you need to download and load two software packets:
* compiletc.tcz
* fltk-1.3.9-dev.tcz
## Scripts
Scripts included with application in folder ./scripts need to be copied to /mnt/sda1/scripts location
Scripts need additional TCZ. On beggining of each script tcz-load -i command show you what TCZ you need download.
