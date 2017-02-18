Content-Type: multipart/mixed; boundary="===============3500241077051485525=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [locking/mutex] e274795ea7 WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/internal.h:348 __switch_to
Date: Sat, 18 Feb 2017 21:53:07 +0800
Message-ID: <20170218135307.dw6gt5tjqdprxzkr@wfg-t540p.sh.intel.com>
In-Reply-To: <20170218102845.GF6500@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3500241077051485525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 11:28:45AM +0100, Peter Zijlstra wrote:
>On Sat, Feb 18, 2017 at 04:57:46PM +0800, Fengguang Wu wrote:
>> Hi Peter,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>>
>> commit e274795ea7b7caa0fd74ef651594382a69e2a951
>> Author:     Peter Zijlstra <peterz@infradead.org>
>> AuthorDate: Wed Jan 11 14:17:48 2017 +0100
>> Commit:     Ingo Molnar <mingo@kernel.org>
>> CommitDate: Sat Jan 14 11:14:38 2017 +0100
>
>That commit has been in the tree for over a month now.. And I've never
>seen a warning like this before.

Yeah there're always rooms to improve the test&bisect system (which is
hard problem and takes round-after-round optimizations to work well).
It happen to be my focus these days, as you may see from the following
bunch of reports. This effort digs out some old bugs as well.

1177   F Feb 18 To Borislav Pet (4041:2) [clear_page] 0ad07c8104 BUG: unabl=
e to handle kernel NULL pointer dereference at 0000000000000040
1178   F Feb 18 Cc LKML         (3701:2) [x86/mm] e1a58320a3 WARNING: CPU: =
0 PID: 1 at arch/x86/mm/dump_pagetables.c:225 note_page()
1179   F Feb 18 Cc LKML         (3796:2) [drm] bea5b158ff BUG: unable to ha=
ndle kernel NULL pointer dereference at 0000000000000748
1180   F Feb 18 Cc LKML         (5990:2) [USB] bea5b158ff WARNING: CPU: 0 P=
ID: 1 at lib/list_debug.c:33 __list_add
1181   F Feb 18 To Herbert Xu   (4904:3) [rhashtable] 5d60de5ff1 [ INFO: su=
spicious RCU usage. ]
1182   F Feb 18 Cc LKML         (4637:2) [x86/vsyscall] 3dc33bd30f Kernel p=
anic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
1183   F Feb 18 To Kees Cook    (4402:3) [x86/vsyscall] 3dc33bd30f Kernel p=
anic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
1184   F Feb 18 To Thomas Gleix (4032:2) [genirq] f91f694540 BUG: unable to=
 handle kernel NULL pointer dereference at 0000002c
1185   F Feb 18 To Thomas Gleix (5093:3) [genirq] f91f694540 BUG: unable to=
 handle kernel NULL pointer dereference at 0000000000000078
1186   F Feb 18 To Matt Fleming (4595:2) [sched/core] cb42c9a3eb WARNING: C=
PU: 0 PID: 9 at kernel/sched/sched.h:804 assert_clock_updated
1187   F Feb 18 To LKML         (4070:2) [x86] a75a3f6fc9 Kernel panic - no=
t syncing: Attempted to kill init! exitcode=3D0x0000000b
1188   F Feb 18 Cc LKML         (  32:0) Re: [x86] a75a3f6fc9 Kernel panic =
- not syncing: Attempted to kill init! exitcode=3D0x0000000b
1189   F Feb 18 To Herbert Xu   (4690:2) [rhashtable] da20420f83 [ INFO: su=
spicious RCU usage. ]
1190   F Feb 18 To Wenzhong Sun (  60:0) Re: smpboot issue in LKP environme=
nt
1191   F Feb 18 To Peter Zijlst (5881:2) [locking/mutex] e274795ea7 WARNING=
: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/internal.h:348 __switch_to

>>      locking/mutex: Fix mutex handoff
>
>
>>
>> [   13.377261] Write protecting the kernel text: 15320k
>> [   13.378910] Write protecting the kernel read-only data: 6316k
>> [   13.380655] NX-protecting the kernel data: 9256k
>> [   13.382475] x86/mm: Checked W+X mappings: passed, no W+X pages found.
>> [   13.384781] ------------[ cut here ]------------
>> [   13.386327] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/intern=
al.h:348 __switch_to+0x1b6/0x260
>
>What tree is this? on current next/master that file doesn't have a WARN
>on that line.

The dmesg comes from the first bad commit e274795ea7 ("locking/mutex: Fix m=
utex handoff").

% git blame -sL 333,350 e274795ea7 arch/x86/include/asm/fpu/internal.h
fd169b05 333) /*
fd169b05 334)  * Save processor xstate to xsave area.
fd169b05 335)  */
8c05f05e 336) static inline void copy_xregs_to_kernel(struct xregs_state *x=
state)
fd169b05 337) {
fd169b05 338)   u64 mask =3D -1;
fd169b05 339)   u32 lmask =3D mask;
fd169b05 340)   u32 hmask =3D mask >> 32;
b7106fa0 341)   int err;
fd169b05 342)
fd169b05 343)   WARN_ON(!alternatives_patched);
fd169b05 344)
b7106fa0 345)   XSTATE_XSAVE(xstate, lmask, hmask, err);
fd169b05 346)
8c05f05e 347)   /* We should never fault when copying to a kernel buffer: */
8c05f05e 348)   WARN_ON_FPU(err);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fd169b05 349) }
fd169b05 350)

Regards,
Fengguang

--===============3500241077051485525==--

