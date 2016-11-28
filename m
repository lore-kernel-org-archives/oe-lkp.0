Content-Type: multipart/mixed; boundary="===============7736903946513022679=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] a7410f28ce: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0-... } 25089 jiffies s: 9 root: 0x1/.
Date: Tue, 29 Nov 2016 01:34:57 +0800
Message-ID: <20161128173457.GJ2501@yexl-desktop>
In-Reply-To: <20161128205352.gozyck5ehal6nnoc@linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7736903946513022679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/28, Sebastian Andrzej Siewior wrote:
>On 2016-11-09 14:25:39 [+0800], kernel test robot wrote:
>> =

>> FYI, we noticed the following commit:
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit a7410f28ceb566bda840b4afc278747c63383fb6 ("rcu: update: Make RCU_=
EXPEDITE_BOOT be the default")
>> =

>> in testcase: boot
>> =

>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
>> =

>> caused below changes:
>> =

>> =

>> +-----------------------------------------------------------------------=
------------+------------+------------+
>> |                                                                       =
            | 9aa96e24ec | a7410f28ce |
>> +-----------------------------------------------------------------------=
------------+------------+------------+
>> | boot_successes                                                        =
            | 3          | 7          |
>> | boot_failures                                                         =
            | 17         | 17         |
>> | INFO:rcu_sched_self-detected_stall_on_CPU                             =
            | 17         | 14         |
>> | calltrace:mark_rodata_ro                                              =
            | 17         | 14         |
>> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks                          =
            | 15         | 14         |
>> | INFO:rcu_sched_detected_expedited_stalls_on_CPUs/tasks:{#-...}#jiffies=
_s:#root:#/ | 0          | 15         |
>> +-----------------------------------------------------------------------=
------------+------------+------------+
>
>Is it correct to assume that there are RCU stalls with and without my
>patch but with my patch there are also "expedited" stalls?
>
>> [   38.504100] Write protecting the kernel read-only data: 47104k
>> [   38.511102] Freeing unused kernel memory: 720K (ffff88000314c000 - ff=
ff880003200000)
>> [   38.547480] Freeing unused kernel memory: 1032K (ffff880003cfe000 - f=
fff880003e00000)
>> [  149.710631] INFO: rcu_sched detected expedited stalls on CPUs/tasks: =
{ 0-... } 25089 jiffies s: 9 root: 0x1/.
>> [  149.720353] blocking rcu_node structures:
>
>The other testing robot reported something similar against rcu/next.
>With my patch I get:
>
>[   14.260226] Freeing unused kernel memory: 536K (ffff88000277a000 - ffff=
880002800000)
>[   14.263114] Freeing unused kernel memory: 252K (ffff8800031c1000 - ffff=
880003200000)
>[   35.256735] INFO: rcu_sched self-detected stall on CPU
>[   35.257565]  1-...: (6299 ticks this GP) idle=3D0e2/140000000000001/0 s=
oftirq=3D90/90 fqs=3D2100 last_accelerate: 0000/c973, nonlazy_posted: 0, .D
>[   35.259410]   (t=3D6300 jiffies g=3D-252 c=3D-253 q=3D0)
>[   35.260106] Task dump for CPU 1:
>[   35.260608] swapper/0       R  running task        0     1      0 0x000=
00008
>[   35.261698]  ffff880036107cc0 ffffffff81181de2 0000000000021780 ffff880=
036121780
>[   35.262835]  0000000000000001 ffffffff832d7fc0 ffff880036107ce0 fffffff=
f8118616d
>[   35.263995]  ffffffff832d7fc0 0000000000000001 ffff880036107d30 fffffff=
f8128b3b8
>[   35.265131] Call Trace:
>[   35.265512]  <IRQ> [   35.265826]  [<ffffffff81181de2>] sched_show_task=
+0x102/0x180
>[   35.266701]  [<ffffffff8118616d>] dump_cpu_task+0x4d/0x60 =

>[   35.267526]  [<ffffffff8128b3b8>] rcu_dump_cpu_stacks+0xee/0x11b
>=E2=80=A6
>[   35.289870] INFO: rcu_sched detected stalls on CPUs/tasks:
>[   35.290500]  1-...: (6301 ticks this GP) idle=3D0e2/140000000000000/0 s=
oftirq=3D90/90 fqs=3D2100 last_accelerate: 0000/c97d, nonlazy_posted: 0, .D
>[   35.291834]  (detected by 0, t=3D6310 jiffies, g=3D-252, c=3D-253, q=3D=
0)
>[   35.292505] Task dump for CPU 1:
>=E2=80=A6
>[   44.260103] INFO: rcu_sched detected expedited stalls on CPUs/tasks: { =
1-... } 6784 jiffies s: 299 root: 0x2/.
>[   44.261911] blocking rcu_node structures:
>[   44.262627] Task dump for CPU 1:
>[   44.263177] swapper/0       R  running task        0     1      0 0x000=
00008
>[   44.264379]  0000000041b58ab3 ffffffff81249eab ffffffff81b6f150 fffffff=
f819468d7
>[   44.265640]  0000000041b58ab3 ffffffff830f76b0 0000000000000297 fffffff=
f83d87aa0
>[   44.266915]  000000000000c6e0 0000000000000058 0000000000000000 ffff880=
035547be8
>[   44.268153] Call Trace:
>[   44.268603]  [<ffffffff81249eab>] ? trace_hardirqs_on_caller+0xdb/0x1e0
>[   44.269708]  [<ffffffff81b6f150>] ? serial8250_set_defaults+0x1a0/0x1a0
>
>and without it:
>[   15.837956] Freeing unused kernel memory: 536K (ffff88000277a000 - ffff=
880002800000)
>[   15.841396] Freeing unused kernel memory: 252K (ffff8800031c1000 - ffff=
880003200000)
>[   43.070453] INFO: rcu_sched self-detected stall on CPU
>[   43.071215]  1-...: (6299 ticks this GP) idle=3Ddaa/140000000000001/0 s=
oftirq=3D211/211 fqs=3D2100 last_accelerate: 0000/d29c, nonlazy_posted: 0, =
.D
>[   43.072807]   (t=3D6300 jiffies g=3D-91 c=3D-92 q=3D0)
>[   43.073385] Task dump for CPU 1:
>[   43.073800] swapper/0       R  running task        0     1      0 0x000=
00008
>[   43.074734]  ffff880036107cc0 ffffffff81181de2 0000000000021780 ffff880=
036121780
>[   43.075715]  0000000000000001 ffffffff832d7f80 ffff880036107ce0 fffffff=
f8118616d
>[   43.076691]  ffffffff832d7f80 0000000000000001 ffff880036107d30 fffffff=
f8128b3b8
>[   43.077668] Call Trace:
>[   43.077983]  <IRQ> [   43.078265]  [<ffffffff81181de2>] sched_show_task=
+0x102/0x180
>[   43.079006]  [<ffffffff8118616d>] dump_cpu_task+0x4d/0x60
>=E2=80=A6
>[   43.097862] INFO: rcu_sched detected stalls on CPUs/tasks:
>[   43.098442]  1-...: (6300 ticks this GP) idle=3Ddaa/140000000000000/0 s=
oftirq=3D211/211 fqs=3D2100 last_accelerate: 0000/d2a4, nonlazy_posted: 0, =
.D
>[   43.099613]  (detected by 0, t=3D6308 jiffies, g=3D-91, c=3D-92, q=3D0)
>[   43.100180] Task dump for CPU 1:
>[   43.100487] swapper/0       R  running task        0     1      0 0x000=
00008
>[   43.101171]  ffffffff83d86c40 1ffff10006aa8f67 0000000500000058 0000000=
041b58ab3
>[   43.101912]  ffffffff8316ae78 ffffffff81b6f150 ffffffff819468d7 0000000=
041b58ab3
>[   43.102657]  ffffffff830f76b0 ffffffff81946830 ffff103000000020 ffff880=
000000020
>[   43.103395] Call Trace:
>[   43.103647]  [<ffffffff81b6f150>] ? serial8250_set_defaults+0x1a0/0x1a0
>[   43.104272]  [<ffffffff819468d7>] ? sprintf+0xa7/0xd0
>
>So it looks to me that the problem has been always there but the
>additional "expedited" part in the INFO message was the reason to create
>the report.

Thanks for the explanation, we'll ignore this kind of reports. And sorry for
the noise.

Thanks,
Xiaolong
>
>Sebastian

--===============7736903946513022679==--

