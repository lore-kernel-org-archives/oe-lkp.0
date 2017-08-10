Content-Type: multipart/mixed; boundary="===============5590145565442943268=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Thu, 10 Aug 2017 10:15:16 +0800
Message-ID: <20170810021516.i2b6lzeiwrzd3mvl@wfg-t540p.sh.intel.com>
In-Reply-To: <20170810021103.aoqmb4iwtl7rise3@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5590145565442943268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 10:11:03AM +0800, Fengguang Wu wrote:
>On Wed, Aug 09, 2017 at 10:56:17AM +0200, Peter Zijlstra wrote:
>>On Tue, Aug 08, 2017 at 10:33:31AM +0800, Fengguang Wu wrote:
>>> Hi Peter,
>>>
>>> On Mon, Aug 07, 2017 at 12:12:44PM +0200, Peter Zijlstra wrote:
>>> > On Fri, Aug 04, 2017 at 09:12:34PM +0800, kernel test robot wrote:
>>> > > Greetings,
>>> > >
>>> > > 0day kernel testing robot got the below dmesg and the first bad com=
mit is
>>> > >
>>> > > https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/wip
>>> > >
>>> > > commit 5b4ed509027a5b6f495e6fe871cae850d5762bef
>>> > > Author:     Peter Zijlstra <peterz@infradead.org>
>>> > > AuthorDate: Mon Jul 31 17:50:05 2017 +0200
>>> > > Commit:     Peter Zijlstra <peterz@infradead.org>
>>> > > CommitDate: Wed Aug 2 16:38:30 2017 +0200
>>> > >
>>> > >     sched/fair: Fix wake_affine() for !NUMA_BALANCING
>>> > >
>>> > >     In commit:
>>> > >
>>> > >       3fed382b46ba ("sched/numa: Implement NUMA node level wake_aff=
ine()")
>>> > >
>>> > >     Rik changed wake_affine to consider NUMA information when balan=
cing
>>> > >     between LLC domains.
>>> > >
>>> > >     There are a number of problems here which this patch tries to a=
ddress:
>>> > >
>>> > >      - LLC < NODE; in this case we'd use the wrong information to b=
alance
>>> > >      - !NUMA_BALANCING: in this case, the new code doesn't do any
>>> > >        balancing at all
>>> > >      - re-computes the NUMA data for every wakeup, this can mean it=
erating
>>> > >        up to 64 CPUs for every wakeup.
>>> > >      - default affine wakeups inside a cache
>>> > >
>>> > >     We address these by saving the load/capacity values for each
>>> > >     sched_domain during regular load-balance and using these values=
 in
>>> > >     wake_affine_llc(). The obvious down-side to using cached values=
 is
>>> > >     that they can be too old and poorly reflect reality.
>>> > >
>>> > >     But this way we can use LLC wide information and thus not rely =
on
>>> > >     assuming LLC matches NODE. We also don't rely on NUMA_BALANCING=
 nor do
>>> > >     we have to aggegate two nodes (or even cache domains) worth of =
CPUs
>>> > >     for each wakeup.
>>> > >
>>> > >     Fixes: 3fed382b46ba ("sched/numa: Implement NUMA node level wak=
e_affine()")
>>> > >     Cc: Josef Bacik <josef@toxicpanda.com>
>>> > >     Cc: Rik van Riel <riel@redhat.com>
>>> > >     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>> >
>>> >
>>> > > [    0.075078] KVM setup async PF for cpu 1
>>> > > [    0.075078] kvm-stealtime: cpu 1, msr 19016640
>>> > > [    0.077256] smp: Brought up 1 node, 2 CPUs
>>> > > [    0.078038] smpboot: Total of 2 processors activated (10774.03 B=
ogoMIPS)
>>> > > [    0.081353] devtmpfs: initialized
>>> > > [    0.081011] BUG: unable to handle kernel paging request at fffff=
fffffffff80
>>> > > [    0.081021] IP: select_task_rq_fair+0x2c3/0xc30
>>> >
>>> >
>>> > So I'm not in fact able to reproduce.. there used to be an earlier
>>> > version of this patch that would fail to boot, but I'm thinking git-s=
ha1
>>> > would not be the same.
>>>
>>> I noticed it's gcc 4.8 and it's probably the culprit. To confirm that
>>> I tried gcc-6 and find no boot BUG there.
>>
>>I cannot compile a kernel using gcc-4.8 using the provided .config :/
>>
>>It complains about things like:
>>
>>scripts/Makefile.gcc-plugins:23: warning: cannot use CONFIG_KCOV: -fsanit=
ize-coverage=3Dtrace-pc is not supported by compiler
>>scripts/Makefile.kasan:19: Cannot use CONFIG_KASAN: -fsanitize=3Dkernel-a=
ddress is not supported by compiler
>>  CHK     include/config/kernel.release
>>  GEN     ./Makefile
>>  CHK     include/generated/uapi/linux/version.h
>>In file included from <stdin>:1:0:
>>../scripts/gcc-plugins/gcc-common.h:4:22: fatal error: bversion.h: No suc=
h file or directory
>>compilation terminated.
>>Cannot use CONFIG_GCC_PLUGINS: your gcc installation does not support plu=
gins, perhaps the necessary headers are missing?
>>scripts/Makefile.gcc-plugins:67: recipe for target 'gcc-plugins-check' fa=
iled
>>
>>Which is right, because gcc-4.8 doesn't support any of that.
>>
>>So what .config did you use with gcc-4.8?
>
>Attached is the .config for 5b4ed509027a ("sched/fair: Fix wake_affine() f=
or !NUMA_BALANCING")

The build servers have these Debian packages installed:

Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig=
-pend
|/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
||/ Name                             Version               Architecture    =
      Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ii  gcc-4.8                          4.8.4-1               amd64           =
      GNU C compiler
ii  gcc-4.8-base:amd64               4.8.4-1               amd64           =
      GCC, the GNU Compiler Collection (base package)
ii  gcc-4.8-multilib                 4.8.4-1               amd64           =
      GNU C compiler (multilib files)
ii  gcc-4.8-plugin-dev               4.8.4-1               amd64           =
      Files for GNU GCC plugin development.

Regards,
Fengguang

--===============5590145565442943268==--

