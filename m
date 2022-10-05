Content-Type: multipart/mixed; boundary="===============4304588695189174965=="
MIME-Version: 1.0
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: lkp@lists.01.org
Subject: Re: [perf bench syscall] c5ba0666d8: perf-sanity-tests.perf.make_fail
Date: Wed, 05 Oct 2022 22:05:41 +0800
Message-ID: <81cf37d4-b964-cf32-31dd-afd35e7f511a@loongson.cn>
In-Reply-To: <202210051644.a83a7ca4-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4304588695189174965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 10/5/22 16:35, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: c5ba0666d8f6dd34cb07ad45804e6a90159d377f ("[PATCH v2 1/3] perf be=
nch syscall: Introduce bench_syscall_common()")
> url: https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/perf-Add-=
more-syscalls-to-benchmark/20220929-165832
> base: https://git.kernel.org/cgit/linux/kernel/git/acme/linux.git perf/co=
re
> patch link: https://lore.kernel.org/lkml/1664441571-31349-2-git-send-emai=
l-yangtiezhu(a)loongson.cn
> =

> in testcase: perf-sanity-tests
> version: perf-x86_64-b357fd1c2afc-1_20221001
> with following parameters:
> =

> 	perf_compiler: gcc
> =

> =

> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60=
GHz (Kaby Lake) with 32G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

>    CC      bench/syscall.o
> bench/syscall.c: In function =E2=80=98bench_syscall_common=E2=80=99:
> bench/syscall.c:47:8: error: =E2=80=98__NR_getppid=E2=80=99 undeclared (f=
irst use in this function); did you mean =E2=80=98__getpgid=E2=80=99?
>     47 |   case __NR_getppid:
>        |        ^~~~~~~~~~~~
>        |        __getpgid
> bench/syscall.c:47:8: note: each undeclared identifier is reported only o=
nce for each function it appears in
> bench/syscall.c: In function =E2=80=98bench_syscall_basic=E2=80=99:
> bench/syscall.c:102:42: error: =E2=80=98__NR_getppid=E2=80=99 undeclared =
(first use in this function); did you mean =E2=80=98__getpgid=E2=80=99?
>    102 |  return bench_syscall_common(argc, argv, __NR_getppid);
>        |                                          ^~~~~~~~~~~~
>        |                                          __getpgid
> bench/syscall.c:103:1: error: control reaches end of non-void function [-=
Werror=3Dreturn-type]
>    103 | }
>        | ^
> cc1: all warnings being treated as errors
> =

> =

> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/r/202210051644.a83a7ca4-yujie.liu(a)intel=
.com
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          sudo bin/lkp install job.yaml           # job file is attached i=
n this email
>          bin/lkp split-job --compatible job.yaml # generate the yaml file=
 for lkp run
>          sudo bin/lkp run generated-yaml-file
> =

>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =


I am sorry for the build issues.

In my opinion, include asm/unistd.h can fix the build error about
undeclared __NR_getppid reported by kernel test robot, and this is
what I did in the v2 patch, but it seems no effect.

Here are the definition on my x86_64 system:

[yangtiezhu(a)linux ~]$ grep -rn __NR_getppid /usr/include/
/usr/include/asm/unistd_x32.h:102:#define __NR_getppid =

(__X32_SYSCALL_BIT + 110)
/usr/include/asm/unistd_32.h:68:#define __NR_getppid 64
/usr/include/asm/unistd_64.h:114:#define __NR_getppid 110
/usr/include/asm-generic/unistd.h:492:#define __NR_getppid 173
/usr/include/asm-generic/unistd.h:493:__SYSCALL(__NR_getppid, sys_getppid)
/usr/include/bits/syscall.h:610:#ifdef __NR_getppid
/usr/include/bits/syscall.h:611:# define SYS_getppid __NR_getppid
[yangtiezhu(a)linux ~]$ cat /usr/include/asm/unistd.h
/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
#ifndef _ASM_X86_UNISTD_H
#define _ASM_X86_UNISTD_H

/* x32 syscall flag bit */
#define __X32_SYSCALL_BIT	0x40000000

# ifdef __i386__
#  include <asm/unistd_32.h>
# elif defined(__ILP32__)
#  include <asm/unistd_x32.h>
# else
#  include <asm/unistd_64.h>
# endif

#endif /* _ASM_X86_UNISTD_H */
[yangtiezhu(a)linux ~]$ rpm -qf /usr/include/asm/unistd.h
kernel-headers-4.18.0-348.7.1.el8_5.x86_64

In order to fix the build error,

(1) Maybe I need to add the following code like
tools/build/feature/test-bpf.c:

#ifndef __NR_getppid
# if defined(__i386__)
#  define __NR_getppid 64
# elif defined(__x86_64__)
#  define __NR_getppid 110
# elif defined(__aarch64__)
...
# elif defined(__sparc__)
...
# elif defined(__s390__)
...
# elif defined(__mips__)
...
# else
#  error __NR_getppid not defined.
# endif
#endif

(2) Maybe I need to modify the following header files:
tools/arch/x86/include/uapi/asm/unistd_32.h
tools/arch/x86/include/uapi/asm/unistd_64.h

I prefer the second method, but I am a bit confused,
why not include /usr/include/asm/unistd*.h?
I think it is to avoid cross build issues?
Am I missing something?

Let me rethink it and then send v3, thank you.

Thanks,
Tiezhu

--===============4304588695189174965==--

