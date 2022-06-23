Content-Type: multipart/mixed; boundary="===============4476637447911283231=="
MIME-Version: 1.0
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: lkp@lists.01.org
Subject: Re: [cpuidle, intel_idle] 32d4fd5751: WARNING:at_kernel/rcu/tree.c:#rcu_eqs_exit
Date: Thu, 23 Jun 2022 11:23:59 +0000
Message-ID: <20220623112358.chwk2ld6k6sufeb5@shindev>
In-Reply-To: <20220612160006.GB35020@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4476637447911283231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Jun 13, 2022 / 00:00, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 32d4fd5751eadbe1823a37eb38df85ec5c8e6207 ("cpuidle,intel_idle: Fi=
x CPUIDLE_FLAG_IRQ_ENABLE")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-cef46213-1_20220609
> with following parameters:
> =

> 	group: resctrl
> 	ucode: 0x500320a
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2=
.10GHz with 128G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [ 29.104402][ T0] WARNING: CPU: 0 PID: 0 at kernel/rcu/tree.c:864 rcu_eqs=
_exit+0x4b/0xc0 =

> [   29.104417][    T0]
> [   29.104418][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   29.104419][    T0] WARNING: suspicious RCU usage
> [   29.104421][    T0] 5.19.0-rc1-00001-g32d4fd5751ea #1 Not tainted
> [   29.104424][    T0] -----------------------------

FYI, I observe this WARNING on my test servers for fstests, with kernel
v5.19-rc3. It was observed at system boot, and was also observed repeatedly
during fstests run. I reverted the commit 32d4fd5751ea then the WARNING
disappeared. The WARNING was observed on systems with 20 threads CPU, but
not observed on systems with 8 threads CPU.

Looking in the commit, I'm not sure how it is related to the RCU warning.
If any further action on my system would help, please let me know.

-- =

Shin'ichiro Kawasaki
--===============4476637447911283231==--

