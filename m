Content-Type: multipart/mixed; boundary="===============2575558592618167408=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/tdx] e2f278db42: WARNING:at_net/sched/sch_generic.c:#dev_watchdog
Date: Sun, 15 Aug 2021 08:53:37 -0700
Message-ID: <6d7da06b-2339-32ec-3e81-b6c427ef3961@linux.intel.com>
In-Reply-To: <20210815144418.GA8132@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2575558592618167408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 8/15/2021 7:44 AM, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: e2f278db4291ed96e4730a3ee78b8d2732919187 ("x86/tdx: Implement ior=
emap_shared for x86")
> https://github.com/intel/tdx.git guest
>
>
> in testcase: stress-ng
> version: stress-ng-x86_64-0.11-06_20210811
> with following parameters:
>
> 	nr_threads: 100%
> 	testtime: 60s
> 	class: cpu
> 	test: tsc
> 	cpufreq_governor: performance
> 	ucode: 0x42e
>
>
>
> on test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2=
.70GHz with 112G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
>
> [   22.855841][   C28] ------------[ cut here ]------------
> [   22.875923][   C28] NETDEV WATCHDOG: eth0 (igb): transmit queue 2 time=
d out
> [   22.883837][   C28] WARNING: CPU: 28 PID: 0 at net/sched/sch_generic.c=
:477 dev_watchdog+0x258/0x280
> [   22.894079][   C28] Modules linked in:


Must be a bad bisect. The patch is a nop in a non TDX system



-Andi

> [   22.898367][   C28] CPU: 28 PID: 0 Comm: swapper/28 Not tainted 5.14.0=
-rc4-00052-ge2f278db4291 #1
> [   22.908415][   C28] Hardware name: Intel Corporation S2600WP/S2600WP, =
BIOS SE5C600.86B.02.02.0002.122320131210 12/23/2013
> [   22.920805][   C28] RIP: 0010:dev_watchdog+0x258/0x280
> [   22.926649][   C28] Code: 8e 6b 52 7e eb 9d 4c 89 ef c6 05 97 7b 2b 01=
 01 e8 fd 81 f9 ff 44 89 e1 4c 89 ee 48 c7 c7 58 0e 63 82 48 89 c2 e8 e1 81=
 1c 00 <0f> 0b e9 7b ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f
> [   22.948585][   C28] RSP: 0000:ffffc90006dd4eb0 EFLAGS: 00010282
> [   22.955301][   C28] RAX: 0000000000000000 RBX: ffff888f4142e8c0 RCX: c=
0000000fffeffff
> [   22.964183][   C28] RDX: ffffc90006dd4cd8 RSI: 00000000fffeffff RDI: 0=
000000000000000
> [   22.973077][   C28] RBP: ffff88810a8743dc R08: 0000000000000000 R09: f=
fffc90006dd4cd0
> [   22.981959][   C28] R10: 0000000000000001 R11: 0000000000000001 R12: 0=
000000000000002
> [   22.990844][   C28] R13: ffff88810a874000 R14: ffff88810a874480 R15: 0=
000000000000008
> [   22.999725][   C28] FS:  0000000000000000(0000) GS:ffff888f02c00000(00=
00) knlGS:0000000000000000
> [   23.009667][   C28] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   23.016967][   C28] CR2: 0000000000000000 CR3: 0000001c3ec10001 CR4: 0=
0000000001706e0
> [   23.025851][   C28] Call Trace:
> [   23.029459][   C28]  <IRQ>
> [   23.032577][   C28]  ? pfifo_fast_enqueue+0x180/0x180
> [   23.038321][   C28]  call_timer_fn+0x29/0x140
> [   23.043291][   C28]  run_timer_softirq+0x3c3/0x480
> [   23.048735][   C28]  ? tick_sched_do_timer+0x80/0x80
> [   23.054399][   C28]  ? recalibrate_cpu_khz+0x40/0x40
> [   23.060048][   C28]  ? ktime_get+0x38/0xc0
> [   23.064716][   C28]  __do_softirq+0xdb/0x2a6
> [   23.069591][   C28]  irq_exit_rcu+0xba/0x100
> [   23.074462][   C28]  sysvec_apic_timer_interrupt+0x72/0xc0
> [   23.080695][   C28]  </IRQ>
> [   23.083901][   C28]  asm_sysvec_apic_timer_interrupt+0x12/0x20
> [   23.090519][   C28] RIP: 0010:cpuidle_enter_state+0xd2/0x380
> [   23.096948][   C28] Code: 49 89 c5 0f 1f 44 00 00 31 ff e8 09 25 70 ff=
 45 84 ff 74 12 9c 58 f6 c4 02 0f 85 62 02 00 00 31 ff e8 72 68 77 ff fb 45=
 85 f6 <0f> 88 fb 00 00 00 49 63 c6 4c 2b 2c 24 48 8d 14 40 48 8d 14 90 49
> [   23.118889][   C28] RSP: 0000:ffffc9000649fe80 EFLAGS: 00000202
> [   23.125604][   C28] RAX: ffff888f02c2bd00 RBX: 0000000000000004 RCX: 0=
00000000000001f
> [   23.134483][   C28] RDX: 0000000000000000 RSI: 000000002f858b0c RDI: 0=
000000000000000
> [   23.143364][   C28] RBP: ffff888f02c36108 R08: 00000005524fa10b R09: 0=
00000007fffffff
> [   23.152245][   C28] R10: 000000000000afc8 R11: ffff888f02c2aa44 R12: f=
fffffff82ce4860
> [   23.161124][   C28] R13: 00000005524fa10b R14: 0000000000000004 R15: 0=
000000000000000
> [   23.170006][   C28]  cpuidle_enter+0x29/0x40
> [   23.174875][   C28]  do_idle+0x1d7/0x280
> [   23.179356][   C28]  cpu_startup_entry+0x19/0x40
> [   23.184614][   C28]  start_secondary+0x116/0x180
> [   23.189873][   C28]  secondary_startup_64_no_verify+0xd1/0xdb
> [   23.196400][   C28] ---[ end trace 21b4b12bee2c9403 ]---
>
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install                job.yaml  # job file is attached =
in this email
>          bin/lkp split-job --compatible job.yaml  # generate the yaml fil=
e for lkp run
>          bin/lkp run                    generated-yaml-file
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
>
--===============2575558592618167408==--

