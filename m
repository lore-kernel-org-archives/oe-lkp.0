Content-Type: multipart/mixed; boundary="===============5671081806851090719=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/4] lkp: add initial opensuse support
Date: Wed, 11 Jan 2017 15:34:35 +0100
Message-ID: <20170111143435.GL13946@wotan.suse.de>
In-Reply-To: <20170111015201.GB690@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5671081806851090719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 09:52:01AM +0800, Ye Xiaolong wrote:
> On 01/10, Luis R. Rodriguez wrote:
> =

> [snip]
> =

> >> >OK that runs, but that beats my actual machine with trinity, which is=
 not
> >> >desirable. I am trying to reproduce a reported error caught by lpk te=
sts
> >> >with trinity on my tree and that was with qemu. I have the job-script=
 but
> >> >that produces the same error with missing files. Can you help me with=
 that?
> >> =

> >> Sure, could you paste the exact error log when you tried
> >> "./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script=
"?
> >
> >As I noted its the same exact output, but here it is again:
> >
> >ergon:/home/mcgrof/devel/lkp-tests # export LKP_SRC=3D$PWD              =
                                       =

> >ergon:/home/mcgrof/devel/lkp-tests # export PATH=3D$PATH:$LKP_SRC/bin =

> >ergon:/home/mcgrof/devel/lkp-tests # ./bin/lkp qemu -k ~mcgrof/linux-nex=
t/arch/x86/boot/bzImage job-script
> >job-script: line 2: $'\r': command not found
> >job-script: line 3: syntax error near unexpected token `$'\r''
> >'ob-script: line 3: `export_top_env()
> >make: Entering directory '/home/mcgrof/devel/lkp-tests/bin/event'
> >klcc    -c -o wakeup.o wakeup.c
> >klcc  -static -o wakeup wakeup.o
> >rm -f wakeup.o
> >strip wakeup
> >make: Leaving directory '/home/mcgrof/devel/lkp-tests/bin/event'
> >cpio: lkp: Cannot stat: No such file or directory
> >cpio: lkp/scheduled: Cannot stat: No such file or directory
> >cpio: blank line ignored
> >cpio: File /dev/mqueue/=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD shrunk by 20=
 bytes, padding with zeros
> >
> >  Luis
> =

> Hmm, I believe it was caused by job-script saved as dos format, I can rep=
roduce
> it when I downloaded it through outlook attachment.
> =

> Try `dos2unix job-script` before "lkp qemu" to see whether it works.

Thanks, that fixed it!

I cannot reproduce the error reported. See:

root(a)10:/# dmesg| grep linkta
[    6.189785] test_linktables: linker table tests: OK!

The original report:

https://lists.01.org/pipermail/lkp/2016-December/005358.html

I also pushed out a new linker table branch out for linker table
with a revert done first to force test avr32 (it worked!) a yesterday
and have not received any lkp complaints about it yet.

Also if I hit CTRL-C and try to run again I get:

make: Entering directory '/home/mcgrof/devel/lkp-tests/bin/event'
gcc  -m32 -static -o wakeup wakeup.o
/usr/lib64/gcc/x86_64-suse-linux/6/../../../../x86_64-suse-linux/bin/ld: sk=
ipping incompatible /usr/lib64/gcc/x86_64-suse-linux/6/libgcc.a when search=
ing for -lgcc
/usr/lib64/gcc/x86_64-suse-linux/6/../../../../x86_64-suse-linux/bin/ld: ca=
nnot find -lgcc
/usr/lib64/gcc/x86_64-suse-linux/6/../../../../x86_64-suse-linux/bin/ld: sk=
ipping incompatible /usr/lib64/gcc/x86_64-suse-linux/6/libgcc_eh.a when sea=
rching for -lgcc_eh
/usr/lib64/gcc/x86_64-suse-linux/6/../../../../x86_64-suse-linux/bin/ld: ca=
nnot find -lgcc_eh
/usr/lib64/gcc/x86_64-suse-linux/6/../../../../x86_64-suse-linux/bin/ld: ca=
nnot find -lc
collect2: error: ld returned 1 exit status
make: *** [Makefile:14: main] Error 1
make: Leaving directory '/home/mcgrof/devel/lkp-tests/bin/event'
mv: cannot stat '/root/.lkp/cache/lkp-i386.cgz': No such file or directory
downloading initrds ...
/usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretry 1=
000 --tries 1000 https://github.com/0day-ci/lkp-qemu/raw/master/osimage/ope=
nwrt/openwrt-i386-2016-03-16.cgz -N -P /root/.lkp/cache/osimage/openwrt

It seems this tries to re-download the openwrt cpio -- why not avoid it if =
we already had it?

  Luis

--===============5671081806851090719==--

