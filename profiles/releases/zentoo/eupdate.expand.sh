#!/bin/bash

case $1 in
app-admin/eselect-php)                   echo "=$1-0.7.1";;
app-admin/syslog-ng)                     echo "=$1-3.4.2";;
app-editors/vim*)                        echo "=$1-7.3.905";;
app-emulation/virtualbox*)               echo "=$1-4.2.12";;
app-misc/tmux)                           echo "=$1-1.8";;
app-text/docbook-sgml-dtd)               echo "=$1-3.0-r3"
                                         echo "=$1-3.1-r3"
                                         echo "=$1-4.0-r3"
                                         echo "=$1-4.1-r3";;
app-text/docbook-xml-dtd)                echo "=$1-4.1.2-r6"
                                         echo "=$1-4.2-r2"
                                         echo "=$1-4.3-r1"
                                         echo "=$1-4.4-r2"
                                         echo "=$1-4.5-r1";;
app-text/docbook-xml-simple-dtd)         echo "=$1-1.0-r1"
                                         echo "=$1-4.1.2.4-r2";;
app-text/openjade)                       echo "=$1-1.3.2-r5";;
dev-db/hsqldb)                           echo "=$1-1.8.1.3-r1";;
dev-db/postgresql-*)                     echo "=$1-9.1.9";;
dev-haskell/cabal)                       echo "=$1-1.16.0.3";;
dev-java/antlr)                          echo "=$1-2.7.7-r2";;
dev-java/asm)                            echo "=$1-2.0-r1";;
dev-java/icedtea-bin)                    echo "=$1-7.2.3.9";;
dev-java/junit)                          echo "=$1-3.8.2-r1";;
dev-java/jzlib)                          echo "=$1-1.0.7-r1";;
dev-java/tomcat-servlet-api)             echo "=$1-4.1.36"
                                         echo "=$1-6.0.36";;
dev-java/xml-commons-external)           echo "=$1-1.3.04"
                                         echo "=$1-1.4.01";;
dev-lang/R)                              echo "=$1-2.15.3";;
dev-lang/php)                            echo "=$1-5.3.26"
                                         echo "=$1-5.4.16";;
dev-lang/python)                         echo "=$1-2.7.4";;
dev-libs/openssl)                        echo "=$1-0.9.8x"
                                         echo "$1";;
dev-libs/libpcre)                        echo "=$1-8.32-r1";;
dev-libs/boost)                          echo "=$1-1.52.0-r6";;
dev-libs/libnl)                          echo "=$1-1.1-r3";;
dev-libs/jemalloc)                       echo "=$1-3.3.1";;
dev-util/systemtap)                      echo "=$1-2.1";;
dev-php/pecl-memcache)                   echo "=$1-3.0.8";;
dev-python/Babel)                        echo "=$1-0.9.6-r1";;
dev-python/beaker)                       echo "=$1-1.6.4-r1";;
dev-python/cython)                       echo "=$1-0.18-r1";;
dev-python/feedparser)                   echo "=$1-5.1.3-r1";;
dev-python/mako)                         echo "=$1-0.7.3-r1";;
dev-python/pyasn1)                       echo "=$1-0.1.6";;
dev-python/pyopenssl)                    echo "=$1-0.13-r1";;
dev-python/python-dateutil)              echo "=$1-2.1-r1";;
dev-python/python-ldap)                  echo "=$1-2.4.10-r1";;
dev-python/python-openid)                echo "=$1-2.2.5-r1";;
dev-python/pytz)                         echo "=$1-2012j";;
dev-python/pywebdav)                     echo "=$1-0.9.8";;
dev-python/pyyaml)                       echo "=$1-3.10-r1";;
dev-python/reportlab)                    echo "=$1-2.6";;
dev-python/six)                          echo "=$1-1.2.0-r1";;
dev-python/unittest2)                    echo "=$1-0.5.1-r1";;
dev-python/werkzeug)                     echo "=$1-0.8.3-r1";;
dev-python/xlwt)                         echo "=$1-0.7.4-r1";;
dev-ruby/activesupport)                  echo "=$1-3.2.13";;
dev-ruby/amqp)                           echo "=$1-0.6.7-r1";;
dev-ruby/builder)                        echo "=$1-3.0.4";;
dev-ruby/i18n)                           echo "=$1-0.6.1";;
dev-ruby/eventmachine)                   echo "=$1-1.0.0";;
dev-ruby/json)                           echo "=$1-1.7.6";;
dev-ruby/mysql-ruby)                     echo "=$1-2.9.0-r1";;
dev-ruby/net-ssh)                        echo "=$1-2.6.3";;
dev-ruby/net-ssh-multi)                  echo "=$1-1.1";;
dev-ruby/ohai)                           echo "=$1-0.6.12";;
dev-ruby/tilt)                           echo "=$1-1.3.3";;
dev-util/boost-build)                    echo "=$1-1.52.0-r1";;
dev-util/google-perftools)               echo "=$1-2.0-r2";;
dev-vcs/cvs)                             echo "=$1-1.12.13.1";;
java-virtuals/servlet-api)               echo "=$1-2.3"
                                         echo "=$1-2.5-r1";;
media-gfx/pydot)                         echo "=$1-1.0.28-r1";;
net-dns/openresolv)                      echo "=$1-3.5.4-r3";;
net-libs/nodejs)                         echo "=$1-0.8.23";;
net-libs/zeromq)                         echo "=$1-3.2.3";;
net-misc/dhcp)                           echo "=$1-4.2.4_p2-r1";;
net-misc/dhcpcd)                         echo "=$1-5.6.8";;
net-nds/openldap)                        echo "=$1-2.4.33-r1";;
sys-apps/dbus)                           echo "=$1-1.6.8-r1";;
sys-apps/shadow)                         echo "=$1-4.1.5.1-r1";;
sys-apps/systemd)                        echo "=$1-200-r1";;
sys-auth/pambase)                        echo "=$1-20120417-r1";;
sys-boot/grub)                           echo "=$1-2.00-r1";;
sys-cluster/util-vserver)                echo "=$1-0.30.216_pre3038";;
sys-devel/autoconf)                      echo "=$1-2.13"
                                         echo "$1";;
sys-devel/automake)                      echo "=$1-1.11.6"
                                         echo "$1";;
sys-devel/bc)                            echo "=$1-1.06.95-r1";;
sys-firmware/seabios)                    echo "=$1-1.7.2.1";;
sys-fs/lvm2)                             echo "=$1-2.02.97-r1";;
sys-fs/mdadm)                            echo "=$1-3.2.6";;
sys-kernel/dracut)                       echo "=$1-027-r1";;
sys-kernel/gentoo-sources)               echo "=$1-3.4.44"
                                         echo "=$1-3.9.1-r1";;
virtual/httpd-php)                       echo "=$1-5.3"
                                         echo "$1";;
virtual/jdk)                             echo "=$1-1.7.0";;
virtual/jre)                             echo "=$1-1.7.0";;
virtual/perl-digest-base)                echo "=$1-1.160.0-r1";;
virtual/ruby-*)                          echo "=$1-1";;
www-servers/nginx)                       echo "=$1-1.4.1-r5";;
x11-libs/gtk+)                           echo "=$1-2.24.17";;
*)                                       echo $1;;
esac
