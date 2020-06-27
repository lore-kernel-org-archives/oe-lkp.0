Content-Type: multipart/mixed; boundary="===============3583509659832551783=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: lkp@lists.01.org
Subject: Re: 039f56b399 ("make rcutorture always dump ftrace"): WARNING: CPU: 1 PID: 121 at kernel/trace/trace.c:3509 trace_find_next_entry
Date: Sat, 27 Jun 2020 12:42:39 -0400
Message-ID: <CAJWu+orsB4N_a=ksEPDKx0UJ82CKOg=uP_=3G31gaoF2CESeNw@mail.gmail.com>
In-Reply-To: <20200627044120.GA14444@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3583509659832551783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No problem, I have also become careful with pushing branches so I don't
give you guys extra work. I appreciate all the work done to help us out!

On Sat, Jun 27, 2020 at 12:41 AM Philip Li <philip.li@intel.com> wrote:

> On Thu, Jun 25, 2020 at 05:12:29PM -0400, Joel Fernandes wrote:
> > I have since deleted this branch. Does it take a while to catch up?
> Hi Joel, it may be cached in the bot when it starts to bisect
> the issue, which need extra time to complete the whole steps. We
> will double check whether the commit is exists or not before sending
> out report. Sorry for this noise.
>
> Thanks
>
> >
> > On Wed, Jun 24, 2020 at 7:56 PM kernel test robot <lkp@intel.com> wro=
te:
> > >
> > > Greetings,
> > >
> > > 0day kernel testing robot got the below dmesg and the first bad commit
> is
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
> rcu-segcb
> > >
> > > commit 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb
> > > Author:     Joel Fernandes <joelaf@google.com>
> > > AuthorDate: Tue Jun 23 16:33:45 2020 -0400
> > > Commit:     Joel Fernandes <joelaf@google.com>
> > > CommitDate: Tue Jun 23 16:34:30 2020 -0400
> > >
> > >     make rcutorture always dump ftrace
> > >
> > >     Signed-off-by: Joel Fernandes <joelaf@google.com>
> > >
> > > c4b4fa5b86  Add tracing for rcu_pending
> > > 039f56b399  make rcutorture always dump ftrace
> > >
> +--------------------------------------------------------+------------+--=
----------+
> > > |                                                        | c4b4fa5b86
> | 039f56b399 |
> > >
> +--------------------------------------------------------+------------+--=
----------+
> > > | boot_successes                                         | 35
>  | 0          |
> > > | boot_failures                                          | 1
> | 17         |
> > > | WARNING:held_lock_freed                                | 1
> | 1          |
> > > | is_freeing_memory#-#,with_a_lock_still_held_there      | 1
> | 1          |
> > > | WARNING:at_kernel/trace/trace.c:#trace_find_next_entry | 0
> | 17         |
> > > | EIP:trace_find_next_entry                              | 0
> | 17         |
> > >
> +--------------------------------------------------------+------------+--=
----------+
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > [  122.596183] rcu_tort-124     1d.h1 71613156us : invoke_rcu_core:
> Raising softirq
> > > [  122.596183] swapper/-1       0d.h. 71613173us : invoke_rcu_core:
> Raising softirq
> > > [  122.596183] rcu_tort-120     1d.h2 71621302us : invoke_rcu_core:
> Raising softirq
> > > [  122.596183] ---------------------------------
> > > [  122.596183] ------------[ cut here ]------------
> > > [  122.596183] WARNING: CPU: 1 PID: 121 at kernel/trace/trace.c:3509
> trace_find_next_entry+0xe9/0x270
> > > [  122.596183] Modules linked in:
> > > [  122.596183] CPU: 1 PID: 121 Comm: rcu_torture_sta Not tainted
> 5.8.0-rc1-00179-g039f56b399665 #1
> > > [  122.596183] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> > > [  122.596183] EIP: trace_find_next_entry+0xe9/0x270
> > > [  122.596183] Code: 8f 4e c4 01 83 15 0c 8f 4e c4 00 39 48 6c 73 6b
> 81 fe 00 f5 4e c4 0f 85 25 01 00 00 83 05 10 8f 4e c4 01 83 15 14 8f 4e c4
> 00 <0f> 0b 83 05 20 8f 4e c4 01 83 15 24 8f 4e c4 00 eb 3f 8d 74 26 00
> > > [  122.596183] EAX: c44ed400 EBX: c44ed400 ECX: 00000014 EDX: f1e360ec
> > > [  122.596183] ESI: c44ef500 EDI: f1e360ec EBP: ee7a9e60 ESP: ee7a9e48
> > > [  122.596183] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS:
> 00010046
> > > [  122.596183] CR0: 80050033 CR2: ffffffff CR3: 04132000 CR4: 001406b0
> > > [  122.596183] Call Trace:
> > > [  122.596183]  trace_print_lat_context+0x47/0x620
> > > [  122.596183]  ? find_next_bit+0x1d/0x30
> > > [  122.596183]  ? cpumask_next+0x59/0x70
> > > [  122.596183]  print_trace_line+0x928/0xb60
> > > [  122.596183]  ftrace_dump+0x307/0x4b0
> > > [  122.596183]  rcu_torture_stats_print+0x908/0x9d0
> > > [  122.596183]  rcu_torture_stats+0x88/0x100
> > > [  122.596183]  kthread+0x244/0x260
> > > [  122.596183]  ? rcu_torture_stats_print+0x9d0/0x9d0
> > > [  122.596183]  ? kthread_unpark+0xd0/0xd0
> > > [  122.596183]  ret_from_fork+0x19/0x30
> > > [  122.596183] ---[ end trace ca04e5844f44c5cc ]---
> > > [  149.891205] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor
> 0
> > >
> > >                                                           # HH:MM
> RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> > > git bisect start 82cf130fe4c5a6e6712f8bd07e42f6455cb9db4e
> 48778464bb7d346b47157d21ffde2af6b2d39110 --
> > > git bisect good ea343062323ab751211db6e3931c41737584891e  # 01:30  G
>    10     0    1   1  Merge 'hid/for-next' into devel-catchup-202006242334
> > > git bisect  bad d55c151aaabf8418b956d88b38864650c88a789c  # 01:44  B
>     0     1   17   0  Merge 'tip/ras/core' into devel-catchup-202006242334
> > > git bisect good 2b99151919ed84b0b4635936833d6873f81e7700  # 02:19  G
>    11     0    2   3  Merge 'saeed/net-next' into devel-catchup-202006242=
334
> > > git bisect  bad 8be1d8a5c01dc631735fee16545fd67b8b6c986e  # 02:39  B
>     0     1   17   0  Merge 'hch-misc/cleanup-kernel-rw-helpers.3' into
> devel-catchup-202006242334
> > > git bisect good 53eaebe99597aa35661387ecdd53dcac64dedb01  # 03:19  G
>    11     0    1   1  Merge 'mkp-scsi/fixes' into devel-catchup-202006242=
334
> > > git bisect  bad 7761f825fef535e2f775c3d98bb6558639116d27  # 03:52  B
>     0     1   17   0  Merge 'jfern/rcu-segcb' into
> devel-catchup-202006242334
> > > git bisect good e3be8c671913af551669f244f5977fb93eea27e2  # 04:22  G
>    10     0    0   0  Merge branches 'doc.2020.06.17a',
> 'fixes.2020.06.17a', 'rcu-tasks.2020.06.17a', 'scale.2020.06.17a',
> 'srcu.2020.06.17a' and 'torture.2020.06.17a' into HEAD
> > > git bisect good a60a604d76885d24fcaa65dd1839046589f60766  # 04:44  G
>    10     0    1   1  tools/memory-model: Make judgelitmus.sh handle
> scripted Result: tag
> > > git bisect good 04e5111a0192dce73b7ef58b8288e16b2855b378  # 05:07  G
>    10     0    1   1  rcu/tree: Use static initializer for krc.lock
> > > git bisect good 6f92ad84da8ba905864d5fe0e616494fb718a84e  # 05:32  G
>    10     0    2   2  rcu: Initialize at declaration time in
> rcu_exp_handler()
> > > git bisect good 1fce90226d6138c0c8fe6f4a913119d4f0c15263  # 05:48  G
>    10     0    1   1  rcu/trace: Use rsp's gp_seq in acceleration's
> rcu_grace_period tracepoint
> > > git bisect good b4ef7c752f22afcd8fa65809c8e6f974dc27714a  # 06:25  G
>    10     0    2   2  rcutree: Make rcu_advance also print Segcb after
> WAIT->DONE happens
> > > git bisect  bad 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb  # 06:37  B
>     0     3   22   3  make rcutorture always dump ftrace
> > > git bisect good c4b4fa5b86f7aca290f6218570980b451d17010a  # 07:00  G
>    10     0    0   0  Add tracing for rcu_pending
> > > # first bad commit: [039f56b3996656cf3a0bdc306fcd09fc02fe3fbb] make
> rcutorture always dump ftrace
> > > git bisect good c4b4fa5b86f7aca290f6218570980b451d17010a  # 07:06  G
>    32     0    1   2  Add tracing for rcu_pending
> > > # extra tests with debug options
> > > git bisect  bad 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb  # 07:17  B
>     0     2   19   1  make rcutorture always dump ftrace
> > > # extra tests on head commit of jfern/rcu-segcb
> > > git bisect  bad 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb  # 07:33  B
>     0    17   33   0  make rcutorture always dump ftrace
> > > # bad: [039f56b3996656cf3a0bdc306fcd09fc02fe3fbb] make rcutorture
> always dump ftrace
> > > # extra tests on revert first bad commit
> > > git bisect good a5800fbf9102456673f4fd9f2c9692dfa71392d8  # 07:55  G
>    10     0    0   0  Revert "make rcutorture always dump ftrace"
> > > # good: [a5800fbf9102456673f4fd9f2c9692dfa71392d8] Revert "make
> rcutorture always dump ftrace"
> > >
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
>

--===============3583509659832551783==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+Tm8gcHJvYmxlbSwgSSBoYXZlIGFsc28gYmVjb21lIGNhcmVmdWwgd2l0
aCBwdXNoaW5nIGJyYW5jaGVzIHNvIEkgZG9uJiMzOTt0IGdpdmUgeW91IGd1eXMgZXh0cmEgd29y
ay4gSSBhcHByZWNpYXRlIGFsbCB0aGUgd29yayBkb25lIHRvIGhlbHAgdXMgb3V0ITwvZGl2Pjxi
cj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0
dHIiPk9uIFNhdCwgSnVuIDI3LCAyMDIwIGF0IDEyOjQxIEFNIFBoaWxpcCBMaSAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnBoaWxpcC5saUBpbnRlbC5jb20iPnBoaWxpcC5saUBpbnRlbC5jb208L2E+Jmd0
OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIw
NCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIFRodSwgSnVuIDI1LCAyMDIwIGF0IDA1OjEyOjI5
UE0gLTA0MDAsIEpvZWwgRmVybmFuZGVzIHdyb3RlOjxicj4KJmd0OyBJIGhhdmUgc2luY2UgZGVs
ZXRlZCB0aGlzIGJyYW5jaC4gRG9lcyBpdCB0YWtlIGEgd2hpbGUgdG8gY2F0Y2ggdXA/PGJyPgpI
aSBKb2VsLCBpdCBtYXkgYmUgY2FjaGVkIGluIHRoZSBib3Qgd2hlbiBpdCBzdGFydHMgdG8gYmlz
ZWN0PGJyPgp0aGUgaXNzdWUsIHdoaWNoIG5lZWQgZXh0cmEgdGltZSB0byBjb21wbGV0ZSB0aGUg
d2hvbGUgc3RlcHMuIFdlPGJyPgp3aWxsIGRvdWJsZSBjaGVjayB3aGV0aGVyIHRoZSBjb21taXQg
aXMgZXhpc3RzIG9yIG5vdCBiZWZvcmUgc2VuZGluZzxicj4Kb3V0IHJlcG9ydC4gU29ycnkgZm9y
IHRoaXMgbm9pc2UuPGJyPgo8YnI+ClRoYW5rczxicj4KPGJyPgomZ3Q7IDxicj4KJmd0OyBPbiBX
ZWQsIEp1biAyNCwgMjAyMCBhdCA3OjU2IFBNIGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVm
PSJtYWlsdG86bGtwQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxrcEBpbnRlbC5jb208L2E+
Jmd0OyB3cm90ZTo8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IEdyZWV0aW5ncyw8YnI+CiZn
dDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IDBkYXkga2VybmVsIHRlc3Rpbmcgcm9ib3QgZ290IHRoZSBi
ZWxvdyBkbWVzZyBhbmQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXM8YnI+CiZndDsgJmd0Ozxicj4K
Jmd0OyAmZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2pmZXJuL2xpbnV4LmdpdCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamZlcm4v
bGludXguZ2l0PC9hPiByY3Utc2VnY2I8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IGNvbW1p
dCAwMzlmNTZiMzk5NjY1NmNmM2EwYmRjMzA2ZmNkMDlmYzAyZmUzZmJiPGJyPgomZ3Q7ICZndDsg
QXV0aG9yOsKgIMKgIMKgSm9lbCBGZXJuYW5kZXMgJmx0OzxhIGhyZWY9Im1haWx0bzpqb2VsYWZA
Z29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmpvZWxhZkBnb29nbGUuY29tPC9hPiZndDs8YnI+
CiZndDsgJmd0OyBBdXRob3JEYXRlOiBUdWUgSnVuIDIzIDE2OjMzOjQ1IDIwMjAgLTA0MDA8YnI+
CiZndDsgJmd0OyBDb21taXQ6wqAgwqAgwqBKb2VsIEZlcm5hbmRlcyAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmpvZWxhZkBnb29nbGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+am9lbGFmQGdvb2dsZS5jb208
L2E+Jmd0Ozxicj4KJmd0OyAmZ3Q7IENvbW1pdERhdGU6IFR1ZSBKdW4gMjMgMTY6MzQ6MzAgMjAy
MCAtMDQwMDxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDvCoCDCoCDCoG1ha2UgcmN1dG9ydHVy
ZSBhbHdheXMgZHVtcCBmdHJhY2U8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7wqAgwqAgwqBT
aWduZWQtb2ZmLWJ5OiBKb2VsIEZlcm5hbmRlcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmpvZWxhZkBn
b29nbGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+am9lbGFmQGdvb2dsZS5jb208L2E+Jmd0Ozxicj4K
Jmd0OyAmZ3Q7PGJyPgomZ3Q7ICZndDsgYzRiNGZhNWI4NsKgIEFkZCB0cmFjaW5nIGZvciByY3Vf
cGVuZGluZzxicj4KJmd0OyAmZ3Q7IDAzOWY1NmIzOTnCoCBtYWtlIHJjdXRvcnR1cmUgYWx3YXlz
IGR1bXAgZnRyYWNlPGJyPgomZ3Q7ICZndDsgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rPGJy
PgomZ3Q7ICZndDsgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgYzRiNGZhNWI4NiB8IDAz
OWY1NmIzOTkgfDxicj4KJmd0OyAmZ3Q7ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKzxicj4K
Jmd0OyAmZ3Q7IHwgYm9vdF9zdWNjZXNzZXPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMzXCoCDCoCDCoCDCoCDCoHwgMMKgIMKg
IMKgIMKgIMKgIHw8YnI+CiZndDsgJmd0OyB8IGJvb3RfZmFpbHVyZXPCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDHCoCDCoCDC
oCDCoCDCoCB8IDE3wqAgwqAgwqAgwqAgwqB8PGJyPgomZ3Q7ICZndDsgfCBXQVJOSU5HOmhlbGRf
bG9ja19mcmVlZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHwgMcKgIMKgIMKgIMKgIMKgIHwgMcKgIMKgIMKgIMKgIMKgIHw8YnI+CiZndDsgJmd0OyB8IGlz
X2ZyZWVpbmdfbWVtb3J5Iy0jLHdpdGhfYV9sb2NrX3N0aWxsX2hlbGRfdGhlcmXCoCDCoCDCoCB8
IDHCoCDCoCDCoCDCoCDCoCB8IDHCoCDCoCDCoCDCoCDCoCB8PGJyPgomZ3Q7ICZndDsgfCBXQVJO
SU5HOmF0X2tlcm5lbC90cmFjZS90cmFjZS5jOiN0cmFjZV9maW5kX25leHRfZW50cnkgfCAwwqAg
wqAgwqAgwqAgwqAgfCAxN8KgIMKgIMKgIMKgIMKgfDxicj4KJmd0OyAmZ3Q7IHwgRUlQOnRyYWNl
X2ZpbmRfbmV4dF9lbnRyecKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHwgMMKgIMKgIMKgIMKgIMKgIHwgMTfCoCDCoCDCoCDCoCDCoHw8YnI+CiZndDsgJmd0OyAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSs8YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IElm
IHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWc8YnI+CiZndDsgJmd0
OyBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgJmx0OzxhIGhyZWY9Im1haWx0bzpsa3BA
aW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGtwQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7
ICZndDs8YnI+CiZndDsgJmd0OyBbwqAgMTIyLjU5NjE4M10gcmN1X3RvcnQtMTI0wqAgwqAgwqAx
ZC5oMSA3MTYxMzE1NnVzIDogaW52b2tlX3JjdV9jb3JlOiBSYWlzaW5nIHNvZnRpcnE8YnI+CiZn
dDsgJmd0OyBbwqAgMTIyLjU5NjE4M10gc3dhcHBlci8tMcKgIMKgIMKgIMKgMGQuaC4gNzE2MTMx
NzN1cyA6IGludm9rZV9yY3VfY29yZTogUmFpc2luZyBzb2Z0aXJxPGJyPgomZ3Q7ICZndDsgW8Kg
IDEyMi41OTYxODNdIHJjdV90b3J0LTEyMMKgIMKgIMKgMWQuaDIgNzE2MjEzMDJ1cyA6IGludm9r
ZV9yY3VfY29yZTogUmFpc2luZyBzb2Z0aXJxPGJyPgomZ3Q7ICZndDsgW8KgIDEyMi41OTYxODNd
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KJmd0OyAmZ3Q7IFvCoCAxMjIu
NTk2MTgzXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS08YnI+CiZndDsgJmd0
OyBbwqAgMTIyLjU5NjE4M10gV0FSTklORzogQ1BVOiAxIFBJRDogMTIxIGF0IGtlcm5lbC90cmFj
ZS90cmFjZS5jOjM1MDkgdHJhY2VfZmluZF9uZXh0X2VudHJ5KzB4ZTkvMHgyNzA8YnI+CiZndDsg
Jmd0OyBbwqAgMTIyLjU5NjE4M10gTW9kdWxlcyBsaW5rZWQgaW46PGJyPgomZ3Q7ICZndDsgW8Kg
IDEyMi41OTYxODNdIENQVTogMSBQSUQ6IDEyMSBDb21tOiByY3VfdG9ydHVyZV9zdGEgTm90IHRh
aW50ZWQgNS44LjAtcmMxLTAwMTc5LWcwMzlmNTZiMzk5NjY1ICMxPGJyPgomZ3Q7ICZndDsgW8Kg
IDEyMi41OTYxODNdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJ
SVgsIDE5OTYpLCBCSU9TIDEuMTIuMC0xIDA0LzAxLzIwMTQ8YnI+CiZndDsgJmd0OyBbwqAgMTIy
LjU5NjE4M10gRUlQOiB0cmFjZV9maW5kX25leHRfZW50cnkrMHhlOS8weDI3MDxicj4KJmd0OyAm
Z3Q7IFvCoCAxMjIuNTk2MTgzXSBDb2RlOiA4ZiA0ZSBjNCAwMSA4MyAxNSAwYyA4ZiA0ZSBjNCAw
MCAzOSA0OCA2YyA3MyA2YiA4MSBmZSAwMCBmNSA0ZSBjNCAwZiA4NSAyNSAwMSAwMCAwMCA4MyAw
NSAxMCA4ZiA0ZSBjNCAwMSA4MyAxNSAxNCA4ZiA0ZSBjNCAwMCAmbHQ7MGYmZ3Q7IDBiIDgzIDA1
IDIwIDhmIDRlIGM0IDAxIDgzIDE1IDI0IDhmIDRlIGM0IDAwIGViIDNmIDhkIDc0IDI2IDAwPGJy
PgomZ3Q7ICZndDsgW8KgIDEyMi41OTYxODNdIEVBWDogYzQ0ZWQ0MDAgRUJYOiBjNDRlZDQwMCBF
Q1g6IDAwMDAwMDE0IEVEWDogZjFlMzYwZWM8YnI+CiZndDsgJmd0OyBbwqAgMTIyLjU5NjE4M10g
RVNJOiBjNDRlZjUwMCBFREk6IGYxZTM2MGVjIEVCUDogZWU3YTllNjAgRVNQOiBlZTdhOWU0ODxi
cj4KJmd0OyAmZ3Q7IFvCoCAxMjIuNTk2MTgzXSBEUzogMDA3YiBFUzogMDA3YiBGUzogMDBkOCBH
UzogMDBlMCBTUzogMDA2OCBFRkxBR1M6IDAwMDEwMDQ2PGJyPgomZ3Q7ICZndDsgW8KgIDEyMi41
OTYxODNdIENSMDogODAwNTAwMzMgQ1IyOiBmZmZmZmZmZiBDUjM6IDA0MTMyMDAwIENSNDogMDAx
NDA2YjA8YnI+CiZndDsgJmd0OyBbwqAgMTIyLjU5NjE4M10gQ2FsbCBUcmFjZTo8YnI+CiZndDsg
Jmd0OyBbwqAgMTIyLjU5NjE4M13CoCB0cmFjZV9wcmludF9sYXRfY29udGV4dCsweDQ3LzB4NjIw
PGJyPgomZ3Q7ICZndDsgW8KgIDEyMi41OTYxODNdwqAgPyBmaW5kX25leHRfYml0KzB4MWQvMHgz
MDxicj4KJmd0OyAmZ3Q7IFvCoCAxMjIuNTk2MTgzXcKgID8gY3B1bWFza19uZXh0KzB4NTkvMHg3
MDxicj4KJmd0OyAmZ3Q7IFvCoCAxMjIuNTk2MTgzXcKgIHByaW50X3RyYWNlX2xpbmUrMHg5Mjgv
MHhiNjA8YnI+CiZndDsgJmd0OyBbwqAgMTIyLjU5NjE4M13CoCBmdHJhY2VfZHVtcCsweDMwNy8w
eDRiMDxicj4KJmd0OyAmZ3Q7IFvCoCAxMjIuNTk2MTgzXcKgIHJjdV90b3J0dXJlX3N0YXRzX3By
aW50KzB4OTA4LzB4OWQwPGJyPgomZ3Q7ICZndDsgW8KgIDEyMi41OTYxODNdwqAgcmN1X3RvcnR1
cmVfc3RhdHMrMHg4OC8weDEwMDxicj4KJmd0OyAmZ3Q7IFvCoCAxMjIuNTk2MTgzXcKgIGt0aHJl
YWQrMHgyNDQvMHgyNjA8YnI+CiZndDsgJmd0OyBbwqAgMTIyLjU5NjE4M13CoCA/IHJjdV90b3J0
dXJlX3N0YXRzX3ByaW50KzB4OWQwLzB4OWQwPGJyPgomZ3Q7ICZndDsgW8KgIDEyMi41OTYxODNd
wqAgPyBrdGhyZWFkX3VucGFyaysweGQwLzB4ZDA8YnI+CiZndDsgJmd0OyBbwqAgMTIyLjU5NjE4
M13CoCByZXRfZnJvbV9mb3JrKzB4MTkvMHgzMDxicj4KJmd0OyAmZ3Q7IFvCoCAxMjIuNTk2MTgz
XSAtLS1bIGVuZCB0cmFjZSBjYTA0ZTU4NDRmNDRjNWNjIF0tLS08YnI+CiZndDsgJmd0OyBbwqAg
MTQ5Ljg5MTIwNV0gW2RybV0gSW5pdGlhbGl6ZWQgdmdlbSAxLjAuMCAyMDEyMDExMiBmb3Igdmdl
bSBvbiBtaW5vciAwPGJyPgomZ3Q7ICZndDs8YnI+CiZndDsgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIyBISDpNTSBSRVNVTFQgR09PRCBCQUQgR09PRF9CVVRfRElSVFkgRElS
VFlfTk9UX0JBRDxicj4KJmd0OyAmZ3Q7IGdpdCBiaXNlY3Qgc3RhcnQgODJjZjEzMGZlNGM1YTZl
NjcxMmY4YmQwN2U0MmY2NDU1Y2I5ZGI0ZSA0ODc3ODQ2NGJiN2QzNDZiNDcxNTdkMjFmZmRlMmFm
NmIyZDM5MTEwIC0tPGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdCBnb29kIGVhMzQzMDYyMzIzYWI3
NTEyMTFkYjZlMzkzMWM0MTczNzU4NDg5MWXCoCAjIDAxOjMwwqAgR8KgIMKgIMKgMTDCoCDCoCDC
oDDCoCDCoCAxwqAgwqAxwqAgTWVyZ2UgJiMzOTtoaWQvZm9yLW5leHQmIzM5OyBpbnRvIGRldmVs
LWNhdGNodXAtMjAyMDA2MjQyMzM0PGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdMKgIGJhZCBkNTVj
MTUxYWFhYmY4NDE4Yjk1NmQ4OGIzODg2NDY1MGM4OGE3ODljwqAgIyAwMTo0NMKgIELCoCDCoCDC
oCAwwqAgwqAgwqAxwqAgwqAxN8KgIMKgMMKgIE1lcmdlICYjMzk7dGlwL3Jhcy9jb3JlJiMzOTsg
aW50byBkZXZlbC1jYXRjaHVwLTIwMjAwNjI0MjMzNDxicj4KJmd0OyAmZ3Q7IGdpdCBiaXNlY3Qg
Z29vZCAyYjk5MTUxOTE5ZWQ4NGIwYjQ2MzU5MzY4MzNkNjg3M2Y4MWU3NzAwwqAgIyAwMjoxOcKg
IEfCoCDCoCDCoDExwqAgwqAgwqAwwqAgwqAgMsKgIMKgM8KgIE1lcmdlICYjMzk7c2FlZWQvbmV0
LW5leHQmIzM5OyBpbnRvIGRldmVsLWNhdGNodXAtMjAyMDA2MjQyMzM0PGJyPgomZ3Q7ICZndDsg
Z2l0IGJpc2VjdMKgIGJhZCA4YmUxZDhhNWMwMWRjNjMxNzM1ZmVlMTY1NDVmZDY3YjhiNmM5ODZl
wqAgIyAwMjozOcKgIELCoCDCoCDCoCAwwqAgwqAgwqAxwqAgwqAxN8KgIMKgMMKgIE1lcmdlICYj
Mzk7aGNoLW1pc2MvY2xlYW51cC1rZXJuZWwtcnctaGVscGVycy4zJiMzOTsgaW50byBkZXZlbC1j
YXRjaHVwLTIwMjAwNjI0MjMzNDxicj4KJmd0OyAmZ3Q7IGdpdCBiaXNlY3QgZ29vZCA1M2VhZWJl
OTk1OTdhYTM1NjYxMzg3ZWNkZDUzZGNhYzY0ZGVkYjAxwqAgIyAwMzoxOcKgIEfCoCDCoCDCoDEx
wqAgwqAgwqAwwqAgwqAgMcKgIMKgMcKgIE1lcmdlICYjMzk7bWtwLXNjc2kvZml4ZXMmIzM5OyBp
bnRvIGRldmVsLWNhdGNodXAtMjAyMDA2MjQyMzM0PGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdMKg
IGJhZCA3NzYxZjgyNWZlZjUzNWUyZjc3NWMzZDk4YmI2NTU4NjM5MTE2ZDI3wqAgIyAwMzo1MsKg
IELCoCDCoCDCoCAwwqAgwqAgwqAxwqAgwqAxN8KgIMKgMMKgIE1lcmdlICYjMzk7amZlcm4vcmN1
LXNlZ2NiJiMzOTsgaW50byBkZXZlbC1jYXRjaHVwLTIwMjAwNjI0MjMzNDxicj4KJmd0OyAmZ3Q7
IGdpdCBiaXNlY3QgZ29vZCBlM2JlOGM2NzE5MTNhZjU1MTY2OWYyNDRmNTk3N2ZiOTNlZWEyN2Uy
wqAgIyAwNDoyMsKgIEfCoCDCoCDCoDEwwqAgwqAgwqAwwqAgwqAgMMKgIMKgMMKgIE1lcmdlIGJy
YW5jaGVzICYjMzk7ZG9jLjIwMjAuMDYuMTdhJiMzOTssICYjMzk7Zml4ZXMuMjAyMC4wNi4xN2Em
IzM5OywgJiMzOTtyY3UtdGFza3MuMjAyMC4wNi4xN2EmIzM5OywgJiMzOTtzY2FsZS4yMDIwLjA2
LjE3YSYjMzk7LCAmIzM5O3NyY3UuMjAyMC4wNi4xN2EmIzM5OyBhbmQgJiMzOTt0b3J0dXJlLjIw
MjAuMDYuMTdhJiMzOTsgaW50byBIRUFEPGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdCBnb29kIGE2
MGE2MDRkNzY4ODVkMjRmY2FhNjVkZDE4MzkwNDY1ODlmNjA3NjbCoCAjIDA0OjQ0wqAgR8KgIMKg
IMKgMTDCoCDCoCDCoDDCoCDCoCAxwqAgwqAxwqAgdG9vbHMvbWVtb3J5LW1vZGVsOiBNYWtlIGp1
ZGdlbGl0bXVzLnNoIGhhbmRsZSBzY3JpcHRlZCBSZXN1bHQ6IHRhZzxicj4KJmd0OyAmZ3Q7IGdp
dCBiaXNlY3QgZ29vZCAwNGU1MTExYTAxOTJkY2U3M2I3ZWY1OGI4Mjg4ZTE2YjI4NTViMzc4wqAg
IyAwNTowN8KgIEfCoCDCoCDCoDEwwqAgwqAgwqAwwqAgwqAgMcKgIMKgMcKgIHJjdS90cmVlOiBV
c2Ugc3RhdGljIGluaXRpYWxpemVyIGZvciBrcmMubG9jazxicj4KJmd0OyAmZ3Q7IGdpdCBiaXNl
Y3QgZ29vZCA2ZjkyYWQ4NGRhOGJhOTA1ODY0ZDVmZTBlNjE2NDk0ZmI3MThhODRlwqAgIyAwNToz
MsKgIEfCoCDCoCDCoDEwwqAgwqAgwqAwwqAgwqAgMsKgIMKgMsKgIHJjdTogSW5pdGlhbGl6ZSBh
dCBkZWNsYXJhdGlvbiB0aW1lIGluIHJjdV9leHBfaGFuZGxlcigpPGJyPgomZ3Q7ICZndDsgZ2l0
IGJpc2VjdCBnb29kIDFmY2U5MDIyNmQ2MTM4YzBjOGZlNmY0YTkxMzExOWQ0ZjBjMTUyNjPCoCAj
IDA1OjQ4wqAgR8KgIMKgIMKgMTDCoCDCoCDCoDDCoCDCoCAxwqAgwqAxwqAgcmN1L3RyYWNlOiBV
c2UgcnNwJiMzOTtzIGdwX3NlcSBpbiBhY2NlbGVyYXRpb24mIzM5O3MgcmN1X2dyYWNlX3Blcmlv
ZCB0cmFjZXBvaW50PGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdCBnb29kIGI0ZWY3Yzc1MmYyMmFm
Y2Q4ZmE2NTgwOWM4ZTZmOTc0ZGMyNzcxNGHCoCAjIDA2OjI1wqAgR8KgIMKgIMKgMTDCoCDCoCDC
oDDCoCDCoCAywqAgwqAywqAgcmN1dHJlZTogTWFrZSByY3VfYWR2YW5jZSBhbHNvIHByaW50IFNl
Z2NiIGFmdGVyIFdBSVQtJmd0O0RPTkUgaGFwcGVuczxicj4KJmd0OyAmZ3Q7IGdpdCBiaXNlY3TC
oCBiYWQgMDM5ZjU2YjM5OTY2NTZjZjNhMGJkYzMwNmZjZDA5ZmMwMmZlM2ZiYsKgICMgMDY6MzfC
oCBCwqAgwqAgwqAgMMKgIMKgIMKgM8KgIMKgMjLCoCDCoDPCoCBtYWtlIHJjdXRvcnR1cmUgYWx3
YXlzIGR1bXAgZnRyYWNlPGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdCBnb29kIGM0YjRmYTViODZm
N2FjYTI5MGY2MjE4NTcwOTgwYjQ1MWQxNzAxMGHCoCAjIDA3OjAwwqAgR8KgIMKgIMKgMTDCoCDC
oCDCoDDCoCDCoCAwwqAgwqAwwqAgQWRkIHRyYWNpbmcgZm9yIHJjdV9wZW5kaW5nPGJyPgomZ3Q7
ICZndDsgIyBmaXJzdCBiYWQgY29tbWl0OiBbMDM5ZjU2YjM5OTY2NTZjZjNhMGJkYzMwNmZjZDA5
ZmMwMmZlM2ZiYl0gbWFrZSByY3V0b3J0dXJlIGFsd2F5cyBkdW1wIGZ0cmFjZTxicj4KJmd0OyAm
Z3Q7IGdpdCBiaXNlY3QgZ29vZCBjNGI0ZmE1Yjg2ZjdhY2EyOTBmNjIxODU3MDk4MGI0NTFkMTcw
MTBhwqAgIyAwNzowNsKgIEfCoCDCoCDCoDMywqAgwqAgwqAwwqAgwqAgMcKgIMKgMsKgIEFkZCB0
cmFjaW5nIGZvciByY3VfcGVuZGluZzxicj4KJmd0OyAmZ3Q7ICMgZXh0cmEgdGVzdHMgd2l0aCBk
ZWJ1ZyBvcHRpb25zPGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdMKgIGJhZCAwMzlmNTZiMzk5NjY1
NmNmM2EwYmRjMzA2ZmNkMDlmYzAyZmUzZmJiwqAgIyAwNzoxN8KgIELCoCDCoCDCoCAwwqAgwqAg
wqAywqAgwqAxOcKgIMKgMcKgIG1ha2UgcmN1dG9ydHVyZSBhbHdheXMgZHVtcCBmdHJhY2U8YnI+
CiZndDsgJmd0OyAjIGV4dHJhIHRlc3RzIG9uIGhlYWQgY29tbWl0IG9mIGpmZXJuL3JjdS1zZWdj
Yjxicj4KJmd0OyAmZ3Q7IGdpdCBiaXNlY3TCoCBiYWQgMDM5ZjU2YjM5OTY2NTZjZjNhMGJkYzMw
NmZjZDA5ZmMwMmZlM2ZiYsKgICMgMDc6MzPCoCBCwqAgwqAgwqAgMMKgIMKgIDE3wqAgwqAzM8Kg
IMKgMMKgIG1ha2UgcmN1dG9ydHVyZSBhbHdheXMgZHVtcCBmdHJhY2U8YnI+CiZndDsgJmd0OyAj
IGJhZDogWzAzOWY1NmIzOTk2NjU2Y2YzYTBiZGMzMDZmY2QwOWZjMDJmZTNmYmJdIG1ha2UgcmN1
dG9ydHVyZSBhbHdheXMgZHVtcCBmdHJhY2U8YnI+CiZndDsgJmd0OyAjIGV4dHJhIHRlc3RzIG9u
IHJldmVydCBmaXJzdCBiYWQgY29tbWl0PGJyPgomZ3Q7ICZndDsgZ2l0IGJpc2VjdCBnb29kIGE1
ODAwZmJmOTEwMjQ1NjY3M2Y0ZmQ5ZjJjOTY5MmRmYTcxMzkyZDjCoCAjIDA3OjU1wqAgR8KgIMKg
IMKgMTDCoCDCoCDCoDDCoCDCoCAwwqAgwqAwwqAgUmV2ZXJ0ICZxdW90O21ha2UgcmN1dG9ydHVy
ZSBhbHdheXMgZHVtcCBmdHJhY2UmcXVvdDs8YnI+CiZndDsgJmd0OyAjIGdvb2Q6IFthNTgwMGZi
ZjkxMDI0NTY2NzNmNGZkOWYyYzk2OTJkZmE3MTM5MmQ4XSBSZXZlcnQgJnF1b3Q7bWFrZSByY3V0
b3J0dXJlIGFsd2F5cyBkdW1wIGZ0cmFjZSZxdW90Ozxicj4KJmd0OyAmZ3Q7PGJyPgomZ3Q7ICZn
dDsgLS0tPGJyPgomZ3Q7ICZndDsgMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZSwgSW50ZWwg
Q29ycG9yYXRpb248YnI+CiZndDsgJmd0OyA8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9o
eXBlcmtpdHR5L2xpc3QvbGtwQGxpc3RzLjAxLm9yZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L2xrcEBsaXN0cy4w
MS5vcmc8L2E+PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============3583509659832551783==--

