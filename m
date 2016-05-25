Content-Type: multipart/mixed; boundary="===============4766900504958223900=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/cpufeature] 7b5e74e637: BUG: unable to handle kernel paging request at 6b636170
Date: Wed, 25 May 2016 08:54:03 +0800
Message-ID: <20160525005403.GA24370@wfg-t540p.sh.intel.com>
In-Reply-To: <20160524200709.GA9079@codemonkey.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4766900504958223900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

You are right -- this is a bad bisect.

>  > [    1.914984] random: trinity urandom read with 25 bits of entropy av=
ailable
>  > [    8.542178] random: nonblocking pool is initialized
>  > [   11.939833] sock: process `trinity-main' is using obsolete setsocko=
pt SO_BSDCOMPAT
>  > [   12.349890] BUG: unable to handle kernel paging request at 6b636170
>  > [   12.349895] IP: [<c108154b>] perf_prepare_sample+0x7d/0x263
> =

> The trace is more related to perf.
>  =

>  > git bisect good 6b1291f3392c44c6e5a33e220615809ba7e09903  # 01:38     =
27+      0  Merge 'ubifs/master' into devel-catchup-201605250104
>  > git bisect good 3bd1789389525d3913f496b07937711164ce3809  # 01:51     =
27+      0  Merge 'mark-rutland/arm64/misc-patches' into devel-catchup-2016=
05250104
>  > git bisect good 6944b78a365a8b71dabad7169896c3e75f253e8b  # 01:56     =
27+      0  Merge 'linux-review/Rajneesh-Bhardwaj/platform-x86-Add-PMC-Driv=
er-for-Intel-Core-SoC/20160524-222735' into devel-catchup-201605250104
>  > git bisect  bad 5c7f53f3c9182146efd37be1989f8e23e3b796ff  # 02:01     =
 0-      1  Merge 'linux-review/Leon-Romanovsky/Netlink-based-IOCTLs-RDMA-A=
BI/20160524-223842' into devel-catchup-201605250104
>  > git bisect  bad be092017b6ffbd013f481f915632db6aa9fc3ca3  # 02:07     =
 0-      1  Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/arm64/linux
>  > git bisect good 36db171cc733bc7b8c628ef21831467d1919decd  # 02:14     =
27+      0  Merge branch 'perf-core-for-linus' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tip/tip
>  > git bisect  bad 168f1a7163b37294a0ef33829e1ed54d41e33c42  # 02:19     =
 1-     21  Merge branch 'x86-asm-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
>  > git bisect good 825a3b2605c3aa193e0075d0f9c72e33c17ab16a  # 02:26     =
27+      0  Merge branch 'sched-core-for-linus' of git://git.kernel.org/pub=
/scm/linux/kernel/git/tip/tip
>  > git bisect  bad 93984fbd4e33cc861d5b49caed02a02cbfb01340  # 02:30     =
 0-      2  x86/cpufeature: Replace cpu_has_apic with boot_cpu_has() usage
>  > git bisect  bad cb44d0cfc2969999a4d9e20e4fd8749fec6c5498  # 02:35     =
 0-     12  Merge branch 'x86/cpu' into x86/asm, to merge more patches
>  > git bisect  bad d7847a7017b2a2759dd5590c0cffdbdf2994918e  # 02:41     =
 0-      1  x86/cpufeature: Fix build bug caused by merge artifact with the=
 removal of cpu_has_hypervisor
>  > git bisect  bad 7b5e74e637e4a977c7cf40fd7de332f60b68180e  # 03:36     =
 0-      1  x86/cpufeature: Remove cpu_has_arch_perfmon
>  > # first bad commit: [7b5e74e637e4a977c7cf40fd7de332f60b68180e] x86/cpu=
feature: Remove cpu_has_arch_perfmon
>  > git bisect good 1e6d88ccf41c7ef2d6c99aa5e7fb9215aa0e5423  # 03:43     =
82+      0  Merge tag 'nios2-v4.6-rc2' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/lftan/nios2
>  > # extra tests with CONFIG_DEBUG_INFO_REDUCED
>  > git bisect good 7b5e74e637e4a977c7cf40fd7de332f60b68180e  # 03:50     =
82+      0  x86/cpufeature: Remove cpu_has_arch_perfmon
>  > # extra tests on HEAD of linux-devel/devel-catchup-201605250104
>  > git bisect  bad a43f260a02e7f31d72e082768ad0e32d97bdacbd  # 03:50     =
 0-      2  0day head guard for 'devel-catchup-201605250104'
>  > # extra tests on tree/branch linus/master
>  > git bisect  bad 29567292c0b5b2fb484125c280a2175141fe2205  # 03:51     =
 0-     63  Merge tag 'for-linus-4.7-rc0-tag' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/xen/tip
>  > # extra tests on tree/branch linus/master
>  > git bisect  bad 29567292c0b5b2fb484125c280a2175141fe2205  # 03:51     =
 0-     63  Merge tag 'for-linus-4.7-rc0-tag' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/xen/tip
>  > # extra tests on tree/branch linux-next/master
> =

> Given the random nature of the test that triggered this, it seems more
> plausible that this came from the perf-core-for-linus branch, and when
> git-bisect ran on that branch, it marked it good because it didn't run
> the fuzzer for long enough.

I just give 36db171cc733bc7b8c628ef21831467d1919decd ("Merge branch 'perf-c=
ore-for-linus' ...)
900 more runs and it looks good. So I'll queue more bisects.

Thanks,
Fengguang

--===============4766900504958223900==--

