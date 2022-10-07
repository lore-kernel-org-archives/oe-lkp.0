Content-Type: multipart/mixed; boundary="===============5781918056070021415=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched] 3cf68f7aae: WARNING:at_kernel/rcu/update.c:#rcutorture_sched_setaffinity
Date: Fri, 07 Oct 2022 14:09:11 -0400
Message-ID: <ac89f8d8-d87f-9d56-dd5b-43e2c948db29@redhat.com>
In-Reply-To: <202209260935.35aecc5a-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5781918056070021415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/25/22 22:51, kernel test robot wrote:
> Hi Waiman,
>
> While this report is for v9 patch, we found that the issue also happens
> on v10 patch, so we send this report FYI. Thanks.
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 3cf68f7aaecb7f1482f3183a5925641632658667 ("[PATCH v9 2/7] sched: =
Use user_cpus_ptr for saving user provided cpumask in sched_setaffinity()")
> url: https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/sched-Per=
sistent-user-requested-affinity/20220917-023345
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 687=
9c2d3b96039ff1668b4328a4d0dd3ea952cff
> patch link: https://lore.kernel.org/lkml/20220916183217.1172225-3-longman=
(a)redhat.com
>
> in testcase: rcutorture
> version:
> with following parameters:
>
> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: trivial
>
> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> dl_task_check_affinity
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> [   95.904059][  T543] ------------[ cut here ]------------
> [   95.904506][  T543] rcutorture_sched_setaffinity: sched_setaffinity() =
returned -22
> [   95.905105][  T543] WARNING: CPU: 0 PID: 543 at kernel/rcu/update.c:49=
5 rcutorture_sched_setaffinity+0x45/0x50
> [   95.905843][  T543] Modules linked in: rcutorture torture
> [   95.906279][  T543] CPU: 0 PID: 543 Comm: rcu_torture_fak Tainted: G  =
      W          6.0.0-rc5-00091-g3cf68f7aaecb #1
> [   95.907111][  T543] EIP: rcutorture_sched_setaffinity+0x45/0x50
> [   95.907640][  T543] Code: 94 d0 82 00 75 ee 89 44 24 08 b9 88 5e f9 81=
 b2 01 89 4c 24 04 c7 04 24 00 d9 5f 82 88 15 8a 94 d0 82 89 45 fc e8 db 4d=
 dc 00 <0f> 0b 8b 45 fc 89 ec 5d c3 66 90 55 31 c0 80 3d dc 65 65 83 00 89
> [   95.909113][  T543] EAX: 0000003e EBX: 00000000 ECX: e756ff14 EDX: 000=
01794
> [   95.909666][  T543] ESI: ee381d00 EDI: 00000002 EBP: ed37ff44 ESP: ed3=
7ff34
> [   95.910203][  T543] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00010282
> [   95.910816][  T543] CR0: 80050033 CR2: 77d40bb0 CR3: 06a9a000 CR4: 000=
406b0
> [   95.911357][  T543] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   95.911895][  T543] DR6: fffe0ff0 DR7: 00000400
> [   95.912255][  T543] Call Trace:
> [   95.912529][  T543]  synchronize_rcu_trivial+0x57/0xf0 [rcutorture]
> [   95.913034][  T543]  rcu_torture_fakewriter+0x108/0x280 [rcutorture]
> [   95.913532][  T543]  kthread+0xcd/0xf0
> [   95.913839][  T543]  ? rcu_read_unlock+0x60/0x60 [rcutorture]
> [   95.914311][  T543]  ? kthread_complete_and_exit+0x20/0x20
> [   95.914734][  T543]  ret_from_fork+0x19/0x24
> [   95.915065][  T543] irq event stamp: 66091
> [   95.915386][  T543] hardirqs last  enabled at (66099): [<810d5f79>] __=
up_console_sem+0x69/0x80
> [   95.916046][  T543] hardirqs last disabled at (66106): [<810d5f5d>] __=
up_console_sem+0x4d/0x80
> [   95.916711][  T543] softirqs last  enabled at (66072): [<81f8e014>] __=
do_softirq+0x284/0x4a3
> [   95.917377][  T543] softirqs last disabled at (66063): [<8100b544>] do=
_softirq_own_stack+0x24/0x30
> [   95.918043][  T543] ---[ end trace 0000000000000000 ]---
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/r/202209260935.35aecc5a-yujie.liu(a)intel=
.com
>
>
> To reproduce:
>
>          # build kernel
> 	cd linux
> 	cp config-6.0.0-rc5-00091-g3cf68f7aaecb .config
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 olddefconfig prepare module=
s_prepare bzImage modules
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script=
 is attached in this email
>
>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
The warning happens in the following code:

 =C2=A0=C2=A0=C2=A0 490 long rcutorture_sched_setaffinity(pid_t pid, const =
struct =

cpumask *in_mask)
 =C2=A0=C2=A0=C2=A0 491 {
 =C2=A0=C2=A0=C2=A0 492=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
 ret;
 =C2=A0=C2=A0=C2=A0 493
 =C2=A0=C2=A0=C2=A0 494=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D sched_setaffinity(pid, in_mask);
 =C2=A0=C2=A0=C2=A0 495=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WAR=
N_ONCE(ret, "%s: sched_setaffinity() returned %d\n", =

__func__, ret);
 =C2=A0=C2=A0=C2=A0 496=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
 =C2=A0=C2=A0=C2=A0 497 }

 =C2=A0=C2=A0=C2=A0 792 static void synchronize_rcu_trivial(void)
 =C2=A0=C2=A0=C2=A0 793 {
 =C2=A0=C2=A0=C2=A0 794=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
 cpu;
 =C2=A0=C2=A0=C2=A0 795
 =C2=A0=C2=A0=C2=A0 796=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for=
_each_online_cpu(cpu) {
 =C2=A0=C2=A0=C2=A0 797 rcutorture_sched_setaffinity(current->pid, cpumask_=
of(cpu));
 =C2=A0=C2=A0=C2=A0 798=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(raw_smp_processo=
r_id() !=3D cpu);
 =C2=A0=C2=A0=C2=A0 799=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
 =C2=A0=C2=A0=C2=A0 800 }

The original sched_setaffinity() code hide the failure due to racing in =

cpuset's cpus_allowed change. So it won't fail even if the new cpu being =

set is different from the mask given by the caller. The patch changes =

the code that will return a failure code instead. In this particular =

failure, the calling synchronize_rcu_trivial() should have triggered its =

WARN_ON_ONCE() check. Since this warning has been triggered before, it =

won't show up a second time. As a result, you have two warnings instead =

of one.

-Longman


--===============5781918056070021415==--

