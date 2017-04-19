Content-Type: multipart/mixed; boundary="===============7889948056947971186=="
MIME-Version: 1.0
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/madvise] 23a003bfd2: mce-test.ras.fail
Date: Wed, 19 Apr 2017 06:40:45 +0000
Message-ID: <20170419064044.GA20936@hori1.linux.bs1.fc.nec.co.jp>
In-Reply-To: <20170417055948.GM31394@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7889948056947971186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 01:59:48PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 23a003bfd23ea9ea0b7756b920e51f64b284b468 ("mm/madvise: pass retur=
n code of memory_failure() to userspace")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Yes, this patch makes the result of memory error isolation visible to
userspace, so no wonder that some testcases start to spit failures.
I'm still digging each failure now, but I already found a few real kernel
bugs detected by this. Hopefully I'll post patches in a few days.

Thanks,
Naoya Horiguchi

> =

> in testcase: mce-test
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: ext4
> 	test_case: HWPOISON-HARD
> 	test_mode: single
> =

> =

> =

> on test machine: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz with=
 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> ---------wjin:BENCHMARK_ROOT=3D/lkp/benchmarks
> ---------wjin: come here 14
> ---------wjin: come here 90
> ----mount_points=3D/fs/sdb3
> 2017-04-14 22:24:00 cp -af ras /fs/sdb3
> <<<<<<<<<<<<<<<<<<<    TEST BEGIN    >>>>>>>>>>>>>>>>>>>
> Case ID: HWPOISON-HARD"
> --------------------------------------------------------
> hwpoison-inject module is loaded.
> =

> *************************************************************************=
**
> Pay attention:
> =

> This test is hard mode of HWPoison functional test.
> *************************************************************************=
**
> =

> =

> ------------------------------------------------------------------------
> Running tsimpleinj (simple hard offline test)
> PASS: ./tkillpoison
> ------------------------------------------------------------------------
> Running tsimpleinj (simple hard offline test)
> dirty page 0x7f511c605000
> signal 7 code 4 addr 0x7f511c605000
> recovered
> mlocked page 0x7f511c604000
> signal 7 code 4 addr 0x7f511c604000
> recovered
> clean file page 0x7f511c603000
> signal 7 code 4 addr 0x7f511c603000
> recovered
> file dirty page 0x7f511c602000
> signal 7 code 4 addr 0x7f511c602000
> recovered
> no error on msync expect error
> no error on fsync expect error
> hole file dirty page 0x7f511c5fe000
> signal 7 code 4 addr 0x7f511c5fe000
> recovered
> no error on hole msync expect error
> no error on hole fsync expect error
> FAILURE -- 2 of 5 cases broken!
> FAIL: ./tsimpleinj returned with failure.
> ------------------------------------------------------------------------
> Running tinjpage (hard offline test on various types of pages)
> vm.memory_failure_early_kill =3D 0
> ---- testing dirty anonymous
> 	dirty poisoning page 0x7f716c8d1000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d1000
> 	recovered
> ---- testing dirty anonymous unmap
> 	dirty poisoning page 0x7f716c8d0000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d0000
> 	recovered
> ---- testing mlocked anonymous
> 	mlocked poisoning page 0x7f716c8d0000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d0000
> 	recovered
> ---- testing file clean
> 	file clean poisoning page 0x7f716c8cf000
> 	reading 2e
> 	 reading 2e
> 	file clean poisoning page 0x7f716c8cf000
> 	writing 4
> ---- testing file dirty
> 	file dirty initial poisoning page 0x7f716c8ce000
> 	signal 7 code 4 addr 0x7f716c8ce000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing file hole
> 	hole file dirty poisoning page 0x7f716c8ce000
> 	signal 7 code 4 addr 0x7f716c8ce000
> 	recovered
> 	expected optional error 5 on hole fsync expect error
> LATER: expected likely incorrect no error on hole msync expect error
> ---- testing file clean mlocked
> 	file clean mlocked poisoning page 0x7f716c8ca000
> 	reading 2e
> 	 reading 2e
> 	file clean mlocked poisoning page 0x7f716c8ca000
> 	writing 4
> ---- testing file dirty mlocked
> 	file dirty mlocked initial poisoning page 0x7f716c8c9000
> 	signal 7 code 4 addr 0x7f716c8c9000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing nonlinear
> 	rfp file dirty poisoning page 0x7f716c8c0000
> 	signal 7 code 4 addr 0x7f716c8c0000
> 	recovered
> 	expected error 5 on rfp fsync expect error
> LATER: expected likely incorrect no error on rfp msync expect error
> ---- testing mmap shared
> 	ipv shared page poisoning page 0x7f716c8bf000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8bf000
> 	recovered
> ---- testing dirty anonymous
> 	dirty poisoning page 0x7f716c8d1000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d1000
> 	recovered
> ---- testing dirty anonymous unmap
> 	dirty poisoning page 0x7f716c8d0000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d0000
> 	recovered
> ---- testing mlocked anonymous
> 	mlocked poisoning page 0x7f716c8d0000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d0000
> 	recovered
> ---- testing file clean
> 	file clean poisoning page 0x7f716c8cf000
> 	reading 2e
> 	 reading 2e
> 	file clean poisoning page 0x7f716c8cf000
> 	writing 4
> ---- testing file dirty
> 	file dirty initial poisoning page 0x7f716c8ce000
> 	signal 7 code 4 addr 0x7f716c8ce000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing file hole
> 	hole file dirty poisoning page 0x7f716c8ce000
> 	signal 7 code 4 addr 0x7f716c8ce000
> 	recovered
> 	expected optional error 5 on hole fsync expect error
> LATER: expected likely incorrect no error on hole msync expect error
> ---- testing file clean mlocked
> 	file clean mlocked poisoning page 0x7f716c8ca000
> 	reading 2e
> 	 reading 2e
> 	file clean mlocked poisoning page 0x7f716c8ca000
> 	writing 4
> ---- testing file dirty mlocked
> 	file dirty mlocked initial poisoning page 0x7f716c8c9000
> 	signal 7 code 4 addr 0x7f716c8c9000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing nonlinear
> 	rfp file dirty poisoning page 0x7f716c8c0000
> 	signal 7 code 4 addr 0x7f716c8c0000
> 	recovered
> 	expected error 5 on rfp fsync expect error
> LATER: expected likely incorrect no error on rfp msync expect error
> ---- testing mmap shared
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8bf000
> 	recovered
> ---- testing ipv shared
> 	ipv shared page poisoning page 0x7f716c8bf000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8bf000
> 	recovered
> vm.memory_failure_early_kill =3D 1
> ---- testing dirty anonymous
> 	dirty poisoning page 0x7f716c8d1000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d1000
> 	recovered
> ---- testing dirty anonymous unmap
> 	dirty poisoning page 0x7f716c8d0000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d0000
> 	recovered
> ---- testing mlocked anonymous
> 	mlocked poisoning page 0x7f716c8d0000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8d0000
> 	recovered
> ---- testing file clean
> 	file clean poisoning page 0x7f716c8cf000
> 	reading 2e
> 	 reading 2e
> 	file clean poisoning page 0x7f716c8cf000
> 	writing 4
> ---- testing file dirty
> 	file dirty initial poisoning page 0x7f716c8ce000
> 	signal 7 code 4 addr 0x7f716c8ce000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing file hole
> 	hole file dirty poisoning page 0x7f716c8ce000
> 	signal 7 code 4 addr 0x7f716c8ce000
> 	recovered
> 	expected optional error 5 on hole fsync expect error
> LATER: expected likely incorrect no error on hole msync expect error
> ---- testing file clean mlocked
> 	file clean mlocked poisoning page 0x7f716c8ca000
> 	reading 2e
> 	 reading 2e
> 	file clean mlocked poisoning page 0x7f716c8ca000
> 	writing 4
> ---- testing file dirty mlocked
> 	file dirty mlocked initial poisoning page 0x7f716c8c9000
> 	signal 7 code 4 addr 0x7f716c8c9000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing nonlinear
> 	rfp file dirty poisoning page 0x7f716c8c0000
> 	signal 7 code 4 addr 0x7f716c8c0000
> 	recovered
> 	expected error 5 on rfp fsync expect error
> LATER: expected likely incorrect no error on rfp msync expect error
> ---- testing mmap shared
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8bf000
> 	recovered
> ---- testing ipv shared
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8bf000
> 	recovered
> ---- testing anonymous hugepage
> 	anonymous hugepage poisoning page 0x7f716be00000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716be00000
> 	recovered
> ---- testing file backed hugepage
> 	file backed hugepage poisoning page 0x7f716be00000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716be00000
> 	recovered
> ---- testing shared memory hugepage
> 	shared memory hugepage poisoning page 0x7f716be00000
> 	writing 2
> 	signal 7 code 4 addr 0x7f716be00000
> 	recovered
> ---- testing dirty anonymous in child
> ---- testing dirty anonymous unmap in child
> ---- testing mlocked anonymous in child
> ---- testing file clean in child
> ---- testing file dirty in child
> ---- testing file hole in child
> ---- testing file clean mlocked in child
> ---- testing file dirty mlocked in child
> ---- testing nonlinear in child
> ---- testing mmap shared in child
> ---- testing ipv shared in child
> ---- testing anonymous hugepage in child
> ---- testing file backed hugepage in child
> ---- testing shared memory hugepage in child
> ---- testing dirty anonymous (early kill)
> 	dirty poisoning page 0x7f716c8bf000
> 	signal 7 code 5 addr 0x7f716c8bf000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8bf000
> 	recovered
> ---- testing dirty anonymous unmap (early kill)
> 	dirty poisoning page 0x7f716c8be000
> 	signal 7 code 5 addr 0x7f716c8be000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8be000
> 	recovered
> ---- testing mlocked anonymous (early kill)
> 	mlocked poisoning page 0x7f716c8be000
> 	signal 7 code 5 addr 0x7f716c8be000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8be000
> 	recovered
> ---- testing file clean (early kill)
> 	file clean poisoning page 0x7f716c8bd000
> 	reading 2e
> 	 reading 2e
> 	file clean poisoning page 0x7f716c8bd000
> 	writing 4
> ---- testing file dirty (early kill)
> 	file dirty initial poisoning page 0x7f716c8bc000
> 	signal 7 code 5 addr 0x7f716c8bc000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8bc000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing file hole (early kill)
> 	hole file dirty poisoning page 0x7f716c8bc000
> 	signal 7 code 5 addr 0x7f716c8bc000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8bc000
> 	recovered
> 	expected optional error 5 on hole fsync expect error
> LATER: expected likely incorrect no error on hole msync expect error
> ---- testing file clean mlocked (early kill)
> 	file clean mlocked poisoning page 0x7f716c8bb000
> 	reading 2e
> 	 reading 2e
> 	file clean mlocked poisoning page 0x7f716c8bb000
> 	writing 4
> ---- testing file dirty mlocked (early kill)
> 	file dirty mlocked initial poisoning page 0x7f716c8ba000
> 	signal 7 code 5 addr 0x7f716c8ba000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8ba000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing nonlinear (early kill)
> 	rfp file dirty poisoning page 0x7f716c8b1000
> 	signal 7 code 5 addr 0x7f716c8b1000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8b1000
> 	recovered
> 	expected error 5 on rfp fsync expect error
> LATER: expected likely incorrect no error on rfp msync expect error
> ---- testing mmap shared (early kill)
> 	ipv shared page poisoning page 0x7f716c8b0000
> 	signal 7 code 5 addr 0x7f716c8b0000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8b0000
> 	recovered
> correct no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing file hole (early kill)
> 	hole file dirty poisoning page 0x7f716c8bc000
> 	signal 7 code 5 addr 0x7f716c8bc000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8bc000
> 	recovered
> 	expected optional error 5 on hole fsync expect error
> LATER: expected likely incorrect no error on hole msync expect error
> ---- testing file clean mlocked (early kill)
> 	file clean mlocked poisoning page 0x7f716c8bb000
> 	reading 2e
> 	 reading 2e
> 	file clean mlocked poisoning page 0x7f716c8bb000
> 	writing 4
> ---- testing file dirty mlocked (early kill)
> 	file dirty mlocked initial poisoning page 0x7f716c8ba000
> 	signal 7 code 5 addr 0x7f716c8ba000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8ba000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing nonlinear (early kill)
> 	rfp file dirty poisoning page 0x7f716c8b1000
> 	signal 7 code 5 addr 0x7f716c8b1000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8b1000
> 	recovered
> 	expected error 5 on rfp fsync expect error
> LATER: expected likely incorrect no error on rfp msync expect error
> ---- testing mmap shared (early kill)
> 	signal 7 code 5 addr 0x7f716c8b0000
> ---- testing ipv shared (early kill)
> 	ipv shared page poisoning page 0x7f716c8b0000
> 	signal 7 code 5 addr 0x7f716c8b0000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716c8b0000
> 	recovered
> correct no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing file hole (early kill)
> 	hole file dirty poisoning page 0x7f716c8bc000
> 	signal 7 code 5 addr 0x7f716c8bc000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8bc000
> 	recovered
> 	expected optional error 5 on hole fsync expect error
> LATER: expected likely incorrect no error on hole msync expect error
> ---- testing file clean mlocked (early kill)
> 	file clean mlocked poisoning page 0x7f716c8bb000
> 	reading 2e
> 	 reading 2e
> 	file clean mlocked poisoning page 0x7f716c8bb000
> 	writing 4
> ---- testing file dirty mlocked (early kill)
> 	file dirty mlocked initial poisoning page 0x7f716c8ba000
> 	signal 7 code 5 addr 0x7f716c8ba000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8ba000
> 	recovered
> 	expected error 5 on msync expect error
> 	reading 0
> 	reading 0
> LATER: expected likely incorrect no error on explicit read after poison
> LATER: expected likely incorrect no error on explicit write after poison
> LATER: expected likely incorrect no error on fsync expect error
> ---- testing nonlinear (early kill)
> 	rfp file dirty poisoning page 0x7f716c8b1000
> 	signal 7 code 5 addr 0x7f716c8b1000
> 	recovered
> 	signal 7 code 4 addr 0x7f716c8b1000
> 	recovered
> 	expected error 5 on rfp fsync expect error
> LATER: expected likely incorrect no error on rfp msync expect error
> ---- testing mmap shared (early kill)
> 	signal 7 code 5 addr 0x7f716c8b0000
> ---- testing ipv shared (early kill)
> 	signal 7 code 5 addr 0x7f716c8b0000
> ---- testing anonymous hugepage (early kill)
> 	anonymous hugepage poisoning page 0x7f716be00000
> 	signal 7 code 5 addr 0x7f716be00000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716be00000
> 	recovered
> ---- testing file backed hugepage (early kill)
> 	file backed hugepage poisoning page 0x7f716be00000
> 	signal 7 code 5 addr 0x7f716be00000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716be00000
> 	recovered
> ---- testing shared memory hugepage (early kill)
> 	shared memory hugepage poisoning page 0x7f716be00000
> 	signal 7 code 5 addr 0x7f716be00000
> 	recovered
> 	writing 2
> 	signal 7 code 4 addr 0x7f716be00000
> 	recovered
> FAILURE -- 8 cases broken!
> FAIL: ./tinjpage returned with failure.
> ------------------------------------------------------------------------
> Running tprctl (hard offline test with various prctl settings)
> vm.memory_failure_early_kill =3D 0
> ptr =3D 0x7ff15a0d4000
> injection
> faulting
> recovered
> ptr =3D 0x7ff15a0d3000
> injection
> recovered
> PASS: ./tprctl
> vm.memory_failure_early_kill =3D 1
> Unpoisoning.
> WARNING: hwpoison page counter is broken.
> HardwareCorrupted:     4 kB
> =

> 	Num of Executed Test Case: 4	Num of Failed Case: 2
> =

> --------------------------------------------------------
> <<<<<<<<<<<<<<<<<<<<    TEST END    >>>>>>>>>>>>>>>>>>>>
> =

> 9897
> Test Start Time: 2017-04-14.22.24.00
> ----------------------------------------------
> testcase                            result
> -------------------                 ----------
> HWPOISON-HARD                       FAIL      =

> ----------------------------------------------
> Test End Time: 2017-04-14.22.24.10
> Total Tests: 1
> Total Passes: 0
> Total Failures: 1
> Kernel Version: 4.5.0-00557-g23a003b
> Machine Architecture: x86_64
> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Xiaolong


--===============7889948056947971186==--

