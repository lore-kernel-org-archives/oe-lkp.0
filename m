Content-Type: multipart/mixed; boundary="===============6915124976161750510=="
MIME-Version: 1.0
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [tools headers UAPI] e2bcbd7769: kernel-selftests.ir.make_fail
Date: Fri, 28 Jan 2022 08:49:51 -0800
Message-ID: <CAADnVQJ3RCPUQ0k9nu2urrRK=U7SUetuPmY0_b17M_PD=j4fkw@mail.gmail.com>
In-Reply-To: <YfO39Q3mNHMQOkd4@gofer.mess.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6915124976161750510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 1:32 AM Sean Young <sean@mess.org> wrote:
>
> On Fri, Jan 28, 2022 at 03:53:46PM +0800, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: e2bcbd7769ee8f05e1b3d10848aace98973844e4 ("tools headers UAPI: =
remove stale lirc.h")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> > in testcase: kernel-selftests
> > version: kernel-selftests-x86_64-db530529-1_20220124
> > with following parameters:
> >
> >       group: group-01
> >       ucode: 0xe2
> >
> > test-description: The kernel contains a set of "self tests" under the t=
ools/testing/selftests/ directory. These are intended to be small unit test=
s to exercise individual code paths in the kernel.
> > test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> >
> >
> > on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with=
 16G memory
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> >
> >
> > 2022-01-27 18:57:29 make -C ir
> > make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kself=
tests-e2bcbd7769ee8f05e1b3d10848aace98973844e4/tools/testing/selftests/ir'
> > gcc -Wall -O2 -I../../../include/uapi    ir_loopback.c  -o /usr/src/per=
f_selftests-x86_64-rhel-8.3-kselftests-e2bcbd7769ee8f05e1b3d10848aace989738=
44e4/tools/testing/selftests/ir/ir_loopback
> > ir_loopback.c: In function =E2=80=98main=E2=80=99:
> > ir_loopback.c:147:20: error: =E2=80=98RC_PROTO_RCMM32=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98RC_PROTO_RC6_MCE=E2=
=80=99?
> >     if (rc_proto =3D=3D RC_PROTO_RCMM32 &&
> >                     ^~~~~~~~~~~~~~~
> >                     RC_PROTO_RC6_MCE
> > ir_loopback.c:147:20: note: each undeclared identifier is reported only=
 once for each function it appears in
> > make: *** [../lib.mk:146: /usr/src/perf_selftests-x86_64-rhel-8.3-kself=
tests-e2bcbd7769ee8f05e1b3d10848aace98973844e4/tools/testing/selftests/ir/i=
r_loopback] Error 1
> > make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselft=
ests-e2bcbd7769ee8f05e1b3d10848aace98973844e4/tools/testing/selftests/ir'
> > 2022-01-27 18:57:29 make run_tests -C ir
> > make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kself=
tests-e2bcbd7769ee8f05e1b3d10848aace98973844e4/tools/testing/selftests/ir'
> > gcc -Wall -O2 -I../../../include/uapi    ir_loopback.c  -o /usr/src/per=
f_selftests-x86_64-rhel-8.3-kselftests-e2bcbd7769ee8f05e1b3d10848aace989738=
44e4/tools/testing/selftests/ir/ir_loopback
> > ir_loopback.c: In function =E2=80=98main=E2=80=99:
> > ir_loopback.c:147:20: error: =E2=80=98RC_PROTO_RCMM32=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98RC_PROTO_RC6_MCE=E2=
=80=99?
> >     if (rc_proto =3D=3D RC_PROTO_RCMM32 &&
> >                     ^~~~~~~~~~~~~~~
> >                     RC_PROTO_RC6_MCE
>
> So this commit removes the copy of lirc.h from tools/include/uapi/linux/l=
irc.h,
> so now the test uses /usr/include/linux/lirc.h. It appears that this file
> does not have RC_PROTO_RCMM32 defined on this system, which means it is a
> kernel header from v5.1 or earlier (this was added in commit
> 721074b03411327e7bf41555d4cc7c18f49313f7).
>
> It looks like this machine is redhat 8.3, which ships with kernel 4.18.
>
> I guess my change was far too optimistic; I had no ideal enterprise kerne=
ls
> were so ancient.
>
> We should probably drop e2bcbd7769ee8f05e1b3d10848aace98973844e4. Sorry a=
bout
> the turbulence.

I'd rather avoid reverting.
Just add ifdef or something to shut up the error on old distros.

>
> Sean
>
> > ir_loopback.c:147:20: note: each undeclared identifier is reported only=
 once for each function it appears in
> > make: *** [../lib.mk:146: /usr/src/perf_selftests-x86_64-rhel-8.3-kself=
tests-e2bcbd7769ee8f05e1b3d10848aace98973844e4/tools/testing/selftests/ir/i=
r_loopback] Error 1
> > make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselft=
ests-e2bcbd7769ee8f05e1b3d10848aace98973844e4/tools/testing/selftests/ir'

Please trim your replies.
--===============6915124976161750510==--

