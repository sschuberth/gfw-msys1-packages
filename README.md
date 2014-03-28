# Introduction

This is [mingwGitDevEnv-packages](https://github.com/sschuberth/mingwGitDevEnv-packages), the project providing the mingw-get packages for [mingwGitDevEnv](https://github.com/sschuberth/mingwGitDevEnv).

## Git configuration for LZMA (de-)compression

For convenience, the _*.xml.lzma_ files are supposed to be (de-)compressed on-the-fly when checked out / in. To make this work you have to add the following diff and smudge / clean filters to your Git config file:

    [diff "lzma"]
    	textconv = lzma -d -c -qq | cat
    	cachetextconv = true
    [filter "lzma"]
    	smudge = lzma -d
    	clean = lzma -z

If you let the mingwGitDevEnv installer clone the packages repository this is already done for you.

# Getting involved

## Creating mingw-get packages

If you want to create a new package for use with mingw-get the following steps are necessary:

* Create an [mgwport / msysport](http://gitorious.org/mgwport/mgwport/blobs/master/README) "build recipe" file that downloads the source code, applies optional patches, builds the binaries, and packages them to archives. Just like MSYS started out as a fork of [Cygwin](http://www.cygwin.com/), mgwport is a fork of the [Cygwin Port project](http://sourceware.org/cygwinports/)'s [cygport tool](http://cygwin-ports.git.sourceforge.net/git/gitweb.cgi?p=cygwin-ports/cygport;a=blob;f=README;hb=HEAD) and thus uses (almost) the same syntax. However, as there seems to be very little documentation about either syntax available and mgwport / cygport are heavily inspired by [Gentoo's Portage](http://en.gentoo-wiki.com/wiki/Portage), the best resource I could possibly find is the [Gentoo Development Guide](http://devmanual.gentoo.org/)'s section about [Ebuild Writing](http://devmanual.gentoo.org/ebuild-writing/), in particular the [Variables](http://devmanual.gentoo.org/ebuild-writing/variables/) article. _(See the [mgwport file for mingw32-openssl](https://github.com/sschuberth/mingwGitDevEnv-packages/blob/master/mingw32-openssl/openssl-1.0.0j-1.mgwport) as an example.)_
* If you need help with the actual build flags to use for a particular package good places to look at are (in no particular order):
  * The _*.cygport_ files inside the Cygwin Port project's [Git repository](http://cygwin-ports.git.sourceforge.net/git/gitweb-index.cgi), especially those inside directories with an _mingw-_ prefix.  
  * The _release.sh_ scripts below the [msysgit repository](https://github.com/msysgit/msysgit)'s [src directory](https://github.com/msysgit/msysgit/tree/master/src).
  * The _pkgbuild.sh_ scripts inside the _*-src.tar.lzma_ archives below [LRN](https://github.com/LRN/)'s [mingw directory](http://lrn.no-ip.info/other/mingw/) on his web server.
  * The build scripts inside the _*-src.tar.lzma_ archives in the [MinGW project's files section](http://sourceforge.net/projects/mingw/files/).
* Actually build the packages using the _mgwport_ tool. Use the _Git Development Environment_ shortcut for building _*.mgwport_ files and the _Git Development Environment (MSYS Mode)_ shortcut for building _*.msysport_ files.
* Create an xml catalogue / package description file which lists meta-information and dependencies. This is the hardest part as there seems to be no documentation of the format available at all (and cygport does not have this type of file). So probably the best thing you can do is to derive the syntax from the [existing catalogue files](http://sourceforge.net/projects/mingw/files/Installer/mingw-get/catalogue/). _(See the [catalogue file for mingw32-openssl](https://github.com/sschuberth/mingwGitDevEnv-packages/blob/master/mingw32-openssl.xml) as an example.)_
* Add the package catalogue's file name to the [master package catalogue file](https://github.com/sschuberth/mingwGitDevEnv-packages/blob/master/mingwgitdevenv-package-list.xml).
* Run the [compress-xml.sh](https://github.com/sschuberth/mingwGitDevEnv-packages/blob/master/compress-xml.sh) script to run LZMA on the _*.xml_ files.
* Upload the compressed catalogue and updated master catalogue files to one of the web server locations listed as _repository uri_ at the end of the [update-mingw-get.sh](https://github.com/sschuberth/mingwGitDevEnv/blob/master/update-mingw-get.sh) script. _(Currently only I have access to this location, so please contact me instead.)_
* Upload the package archives to the web server location that is listed as _download-host uri_ in its catalogue file. _(As it probably makes sense to host all mingwGitDevEnv related packages in one place, please contact me instead.)_
* Send a [pull request](https://github.com/sschuberth/mingwGitDevEnv-packages/pulls).

## Getting in contact

We now have a [mailing list](http://groups.google.com/group/mingwGitDevEnv) for developers.

