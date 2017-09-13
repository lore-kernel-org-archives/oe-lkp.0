Content-Type: multipart/mixed; boundary="===============5766640188109678852=="
MIME-Version: 1.0
From: Prarit Bhargava <prarit@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/topology] 05aa90edc7: kernel_BUG_at_arch/x86/kernel/cpu/common.c
Date: Wed, 13 Sep 2017 11:11:23 -0400
Message-ID: <20f9eceb-db6f-3386-0f71-3a0f6a1cf0a1@redhat.com>
In-Reply-To: <20170911234651.64p6yxmnzthsbpia@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============5766640188109678852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/11/2017 07:46 PM, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: 05aa90edc7910ec3d1ed791fa77371b3acb9bf08 ("x86/topology: Avoid wa=
sting 128k for package id array")
> url: https://github.com/0day-ci/linux/commits/Andi-Kleen/perf-x86-intel-u=
ncore-Cache-logical-pkg-id-in-uncore-driver/20170910-025322
> =

> =

> in testcase: pm-qa
> with following parameters:
> =

> 	test: cpuidle
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu kvm64,+ssse3 -smp 2 =
-m 8G
> =


See comment below on ^^^ ...

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------+------------+------------+
> |                                            | b62bc52ffc | 05aa90edc7 |
> +--------------------------------------------+------------+------------+
> | boot_successes                             | 0          | 0          |
> | boot_failures                              | 0          | 36         |
> | invalid_opcode:#[##]                       | 0          | 32         |
> | kernel_BUG_at_arch                         | 0          | 3          |
> | Kernel_panic-not_syncing:Fatal_exception   | 0          | 26         |
> | kernel_BUG_at_arch/x86/kernel/cpu/common.c | 0          | 9          |
> | Kernel_panic-not_syncing:Fatal_exc         | 0          | 2          |
> | Kernel_panic-not_syncing:Fatal_exceptf810  | 0          | 1          |
> +--------------------------------------------+------------+------------+
> =

> =

> =

> [  277.992221] kernel BUG at arch/x86/kernel/cpu/common.c:1061!
> [  277.993885] invalid opcode: 0000 [#1] SMP
> [  277.994707] Modules linked in:
> [  277.995237] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.13.0-00002-g05=
aa90ed #26
> [  277.996567] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [  277.998765] task: ffff9b2555034300 task.stack: ffffabde018f0000
> [  278.000063] RIP: 0010:identify_secondary_cpu+0x6a/0x71
> [  278.001055] RSP: 0000:ffffabde018f3f10 EFLAGS: 00010086
> [  278.001699] RAX: 00000000ffffffe4 RBX: ffff9b255f40a100 RCX: 000000000=
0000007
> [  278.002621] RDX: 0000000000000000 RSI: ffffffff8c13baf7 RDI: ffff9b255=
f5ce040
> [  278.003674] RBP: ffffabde018f3f20 R08: 00000049c6d945a5 R09: 000000000=
0000001
> [  278.005029] R10: 0000000000000000 R11: ffffffff90a8af67 R12: 000000000=
0000001
> [  278.006221] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [  278.007529] FS:  0000000000000000(0000) GS:ffff9b255f400000(0000) knlG=
S:0000000000000000
> [  278.009384] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  278.010798] CR2: 0000000000000000 CR3: 00000001b222c000 CR4: 000000000=
00006e0
> [  278.012134] Call Trace:
> [  278.012458]  smp_store_cpu_info+0x3e/0x40
> [  278.013008]  start_secondary+0x2f/0xe5
> [  278.013538]  secondary_startup_64+0x9f/0x9f
> [  278.014083] Code: 0f b7 8b d4 00 00 00 89 c2 44 89 e6 48 c7 c7 19 1f c=
3 8e e8 55 7c 0b 00 0f b7 bb da 00 00 00 44 89 e6 e8 f9 df 00 00 85 c0 74 0=
2 <0f> 0b 5b 41 5c 5d c3 55 48 89 e5 41 54 53 80 7f 01 08 48 89 fb =

> [  278.017392] RIP: identify_secondary_cpu+0x6a/0x71 RSP: ffffabde018f3f10
> [  278.018303] ---[ end trace 791e5b1aeb0d5a6c ]---
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
> =


I'm willing to debug but I can't get lkp to work on any system.

# bin/lkp qemu -k /home/linux/vmlinux job-script
make: Entering directory `/root/lkp-tests/bin/event'
gcc    -c -o wakeup.o wakeup.c
gcc   -o wakeup wakeup.o
rm -f wakeup.o
strip wakeup
make: Leaving directory `/root/lkp-tests/bin/event'
cpio: root:lkp: invalid group
cpio: root:lkp: invalid group
cpio: root:lkp: invalid group
gzip: /root/.lkp/cache/lkp-x86_64.cpio: No such file or directory
mv: cannot stat =E2=80=98/root/.lkp/cache/lkp-x86_64.cpio.gz=E2=80=99: No s=
uch file or directory
mv: cannot stat =E2=80=98/root/.lkp/cache/lkp-x86_64.cgz=E2=80=99: No such =
file or directory
result_root:
/root/.lkp//result/pm-qa/cpuidle/vm-lkp-nex04-8G/debian-x86_64-2016-08-31.c=
gz/x86_64-allyesdebian/gcc-6/05aa90edc7910ec3d1ed791fa77371b3acb9bf08/2
downloading initrds ...
/usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretry 1=
000
--tries 1000
https://github.com/0day-ci/lkp-qemu/raw/master/osimage/debian/debian-x86_64=
-2016-08-31.cgz
-N -P /root/.lkp/cache/osimage/debian
/usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretry 1=
000
--tries 1000
https://github.com/0day-ci/lkp-qemu/raw/master/osimage/deps/debian-x86_64-2=
016-08-31.cgz/lkp_2017-08-01.cgz
-N -P /root/.lkp/cache/osimage/deps/debian-x86_64-2016-08-31.cgz
Failed to download osimage/deps/debian-x86_64-2016-08-31.cgz/lkp_2017-08-01=
.cgz

Based on the qemu options above I manually created a guest that does

-smp 2,sockets=3D2,cores=3D1,threads=3D1

and don't see a problem.  I also tried some other configs and also don't se=
e a
problem.

Suggestions from the lkp folks on reproducing welcomed,

P.

> =

> =

> Thanks,
> lkp
>=20

--===============5766640188109678852==--

