Content-Type: multipart/mixed; boundary="===============4663274206949003530=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/4] lkp: add initial opensuse support
Date: Tue, 10 Jan 2017 15:25:29 +0100
Message-ID: <20170110142529.GE13946@wotan.suse.de>
In-Reply-To: <20170110021157.GY690@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4663274206949003530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2017 at 10:11:57AM +0800, Ye Xiaolong wrote:
> On 01/09, Luis R. Rodriguez wrote:
> >On Mon, Jan 09, 2017 at 03:49:14PM +0800, Ye Xiaolong wrote:
> >> Hi, Luis
> >> =

> >> On 01/06, Luis R. Rodriguez wrote:
> >> >I received a failed test results notice from 0-day LKP test suite
> >> >using trinity, however it was pretty hard to get reproduce given
> >> >the LKP did not have OpenSUSE support to start off with, but the
> >> >second issue I've stubmled upon is beyond me -- running either:
> >> >
> >> >./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script

Note I had run the same command.

> >> >
> >> >or
> >> >
> >> >lkp qemu jobs/trinity.yaml =

> >> >
> >> >ends up creating calling a few subroutines or files which are
> >> >clearly not present, then tries to create a cpio archive but
> >> >clearly there are a few files which LKP tree expects you to have
> >> >and are not present such as lkp and lkp/scheduled.
> >> >
> >> >This is a run on OpenSUSE, first we install the dependencies for
> >> >trinity.yaml deps:
> >> >
> >> > # lkp install jobs/trinity.yaml =

> >> >
> >> >Then we try to run it:
> >> >
> >> > # lkp qemu jobs/trinity.yaml =

> >> =

> >> Actually we don't use yaml file for lkp qemu, you could try "lkp run j=
obs/trinity.yaml"
> >> instead.
> >
> >OK that runs, but that beats my actual machine with trinity, which is not
> >desirable. I am trying to reproduce a reported error caught by lpk tests
> >with trinity on my tree and that was with qemu. I have the job-script but
> >that produces the same error with missing files. Can you help me with th=
at?
> =

> Sure, could you paste the exact error log when you tried
> "./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script"?

As I noted its the same exact output, but here it is again:

ergon:/home/mcgrof/devel/lkp-tests # export LKP_SRC=3D$PWD                 =
                                    =

ergon:/home/mcgrof/devel/lkp-tests # export PATH=3D$PATH:$LKP_SRC/bin =

ergon:/home/mcgrof/devel/lkp-tests # ./bin/lkp qemu -k ~mcgrof/linux-next/a=
rch/x86/boot/bzImage job-script
job-script: line 2: $'\r': command not found
job-script: line 3: syntax error near unexpected token `$'\r''
'ob-script: line 3: `export_top_env()
make: Entering directory '/home/mcgrof/devel/lkp-tests/bin/event'
klcc    -c -o wakeup.o wakeup.c
klcc  -static -o wakeup wakeup.o
rm -f wakeup.o
strip wakeup
make: Leaving directory '/home/mcgrof/devel/lkp-tests/bin/event'
cpio: lkp: Cannot stat: No such file or directory
cpio: lkp/scheduled: Cannot stat: No such file or directory
cpio: blank line ignored
cpio: File /dev/mqueue/=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD shrunk by 20 by=
tes, padding with zeros

  Luis

--===============4663274206949003530==--

