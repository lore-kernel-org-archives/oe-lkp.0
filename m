Content-Type: multipart/mixed; boundary="===============3258958676933447500=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 867853145c: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Mon, 23 May 2016 22:11:35 +0800
Message-ID: <20160523141135.GA23589@wfg-t540p.sh.intel.com>
In-Reply-To: <alpine.LFD.2.20.1605230935190.5796@knanqh.ubzr>
List-Id: <oe-lkp.lists.linux.dev>

--===============3258958676933447500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2016 at 09:49:20AM -0400, Nicolas Pitre wrote:
> On Mon, 23 May 2016, Michal Marek wrote:
> =

> > On 2016-05-20 23:52, kernel test robot wrote:
> > > Greetings,
> > > =

> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > > =

> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git m=
aster
> > > =

> > > commit 867853145cea25491054ef067ff8af8946f37e2d
> > > Merge: 4bf284b 2441e78
> > > Author:     Michal Marek <mmarek@suse.com>
> > > AuthorDate: Tue Apr 26 13:20:18 2016 +0200
> > > Commit:     Michal Marek <mmarek@suse.com>
> > > CommitDate: Tue Apr 26 13:20:18 2016 +0200
> > > =

> > >     Merge branch 'kbuild/kbuild' into kbuild/for-next
> > =

> > Adding Nicolas to CC, because this is the merge commit of the
> > CONFIG_TRIM_UNUSED_KSYMS series.
> =

> Is there a .config associated with those failures?

Just provided by Michal.

> > > [   24.611486] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
> > > [   24.612525] EDD information not available.
> > > [   24.614384] BUG: unable to handle kernel NULL pointer dereference =
at           (null)
> > > [   24.615776] IP: [<ffffffff817f158b>] strcpy+0xb/0x50
> > > [   24.616700] PGD 0 =

> > > [   24.617128] Oops: 0000 [#1] PREEMPT =

> > > [   24.617819] CPU: 0 PID: 1 Comm: swapper Not tainted 4.6.0-qxl-0642=
3-gbac2892 #2
> > > [   24.619079] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS Debian-1.8.2-1 04/01/2014
> > > [   24.620591] task: ffff8800002bc000 ti: ffff880000330000 task.ti: f=
fff880000330000
> > > [   24.621943] RIP: 0010:[<ffffffff817f158b>]  [<ffffffff817f158b>] s=
trcpy+0xb/0x50
> > > [   24.623264] RSP: 0000:ffff8800003339d8  EFLAGS: 00010297
> > > [   24.624181] RAX: ffff88000c4600a8 RBX: ffff88000c4600a8 RCX: 00000=
00000000000
> > > [   24.625395] RDX: 000000000000a2a1 RSI: 0000000000000000 RDI: ffff8=
8000c4600a8
> > > [   24.626623] RBP: ffff880000333d80 R08: 0000000000000001 R09: ffff8=
8000c460000
> > > [   24.627847] R10: 0000000000000001 R11: 0000000000000000 R12: fffff=
fff82aa7620
> > > [   24.629062] R13: ffff88000c4600a8 R14: ffff880000333e08 R15: ffff8=
8000c4600aa
> > > [   24.630281] FS:  0000000000000000(0000) GS:ffffffff8264a000(0000) =
knlGS:0000000000000000
> > > [   24.631651] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   24.632635] CR2: 0000000000000000 CR3: 000000000260c000 CR4: 00000=
000000006f0
> > > [   24.633856] Stack:
> > > [   24.634218]  ffff880000333d80 ffffffff81d5722a 0000000000011c48 ff=
ff880000333e08
> > > [   24.635584]  000000010fcc5390 0000000000000000 ffffffff824d0a08 ff=
ff88000c1d9e98
> > > [   24.636954]  0000000000000001 0000000000011b20 ffff88000c460000 ff=
ff88000c460000
> > > [   24.638323] Call Trace:
> > > [   24.638764]  [<ffffffff81d5722a>] ? unflatten_dt_nodes+0x8da/0xb90
> > > [   24.639836]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> > > [   24.640932]  [<ffffffff81250a04>] ? get_page_from_freelist+0x4f4/0=
x15b0
> > > [   24.642068]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> > > [   24.643190]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> > > [   24.644310]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> > > [   24.645405]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> > > [   24.646525]  [<ffffffff812517fb>] ? get_page_from_freelist+0x12eb/=
0x15b0
> > > [   24.647679]  [<ffffffff811fe300>] ? disable_branch_tracing+0x50/0x=
70
> > > [   24.648776]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> > > [   24.649864]  [<ffffffff81251e33>] ? __alloc_pages_nodemask+0x373/0=
x15c0
> > > [   24.651059]  [<ffffffff8181e3a3>] ? check_preemption_disabled+0x53=
/0x190
> > > [   24.652208]  [<ffffffff8114d571>] ? __lock_acquire+0x261/0xf20
> > > [   24.653311]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> > > [   24.654445]  [<ffffffff81d56817>] ? kernel_tree_alloc+0x27/0x40
> > > [   24.655469]  [<ffffffff812b6ed5>] ? __kmalloc+0x145/0x460
> > > [   24.656433]  [<ffffffff81d575b9>] __unflatten_device_tree+0xd9/0x1=
60
> > > [   24.657583]  [<ffffffff81d57a8f>] of_fdt_unflatten_tree+0x4f/0x80
> > > [   24.658764]  [<ffffffff82be25ac>] of_unittest+0xd1/0x259b
> > > [   24.659769]  [<ffffffff82be24db>] ? of_unittest_platform_populate+=
0x587/0x587
> > > [   24.661029]  [<ffffffff82b559dc>] do_one_initcall+0x1b1/0x302
> > > [   24.662060]  [<ffffffff82b55d30>] kernel_init_freeable+0x203/0x32d
> > > [   24.663164]  [<ffffffff81ea2c90>] kernel_init+0x20/0x240
> > > [   24.664106]  [<ffffffff81eb02cf>] ret_from_fork+0x1f/0x40
> > > [   24.665048]  [<ffffffff81ea2c70>] ? rest_init+0x130/0x130
> > > [   24.665987] Code: 17 02 01 8d 52 20 0f b6 d2 39 d0 74 b0 29 d0 48 =
83 05 39 79 17 02 01 5d c3 0f 1f 80 00 00 00 00 48 8b 15 41 79 17 02 55 48 =
89 f8 <0f> b6 0e 48 89 e5 49 89 d0 49 f7 d8 4c 01 c6 49 01 f8 84 c9 88 =

> > > [   24.670987] RIP  [<ffffffff817f158b>] strcpy+0xb/0x50
> > > [   24.671893]  RSP <ffff8800003339d8>
> > > [   24.672500] CR2: 0000000000000000
> > This is strange, because the diff between the good kbuild/kbuild branch
> > and the bad kbuild/for-next branch is just a few coccinelle patches and
> > a fix for make rpm:
> > $ git --no-pager diff --stat 2441e78b1919 867853145cea
> >  scripts/coccinelle/api/setup_timer.cocci       |   4 +-
> >  scripts/coccinelle/misc/compare_const_fl.cocci | 171
> > -------------------------
> >  scripts/package/mkspec                         |   5 +
> >  3 files changed, 7 insertions(+), 173 deletions(-)

The changed part by that merge should be top level Makefile:

% git --no-pager diff  --stat 867853145cea25491054ef067ff8af8946f37e2d~..86=
7853145cea25491054ef067ff8af8946f37e2d
 Makefile | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

> Would be interesting to know if the bug goes away simply by reverting =

> those changes.

It's a bit special since the first bad commit is a merge commit.
Both of your branches' parent commits are fine:

+------------------------------------------+------------+------------+-----=
-------+------------+
|                                          | 4bf284b277 | 2441e78b19 | 8678=
53145c | f490734437 |
+------------------------------------------+------------+------------+-----=
-------+------------+
| boot_successes                           | 63         | 63         | 0   =
       | 0          |
| boot_failures                            | 0          | 0          | 22  =
       | 13         |
| BUG:unable_to_handle_kernel              | 0          | 0          | 22  =
       | 13         |
| Oops                                     | 0          | 0          | 22  =
       | 13         |
| RIP:strcpy                               | 0          | 0          | 22  =
       | 13         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 0          | 22  =
       | 13         |
| backtrace:of_unittest                    | 0          | 0          | 22  =
       | 13         |
| backtrace:kernel_init_freeable           | 0          | 0          | 22  =
       | 13         |
+------------------------------------------+------------+------------+-----=
-------+------------+

Bisect log shows another interesting fact: after enabling
CONFIG_DEBUG_INFO, the error goes away.

# extra tests with DEBUG_INFO
git bisect good 867853145cea25491054ef067ff8af8946f37e2d  # 05:36     66+  =
    0  Merge branch 'kbuild/kbuild' into kbuild/for-next

> I'm willing to have a look but I need to be able to reproduce.

This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1
initrd=3Dyocto-minimal-x86_64.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/mas=
ter/initrd/$initrd

kvm=3D(
        qemu-system-x86_64
        -enable-kvm
        -kernel $kernel
        -initrd $initrd
        -m 256
        -smp 1
        -device e1000,netdev=3Dnet0
        -netdev user,id=3Dnet0     =

        -boot order=3Dnc
        -no-reboot
        -watchdog i6300esb
        -rtc base=3Dlocaltime
        -serial stdio
        -display none
        -monitor null
)

append=3D(
        hung_task_panic=3D1
        earlyprintk=3DttyS0,115200
        systemd.log_level=3Derr
        debug
        apic=3Ddebug
        sysrq_always_enabled
        rcupdate.rcu_cpu_stall_timeout=3D100
        panic=3D-1
        softlockup_panic=3D1
        nmi_watchdog=3Dpanic
        oops=3Dpanic
        load_ramdisk=3D2
        prompt_ramdisk=3D0
        console=3DttyS0,115200
        console=3Dtty0
        vga=3Dnormal
        root=3D/dev/ram0
        rw
        drbd.minor_count=3D8
)

"${kvm[@]}" --append "${append[*]}"
----------------------------------------------------------------------------

Thanks,
Fengguang

--===============3258958676933447500==--

