Content-Type: multipart/mixed; boundary="===============0336757419202880817=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpuidle, intel_idle] 32d4fd5751: WARNING:at_kernel/rcu/tree.c:#rcu_eqs_exit
Date: Wed, 14 Sep 2022 16:26:58 +0800
Message-ID: <YyGQUu9S+ISHaNFi@xsang-OptiPlex-9020>
In-Reply-To: <20220623112358.chwk2ld6k6sufeb5@shindev>
List-Id: <oe-lkp.lists.linux.dev>

--===============0336757419202880817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Shin'ichiro Kawasaki and Peter Zijlstra,

On Thu, Jun 23, 2022 at 11:23:59AM +0000, Shinichiro Kawasaki wrote:
> On Jun 13, 2022 / 00:00, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-11):
> > =

> > commit: 32d4fd5751eadbe1823a37eb38df85ec5c8e6207 ("cpuidle,intel_idle: =
Fix CPUIDLE_FLAG_IRQ_ENABLE")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > in testcase: kernel-selftests
> > version: kernel-selftests-x86_64-cef46213-1_20220609
> > with following parameters:
> > =

> > 	group: resctrl
> > 	ucode: 0x500320a
> > =

> > test-description: The kernel contains a set of "self tests" under the t=
ools/testing/selftests/ directory. These are intended to be small unit test=
s to exercise individual code paths in the kernel.
> > test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> > =

> > =

> > on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @=
 2.10GHz with 128G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > [ 29.104402][ T0] WARNING: CPU: 0 PID: 0 at kernel/rcu/tree.c:864 rcu_e=
qs_exit+0x4b/0xc0 =

> > [   29.104417][    T0]
> > [   29.104418][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   29.104419][    T0] WARNING: suspicious RCU usage
> > [   29.104421][    T0] 5.19.0-rc1-00001-g32d4fd5751ea #1 Not tainted
> > [   29.104424][    T0] -----------------------------
> =

> FYI, I observe this WARNING on my test servers for fstests, with kernel
> v5.19-rc3. It was observed at system boot, and was also observed repeated=
ly
> during fstests run. I reverted the commit 32d4fd5751ea then the WARNING
> disappeared. The WARNING was observed on systems with 20 threads CPU, but
> not observed on systems with 8 threads CPU.
> =

> Looking in the commit, I'm not sure how it is related to the RCU warning.
> If any further action on my system would help, please let me know.

recently we made further tests and confirmed the issue is existing on this
commit but clean on parent, still on test machine:
  88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz with 128G =
memory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/tbox_group/testcase:
  gcc-11/resctrl/x86_64-rhel-8.3-kselftests/debian-11.1-x86_64-20220510.cgz=
/lkp-csl-2sp9/kernel-selftests

commit:
  v5.19-rc1
  32d4fd5751eadbe1823a37eb38df85ec5c8e6207

       v5.19-rc1 32d4fd5751eadbe1823a37eb38d
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :20         100%          20:20    dmesg.RIP:rcu_eqs_exit   <---=
---
           :20          95%          19:20    dmesg.RIP:sched_clock_tick
           :20          90%          18:20    dmesg.WARNING:at_kernel/rcu/t=
ree.c:#rcu_eqs_exit
           :20          90%          18:20    dmesg.WARNING:at_kernel/sched=
/clock.c:#sched_clock_tick
           :20         100%          20:20    dmesg.WARNING:suspicious_RCU_=
usage
           :20         100%          20:20    dmesg.boot_failures
           :20           5%           1:20    dmesg.include/linux/rcupdate.=
h:#rcu_read_lock()used_illegally_while_idle
           :20           5%           1:20    dmesg.include/linux/rcupdate.=
h:#rcu_read_unlock()used_illegally_while_idle
           :20          95%          19:20    dmesg.include/trace/events/er=
ror_report.h:#suspicious_rcu_dereference_check()usage
           :20         100%          20:20    dmesg.include/trace/events/lo=
ck.h:#suspicious_rcu_dereference_check()usage


as Shin'ichiro Kawasaki mentioned, the issues seems not be able to reproduc=
e on
systems with small number of threads of CPU. so we tested on a vm which only
have 2 threads
  qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

we confirmed the issue cannot be reproduced.

we actually don't have related knolwedge, if need extra data or testing we =
can
help.

> =

> -- =

> Shin'ichiro Kawasaki
--===============0336757419202880817==--

