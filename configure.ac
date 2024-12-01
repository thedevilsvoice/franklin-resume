dnl Process this file with autoconf
AC_PREREQ([2.69])
AC_INIT(franklin-resume, 0.4, franklin@dead10c5.org, https://github.com/devsecfranklin/franklin-resume)
AC_CONFIG_MACRO_DIR(config/m4)
AC_CONFIG_AUX_DIR(config)
AM_INIT_AUTOMAKE(foreign)
AC_MSG_NOTICE([build directory: $ac_pwd])
AC_SUBST(WORKDIR, $ac_pwd)

LT_INIT

AC_SUBST([GITVERSION])
AC_SUBST([GITTAG])
AC_SUBST([GITBRANCH])

if test -e $srcdir/.git
then
AC_CHECK_PROG([HAS_GIT], [git], [found], [not-found])
else
HAS_GIT=no-repository
fi
if test $HAS_GIT = found
then
    GITVERSION="git --git-dir \$(srcdir)/.git rev-parse --short HEAD"
    GITTAG="git --git-dir \$(srcdir)/.git describe --all --always --dirty"
    GITBRANCH="git --git-dir \$(srcdir)/.git name-rev --name-only HEAD"
else
    GITVERSION=""
    GITTAG=""
    GITBRANCH=""
fi

dnl le python
AM_PATH_PYTHON(3.9) # minimum version of Python
PY39="python$PYTHON_VERSION" # define the python interpreter
dnl LDFLAGS="$LDFLAGS -l$PY39"
AC_SUBST(PY39, python$PYTHON_VERSION)

AC_CHECK_PROG( [HAS_GPG], [gpg], [found], [not-found])

AC_CONFIG_COMMANDS([franklin-build],
 [echo "(⊃｡•́‿•̀｡)⊃━⭑･ﾟﾟ･*:༅｡.｡༅:*ﾟ:*:✼✿ Configuring for $mypkgname ☽༓･*˚⁺‧͙"],
 [mypkgname=$PACKAGE_NAME])
AC_CONFIG_FILES([
 Makefile
 docker/Makefile
])

# AC_CANONICAL_HOST is needed to access the 'host_os' variable
AC_CANONICAL_HOST
AC_OUTPUT
