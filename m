Content-Type: multipart/mixed; boundary="===============4445453797999219755=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [squash! clocksource] 0a526bb47c: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Mon, 08 Nov 2021 20:34:10 -0800
Message-ID: <20211109043410.GU641268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211109024143.GA2871@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4445453797999219755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 10:41:43AM +0800, Oliver Sang wrote:
> hi Paul,
> =

> On Mon, Nov 08, 2021 at 08:20:26AM -0800, Paul E. McKenney wrote:
> > On Mon, Nov 08, 2021 at 03:17:12PM +0800, Oliver Sang wrote:
> > > Hi Paul,
> > > =

> > > On Sun, Oct 31, 2021 at 08:13:20AM -0700, Paul E. McKenney wrote:
> > > > On Sun, Oct 31, 2021 at 08:35:40AM +0800, kernel test robot wrote:
> > > > > =

> > > > > =

> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed the following commit (built with gcc-9):
> > > > > =

> > > > > commit: 0a526bb47c44195b902ae91ff8c9dff7322324fb ("squash! clocks=
ource: Forgive repeated long-latency watchdog clocksource reads")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.gi=
t dev.2021.10.13a
> > > > > =

> > > > > in testcase: stress-ng
> > > > > version: stress-ng-x86_64-0.11-06_20211029
> > > > > with following parameters:
> > > > > =

> > > > > 	nr_threads: 100%
> > > > > 	testtime: 60s
> > > > > 	class: cpu
> > > > > 	test: ioport
> > > > > 	cpufreq_governor: performance
> > > > > 	ucode: 0x5003006
> > > > > =

> > > > > =

> > > > > =

> > > > > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 =
CPU @ 2.10GHz with 512G memory
> > > > > =

> > > > > caused below changes (please refer to attached dmesg/kmsg for ent=
ire log/backtrace):
> > > > > =

> > > > > =

> > > > > =

> > > > > If you fix the issue, kindly add following tag
> > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > =

> > > > > =

> > > > > [ 51.311345][ C93] WARNING: CPU: 93 PID: 5763 at kernel/time/cloc=
ksource.c:235 clocksource_watchdog (kernel/time/clocksource.c:235 kernel/ti=
me/clocksource.c:389) =

> > > > =

> > > > OK, this splat is expected behavior when your workload is stressing=
 the
> > > > hardware to such a degree that it cannot complete a clocksource rea=
d in
> > > > a reasonable timeframe, even after 100 tries.
> > > > =

> > > > Could you please increase the value of clocksource.max_cswd_coarse_=
reads
> > > > (which defaults to 100) to see if there is a reasonable default that
> > > > avoids this splat?  I set the default based on earlier 0day testing.
> > > =

> > > thanks for guidance. we tested by increasing max_cswd_coarse_reads 10=
0 each
> > > time. and confirmed, in this test case, issue still reproduced 10 tim=
es out
> > > of 10 runs when setting clocksource.max_cswd_coarse_reads=3D400
> > > =

> > > but when increasing to 500, the issue gone.
> > =

> > OK, I will bump the default up to 1000 (with attribution).  At four rea=
ds
> > per attempt and two attempts per second, that will flag the warning
> > in a few minutes in the case where the delay is due to a bug in the
> > clock read, and will hopefully result in very few complaints due to
> > cache-buster workloads.
> =

> Thanks for information!
> we actually started the test by bumping up to 1000 then found the 500
> in kind of a bisection way :)

Very good!  But I am happy to add another factor of two to the mix.

Just in case someone finds an even more challenging cachebuster workload
out there somewhere.  ;-)

							Thanx, Paul

> > Again, thank you for testing this!
> > =

> > 							Thanx, Paul
> > =

> > > (cs_mccr below is just a short of clocksource.max_cswd_coarse_reads)
> > > =

> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > class/commit/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox=
_group/test/testcase/testtime/ucode:
> > >   cpu/0a526bb47c44195b902ae91ff8c9dff7322324fb/gcc-9/performance/x86_=
64-rhel-8.3/100%/debian-10.4-x86_64-20200603.cgz/lkp-csl-2sp7/ioport/stress=
-ng/60s/0x5003006
> > > =

> > > debug-setup:
> > >   cs_mccr_400
> > >   cs_mccr_500
> > > =

> > >      cs_mccr_400                 cs_mccr_500
> > > ---------------- ---------------------------
> > >        fail:runs  %reproduction    fail:runs
> > >            |             |             |
> > >          10:10        -100%            :10    dmesg.RIP:clocksource_w=
atchdog
> > >          10:10        -100%            :10    dmesg.WARNING:at_kernel=
/time/clocksource.c:#clocksource_watchdog
> > > ...
> > >          10:10           0%          10:10    stress-ng.ioport.pass
> > > =

> > > =

> > > the dmesg from clocksource.max_cswd_coarse_reads=3D400 is:
> > > [   88.238322][   C71] ------------[ cut here ]------------
> > > [   88.242710][ T1308] perf version 5.15.gcc0356d6a02e
> > > [   88.263453][   C71] timekeeping watchdog on CPU71: hpet 400 consec=
utive coarse-grained reads
> > > [   88.263459][   C71] WARNING: CPU: 71 PID: 5742 at kernel/time/cloc=
ksource.c:235 clocksource_watchdog+0x397/0x3c0
> > > [   88.263469][   C71] Modules linked in: binfmt_misc btrfs blake2b_g=
eneric xor zstd_compress raid6_pq libcrc32c sd_mod t10_pi sg intel_rapl_msr=
 intel_rapl
> > > _common skx_edac nfit libnvdimm x86_pkg_temp_thermal intel_powerclamp=
 coretemp kvm_intel kvm ast drm_vram_helper irqbypass drm_ttm_helper crct10=
dif_pclmul
> > > crc32_pclmul ttm crc32c_intel ipmi_ssif ghash_clmulni_intel drm_kms_h=
elper rapl syscopyarea intel_cstate sysfillrect sysimgblt fb_sys_fops ahci =
acpi_ipmi m
> > > ei_me libahci drm intel_uncore ipmi_si libata ioatdma mei joydev ipmi=
_devintf intel_pch_thermal dca wmi ipmi_msghandler acpi_pad acpi_power_mete=
r ip_tables
> > > [   88.263505][   C71] CPU: 71 PID: 5742 Comm: stress-ng Not tainted =
5.15.0-rc1-00122-g0a526bb47c44 #1
> > > [   88.263508][   C71] Hardware name: Intel Corporation S2600WFT/S260=
0WFT, BIOS SE5C620.86B.02.01.0008.031920191559 03/19/2019
> > > [   88.263509][   C71] RIP: 0010:clocksource_watchdog+0x397/0x3c0
> > > [   88.263513][   C71] Code: 75 fe ff ff 48 8b 56 30 48 c7 c7 d0 93 5=
5 82 4c 89 0c 24 65 44 8b 05 a0 43 e8 7e 44 89 c6 c6 05 e6 de c0 01 01 e8 8=
7 b0 ad 00
> > > <0f> 0b 4c 8b 0c 24 e9 fd fe ff ff e8 59 ec 00 00 e9 b4 fc ff ff 66
> > > [   88.263515][   C71] RSP: 0000:ffffc90026237dd0 EFLAGS: 00010286
> > > [   88.263518][   C71] RAX: 0000000000000000 RBX: ffffffff828232c0 RC=
X: 0000000000000027
> > > [   88.263519][   C71] RDX: 0000000000000027 RSI: 0000000000000002 RD=
I: ffff88bf801d7b58
> > > [   88.263520][   C71] RBP: 0000000000000000 R08: ffff88bf801d7b50 R0=
9: 0000000000000002
> > > [   88.263522][   C71] R10: ffffffff835b18da R11: ffffffff835b18b7 R1=
2: 000000007e656842
> > > [   88.263523][   C71] R13: 000245aea394157e R14: 0000000000000003 R1=
5: 0000000000000003
> > > [   88.263525][   C71] FS:  00007f24603f3740(0000) GS:ffff88bf801c000=
0(0000) knlGS:0000000000000000
> > > [   88.263526][   C71] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > > [   88.263528][   C71] CR2: 0000000000451c00 CR3: 000000073b9aa004 CR=
4: 00000000007706e0
> > > [   88.263529][   C71] DR0: 0000000000000000 DR1: 0000000000000000 DR=
2: 0000000000000000
> > > [   88.263530][   C71] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR=
7: 0000000000000400
> > > [   88.263531][   C71] PKRU: 55555554
> > > [   88.263532][   C71] Call Trace:
> > > [   88.263536][   C71]  ? trigger_load_balance+0x60/0x340
> > > [   88.263541][   C71]  ? __clocksource_register_scale+0x140/0x140
> > > [   88.263544][   C71]  call_timer_fn+0x27/0x140
> > > [   88.263547][   C71]  run_timer_softirq+0x3c3/0x480
> > > [   88.263549][   C71]  ? enqueue_hrtimer+0x2f/0x80
> > > [   88.263552][   C71]  ? ktime_get+0x35/0xc0
> > > [   88.263554][   C71]  __do_softirq+0xd8/0x2a6
> > > [   88.263560][   C71]  irq_exit_rcu+0xa6/0xc0
> > > [   88.263564][   C71]  sysvec_apic_timer_interrupt+0x3c/0xc0
> > > [   88.263569][   C71]  ? asm_sysvec_apic_timer_interrupt+0xa/0x20
> > > [   88.263575][   C71]  asm_sysvec_apic_timer_interrupt+0x12/0x20
> > > [   88.263578][   C71] RIP: 0033:0x55d49ae0e924
> > > [   88.263580][   C71] Code: e4 80 e4 80 e4 80 e4 80 e4 80 e4 80 83 e=
2 02 74 4f 8d 43 0f e6 80 8d 43 0e e6 80 8d 43 0d e6 80 8d 43 0c e6 80 8d 4=
3 0b e6 80
> > > <8d> 43 0a e6 80 8d 43 09 e6 80 8d 43 08 e6 80 8d 43 07 e6 80 8d 43
> > > [   88.263582][   C71] RSP: 002b:00007ffe961e18a0 EFLAGS: 00000202
> > > [   88.263583][   C71] RAX: 000000000000010a RBX: 00000000000000ff RC=
X: 00007f24605123d7
> > > [   88.263585][   C71] RDX: 0000000000000002 RSI: 00007ffe961e1978 RD=
I: 00007ffe961e1960
> > > [   88.263586][   C71] RBP: 00007ffe961e1960 R08: 00007ffe961e38cf R0=
9: 00007f2460593e80
> > > [   88.263586][   C71] R10: fffffffffffffcd6 R11: 0000000000000217 R1=
2: 0000000000000005
> > > [   88.263587][   C71] R13: 00007ffe961e1978 R14: 00007ffe961e18a3 R1=
5: 00007f24603b4500
> > > [   88.263589][   C71] ---[ end trace 1f3edff80798e33c ]---
> > > =

> > > =

> > > =

> > > =

> > > > =

> > > > The other situation that this needs to handle is where there is bad
> > > > hardware, clock drivers, firmware, or whatever that is causing the
> > > > slow reads even at idle, in which case we really do need to splat.
> > > > I am still hoping to handle both situations without explicit tuning=
.  ;-)
> > > > =

> > > > 							Thanx, Paul
> > > > =

> > > > > [   51.326950][   C93] Modules linked in: binfmt_misc btrfs blake=
2b_generic xor zstd_compress raid6_pq libcrc32c sd_mod t10_pi sg intel_rapl=
_msr intel_rapl_common skx_edac nfit libnvdimm x86_pkg_temp_thermal intel_p=
owerclamp coretemp kvm_intel ast drm_vram_helper kvm drm_ttm_helper ipmi_ss=
if ttm irqbypass crct10dif_pclmul drm_kms_helper crc32_pclmul crc32c_intel =
ghash_clmulni_intel rapl syscopyarea sysfillrect sysimgblt acpi_ipmi intel_=
cstate fb_sys_fops ahci ipmi_si mei_me libahci ipmi_devintf drm intel_uncor=
e ioatdma libata mei joydev intel_pch_thermal dca wmi ipmi_msghandler acpi_=
pad acpi_power_meter ip_tables
> > > > > [   51.331824][ T1303] /lkp/lkp/src/monitors/wrapper: 64: /lkp/lk=
p/src/monitors/wrapper: [[: not found
> > > > > [   51.419746][ T1303]
> > > > > [   51.419749][   C93] CPU: 93 PID: 5763 Comm: stress-ng Not tain=
ted 5.15.0-rc1-00122-g0a526bb47c44 #1
> > > > > [   51.490062][   C93] Hardware name: Intel Corporation S2600WFT/=
S2600WFT, BIOS SE5C620.86B.02.01.0008.031920191559 03/19/2019
> > > > > [   51.516549][ T1303] /lkp/lkp/src/monitors/wrapper: 64: /lkp/lk=
p/src/monitors/wrapper: [[: not found
> > > > > [   51.520735][ T1303]
> > > > > [ 51.522283][ C93] RIP: 0010:clocksource_watchdog (kernel/time/cl=
ocksource.c:235 kernel/time/clocksource.c:389) =

> > > > > [ 51.575930][ C93] Code: 75 fe ff ff 48 8b 56 30 48 c7 c7 d0 93 5=
5 82 4c 89 0c 24 65 44 8b 05 a0 43 e8 7e 44 89 c6 c6 05 e6 de c0 01 01 e8 8=
7 b0 ad 00 <0f> 0b 4c 8b 0c 24 e9 fd fe ff ff e8 59 ec 00 00 e9 b4 fc ff ff=
 66
> > > > > All code
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > > >    0:	75 fe                	jne    0x0
> > > > >    2:	ff                   	(bad)  =

> > > > >    3:	ff 48 8b             	decl   -0x75(%rax)
> > > > >    6:	56                   	push   %rsi
> > > > >    7:	30 48 c7             	xor    %cl,-0x39(%rax)
> > > > >    a:	c7                   	(bad)  =

> > > > >    b:	d0 93 55 82 4c 89    	rclb   -0x76b37dab(%rbx)
> > > > >   11:	0c 24                	or     $0x24,%al
> > > > >   13:	65 44 8b 05 a0 43 e8 	mov    %gs:0x7ee843a0(%rip),%r8d     =
   # 0x7ee843bb
> > > > >   1a:	7e =

> > > > >   1b:	44 89 c6             	mov    %r8d,%esi
> > > > >   1e:	c6 05 e6 de c0 01 01 	movb   $0x1,0x1c0dee6(%rip)        # =
0x1c0df0b
> > > > >   25:	e8 87 b0 ad 00       	callq  0xadb0b1
> > > > >   2a:*	0f 0b                	ud2    		<-- trapping instruction
> > > > >   2c:	4c 8b 0c 24          	mov    (%rsp),%r9
> > > > >   30:	e9 fd fe ff ff       	jmpq   0xffffffffffffff32
> > > > >   35:	e8 59 ec 00 00       	callq  0xec93
> > > > >   3a:	e9 b4 fc ff ff       	jmpq   0xfffffffffffffcf3
> > > > >   3f:	66                   	data16
> > > > > =

> > > > > Code starting with the faulting instruction
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >    0:	0f 0b                	ud2    =

> > > > >    2:	4c 8b 0c 24          	mov    (%rsp),%r9
> > > > >    6:	e9 fd fe ff ff       	jmpq   0xffffffffffffff08
> > > > >    b:	e8 59 ec 00 00       	callq  0xec69
> > > > >   10:	e9 b4 fc ff ff       	jmpq   0xfffffffffffffcc9
> > > > >   15:	66                   	data16
> > > > > [   51.610021][   C93] RSP: 0018:ffffc9000dc68e88 EFLAGS: 00010282
> > > > > [   51.618528][ T1303] /lkp/lkp/src/monitors/wrapper: 3: /lkp/lkp=
/src/lib/lkp_path.sh: [[: not found
> > > > > [   51.619224][ T1303]
> > > > > [   51.619226][   C93] RAX: 0000000000000000 RBX: ffffffff828232c=
0 RCX: 0000000000000000
> > > > > [   51.654375][ T1303] /lkp/lkp/src/monitors/wrapper: 5: /lkp/lkp=
/src/lib/lkp_path.sh: source: not found
> > > > > [   51.661420][ T1303]
> > > > > [   51.661449][   C93] RDX: ffff88ff48d63800 RSI: ffff88ff48d57b5=
0 RDI: ffff88ff48d57b50
> > > > > [   51.687441][   C93] RBP: 0000000000000000 R08: ffff88ff48d57b5=
0 R09: ffffc9000dc68ca8
> > > > > [   51.710127][   C93] R10: 0000000000000001 R11: 000000000000000=
1 R12: 0000000049784638
> > > > > [   51.735896][   C93] R13: 00000dbb62d538fc R14: 000000000000000=
3 R15: 0000000000000003
> > > > > [   51.751265][   C93] FS:  00007fbde3ad7740(0000) GS:ffff88ff48d=
40000(0000) knlGS:0000000000000000
> > > > > [   51.779544][   C93] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
> > > > > [   51.782253][ T1303] /lkp/lkp/src/monitors/wrapper: 3: /lkp/lkp=
/src/lib/lkp_path.sh: [[: not found
> > > > > [   51.799053][   C93] CR2: 00007f52fb06ba20 CR3: 000000079349e00=
4 CR4: 00000000007706e0
> > > > > [   51.799055][   C93] DR0: 0000000000000000 DR1: 000000000000000=
0 DR2: 0000000000000000
> > > > > [   51.799214][   C93] DR3: 0000000000000000 DR6: 00000000fffe0ff=
0 DR7: 0000000000000400
> > > > > [   51.799383][   C93] PKRU: 55555554
> > > > > [   51.799385][   C93] Call Trace:
> > > > > [   51.799725][   C93]  <IRQ>
> > > > > [   51.832939][ T1303]
> > > > > [ 51.852125][ C93] ? trigger_load_balance (arch/x86/include/asm/a=
tomic.h:29 include/linux/atomic/atomic-instrumented.h:28 kernel/sched/fair.=
c:10363 kernel/sched/fair.c:10919) =

> > > > > [   51.946975][ T1303] /lkp/lkp/src/monitors/wrapper: 5: /lkp/lkp=
/src/lib/lkp_path.sh: source: not found
> > > > > [   51.948795][ T1303]
> > > > > [ 51.948794][ C93] ? __clocksource_register_scale (kernel/time/cl=
ocksource.c:366) =

> > > > > [   51.961958][ T1303] /lkp/lkp/src/monitors/wrapper: 64: /lkp/lk=
p/src/monitors/wrapper: [[: not found
> > > > > [ 51.967150][ C93] call_timer_fn (kernel/time/timer.c:1421) =

> > > > > [   51.967153][ T1303]
> > > > > [ 51.983240][ C93] run_timer_softirq (kernel/time/timer.c:1467 ke=
rnel/time/timer.c:1734 kernel/time/timer.c:1710 kernel/time/timer.c:1747) =

> > > > > [ 51.988436][ C93] ? enqueue_hrtimer (kernel/time/hrtimer.c:1092) =

> > > > > [   51.990262][ T1303] /lkp/lkp/src/monitors/wrapper: 64: /lkp/lk=
p/src/monitors/wrapper: [[: not found
> > > > > [   51.993387][ T1303]
> > > > > [ 51.993535][ C93] ? ktime_get (kernel/time/timekeeping.c:193 ker=
nel/time/timekeeping.c:287 kernel/time/timekeeping.c:386 kernel/time/timeke=
eping.c:829 kernel/time/timekeeping.c:817) =

> > > > > [ 52.009974][ C93] __do_softirq (kernel/softirq.c:558) =

> > > > > [ 52.014815][ C93] irq_exit_rcu (kernel/softirq.c:432 kernel/soft=
irq.c:637 kernel/softirq.c:649) =

> > > > > [ 52.019617][ C93] sysvec_apic_timer_interrupt (arch/x86/kernel/a=
pic/apic.c:1097 (discriminator 14)) =

> > > > > [   52.021485][ T1303] /lkp/lkp/src/monitors/wrapper: 3: /lkp/lkp=
/src/lib/lkp_path.sh: [[: not found
> > > > > [   52.025661][   C93]  </IRQ>
> > > > > [   52.025899][ T1303]
> > > > > [ 52.034972][ C93] asm_sysvec_apic_timer_interrupt (arch/x86/incl=
ude/asm/idtentry.h:638) =

> > > > > [ 52.034980][ C93] RIP: 0010:osq_lock (kernel/locking/osq_lock.c:=
143) =

> > > > > [ 52.034989][ C93] Code: 85 95 00 00 00 65 4c 8b 0c 25 00 6d 01 0=
0 eb 21 48 8b 42 08 8b 78 14 83 ef 01 48 63 ff 48 31 c0 0f 1f 40 00 84 c0 7=
5 10 f3 90 <8b> 42 10 85 c0 75 69 49 8b 01 a8 08 74 d8 31 ff eb 0d 8b 42 10=
 85
> > > > > All code
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > > >    0:	85 95 00 00 00 65    	test   %edx,0x65000000(%rbp)
> > > > >    6:	4c 8b 0c 25 00 6d 01 	mov    0x16d00,%r9
> > > > >    d:	00 =

> > > > >    e:	eb 21                	jmp    0x31
> > > > >   10:	48 8b 42 08          	mov    0x8(%rdx),%rax
> > > > >   14:	8b 78 14             	mov    0x14(%rax),%edi
> > > > >   17:	83 ef 01             	sub    $0x1,%edi
> > > > >   1a:	48 63 ff             	movslq %edi,%rdi
> > > > >   1d:	48 31 c0             	xor    %rax,%rax
> > > > >   20:	0f 1f 40 00          	nopl   0x0(%rax)
> > > > >   24:	84 c0                	test   %al,%al
> > > > >   26:	75 10                	jne    0x38
> > > > >   28:	f3 90                	pause  =

> > > > >   2a:*	8b 42 10             	mov    0x10(%rdx),%eax		<-- trapping=
 instruction
> > > > >   2d:	85 c0                	test   %eax,%eax
> > > > >   2f:	75 69                	jne    0x9a
> > > > >   31:	49 8b 01             	mov    (%r9),%rax
> > > > >   34:	a8 08                	test   $0x8,%al
> > > > >   36:	74 d8                	je     0x10
> > > > >   38:	31 ff                	xor    %edi,%edi
> > > > >   3a:	eb 0d                	jmp    0x49
> > > > >   3c:	8b 42 10             	mov    0x10(%rdx),%eax
> > > > >   3f:	85                   	.byte 0x85
> > > > > =

> > > > > Code starting with the faulting instruction
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >    0:	8b 42 10             	mov    0x10(%rdx),%eax
> > > > >    3:	85 c0                	test   %eax,%eax
> > > > >    5:	75 69                	jne    0x70
> > > > >    7:	49 8b 01             	mov    (%r9),%rax
> > > > >    a:	a8 08                	test   $0x8,%al
> > > > >    c:	74 d8                	je     0xffffffffffffffe6
> > > > >    e:	31 ff                	xor    %edi,%edi
> > > > >   10:	eb 0d                	jmp    0x1f
> > > > >   12:	8b 42 10             	mov    0x10(%rdx),%eax
> > > > >   15:	85                   	.byte 0x85
> > > > > =

> > > > > =

> > > > > To reproduce:
> > > > > =

> > > > >         git clone https://github.com/intel/lkp-tests.git
> > > > >         cd lkp-tests
> > > > >         sudo bin/lkp install job.yaml           # job file is att=
ached in this email
> > > > >         bin/lkp split-job --compatible job.yaml # generate the ya=
ml file for lkp run
> > > > >         sudo bin/lkp run generated-yaml-file
> > > > > =

> > > > >         # if come across any failure that blocks the test,
> > > > >         # please remove ~/.lkp and /lkp dir to run from a clean s=
tate.
> > > > > =

> > > > > =

> > > > > =

> > > > > ---
> > > > > 0DAY/LKP+ Test Infrastructure                   Open Source Techn=
ology Center
> > > > > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Int=
el Corporation
> > > > > =

> > > > > Thanks,
> > > > > Oliver Sang
> > > > > =

> > > >=20
--===============4445453797999219755==--

