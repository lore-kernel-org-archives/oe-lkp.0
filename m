Content-Type: multipart/mixed; boundary="===============6778425888176809920=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: bug-report: can't install jobs in Archlinux
Date: Fri, 14 Oct 2016 11:52:28 +0800
Message-ID: <d009e5d5-25da-ade3-a1e7-77100c5cfbfa@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6778425888176809920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch is just for reporting a bug.

In README.md, most test cases should install/run well in

- Debian sid
- Ubuntu 14.04
- Archlinux

So I choice the Archlinux, but it can't install well.

------------------------------------------------

Env: 4.7.6-1-ARCH Linux in QEmu
[root(a)douly lkp-tests]# uname -a
Linux douly 4.7.6-1-ARCH #1 SMP PREEMPT Fri Sep 30 19:28:42 CEST 2016
x86_64 GNU/Linux

Process:
Doing the steps in README.md file to install packages for a job


Situation:

Command:

[root(a)douly lkp-tests]# export LKP_SRC=3D$PWD
[root(a)douly lkp-tests]# export PATH=3D$PATH:$LKP_SRC/bin
[root(a)douly lkp-tests]# lkp install $LKP_SRC/jobs/hackbench.yaml

Log:

Use: /home/douly/bug_test/lkp-tests/distro/installer/archlinux install =

bc gawk time kmod gzip make automake gcc base-devel libtool patch git =

openssl ca-certificates rsync cpio wget libklibc-dev linux-libc-dev =

linux-libc-dev:i386 glibc libc6-dev:i386
[sudo] password for douly:
error: target not found: libc6-dev:i386
error: target not found: linux-libc-dev:i386
error: target not found: libklibc-dev
error: target not found: linux-libc-dev
warning: kmod-23-1 is up to date -- reinstalling
warning: gawk-4.1.4-1 is up to date -- reinstalling
warning: openssl-1.0.2.j-1 is up to date -- reinstalling
warning: gzip-1.8-2 is up to date -- reinstalling
warning: ca-certificates-20160507-1 is up to date -- reinstalling
warning: glibc-2.24-2 is up to date -- reinstalling
warning: git-2.10.0-1 is up to date -- reinstalling
Cannot install some packages in =

/home/douly/bug_test/lkp-tests/distro/depends/lkp

-------------------------------------------------------------

Lastly:
For your advice, I delete these packages in "distro/depends/lkp-dev", It =

can be installed.

Thanks,

	Dou.



--===============6778425888176809920==--

