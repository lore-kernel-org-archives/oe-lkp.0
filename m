Content-Type: multipart/mixed; boundary="===============8623337434335091745=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [xarray] 4e99d4e957: BUG:soft_lockup-CPU##stuck_for#s
Date: Tue, 11 Dec 2018 06:29:47 -0800
Message-ID: <20181211142947.GC6830@bombadil.infradead.org>
In-Reply-To: <20181211095441.GR23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8623337434335091745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2018 at 05:54:41PM +0800, kernel test robot wrote:
> # To reproduce,
> # 1) save job-script and this script (both are attached in 0day report em=
ail)
> # 2) run this script with your compiled kernel and optional env $INSTALL_=
MOD_PATH
> =

> kernel=3D$1
> =

> initrds=3D(
> 	/osimage/yocto/yocto-tiny-i386-2016-04-22.cgz
> 	/lkp/lkp/lkp-i386.cgz
> 	/osimage/deps/debian-x86_64-2016-08-31.cgz/run-ipconfig.i386_2016-09-03.=
cgz
> )
> =

> HTTP_PREFIX=3Dhttps://download.01.org/0day-ci/lkp-qemu
> wget --timestamping "${initrds[@]/#/$HTTP_PREFIX}"
> =

> {
> 	cat "${initrds[@]//*\//}"
> 	[[ $INSTALL_MOD_PATH ]] && (
> 		cd "$INSTALL_MOD_PATH"
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email

When I do this, the only output I get is:

make: Entering directory '/home/willy/kernel/lkp-tests/bin/event'
gcc    -c -o wakeup.o wakeup.c
gcc  -static -o wakeup wakeup.o
rm -f wakeup.o
strip wakeup
make: Leaving directory '/home/willy/kernel/lkp-tests/bin/event'

Running under sh -x, I get as far as:

+ exec /home/willy/kernel/lkp-tests/lkp-exec/qemu -k ../idrext/.build-yocto=
/arch/x86/boot/bzImage job-script

Editing that script to set -x, I get to:

+ /home/willy/kernel/lkp-tests/sbin/pack -f -a x86_64 lkp-src
make: Entering directory '/home/willy/kernel/lkp-tests/bin/event'
gcc    -c -o wakeup.o wakeup.c
gcc  -static -o wakeup wakeup.o
rm -f wakeup.o
strip wakeup
make: Leaving directory '/home/willy/kernel/lkp-tests/bin/event'
+ exit

which would seem to indicate your 'pack' command failed with a non-zero
exit code?  Adding set -x to _that_ script gives me:

+ find . -type d -exec chmod g+rwx '{}' ';'
+ chmod -R g+rw etc lib root usr
+ '[' -d /osimage/addon-x86_64 ']'
+ gzip -n -9 /home/willy/.lkp/cache/lkp-x86_64.cpio
+ mv -f /home/willy/.lkp/cache/lkp-x86_64.cpio.gz /home/willy/.lkp/cache/lk=
p-x86_64.cgz
+ [[ -n '' ]]
+ [[ -n '' ]]
+ exit

I'm using your top-of-tree lkp-tests, commit
e28c726dfe85e3e595ba4776a4eb92f2559d3ac0

By the way, I took this kernel config and ran it under one of your other
test cases (the one which runs Trinity) and didn't see a boot problem,
so either it's something specific to this setup, or the problem got
fixed between this commit and current top-of-tree.

--===============8623337434335091745==--

