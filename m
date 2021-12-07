Content-Type: multipart/mixed; boundary="===============1352435747337690155=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: ww_mutex.sh hangs since v5.16-rc1
Date: Tue, 07 Dec 2021 12:27:08 +0800
Message-ID: <5249edf6-5b28-a8da-ca68-f1ea68c3637e@intel.com>
In-Reply-To: <20211202225712.GG16608@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1352435747337690155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 03/12/2021 06:57, Peter Zijlstra wrote:
> On Wed, Dec 01, 2021 at 09:26:18AM +0800, Li Zhijian wrote:
>> Hi Folks
>>
>>
>> LKP/0Day found that ww_mutex.sh cannot complete since v5.16-rc1, but
>> I'm pretty sorry that we failed to bisect the FBC, instead, the bisectio=
n pointed
>> to a/below merge commit(91e1c99e17) finally.
>>
>> Due to this hang, other tests in the same group are also blocked in 0Day=
, we
>> hope we can fix this hang ASAP.
>>
>> So if you have any idea about this, or need more debug information, feel=
 free to let me know :)
>>
>> BTW, ww_mutex.sh was failed in v5.15 without hang, and looks it cannot r=
eproduce on a vm.
> On real hardware:
>
> root(a)ivb-ep:/usr/src/linux-2.6/tools/testing/selftests/locking# uname -a
> Linux ivb-ep 5.16.0-rc3-00284-g68601c558556 #1 SMP PREEMPT Thu Dec 2 23:0=
3:29 CET 2021 x86_64 GNU/Linux
> root(a)ivb-ep:/usr/src/linux-2.6/tools/testing/selftests/locking# ./ww_mu=
tex.sh
> locking/ww_mutex: ok
>
> [ 1907.907801] Beginning ww mutex selftests
> [ 1915.700077] All ww mutex selftests passed
>
>
> What else do I try?
I have no idea that, not sure below message is helpful

root(a)lkp-knm01 /opt/rootfs# pgrep test-ww_mutex | wc -l
256
root(a)lkp-knm01 /opt/rootfs# pgrep test-ww_mutex -l | head -n 3
1492 kworker/u576:38+test-ww_mutex
1497 kworker/u576:43+test-ww_mutex
1513 kworker/u576:59+test-ww_mutex

root(a)lkp-knm01 /opt/rootfs# lscpu
Architecture:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_64
CPU op-mode(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32-bit, 64-bit
Byte Order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Little En=
dian
Address sizes:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46 bits physical, 48 bit=
s virtual
CPU(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 288
On-line CPU(s) list: 0-287
Thread(s) per core:=C2=A0 4
Core(s) per socket:=C2=A0 72
Socket(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
NUMA node(s):=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
Vendor ID:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Genu=
ineIntel
CPU family:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6
Model:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 133
Model name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Intel(R) =
Xeon Phi(TM) CPU 7295 @ 1.50GHz
Stepping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0
CPU MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1600.000
CPU max MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1600.0000
CPU min MHz:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1000.0000
BogoMIPS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 2992.92
Virtualization:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VT-x
L1d cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32K
L1i cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32K
L2 cache:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1024K
NUMA node0 CPU(s):=C2=A0=C2=A0 0-287
NUMA node1 CPU(s):
Flags:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cm=
ov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdp=
e1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology n=
onstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2=
 ssse3 fma cx16 xtpr pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_ti=
mer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch ring3mwait cpuid_fa=
ult epb pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 =
avx2 smep bmi2 erms avx512f rdseed adx avx512pf avx512er avx512cd xsaveopt =
dtherm ida arat pln pts avx512_vpopcntdq avx512_4vnniw avx512_4fmaps
root(a)lkp-knm01 /opt/rootfs#


[ 1500.848024] INFO: task kworker/u576:5:12395 blocked for more than 496 se=
conds.
[ 1500.866920]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 5.16.0-rc4 #1
[ 1500.882898] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[ 1500.903997] task:kworker/u576:5=C2=A0 state:D stack:=C2=A0=C2=A0=C2=A0 0=
 pid:12395 ppid:=C2=A0=C2=A0=C2=A0=C2=A0 2 flags:0x00004000
[ 1500.926047] Workqueue: test-ww_mutex test_cycle_work [test_ww_mutex]
[ 1500.945916] Call Trace:
[ 1500.959042] <TASK>
[ 1500.972977] __schedule+0xdb0/0x25c0
[ 1500.987868]=C2=A0 ? io_schedule_timeout+0x180/0x180
[ 1501.004971]=C2=A0 ? lock_downgrade+0x680/0x680
[ 1501.021975] schedule+0xe4/0x280
[ 1501.036896] schedule_preempt_disabled+0x18/0x40
[ 1501.053967] __ww_mutex_lock.constprop.0+0x1248/0x34c0
[ 1501.072020]=C2=A0 ? test_cycle_work+0x1bb/0x500 [test_ww_mutex]
[ 1501.088903]=C2=A0 ? mutex_lock_interruptible_nested+0x40/0x40
[ 1501.106256]=C2=A0 ? lock_is_held_type+0xd7/0x140
[ 1501.123083]=C2=A0 ? ww_mutex_lock+0x3e/0x380
[ 1501.138803] ww_mutex_lock+0x3e/0x380
[ 1501.154637]=C2=A0 test_cycle_work+0x1bb/0x500 [test_ww_mutex]
[ 1501.172498]=C2=A0 ? stress_reorder_work+0xa00/0xa00 [test_ww_mutex]
[ 1501.189955]=C2=A0 ? rcu_read_lock_sched_held+0xa1/0x100
[ 1501.205827]=C2=A0 ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1501.221996] process_one_work+0x817/0x13c0
[ 1501.236500]=C2=A0 ? rcu_read_unlock+0x40/0x40
[ 1501.252896]=C2=A0 ? pwq_dec_nr_in_flight+0x280/0x280
[ 1501.269914]=C2=A0 ? rwlock_bug.part.0+0xc0/0xc0
[ 1501.285008] worker_thread+0x8b/0xd80
[ 1501.301083]=C2=A0 ? process_one_work+0x13c0/0x13c0
[ 1501.318071] kthread+0x3b9/0x4c0
[ 1501.331953]=C2=A0 ? set_kthread_struct+0x100/0x100
[ 1501.348374] ret_from_fork+0x22/0x30
[ 1501.363834] </TASK>
[ 1501.377565]
[ 1501.377565]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Showing all locks held in the system:
[ 1501.407817] 4 locks held by kworker/u576:38/1492:
[ 1501.424053]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1501.447970]=C2=A0 #1: ffffc9000db6fdd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1501.472031]=C2=A0 #2: ffffc9000db6fc98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1501.495016]=C2=A0 #3: ffff8882688935c0 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1501.519059] 4 locks held by kworker/u576:43/1497:
[ 1501.535821]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1501.558931]=C2=A0 #1: ffffc9000dbbfdd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1501.582978]=C2=A0 #2: ffffc9000dbbfc98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1501.604950]=C2=A0 #3: ffff88826888e520 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1501.628905] 4 locks held by kworker/u576:59/1513:
[ 1501.646947]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1501.672947]=C2=A0 #1: ffffc9000dcbfdd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1501.698754]=C2=A0 #2: ffffc9000dcbfc98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1501.723030]=C2=A0 #3: ffff888268880208 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1501.748891] 1 lock held by khungtaskd/1650:
[ 1501.767506]=C2=A0 #0: ffffffff855d5060 (rcu_read_lock){....}-{1:2}, at: =
rcu_lock_acquire.constprop.0+0x0/0x40
[ 1501.794899] 4 locks held by kworker/192:2/2053:
[ 1501.814535] 1 lock held by in:imklog/3102:
[ 1501.831982]=C2=A0 #0: ffff88828ca12170 (&f->f_pos_lock){+.+.}-{3:3}, at:=
 __fdget_pos+0xa1/0xc0
[ 1501.855919] 1 lock held by dmesg/3826:
[ 1501.873472]=C2=A0 #0: ffff88821e5c80d0 (&user->lock){+.+.}-{3:3}, at: ne=
w_sync_write+0x4cc/0x640
[ 1501.897875] 4 locks held by kworker/u576:0/7921:
[ 1501.918442]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1501.946235]=C2=A0 #1: ffffc9000abcfdd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1501.972770]=C2=A0 #2: ffffc9000abcfc98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1501.998071]=C2=A0 #3: ffff888268884130 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1502.025008] 4 locks held by kworker/u576:1/12391:
[ 1502.045611]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1502.072864]=C2=A0 #1: ffffc900078dfdd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1502.100181]=C2=A0 #2: ffffc900078dfc98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1502.126541]=C2=A0 #3: ffff888268888460 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1502.154874] 4 locks held by kworker/u576:2/12392:
[ 1502.175873]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1502.203986]=C2=A0 #1: ffffc90007937dd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1502.232522]=C2=A0 #2: ffffc90007937c98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1502.260005]=C2=A0 #3: ffff88826888b4c0 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1502.289015] 4 locks held by kworker/u576:3/12393:
[ 1502.311079]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1502.340862]=C2=A0 #1: ffffc9000798fdd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1502.369950]=C2=A0 #2: ffffc9000798fc98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1502.398992]=C2=A0 #3: ffff8882688931b8 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1502.429018] 4 locks held by kworker/u576:4/12394:
[ 1502.452516]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1502.482907]=C2=A0 #1: ffffc900079e7dd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1502.513932]=C2=A0 #2: ffffc900079e7c98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1502.544097]=C2=A0 #3: ffff88826888a1f0 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1502.575802] 4 locks held by kworker/u576:5/12395:
[ 1502.600046]=C2=A0 #0: ffff888262e50138 ((wq_completion)test-ww_mutex){+.=
+.}-{0:0}, at: process_one_work+0x740/0x13c0
[ 1502.630939]=C2=A0 #1: ffffc90007a3fdd0 ((work_completion)(&cycle->work))=
{+.+.}-{0:0}, at: process_one_work+0x76d/0x13c0
[ 1502.662034]=C2=A0 #2: ffffc90007a3fc98 (ww_class_acquire){+.+.}-{0:0}, a=
t: process_one_work+0x817/0x13c0
[ 1502.691957]=C2=A0 #3: ffff88826888d908 (ww_class_mutex){+.+.}-{3:3}, at:=
 test_cycle_work+0x14c/0x500 [test_ww_mutex]
[ 1502.723051] 4 locks held by kworker/u576:6/12396:


--===============1352435747337690155==--

